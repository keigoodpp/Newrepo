#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-3000}"
: "${CODESPACE_NAME:?CODESPACE_NAME is required in Codespaces}"
URL="https://${CODESPACE_NAME}-${PORT}.app.github.dev"
echo "🔗 Preview: ${URL}"

# Optional: comment to the current PR if GH env is available
if command -v gh >/dev/null 2>&1 && [ -n "${GITHUB_REF_NAME:-}" ]; then
  if gh pr status >/dev/null 2>&1; then
    gh pr comment --body "Preview for port ${PORT}: ${URL}" || true
  fi
fi
