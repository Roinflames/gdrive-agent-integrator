#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$ROOT_DIR/docs/shared-drive-request-template.md"
OUT_DIR="$ROOT_DIR/docs/requests"

usage() {
  echo "Usage: $0 \"<requested_by>\" \"<team>\" \"<slug>\"" >&2
}

if [[ ! -f "$TEMPLATE" ]]; then
  echo "Template not found: $TEMPLATE" >&2
  exit 1
fi

if [[ "$#" -lt 3 ]]; then
  usage
  exit 1
fi

requestor="${1:-${USER:-unknown}}"
team="${2}"
slug="${3:-shared-drive}"

request_date="$(date +%F)"
ts="$(date +%Y%m%d-%H%M%S)"
request_id="SDR-$ts"

mkdir -p "$OUT_DIR"
out_file="$OUT_DIR/${request_date}-${slug}.md"

if [[ -e "$out_file" ]]; then
  echo "Request file already exists: $out_file" >&2
  exit 1
fi

cp "$TEMPLATE" "$out_file"

sed -i "s#^- Request ID:#- Request ID: ${request_id}#" "$out_file"
sed -i "s#^- Request date:#- Request date: ${request_date}#" "$out_file"
sed -i "s#^- Requested by:#- Requested by: ${requestor}#" "$out_file"
sed -i "s#^- Team/Area:#- Team/Area: ${team}#" "$out_file"

echo "Created request: $out_file"
