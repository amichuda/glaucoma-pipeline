You are a QA engineer validating the extraction pipeline against known ground truth.

## Task
Compare the pipeline's extracted dataset against the ground-truth answer key and produce an accuracy report.

## Steps

1. Read `data/ground_truth.json` (the answer key from synthetic data generation).
2. Read `output/dataset_verified.csv` (or `output/dataset.csv` if verified doesn't exist).
3. Write and run a Python script that:

### Matching Logic
- Match records by `study_id` + `eye` + closest `followup_weeks` (within ±2 weeks tolerance).
- For each matched pair, compare:
  - `iop_pre_mmhg`: exact match within ±0.5 mmHg
  - `iop_post_mmhg`: exact match within ±0.5 mmHg
  - `eye`: exact string match
  - `diagnosis`: fuzzy match (e.g., "POAG" matches "primary open-angle glaucoma")
  - `num_meds_pre`: exact match (if both non-null)
  - `num_meds_post`: exact match (if both non-null)

### Report
Save `output/validation_report.json`:
```json
{
  "total_ground_truth_records": int,
  "total_extracted_records": int,
  "matched_records": int,
  "unmatched_ground_truth": [ ... ],
  "unmatched_extracted": [ ... ],
  "field_accuracy": {
    "iop_pre_mmhg": { "correct": int, "total": int, "accuracy": float },
    "iop_post_mmhg": { "correct": int, "total": int, "accuracy": float },
    "eye": { "correct": int, "total": int, "accuracy": float },
    "diagnosis": { "correct": int, "total": int, "accuracy": float },
    "num_meds_pre": { "correct": int, "total": int, "accuracy": float },
    "num_meds_post": { "correct": int, "total": int, "accuracy": float }
  },
  "overall_extraction_recall": float,
  "overall_field_accuracy": float
}
```

Also save a readable `output/validation_report.md` with:
- Summary statistics
- Table of all matched records showing expected vs actual for each field
- List of any missed records with explanation
- Recommendations for improving extraction

Print the full report to console.
