#!/usr/bin/env bash
set -euo pipefail

# Web (Vite) — runs on 3000
if [ -d "apps/web" ]; then
  pushd apps/web >/dev/null
  # ensure deps (idempotent)
  command -v pnpm >/dev/null || npm install -g pnpm
  pnpm install
  # host 0.0.0.0 so Codespaces can port-forward
  nohup pnpm dev -- --host 0.0.0.0 --port 3000 >/tmp/web.out 2>&1 &
  popd >/dev/null
fi

# API (Laravel) — runs on 8000
if [ -d "apps/api" ]; then
  # composer may not exist in minimal images; install if needed
  if ! command -v composer >/dev/null 2>&1; then
    sudo apt-get update -y
    sudo apt-get install -y composer
  fi
  composer install -d apps/api
  # serve public dir; bind to 0.0.0.0 for forwarding
  nohup php -S 0.0.0.0:8000 -t apps/api/public >/tmp/api.out 2>&1 &
fi

echo "Started: web -> :3000, api -> :8000"
