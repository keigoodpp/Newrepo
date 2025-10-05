#!/usr/bin/env bash
set -euo pipefail

# Start Next.js (apps/web) on 3000
if ! pgrep -f "next dev -H 0.0.0.0 -p 3000" >/dev/null 2>&1; then
  bash -lc "npm -w apps/web run dev" >/tmp/web-dev.log 2>&1 &
fi

# Start Laravel API on 8000
if ! pgrep -f "php artisan serve --host 0.0.0.0 --port 8000" >/dev/null 2>&1; then
  (cd apps/api && php artisan serve --host 0.0.0.0 --port 8000) >/tmp/api-dev.log 2>&1 &
fi

echo "Dev servers started: web:3000, api:8000"
