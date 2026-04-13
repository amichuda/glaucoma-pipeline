# Extraction Validation Report

## Summary Statistics

| Metric | Value |
|--------|-------|
| Ground-truth records | 16 |
| Matched records | 13 |
| Missed records | 3 |
| Match rate | 81.2% |
| Overall field accuracy (matched) | 100.0% |
| Mean follow-up delta (weeks) | 0.48 |

### Per-Field Accuracy

| Field | Pass | Total | Accuracy |
|-------|------|-------|----------|
| iop_pre_mmhg | 13 | 13 | 100.0% |
| iop_post_mmhg | 13 | 13 | 100.0% |
| eye | 13 | 13 | 100.0% |
| diagnosis | 13 | 13 | 100.0% |
| num_meds_pre | 13 | 13 | 100.0% |
| num_meds_post | 13 | 13 | 100.0% |

## Matched Records

| study_id | eye | FU exp (w) | FU act (w) | iop_pre | iop_post | diagnosis | meds_pre | meds_post | All pass |
|----------|-----|-----------|-----------|---------|----------|-----------|----------|-----------|----------|
| case_report_01 | OS | 4 | 4.0 | 28.0 | 19.0 | POAG | 2 | 2 | Yes |
| case_report_01 | OS | 12 | 13.0 | 28.0 | 17.0 | POAG | 2 | 1 | Yes |
| case_report_02 | OD | 6 | 6.0 | 34.0 | 22.0 | Pseudoexfoliation glaucoma | 3 | 3 | Yes |
| case_report_03 | OD | 8 | 8.7 | 26.0 | 18.0 | POAG | 2 | 1 | Yes |
| case_report_03 | OS | 8 | 8.7 | 24.0 | 16.0 | POAG | 2 | 1 | Yes |
| case_report_04 | OD | 12 | 13.0 | 16.0 | 13.0 | Normal-tension glaucoma | 2 | 1 | Yes |
| case_report_04 | OD | 26 | 26.0 | 16.0 | 12.0 | Normal-tension glaucoma | 2 | 1 | Yes |
| case_report_05 | OS | 1 | 1.0 | 38.0 | 37.0 | Pigmentary glaucoma | 4 | 4 | Yes |
| case_report_05 | OS | 8 | 8.7 | 38.0 | 36.0 | Pigmentary glaucoma | 4 | 4 | Yes |
| clinical_note_01 | OD | 6 | 6.0 | 24.0 | 16.0 | POAG | 3 | 2 | Yes |
| clinical_note_02 | OS | 4 | 4.0 | 22.0 | 15.0 | POAG | 2 | 1 | Yes |
| clinical_note_02 | OS | 16 | 17.4 | 22.0 | 14.0 | POAG | 2 | 1 | Yes |
| clinical_note_03 | OD | 8 | 8.7 | 19.0 | 18.0 | POAG | 2 | 2 | Yes |

## Missed Records

| study_id | eye | Expected FU (weeks) | Reason |
|----------|-----|---------------------|--------|
| case_report_02 | OD | 24 | No extracted row with matching study_id + eye within ±2 weeks |
| case_report_03 | OD | 52 | No extracted row with matching study_id + eye within ±2 weeks |
| case_report_03 | OS | 52 | No extracted row with matching study_id + eye within ±2 weeks |

## Recommendations

1. 3 ground-truth record(s) had no matching extracted row. Review the extractor's handling of follow-up time-point parsing — especially month-to-week conversions (some records show ~4-week drift).
