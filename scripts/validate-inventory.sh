#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INVENTORY_FILE="$ROOT_DIR/docs/shared-drive-inventory.md"

if [[ ! -f "$INVENTORY_FILE" ]]; then
  echo "Inventory file not found: $INVENTORY_FILE" >&2
  exit 1
fi

echo "Validating shared drive inventory..."

awk -F'|' '
  function trim(s) {
    gsub(/^[ \t]+|[ \t]+$/, "", s)
    return s
  }

  /^\|/ {
    if ($0 ~ /^\|---/) next
    if (tolower($2) ~ /drive name/) next

    drive = trim($2)
    url = trim($3)
    last_review = trim($8)
    next_review = trim($9)
    status = trim($10)

    if (drive == "") next

    if (url !~ /^https:\/\/drive\.google\.com\//) {
      printf "ERROR line %d: invalid Drive URL for '\''%s'\''\n", NR, drive > "/dev/stderr"
      err = 1
    }

    if (last_review !~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/) {
      printf "ERROR line %d: invalid Last Review date for '\''%s'\'' (%s)\n", NR, drive, last_review > "/dev/stderr"
      err = 1
    }

    if (next_review !~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/) {
      printf "ERROR line %d: invalid Next Review Due date for '\''%s'\'' (%s)\n", NR, drive, next_review > "/dev/stderr"
      err = 1
    }

    if (status != "Active" && status != "Archived") {
      printf "ERROR line %d: invalid Status for '\''%s'\'' (%s)\n", NR, drive, status > "/dev/stderr"
      err = 1
    }

    if (last_review > next_review) {
      printf "ERROR line %d: Last Review is after Next Review Due for '\''%s'\''\n", NR, drive > "/dev/stderr"
      err = 1
    }
  }

  END {
    exit err
  }
' "$INVENTORY_FILE"

echo "Inventory validation passed."
