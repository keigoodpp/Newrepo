#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-3000}"
: "${CODESPACE_NAME:?CODESPACE_NAME is required in Codespaces}"
URL="https://${CODESPACE_NAME}-${PORT}.app.github.dev"
echo "🔗 Preview: ${URL}"

# Optional: comment to the current PR if GH CLI is available
if command -v gh >/dev/null 2>&1; then
  if gh pr view >/dev/null 2>&1; then
    gh pr comment --body "Preview for port ${PORT}: ${URL}" || true
  fi
fi
