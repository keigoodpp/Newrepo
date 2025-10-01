#!/usr/bin/env bash
set -euo pipefail

# Start Next.js (apps/web) on 3000
if ! pgrep -f "next dev -H 0.0.0.0 -p 3000" >/dev/null 2>&1; then
  bash -lc "npm -w apps/web run dev" >/tmp/web-dev.log 2>&1 &
fi

# Start PHP API on 8000
if ! pgrep -f "php -S 0.0.0.0:8000 -t apps/api/public" >/dev/null 2>&1; then
  php -S 0.0.0.0:8000 -t apps/api/public >/tmp/api-dev.log 2>&1 &
fi

echo "Dev servers started: web:3000, api:8000"
