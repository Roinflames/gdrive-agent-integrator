#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$ROOT_DIR/docs/review-template.md"
OUT_DIR="$ROOT_DIR/docs/reviews"

if [[ ! -f "$TEMPLATE" ]]; then
  echo "Template not found: $TEMPLATE" >&2
  exit 1
fi

reviewer="${1:-${USER:-unknown}}"
quarter_override="${2:-}"

year="$(date +%Y)"
month="$(date +%-m)"
q=$(( (month - 1) / 3 + 1 ))
quarter="${quarter_override:-${year}-Q${q}}"

review_date="$(date +%F)"
ts="$(date +%Y%m%d-%H%M%S)"
review_id="QSR-$ts"
out_file="$OUT_DIR/${quarter}.md"

mkdir -p "$OUT_DIR"
cp "$TEMPLATE" "$out_file"

sed -i "s#^- Review ID:#- Review ID: ${review_id}#" "$out_file"
sed -i "s#^- Quarter:#- Quarter: ${quarter}#" "$out_file"
sed -i "s#^- Review date:#- Review date: ${review_date}#" "$out_file"
sed -i "s#^- Reviewer:#- Reviewer: ${reviewer}#" "$out_file"

echo "Created quarterly review: $out_file"
