# Glaucoma Intervention Analysis Pipeline

## Project Overview
Multi-agent pipeline for biostatistical evaluation of glaucoma interventions from PDF case reports. Each agent is a Claude Code task orchestrated by `scripts/run_pipeline.sh`.

## Architecture
```
[generate_test_data] → synthetic PDFs + ground_truth.json
                            │
PDF Case Reports ───────────┘
      │
      ▼
Extractor → Dataset Builder → Verifier → [Validate vs ground truth]
                                              │
      ┌───────────────────────────────────────┘
      ▼
Analyst (marimo notebook) → Insights (user review) → Outliner → Writer ↔ Critic loop → Final Report
```

## Directory Layout
```
data/pdfs/           ← Drop input PDFs here
data/extracted/      ← Per-PDF JSON extraction results
output/
  dataset.csv        ← Compiled dataset
  dataset_verified.csv
  analysis_results.json
  insights.md        ← User-reviewable insights
  case_report_outline.md
  case_report_draft.md
  case_report_final.md
  critique_round_N.json
notebooks/
  analysis.py        ← Marimo notebook
prompts/             ← Agent system prompts
agents/              ← Agent runner scripts
scripts/             ← Orchestration
```

## Data Schema (dataset.csv)
| Column | Type | Description |
|--------|------|-------------|
| patient_id | str | Unique patient identifier |
| study_id | str | Source PDF filename (stem) |
| eye | str | OD / OS / OU |
| age | int | Patient age |
| sex | str | M / F |
| intervention | str | Intervention name |
| iop_pre_mmhg | float | IOP before intervention (mmHg) |
| iop_post_mmhg | float | IOP after intervention (mmHg) |
| followup_weeks | float | Weeks post-intervention |
| num_meds_pre | int | Glaucoma medications before |
| num_meds_post | int | Glaucoma medications after |
| diagnosis | str | Primary glaucoma diagnosis |
| notes | str | Additional clinical notes |
| source_page | int | PDF page number |
| verified | bool | Verification agent confirmed |

## Key Conventions
- All agent scripts live in `agents/` and are invoked via `claude -p`
- Prompts in `prompts/` are the system-level instructions per agent
- Intermediate state passes through files in `output/` — agents read predecessor outputs
- The pipeline is idempotent: re-running an agent overwrites its outputs
- Python dependencies: pandas, scipy, matplotlib, seaborn, pingouin, pymupdf, marimo
- The `INTERVENTION` variable is set at pipeline start and propagated to all agents

## Running

```bash
# Full pipeline with real PDFs
./scripts/run_pipeline.sh --intervention "SLT" --pdfs data/pdfs/

# Full pipeline with synthetic test data + validation
./scripts/run_pipeline.sh --intervention "SLT" --generate-test-data --validate

# Non-interactive (skips insights review)
./scripts/run_pipeline.sh --intervention "SLT" --generate-test-data --validate --non-interactive

# Single agent
./agents/run_agent.sh extractor --intervention "SLT"

# Generate test data only
./agents/run_agent.sh generate_test_data --intervention "SLT"

# Validate extraction against ground truth
./agents/run_agent.sh validate --intervention "SLT"

# Interactive insights review
./agents/run_agent.sh insights --interactive

# Resume from a specific stage
./scripts/run_pipeline.sh --intervention "SLT" --start-from analyst

# Open analysis notebook
marimo edit notebooks/analysis.py
```

## Test Data Generation

The `generate_test_data` agent creates 8 synthetic PDFs:
- 5 case report–style PDFs (title, abstract, case presentation, results, discussion)
- 3 clinical note–style PDFs (EHR progress notes with exam findings)

Each has realistic IOP values, demographics, medications, and diagnoses. A ground-truth
answer key is saved to `data/ground_truth.json` so the `validate` agent can score
extraction accuracy.

## Validation

The `validate` agent compares `output/dataset_verified.csv` against `data/ground_truth.json`:
- Matches records by study_id + eye + followup_weeks
- Reports per-field accuracy (IOP pre/post, eye, diagnosis, medications)
- Outputs `output/validation_report.json` and `output/validation_report.md`
