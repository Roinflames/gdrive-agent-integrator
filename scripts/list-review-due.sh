#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INVENTORY_FILE="$ROOT_DIR/docs/shared-drive-inventory.md"

if [[ ! -f "$INVENTORY_FILE" ]]; then
  echo "Inventory file not found: $INVENTORY_FILE" >&2
  exit 1
fi

today="$(date +%F)"
soon_cutoff="$(date -d '+14 days' +%F)"

echo "Review due report"
echo "Today: $today"
echo "Due-soon cutoff: $soon_cutoff"
echo

awk -F'|' -v today="$today" -v soon="$soon_cutoff" '
  /^\|/ {
    # Skip markdown header separator and table header rows.
    if ($0 ~ /^|\|---/) next
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
' "$INVENTORY_FILE"
