#!/usr/bin/env bash
# Run a single agent by name.
# Usage: ./agents/run_agent.sh <agent_name> [--intervention NAME]
#
# Agent names: extractor, dataset_builder, verifier, analyst, insights,
#              outliner, writer, critic, reviser

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

AGENT_NAME="${1:?Usage: run_agent.sh <agent_name>}"
shift

# Parse optional flags
INTERVENTION=""
INTERACTIVE=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --intervention) INTERVENTION="$2"; shift 2 ;;
        --interactive) INTERACTIVE="1"; shift ;;
        *) echo "Unknown arg: $1"; exit 1 ;;
    esac
done

# Map agent name to prompt number
declare -A AGENT_MAP=(
    [generate_test_data]="00_generate_test_data"
    [extractor]="01_extractor"
    [dataset_builder]="02_dataset_builder"
    [verifier]="03_verifier"
    [analyst]="04_analyst"
    [insights]="05_insights"
    [outliner]="06_outliner"
    [writer]="07_writer"
    [critic]="08_critic"
    [reviser]="09_reviser"
    [validate]="10_validate"
)

PROMPT_NAME="${AGENT_MAP[$AGENT_NAME]:-}"
if [[ -z "$PROMPT_NAME" ]]; then
    echo "Unknown agent: $AGENT_NAME"
    echo "Available: ${!AGENT_MAP[*]}"
    exit 1
fi

PROMPT_FILE="$PROJECT_DIR/prompts/${PROMPT_NAME}.md"
if [[ ! -f "$PROMPT_FILE" ]]; then
    echo "Prompt file not found: $PROMPT_FILE"
    exit 1
fi

# Set intervention if provided
if [[ -n "$INTERVENTION" ]]; then
    mkdir -p "$PROJECT_DIR/output"
    echo "$INTERVENTION" > "$PROJECT_DIR/output/.intervention"
fi

cd "$PROJECT_DIR"

PROMPT_CONTENT=$(cat "$PROMPT_FILE")

echo "═══════════════════════════════════════════════════"
echo "  Agent: $AGENT_NAME"
echo "═══════════════════════════════════════════════════"

if [[ "$AGENT_NAME" == "insights" && -n "$INTERACTIVE" ]]; then
    # Interactive mode: use claude chat so user can review and revise
    claude --chat "$PROMPT_CONTENT"
else
    # Non-interactive: use prompt mode
    claude -p "$PROMPT_CONTENT" --allowedTools "Bash(command:*)" "Edit" "Read" "Write"
fi

echo ""
echo "✓ Agent '$AGENT_NAME' complete."
