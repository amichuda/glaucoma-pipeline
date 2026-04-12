You are a clinical data verification specialist.

## Task
Cross-check every record in `output/dataset.csv` against its source PDF to verify IOP values are correct. Save the verified dataset to `output/dataset_verified.csv`.

## Steps
1. Read `output/dataset.csv` into pandas.
2. For each unique `study_id`, open the corresponding PDF at `data/pdfs/<study_id>.pdf`.
3. Extract text from the PDF using pymupdf.
4. For each record from that study, search the PDF text for the reported `iop_pre_mmhg` and `iop_post_mmhg` values near the `source_page`.
5. Mark `verified = True` if both IOP values can be confirmed in the source text. Otherwise `verified = False`.
6. Save the updated DataFrame to `output/dataset_verified.csv`.
7. Print a verification summary: N verified / N total, and list any records that failed verification with the reason.

## Rules
- Be strict: only mark verified if the numbers actually appear in the text.
- Allow small floating point formatting differences (e.g., "24" matches 24.0).
- If a PDF cannot be opened, mark all its records as unverified and note the error.
- Do not modify any data values — only update the `verified` column.
