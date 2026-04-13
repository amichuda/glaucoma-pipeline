import marimo

__generated_with = "0.13.0"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo
    import numpy as np
    import pandas as pd
    from scipy import stats
    import matplotlib.pyplot as plt
    import seaborn as sns
    import pingouin as pg
    import json
    return json, mo, np, pd, pg, plt, sns, stats


@app.cell
def _(mo):
    mo.md(
        r"""
        # SLT Intervention Analysis

        **Pre–post biostatistical evaluation of Selective Laser Trabeculoplasty (SLT)**

        Data source: `output/dataset_verified.csv`
        """
    )
    return


@app.cell
def _(pd):
    df = pd.read_csv(
        "/Users/lordflaron/Documents/glaucoma-pipeline/output/dataset_verified.csv"
    )
    df["iop_change"] = df["iop_post_mmhg"] - df["iop_pre_mmhg"]
    df["iop_pct_change"] = (df["iop_change"] / df["iop_pre_mmhg"]) * 100
    df["med_change"] = df["num_meds_post"] - df["num_meds_pre"]
    df
    return (df,)


@app.cell
def _(df, mo):
    n_eyes = len(df)
    n_verified = int(df["verified"].sum())
    n_studies = df["study_id"].nunique()
    n_patients = df["patient_id"].nunique()

    mo.md(
        f"""
        ## Dataset Overview

        | Metric | Value |
        |--------|-------|
        | Eyes (observations) | **{n_eyes}** |
        | Verified records | **{n_verified} / {n_eyes}** |
        | Unique patients | **{n_patients}** |
        | Source studies | **{n_studies}** |
        """
    )
    return n_eyes, n_patients, n_studies, n_verified


@app.cell
def _(df, mo, pd):
    def _desc(s):
        q1, q3 = s.quantile(0.25), s.quantile(0.75)
        return {
            "N": int(s.notna().sum()),
            "Mean": round(s.mean(), 2),
            "SD": round(s.std(ddof=1), 2),
            "Median": round(s.median(), 2),
            "Q1": round(q1, 2),
            "Q3": round(q3, 2),
            "Min": round(s.min(), 2),
            "Max": round(s.max(), 2),
        }

    desc_df = pd.DataFrame(
        {
            "Pre-IOP (mmHg)": _desc(df["iop_pre_mmhg"]),
            "Post-IOP (mmHg)": _desc(df["iop_post_mmhg"]),
            "Change (mmHg)": _desc(df["iop_change"]),
            "% Change": _desc(df["iop_pct_change"]),
        }
    )

    mo.md(
        f"""
        ## Descriptive Statistics

        {mo.as_html(desc_df.T)}
        """
    )
    return (desc_df,)


@app.cell
def _(df, mo, np, stats):
    # Normality
    sw_stat, sw_p = stats.shapiro(df["iop_change"].dropna())
    normal = sw_p > 0.05

    # Inferential test
    n = len(df)
    if normal and n >= 8:
        test_label = "Paired t-test"
        t_stat, p_val = stats.ttest_rel(df["iop_post_mmhg"], df["iop_pre_mmhg"])
        test_stat = t_stat
    else:
        test_label = "Wilcoxon signed-rank"
        test_stat, p_val = stats.wilcoxon(df["iop_change"].dropna())

    # Effect size (Cohen's d, paired)
    mean_chg = df["iop_change"].mean()
    sd_chg = df["iop_change"].std(ddof=1)
    cohens_d = mean_chg / sd_chg

    # 95% CI for mean change
    se = sd_chg / np.sqrt(n)
    t_crit = stats.t.ppf(0.975, df=n - 1)
    ci_lo, ci_hi = mean_chg - t_crit * se, mean_chg + t_crit * se

    # Clinical success
    n_success = int((df["iop_pct_change"] <= -20).sum())
    pct_success = n_success / n * 100

    d_interp = "large" if abs(cohens_d) >= 0.8 else "medium" if abs(cohens_d) >= 0.5 else "small"

    mo.md(
        f"""
        ## Inferential Statistics

        **Normality (Shapiro-Wilk):** W = {sw_stat:.3f}, p = {sw_p:.3f}
        → distribution is **{"normal" if normal else "non-normal"}**

        **Statistical test:** {test_label}
        | Statistic | p-value | Significant? |
        |-----------|---------|--------------|
        | {test_stat:.3f} | {p_val:.4f} | {"Yes (p < 0.05)" if p_val < 0.05 else "No"} |

        **Effect size (Cohen's d, paired):** {cohens_d:.3f} — *{d_interp}*

        **95% CI for mean IOP change:** [{ci_lo:.2f}, {ci_hi:.2f}] mmHg

        **Clinical success (≥20% IOP reduction):** {n_success}/{n} eyes — **{pct_success:.1f}%**
        """
    )
    return (
        ci_hi,
        ci_lo,
        cohens_d,
        mean_chg,
        n,
        n_success,
        normal,
        p_val,
        pct_success,
        sd_chg,
        sw_p,
        sw_stat,
        t_crit,
        t_stat,
        test_label,
        test_stat,
    )


@app.cell
def _(ci_hi, ci_lo, df, mean_chg, mo, plt, sns):
    fig, axes = plt.subplots(1, 3, figsize=(15, 5))
    fig.suptitle("IOP Pre vs Post SLT", fontsize=14, fontweight="bold")

    palette = {"Pre": "#4C72B0", "Post": "#DD8452"}

    # ── (a) Paired slope plot ─────────────────────────────────────────────────
    ax0 = axes[0]
    for _, row in df.iterrows():
        ax0.plot(
            [0, 1],
            [row["iop_pre_mmhg"], row["iop_post_mmhg"]],
            color="steelblue",
            alpha=0.45,
            linewidth=1.2,
        )
    ax0.scatter(
        [0] * len(df), df["iop_pre_mmhg"], color=palette["Pre"], zorder=5, s=50, label="Pre"
    )
    ax0.scatter(
        [1] * len(df), df["iop_post_mmhg"], color=palette["Post"], zorder=5, s=50, label="Post"
    )
    ax0.set_xticks([0, 1])
    ax0.set_xticklabels(["Pre-SLT", "Post-SLT"], fontsize=11)
    ax0.set_ylabel("IOP (mmHg)")
    ax0.set_title("(a) Paired Slope Plot")
    ax0.legend(loc="upper right")

    # ── (b) Histogram + KDE of IOP change ────────────────────────────────────
    ax1 = axes[1]
    sns.histplot(
        df["iop_change"],
        bins=8,
        kde=True,
        ax=ax1,
        color="#4C72B0",
        edgecolor="white",
    )
    ax1.axvline(mean_chg, color="crimson", linestyle="--", linewidth=1.5, label=f"Mean={mean_chg:.1f}")
    ax1.axvline(ci_lo, color="grey", linestyle=":", linewidth=1.2)
    ax1.axvline(ci_hi, color="grey", linestyle=":", linewidth=1.2, label="95% CI")
    ax1.set_xlabel("IOP Change (mmHg)")
    ax1.set_ylabel("Count")
    ax1.set_title("(b) Distribution of IOP Change")
    ax1.legend()

    # ── (c) Box plot pre vs post ──────────────────────────────────────────────
    ax2 = axes[2]
    long_df = df[["iop_pre_mmhg", "iop_post_mmhg"]].melt(
        var_name="Timepoint", value_name="IOP (mmHg)"
    )
    long_df["Timepoint"] = long_df["Timepoint"].map(
        {"iop_pre_mmhg": "Pre-SLT", "iop_post_mmhg": "Post-SLT"}
    )
    sns.boxplot(
        data=long_df,
        x="Timepoint",
        y="IOP (mmHg)",
        palette=palette,
        ax=ax2,
        width=0.5,
        flierprops=dict(marker="o", markersize=5),
    )
    sns.stripplot(
        data=long_df,
        x="Timepoint",
        y="IOP (mmHg)",
        color="black",
        alpha=0.4,
        size=4,
        ax=ax2,
        jitter=True,
    )
    ax2.set_title("(c) IOP Box Plot")

    plt.tight_layout()
    mo.mpl.interactive(fig)
    return


@app.cell
def _(df, mo):
    _med = df["med_change"].dropna()
    if len(_med) == 0:
        mo.md("*No medication data available.*")
    else:
        _pre = df["num_meds_pre"].describe().round(2)
        _post = df["num_meds_post"].describe().round(2)
        import pandas as _pd
        _med_df = _pd.DataFrame({
            "Pre-SLT meds": _pre,
            "Post-SLT meds": _post,
            "Change": _med.describe().round(2),
        })

        mo.md(
            f"""
            ## Medication Analysis

            {mo.as_html(_med_df.T)}

            **Mean change in medications:** {_med.mean():.2f} (SD={_med.std(ddof=1):.2f})

            **Median change:** {_med.median():.1f}

            > Negative values indicate reduction in medication burden post-SLT.
            """
        )
    return


@app.cell
def _(df, mo, plt):
    if "diagnosis" not in df.columns:
        mo.md("*No diagnosis data available.*")
    else:
        _counts = df["diagnosis"].value_counts()
        _colors = ["#4C72B0", "#DD8452", "#55A868", "#C44E52", "#8172B3"]

        _fig, _ax = plt.subplots(figsize=(7, 4))
        _bars = _ax.barh(
            _counts.index[::-1],
            _counts.values[::-1],
            color=_colors[: len(_counts)],
            edgecolor="white",
        )
        _ax.bar_label(_bars, padding=4, fontsize=10)
        _ax.set_xlabel("Number of Eyes")
        _ax.set_title("Diagnosis Breakdown")
        _ax.set_xlim(0, _counts.max() * 1.25)
        plt.tight_layout()

        mo.vstack([
            mo.md("## Diagnosis Breakdown"),
            mo.mpl.interactive(_fig),
        ])
    return


if __name__ == "__main__":
    app.run()
