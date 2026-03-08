#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Validating generated docs (requests/reviews) for unresolved placeholders..."

failed=0

# Validate completed request/review records only (exclude templates/readmes).
for f in docs/requests/*.md docs/reviews/*.md; do
  [[ -e "$f" ]] || continue
  base="$(basename "$f")"
  [[ "$base" == "README.md" ]] && continue

  if rg -n -i '\bpending\b|\bTBD\b|Open / Closed' "$f"; then
    echo "ERROR: unresolved placeholder found in $f"
    failed=1
  fi
done

if [[ "$failed" -ne 0 ]]; then
  exit 1
fi

echo "Docs placeholder validation passed."
