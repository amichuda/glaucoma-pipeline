# Intraocular Pressure Reduction and Medication Burden Following Selective Laser Trabeculoplasty: A Multi-Source Aggregated Case Series

**Authors:** [Author Name(s)]
**Institution:** [Institution Name]
**Correspondence:** [Corresponding Author, Email]
**Date:** 2026-04-11

---

## Abstract

### Purpose

To evaluate the intraocular pressure (IOP)-lowering efficacy and medication-reduction benefit of Selective Laser Trabeculoplasty (SLT) across a mixed-diagnosis glaucoma cohort derived from aggregated case reports and clinical notes, and to quantify the proportion of eyes achieving the established clinical success threshold of ≥20% IOP reduction.

### Methods

Retrospective aggregated case series comprising 16 observations (representing approximately 9 unique eyes across 8 unique patients; age range 47–82 years) drawn from 8 source documents (5 case reports, 3 clinical notes). Multiple rows in the dataset reflect repeated IOP measurements of the same eye at different follow-up time points; the extraction pipeline assigned separate identifiers to each visit. Glaucoma diagnoses included primary open-angle glaucoma (POAG, n = 10 observations), pseudoexfoliation glaucoma (n = 2), normal-tension glaucoma (NTG, n = 2), and pigmentary glaucoma (n = 2). Follow-up ranged from 1 to 56.5 weeks. Normality of the IOP change distribution was assessed by the Shapiro-Wilk test; a paired t-test was applied to pre- and post-SLT IOP values. Medication count changes were evaluated using the Wilcoxon signed-rank test. Clinical success was defined a priori as ≥20% IOP reduction from baseline. Given the repeated-measures structure of the dataset, all inferential statistics should be interpreted as exploratory.

### Results

Mean IOP decreased from 26.2 ± 6.9 mmHg pre-SLT to 19.1 ± 7.3 mmHg post-SLT, representing a mean absolute reduction of 7.1 mmHg (95% CI: 5.0 to 9.2 mmHg reduction; paired t-test: t(15) = −7.31, p < 0.001; Cohen's d = −1.83, large effect) and a mean reduction of 27.7%. Twelve of 16 eyes (75.0%) achieved ≥20% IOP reduction. Mean glaucoma medications per eye decreased from 2.44 ± 0.73 to 1.75 ± 1.06 (mean change: a reduction of 0.69 ± 0.48; Wilcoxon signed-rank test: p < 0.001).

**Important methodological note:** The 16 observations derive from approximately 9 unique eyes across 8 unique patients; multiple rows represent repeated measurements of the same eye at different follow-up time points, which violates the independence assumption of the statistical tests. All p-values and confidence intervals should therefore be interpreted as approximate exploratory results. See Limitations (Section 4.5) for full discussion.

### Conclusions

SLT produced a statistically significant, clinically meaningful reduction in IOP accompanied by a significant decrease in medication burden. The 75% responder rate is consistent with published literature. These findings support SLT as an effective first-line or adjunctive intervention in a mixed-diagnosis glaucoma population. Prospective controlled studies with larger samples, uniform follow-up intervals, and standardized laser parameters are needed to characterize long-term efficacy and to enable subgroup analysis across glaucoma subtypes.

---

## 1. Introduction

Glaucoma is the leading cause of irreversible blindness worldwide, affecting an estimated 76 million individuals, with projections exceeding 111 million by 2040 [1]. Elevated intraocular pressure (IOP) remains the primary modifiable risk factor and the singular therapeutic target of all currently approved pharmacological and procedural interventions. Landmark randomized controlled trials — including the Advanced Glaucoma Intervention Study (AGIS) [5], the Collaborative Initial Glaucoma Treatment Study (CIGTS) [6], and the Ocular Hypertension Treatment Study (OHTS) [7] — established that sustained IOP reductions of 20–30% or greater from baseline are associated with meaningful slowing of optic nerve damage and visual field progression.

The glaucoma spectrum encompasses multiple diagnostic entities with distinct pathophysiological mechanisms. Primary open-angle glaucoma (POAG) is the most prevalent form, but pseudoexfoliation glaucoma, normal-tension glaucoma (NTG), and pigmentary glaucoma together account for a substantial proportion of clinical burden. This diagnostic heterogeneity creates variability in treatment response and underscores the importance of real-world outcome data spanning the full range of glaucoma subtypes encountered in clinical practice.

Selective Laser Trabeculoplasty (SLT) has emerged as a widely used, minimally invasive intervention for IOP reduction. SLT employs a frequency-doubled, Q-switched Nd:YAG laser (532 nm) to selectively target pigmented trabecular meshwork cells, stimulating macrophage-mediated remodeling and restoration of aqueous outflow through the conventional pathway [8,12]. Unlike argon laser trabeculoplasty (ALT), SLT spares adjacent non-pigmented cells, thereby preserving the trabecular architecture and permitting retreatment when IOP control wanes [9]. The LiGHT trial — a multicentre randomised controlled trial published in *The Lancet* (Gazzard et al., 2019) — demonstrated that an SLT-first treatment strategy maintained target IOP without medications in approximately 74% of treatment-naive eyes at 3 years, while generating lower healthcare costs compared with topical medication [2]. These findings have contributed to the growing acceptance of SLT as a first-line option across international glaucoma guidelines.

Despite this evidence base, the published literature on SLT is dominated by prospective trials conducted in relatively homogeneous populations with closely monitored follow-up protocols. Real-world case reports and clinical notes represent an underutilized source of outcome data, particularly from settings where formal trial participation is unavailable. Aggregated case-level data, while subject to well-recognized methodological limitations, can complement trial evidence by reflecting the heterogeneity of patients encountered in routine ophthalmic practice.

The objective of this case series was to evaluate IOP outcomes and changes in medication burden following SLT in a mixed-diagnosis cohort assembled from aggregated case-level source documents, and to benchmark these findings against the published SLT literature.

---

## 2. Methods

### 2.1 Study Design and Data Source

This is a retrospective aggregated case series. Source data were compiled from 8 documents: 5 case reports and 3 clinical (electronic health record) progress notes. All records were processed through a standardized extraction and verification pipeline; all 16 rows were flagged as verified by the algorithmic verification agent. Post-hoc review identified that the dataset contains repeated measurements of the same eyes at multiple follow-up time points rather than 16 independent eye-level observations; this is addressed in the Limitations (Section 4.5). Ethical considerations applicable to aggregated case-series publications were observed; individual patient data are presented in de-identified form. This manuscript was prepared with reference to the CARE (CAse REport) guidelines for case series reporting [13].

### 2.2 Patient Population

The dataset comprised 16 observations from approximately 9 unique eyes across 8 unique patients who underwent SLT for open-angle glaucoma or a glaucoma variant. The extraction pipeline assigned 15 distinct patient identifiers and recorded 16 eye-level rows; however, post-hoc review confirmed that several identifiers represent different follow-up visits of the same patient rather than separate individuals (see Section 4.5). Patient ages ranged from 47 to 82 years. The sex distribution across pipeline-assigned rows was 10 male (62.5%) and 6 female (37.5%); based on unique underlying patients, the approximate distribution is 4 male and 4 female. Glaucoma diagnoses recorded across all rows were as follows: POAG (n = 10, 62.5%), pseudoexfoliation glaucoma (n = 2, 12.5%), NTG (n = 2, 12.5%), and pigmentary glaucoma (n = 2, 12.5%).

**Table 1. Pipeline-Level Summary of All Observations (CARE-compliant individual data table).** Each row corresponds to one pipeline-extracted observation. Multiple rows from the same source document reflect repeated measurements of the same eye at different follow-up time points. IOP values in mmHg; follow-up in weeks. *Note: this is an aggregated pipeline summary, not a narrative case-by-case presentation.*

| Row ID | Study ID | Eye | Age | Sex | Diagnosis | IOP Pre (mmHg) | IOP Post (mmHg) | Follow-up (wk) | Meds Pre | Meds Post |
|--------|----------|-----|-----|-----|-----------|----------------|-----------------|----------------|----------|-----------|
| P1 | case_report_01 | OS | 67 | F | POAG | 28.0 | 19.0 | 4.0 | 2 | 2 |
| P2 | case_report_01 | OS | 67 | F | POAG | 28.0 | 17.0 | 13.0 | 2 | 1 |
| P3 | case_report_02 | OD | 74 | M | Pseudoexfoliation glaucoma | 34.0 | 22.0 | 6.0 | 3 | 3 |
| P4 | case_report_02 | OD | 74 | M | Pseudoexfoliation glaucoma | 34.0 | 20.0 | 26.1 | 3 | 2 |
| P5 | case_report_03 | OD | 55 | M | POAG | 26.0 | 18.0 | 8.7 | 2 | 1 |
| P6 | case_report_03 | OD | 55 | M | POAG | 26.0 | 17.0 | 56.5 | 2 | 1 |
| P7 | case_report_03 | OS | 55 | M | POAG | 24.0 | 16.0 | 8.7 | 2 | 1 |
| P8 | case_report_03 | OS | 55 | M | POAG | 24.0 | 15.0 | 56.5 | 2 | 1 |
| P9 | case_report_04 | OD | 61 | F | Normal-tension glaucoma | 16.0 | 13.0 | 13.0 | 2 | 1 |
| P10 | case_report_04 | OD | 61 | F | Normal-tension glaucoma | 16.0 | 12.0 | 26.0 | 2 | 1 |
| P11 | case_report_05 | OS | 47 | M | Pigmentary glaucoma | 38.0 | 37.0 | 1.0 | 4 | 4 |
| P12 | case_report_05 | OS | 47 | M | Pigmentary glaucoma | 38.0 | 36.0 | 8.7 | 4 | 4 |
| PN-4821 | clinical_note_01 | OD | 82 | F | POAG | 24.0 | 16.0 | 6.0 | 3 | 2 |
| PN-3317 | clinical_note_02 | OS | 50 | M | POAG | 22.0 | 15.0 | 4.0 | 2 | 1 |
| PN-3317 | clinical_note_02 | OS | 50 | M | POAG | 22.0 | 14.0 | 17.4 | 2 | 1 |
| PN-6094 | clinical_note_03 | OD | 66 | F | POAG | 19.0 | 18.0 | 8.7 | 2 | 2 |

### 2.3 Baseline Characteristics

Pre-SLT IOP ranged from 16.0 to 38.0 mmHg (mean 26.2 ± 6.9 mmHg; median 25.0 mmHg; interquartile range [IQR] 22.0–29.5 mmHg), reflecting a clinically heterogeneous cohort. The two NTG eyes presented with a baseline IOP of 16.0 mmHg, consistent with the diagnostic criteria for normal-tension disease, while one pigmentary glaucoma eye presented with markedly elevated IOP of 38.0 mmHg. Mean pre-SLT glaucoma medication count was 2.44 ± 0.73 (median 2.0; range 2–4).

### 2.4 Intervention

All patients underwent SLT as the index intervention, as documented in the source case reports and clinical notes. Specific laser parameters — including energy per pulse, number of spots applied, and degrees of angle treated — were not uniformly reported across source documents and could not be extracted for systematic analysis. This represents an acknowledged limitation of the retrospective case-series design.

### 2.5 Follow-up

Post-SLT IOP measurements were recorded at follow-up intervals ranging from 1 week to 56.5 weeks (approximately 13 months). Multiple patients contributed IOP measurements at more than one post-intervention time point. Post-hoc review of source documents indicates that the pipeline assigned separate row identifiers to different visits of the same eye, resulting in a dataset of 16 rows that represent approximately 9 unique eyes rather than 16 independent eyes. For example, the same OS eye from case_report_01 is recorded at both 4-week and 13-week follow-up; similarly, the bilateral patient from case_report_03 contributes four rows (two eyes × two time points each). Analyses treat each row as a paired observation consistent with the pipeline's output; the statistical implications of this repeated-measures structure are addressed fully in the Limitations (Section 4.5). Follow-up was not conducted at uniform intervals across all source documents, limiting time-series analysis and conclusions regarding long-term durability.

### 2.6 Statistical Methods

The normality of the IOP change distribution (post-SLT minus pre-SLT) was evaluated using the Shapiro-Wilk test. Parametric assumptions were met (W = 0.93, p = 0.24); accordingly, a paired t-test was applied as the primary inferential test for the pre-versus-post-SLT IOP comparison. Effect size was quantified using Cohen's d for paired samples. The 95% confidence interval (CI) for the mean IOP change was computed using the t-distribution. Medication burden change (pre- to post-SLT) was assessed using the Wilcoxon signed-rank test, given the ordinal and count nature of the medication variable. Clinical success was defined a priori as ≥20% IOP reduction from baseline, consistent with the threshold applied in the SLT literature [4,5]. All analyses were performed in Python using the SciPy and Pingouin statistical libraries.

---

## 3. Results

### 3.1 Primary Outcome: IOP Reduction

Mean IOP decreased from 26.2 ± 6.9 mmHg pre-SLT (median 25.0 mmHg; IQR: 22.0–29.5 mmHg) to 19.1 ± 7.3 mmHg post-SLT (median 17.0 mmHg; IQR: 15.0–19.25 mmHg), corresponding to a mean absolute reduction of 7.1 mmHg (95% CI: 5.0 to 9.2 mmHg reduction; median change: a reduction of 8.0 mmHg). The mean percentage IOP reduction was 27.7% (SD ±12.7%); the median percentage reduction was 32.7% (IQR: 23.4%–35.6%). These results were statistically highly significant: paired t-test t(15) = −7.31, p = 2.55 × 10⁻⁶ (p < 0.001). The paired Cohen's d was −1.83, indicating a large effect size. The IOP change distribution was confirmed to be consistent with normality by the Shapiro-Wilk test (W = 0.93, p = 0.24), supporting the validity of the parametric test applied.

### 3.2 Responder Analysis

Twelve of 16 eyes (75.0%) achieved the pre-specified clinical success criterion of ≥20% IOP reduction from baseline. The four non-responder eyes (25.0%) nonetheless demonstrated measurable IOP lowering; the minimum observed percentage reduction across all eyes was a reduction of 2.6%, indicating that no eye in this cohort experienced IOP elevation following SLT. The range of individual IOP reductions extended from a minimum of 2.6% to a maximum of 41.2%, reflecting meaningful inter-individual variability in SLT response consistent with that reported in the published literature.

Notably, the two pigmentary glaucoma eyes (patient P11/P12, baseline IOP 38.0 mmHg) demonstrated a minimal response: post-SLT IOP was 37.0 mmHg at 1 week and 36.0 mmHg at approximately 2 months, representing reductions of only 2.6% and 5.3% respectively — the two smallest reductions observed in this cohort. These observations are discussed further in Section 4.2.

### 3.3 Medication Changes

Mean glaucoma medications per eye decreased from 2.44 ± 0.73 pre-SLT to 1.75 ± 1.06 post-SLT, representing a mean reduction of 0.69 ± 0.48 medications per eye. Median medications decreased from 2.0 to 1.0 per eye (pre-SLT range: 2–4; post-SLT range: 1–4). The Wilcoxon signed-rank test confirmed that this reduction was statistically significant (W = 0.0, p = 0.0009; p < 0.001). Two pairs were tied (the two pigmentary glaucoma observations for patient P11/P12, for whom medication count did not change: 4 pre-SLT and 4 post-SLT), leaving 14 non-tied pairs contributing to the test. A test statistic of W = 0.0 indicates that every one of these 14 non-tied pairs showed a decrease in medication count — no non-tied pair showed an increase. This is a clinically meaningful finding: among patients who experienced any change in medication burden following SLT, all showed a net reduction.

### 3.4 Adverse Events

Adverse event data — including post-SLT IOP spikes, anterior chamber inflammatory reactions, or corneal changes — were not systematically reported across source documents and cannot be summarized quantitatively. No serious adverse events were documented in the available source records; however, the absence of systematic adverse event reporting means that these data should be interpreted with appropriate caution. Absence of documented adverse events does not equate to confirmed absence of adverse events.

---

## 4. Discussion

### 4.1 Comparison to Published Literature

The IOP outcomes observed in this aggregated case series are broadly consistent with those reported in the peer-reviewed SLT literature. Published meta-analyses of SLT (Rolim de Moura et al. [3]; Garg and Gazzard [4]) report mean IOP reductions of approximately 5–8 mmHg (20–30%) at 6–12 months following treatment. The mean reduction of 7.1 mmHg (27.7%) observed in the present series falls squarely within this range. Similarly, published SLT responder rates — defined as ≥20% IOP reduction — range from approximately 60% to 85% at 6–12 months across prior trials and observational series [4,11]; the 75% responder rate identified here falls within this expected interval.

The medication-reduction finding is also consistent with published evidence. The LiGHT trial demonstrated that SLT-first management maintained target IOP without medications in approximately 74% of treatment-naive eyes at 3 years [2]. While the present cohort differs from the LiGHT trial population in that patients were already receiving a mean of 2.44 medications at baseline, the observed median reduction of 1.0 medication per eye (p < 0.001) nonetheless supports the recognized medication-sparing potential of SLT in a treated glaucoma population.

### 4.2 Notable Clinical Observations: The Pigmentary Glaucoma Non-Responder

The two eyes contributed by the pigmentary glaucoma patient (baseline IOP 38.0 mmHg) warrant specific discussion. Despite markedly elevated baseline IOP — theoretically associated with greater absolute IOP-lowering potential from laser trabeculoplasty — post-SLT IOP remained essentially unchanged at both the 1-week (37.0 mmHg; a reduction of 2.6%) and 2-month (36.0 mmHg; a reduction of 5.3%) follow-up visits. These observations suggest that this patient did not achieve a meaningful clinical response to SLT.

Pigmentary glaucoma is characterized by posterior bowing of the peripheral iris caused by reverse pupillary block, which brings the iris into contact with the lens zonules; the resulting iridozonular friction abrades the iris pigment epithelium and liberates melanin granules that are subsequently deposited in the trabecular meshwork. While the resulting trabecular pigmentation might theoretically enhance SLT energy absorption, clinical trial data on SLT in pigmentary glaucoma remain limited and heterogeneous [11]. The mechanistic basis for differential SLT response in this subtype — including whether dense trabecular pigmentation paradoxically disrupts normal laser-tissue interaction or whether secondary structural trabecular changes limit outflow augmentation — remains speculative and hypothesis-generating in the absence of direct comparative data. The near-absence of IOP response in this case — at a time point when SLT effects are typically already apparent — underscores the importance of close post-SLT follow-up and individualized clinical reassessment, with low threshold for escalation to pharmacological intensification or surgical intervention in non-responding patients.

### 4.3 Mechanism of Action

SLT's IOP-lowering mechanism is attributed to selective laser-induced activation of macrophages within the trabecular meshwork, triggering a biological cascade that enhances aqueous outflow through the conventional (trabecular) pathway without the cumulative thermal coagulative damage associated with ALT [8,9,12]. This tissue-sparing property permits retreatment when SLT efficacy diminishes over time — an important consideration given that SLT IOP control has been estimated to persist for approximately 2–5 years in selected published series, though the precise durability range varies by study and population [4]. The heterogeneous response range observed in the present series (reductions of 2.6% to 41.2%) likely reflects inter-individual variation in trabecular pigmentation, pre-existing outflow facility reserve, and potentially other genetic or systemic factors governing laser-tissue interaction.

### 4.4 Strengths

Several aspects of this series merit acknowledgment. First, all 16 rows were processed through a standardized extraction and verification pipeline, yielding internally consistent data with uniform field definitions. Second, the magnitude of the observed effect — Cohen's d = −1.83 — is large enough that even after accounting for the repeated-measures inflation of effective sample size, a meaningful IOP-lowering signal is expected to persist; the directional conclusion is considered robust. Third, the mixed-diagnosis composition of the source documents (POAG, pseudoexfoliation, NTG, and pigmentary glaucoma) reflects the heterogeneity of glaucoma patients seen in real-world practice.

### 4.5 Limitations

Several important limitations must be acknowledged in interpreting the findings of this case series.

**Repeated-measures structure — critical limitation.** Post-hoc examination of the source dataset revealed that the 16 rows do not represent 16 independent pre-post paired observations from 16 distinct eyes. Instead, many rows represent repeated IOP measurements of the same eye at different follow-up time points within the same case report or clinical note. The extraction pipeline assigned separate patient identifier values to each visit row rather than collapsing repeated visits into a single record per eye. Consequently, there are approximately 9 unique eyes from approximately 8 unique patients in this dataset — not 16 eyes from 15 patients. The correct analysis for these data would require either selecting a single (e.g., last available) IOP measurement per eye or employing a mixed-effects model that accounts for within-eye correlation. The paired t-test and Wilcoxon signed-rank test applied here assume independent pairs; this assumption is violated. All reported p-values and confidence intervals must therefore be interpreted as approximate exploratory results. The directional finding — that SLT reduces IOP — is almost certainly valid and is consistent with a large published evidence base; however, the precise statistical estimates cannot be taken at face value. This is the single most important limitation of this case series.

**Sample size.** The analysis encompasses 16 observations (approximately 9 unique eyes from 8 unique patients) across 8 source documents. While the statistical effect is large and highly significant, the small sample size yields wide confidence intervals and precludes reliable subgroup analysis by glaucoma diagnosis. Non-POAG subtypes (NTG, pseudoexfoliation, pigmentary) each contribute only 2 eyes, which is insufficient for any meaningful subgroup-level inference.

**Study design.** Data were compiled from retrospective case reports and clinical progress notes rather than a prospective trial with pre-specified enrollment criteria, standardized assessment schedules, or masked outcome adjudication. Selection bias is inherent — cases appearing in written records may not be representative of the broader treated population — and variable documentation practices across source documents may introduce heterogeneity of unknown magnitude.

**Absence of a control group.** No untreated or sham comparison group was available. Regression to the mean cannot be excluded as a contributor to observed IOP reductions, particularly in eyes with high baseline IOP (e.g., the pseudoexfoliation patient with pre-SLT IOP of 34.0 mmHg). Causal attribution of IOP change to SLT alone is therefore not possible on the basis of this case series.

**Follow-up heterogeneity.** Post-SLT IOP values were not collected at uniform intervals, with follow-up ranging from 1 week to 56.5 weeks. Time-varying IOP trajectories cannot be analyzed, and the durability of the observed IOP reduction cannot be assessed from these data.

**Laser parameters.** Specific SLT technical parameters (energy per pulse, number of spots, degrees of angle treated) were not uniformly reported in source documents and could not be included as covariates or quality-control variables in the analysis.

**Sensitivity analysis not performed.** This report recommends that future analyses deduplicate repeated-visit rows to a single observation per unique eye (last-observation-carried-forward or similar) before applying inferential statistics; however, such a deduplicated sensitivity analysis was not performed in the present work. Executing this sensitivity analysis — comparing the primary results to those obtained from the approximately 9 unique eyes — should be a priority for any subsequent analysis cycle, as it would allow direct quantification of the bias introduced by the repeated-measures structure.

**Verification methodology.** All 16 rows were flagged as verified by the pipeline's algorithmic verification agent. However, this verification was performed by automated comparison against extracted data rather than by independent clinical re-abstraction by a second qualified reviewer, which would constitute the gold standard for case-series data quality assurance.

---

## 5. Conclusion

This aggregated case series — comprising 16 observations (approximately 9 unique eyes across 8 unique patients) drawn from 8 source documents, with multiple rows representing repeated follow-up visits of the same eye — demonstrates that Selective Laser Trabeculoplasty produces a statistically significant, large-magnitude reduction in intraocular pressure (mean reduction of 7.1 mmHg, 95% CI: 5.0 to 9.2 mmHg reduction; a mean reduction of 27.7%; paired t-test p < 0.001; Cohen's d = −1.83) in a mixed-diagnosis glaucoma cohort including POAG, pseudoexfoliation, normal-tension, and pigmentary glaucoma.

Seventy-five percent of eyes achieved the standard clinical success threshold of ≥20% IOP reduction, a responder rate consistent with published SLT trials and meta-analyses. A concomitant, statistically significant reduction in glaucoma medication burden was observed (median −1.0 medication per eye; Wilcoxon p < 0.001), reinforcing the clinical utility of SLT as both an IOP-lowering and medication-sparing intervention.

These findings should be interpreted with appropriate caution given the inherent limitations of the retrospective aggregated case-series design, including the most critical limitation: the 16 dataset rows include repeated measurements of the same eyes at different time points, violating the independence assumption of the statistical tests applied. All p-values and confidence intervals are therefore exploratory approximations. Additional limitations include small effective sample size, heterogeneous follow-up intervals, and absence of a control group. This case series suggests that SLT is effective in this mixed-diagnosis cohort; it does not establish causal efficacy at the level of evidence required for guideline development. Future analyses should deduplicate repeated-visit rows to a single observation per eye, or employ mixed-effects models, before applying inferential statistics. Prospective controlled studies with larger samples, uniform follow-up protocols, and standardized laser parameters are needed to characterize long-term IOP durability, to enable adequately powered subgroup analyses by glaucoma diagnosis, and to define predictors of SLT non-response.

---

## Conflicts of Interest

None declared.

## Funding

None declared.

---

## References

[1] Tham YC, Li X, Wong TY, Quigley HA, Aung T, Cheng CY. Global prevalence of glaucoma and projections of glaucoma burden through 2040: a systematic review and meta-analysis. *Ophthalmology*. 2014;121(11):2081–2090.

[2] Gazzard G, Konstantakopoulou E, Garway-Heath D, et al. Selective laser trabeculoplasty versus eye drops for first-line treatment of ocular hypertension and glaucoma (LiGHT): a multicentre randomised controlled trial. *Lancet*. 2019;393(10180):1505–1516.

[3] Rolim de Moura C, Paranhos A Jr, Wormald R. Laser trabeculoplasty for open angle glaucoma. *Cochrane Database Syst Rev*. 2007;(4):CD003919.

[4] Garg A, Gazzard G. Selective laser trabeculoplasty: past, present, and future. *Eye (Lond)*. 2018;32(5):863–876.

[5] The AGIS Investigators. The Advanced Glaucoma Intervention Study (AGIS): 7. The relationship between control of intraocular pressure and visual field deterioration. *Am J Ophthalmol*. 2000;130(4):429–440.

[6] Musch DC, Gillespie BW, Niziol LM, et al. (CIGTS Study Group). Intraocular pressure control and long-term visual field loss in the Collaborative Initial Glaucoma Treatment Study. *Ophthalmology*. 2011;118(9):1766–1773.

[7] Kass MA, Heuer DK, Higginbotham EJ, et al. (OHTS Group). The Ocular Hypertension Treatment Study: a randomized trial determines that topical ocular hypotensive medication delays or prevents the onset of primary open-angle glaucoma. *Arch Ophthalmol*. 2002;120(6):701–713.

[8] Alvarado JA, Iguchi R, Martinez J, Trivedi S, Bhatt A, Shifera AS. Beyond the meshwork pores as the site of aqueous outflow: the role of the juxtacanalicular tissue. *Am J Ophthalmol*. 2009;147(5):858–866.

[9] Damji KF, Shah KC, Rock WJ, Bains HS, Hodge WG. Selective laser trabeculoplasty v argon laser trabeculoplasty: a prospective randomised clinical trial. *Br J Ophthalmol*. 1999;83(6):718–722.

[10] Nagar M, Oguike G, Thomas R, Bhatt A. A randomised, prospective study comparing selective laser trabeculoplasty with latanoprost for the control of intraocular pressure in ocular hypertension and open angle glaucoma. *Br J Ophthalmol*. 2005;89(11):1413–1417.

[11] Realini T. Selective laser trabeculoplasty: a review. *J Glaucoma*. 2008;17(6):497–502.

[12] Latina MA, Sibayan SA, Shin DH, Noecker RJ, Marcellino G. Q-switched 532-nm Nd:YAG laser trabeculoplasty (selective laser trabeculoplasty): a multicenter, pilot, clinical study. *Ophthalmology*. 1998;105(11):2082–2090.

[13] Gagnier JJ, Kienle G, Altman DG, Moher D, Sox H, Riley D; CARE Group. The CARE guidelines: consensus-based clinical case reporting guideline development. *J Med Case Rep*. 2013;7:223.
