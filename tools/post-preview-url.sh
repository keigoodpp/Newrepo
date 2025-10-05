#!/usr/bin/env bash
set -euo pipefail

: "${CODESPACE_NAME:?CODESPACE_NAME is required in Codespaces}"

print_url() { local p="$1"; echo "🔗 Preview (${p}): https://${CODESPACE_NAME}-${p}.app.github.dev"; }

if [ $# -gt 0 ]; then
  print_url "$1"
  urls="Port $1: https://${CODESPACE_NAME}-$1.app.github.dev"
else
  print_url 3000
  print_url 8000
  urls=$(printf 'Ports 3000 & 8000:\n- https://%s-3000.app.github.dev\n- https://%s-8000.app.github.dev' "$CODESPACE_NAME" "$CODESPACE_NAME")
fi

if command -v gh >/dev/null 2>&1 && gh pr view >/dev/null 2>&1; then
  gh pr comment --body "$urls" || true
fi
