#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INVENTORY_FILE="$ROOT_DIR/docs/shared-drive-inventory.md"
WINDOW_DAYS="${REVIEW_WINDOW_DAYS:-14}"
FAIL_ON_OVERDUE=0

usage() {
  echo "Usage: $0 [--fail-on-overdue]" >&2
}

if [[ "${1:-}" == "--fail-on-overdue" ]]; then
  FAIL_ON_OVERDUE=1
  shift
fi

if [[ "$#" -ne 0 ]]; then
  usage
  exit 1
fi

if [[ ! -f "$INVENTORY_FILE" ]]; then
  echo "Inventory file not found: $INVENTORY_FILE" >&2
  exit 1
fi

today="$(date +%F)"
soon_cutoff="$(date -d "+${WINDOW_DAYS} days" +%F)"
report_file="$(mktemp)"
trap 'rm -f "$report_file"' EXIT

echo "Review due report"
echo "Today: $today"
echo "Due-soon cutoff: $soon_cutoff"
echo

awk -F'|' -v today="$today" -v soon="$soon_cutoff" '
  /^\|/ {
    # Skip markdown separator/header rows.
    if ($0 ~ /^\|---/) next
    if (tolower($2) ~ /drive name/) next

    drive=$2
    due=$9
    status=$10

    gsub(/^[ \t]+|[ \t]+$/, "", drive)
    gsub(/^[ \t]+|[ \t]+$/, "", due)
    gsub(/^[ \t]+|[ \t]+$/, "", status)

    if (drive == "" || due == "") next
    if (status != "Active") next

    if (due < today) {
      printf "OVERDUE  | %s | due %s\n", drive, due
    } else if (due <= soon) {
      printf "DUE_SOON | %s | due %s\n", drive, due
    }
  }
' "$INVENTORY_FILE" > "$report_file"

if [[ -s "$report_file" ]]; then
  cat "$report_file"
else
  echo "No overdue or due-soon reviews."
fi

overdue_count="$(rg -c '^OVERDUE' "$report_file" || true)"

if [[ "$FAIL_ON_OVERDUE" -eq 1 && "$overdue_count" -gt 0 ]]; then
  echo
  echo "ERROR: found $overdue_count overdue review(s)." >&2
  exit 2
fi
