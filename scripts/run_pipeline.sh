#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════
# Glaucoma Intervention Analysis Pipeline — Claude Code Orchestrator
# ═══════════════════════════════════════════════════════════════════
#
# Usage:
#   ./scripts/run_pipeline.sh --intervention "SLT" [OPTIONS]
#
# Options:
#   --pdfs DIR           PDF input directory (default: data/pdfs)
#   --start-from AGENT   Resume from a specific agent
#   --non-interactive    Skip insights review pause
#   --max-revisions N    Max writer↔critic loops (default: 3)
#   --generate-test-data Generate synthetic PDFs before running
#   --validate           Run ground-truth validation after extraction
#
# Agent order:
#   [generate_test_data] → extractor → dataset_builder → verifier →
#   [validate] → analyst → insights → outliner → writer → critic/reviser loop
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
AGENT_RUNNER="$PROJECT_DIR/agents/run_agent.sh"

# ── Defaults ──────────────────────────────────────────────────────
INTERVENTION=""
PDF_DIR="data/pdfs"
START_FROM=""
NON_INTERACTIVE=""
MAX_REVISIONS=3
GENERATE_TEST_DATA=""
VALIDATE=""

# ── Parse args ────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --intervention)       INTERVENTION="$2"; shift 2 ;;
        --pdfs)               PDF_DIR="$2"; shift 2 ;;
        --start-from)         START_FROM="$2"; shift 2 ;;
        --non-interactive)    NON_INTERACTIVE="1"; shift ;;
        --max-revisions)      MAX_REVISIONS="$2"; shift 2 ;;
        --generate-test-data) GENERATE_TEST_DATA="1"; shift ;;
        --validate)           VALIDATE="1"; shift ;;
        -h|--help)
            head -22 "$0" | tail -20
            exit 0 ;;
        *) echo "Unknown argument: $1"; exit 1 ;;
    esac
done

if [[ -z "$INTERVENTION" ]]; then
    echo "Error: --intervention is required"
    echo "Usage: $0 --intervention \"SLT\" [--generate-test-data] [--validate]"
    exit 1
fi

cd "$PROJECT_DIR"

# ── Setup ─────────────────────────────────────────────────────────
mkdir -p output data/pdfs data/extracted notebooks

echo "$INTERVENTION" > output/.intervention

# ── Banner ────────────────────────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   GLAUCOMA INTERVENTION ANALYSIS PIPELINE               ║"
echo "╠══════════════════════════════════════════════════════════╣"
echo "║  Intervention      : $INTERVENTION"
echo "║  PDFs              : $PDF_DIR"
echo "║  Start from        : ${START_FROM:-beginning}"
echo "║  Max revisions     : $MAX_REVISIONS"
echo "║  Generate test data: ${GENERATE_TEST_DATA:-no}"
echo "║  Validate          : ${VALIDATE:-no}"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# ── Stage 0 (optional): Generate synthetic test PDFs ─────────────
if [[ -n "$GENERATE_TEST_DATA" ]]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Stage 0: Generating synthetic test data"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    bash "$AGENT_RUNNER" generate_test_data --intervention "$INTERVENTION"
fi

# ── Check for PDFs ────────────────────────────────────────────────
PDF_COUNT=$(find "$PDF_DIR" -name "*.pdf" 2>/dev/null | wc -l)
if [[ "$PDF_COUNT" -eq 0 ]]; then
    echo "⚠  No PDFs found in $PDF_DIR"
    echo "   Place your case report PDFs there, or re-run with --generate-test-data"
    exit 1
fi
echo "Found $PDF_COUNT PDF(s) in $PDF_DIR"
echo ""

# ── Define pipeline stages ───────────────────────────────────────
AGENTS=(extractor dataset_builder verifier)

if [[ -n "$VALIDATE" ]]; then
    AGENTS+=(validate)
fi

AGENTS+=(analyst insights outliner writer)

# ── Determine start index ────────────────────────────────────────
START_IDX=0
if [[ -n "$START_FROM" ]]; then
    FOUND=0
    for i in "${!AGENTS[@]}"; do
        if [[ "${AGENTS[$i]}" == "$START_FROM" ]]; then
            START_IDX=$i
            FOUND=1
            break
        fi
    done
    if [[ "$FOUND" -eq 0 ]]; then
        if [[ "$START_FROM" == "critic" || "$START_FROM" == "critic_loop" ]]; then
            START_IDX=${#AGENTS[@]}
        else
            echo "Unknown start-from agent: $START_FROM"
            echo "Available: ${AGENTS[*]} critic"
            exit 1
        fi
    fi
fi

# ── Run sequential agents ────────────────────────────────────────
TOTAL_STAGES=$(( ${#AGENTS[@]} + 1 ))

for i in "${!AGENTS[@]}"; do
    if [[ $i -lt $START_IDX ]]; then
        continue
    fi

    AGENT="${AGENTS[$i]}"

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Stage $((i+1))/$TOTAL_STAGES: $AGENT"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    EXTRA_ARGS=(--intervention "$INTERVENTION")

    if [[ "$AGENT" == "insights" && -z "$NON_INTERACTIVE" ]]; then
        echo ""
        echo "┌─────────────────────────────────────────────────┐"
        echo "│  INTERACTIVE REVIEW: insights                   │"
        echo "│  Claude will present findings for your review.  │"
        echo "│  You can request revisions in the chat.         │"
        echo "│  Type /exit when satisfied to continue.         │"
        echo "└─────────────────────────────────────────────────┘"
        echo ""
        bash "$AGENT_RUNNER" "$AGENT" "${EXTRA_ARGS[@]}" --interactive
    else
        bash "$AGENT_RUNNER" "$AGENT" "${EXTRA_ARGS[@]}"
    fi
done

# ── Writer ↔ Critic adversarial loop ────────────────────────────
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Stage $TOTAL_STAGES/$TOTAL_STAGES: Writer ↔ Critic Loop (max $MAX_REVISIONS rounds)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

for round in $(seq 1 "$MAX_REVISIONS"); do
    echo ""
    echo "  ── Critic round $round/$MAX_REVISIONS ──"

    bash "$AGENT_RUNNER" critic --intervention "$INTERVENTION"

    if [[ -f output/critique.json ]]; then
        PASSED=$(python3 -c "
import json
with open('output/critique.json') as f:
    d = json.load(f)
print('true' if d.get('pass', False) else 'false')
" 2>/dev/null || echo "false")

        SCORE=$(python3 -c "
import json
with open('output/critique.json') as f:
    d = json.load(f)
print(f\"{d.get('overall_score', 0):.2f}\")
" 2>/dev/null || echo "?")

        echo "  Score: $SCORE | Pass: $PASSED"

        if [[ "$PASSED" == "true" ]]; then
            echo ""
            echo "  ✓ Report passed critique!"
            break
        fi

        if [[ $round -lt $MAX_REVISIONS ]]; then
            echo "  → Sending back to writer for revision..."
            cp output/critique.json "output/critique_round_${round}.json"
            bash "$AGENT_RUNNER" reviser --intervention "$INTERVENTION"
        else
            echo "  ⚠ Max revision rounds reached. Using latest version."
        fi
    else
        echo "  ⚠ No critique.json produced. Skipping."
        break
    fi
done

# ── Finalize ─────────────────────────────────────────────────────
cp output/case_report_draft.md output/case_report_final.md 2>/dev/null || true

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   PIPELINE COMPLETE                                     ║"
echo "╠══════════════════════════════════════════════════════════╣"

for f in data/ground_truth.json \
         output/dataset.csv output/dataset_verified.csv \
         output/validation_report.md \
         notebooks/analysis.py output/insights.md \
         output/case_report_outline.md output/case_report_final.md; do
    if [[ -f "$f" ]]; then
        echo "║  ✓ $f"
    else
        echo "║  · $f (not generated)"
    fi
done

echo "╠══════════════════════════════════════════════════════════╣"
echo "║  Next steps:                                            ║"
echo "║    marimo edit notebooks/analysis.py                    ║"
echo "║    cat output/case_report_final.md                      ║"
if [[ -n "$VALIDATE" ]]; then
echo "║    cat output/validation_report.md                      ║"
fi
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
