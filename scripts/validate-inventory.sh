#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INVENTORY_FILE="$ROOT_DIR/docs/shared-drive-inventory.md"

if [[ ! -f "$INVENTORY_FILE" ]]; then
  echo "Inventory file not found: $INVENTORY_FILE" >&2
  exit 1
fi

echo "Validating shared drive inventory..."

errors=0
line_no=0

while IFS= read -r line; do
  line_no=$((line_no + 1))

  [[ "$line" == \|* ]] || continue
  [[ "$line" == *"---"* ]] && continue
  [[ "$line" == *"Drive Name"* ]] && continue

  # Extract/trim fields from markdown table row.
  IFS='|' read -r _ drive url owner primary backup sensitivity last_review next_review status _ <<< "$line"

  for var in drive url owner primary backup sensitivity last_review next_review status; do
    # shellcheck disable=SC2163
    eval "$var=\"\${$var#${!var%%[![:space:]]*}}\""
    # shellcheck disable=SC2163
    eval "$var=\"\${$var%${!var##*[![:space:]]}}\""
  done

  [[ -z "$drive" ]] && continue

  if [[ -z "$url" || "$url" != https://drive.google.com/* ]]; then
    echo "ERROR line $line_no: invalid Drive URL for '$drive'" >&2
    errors=1
  fi

  if ! [[ "$last_review" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "ERROR line $line_no: invalid Last Review date for '$drive' ($last_review)" >&2
    errors=1
  fi

  if ! [[ "$next_review" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "ERROR line $line_no: invalid Next Review Due date for '$drive' ($next_review)" >&2
    errors=1
  fi

  if [[ "$status" != "Active" && "$status" != "Archived" ]]; then
    echo "ERROR line $line_no: invalid Status for '$drive' ($status)" >&2
    errors=1
  fi

  if [[ "$last_review" > "$next_review" ]]; then
    echo "ERROR line $line_no: Last Review is after Next Review Due for '$drive'" >&2
    errors=1
  fi
done < "$INVENTORY_FILE"

if [[ "$errors" -ne 0 ]]; then
  exit 1
fi

echo "Inventory validation passed."
