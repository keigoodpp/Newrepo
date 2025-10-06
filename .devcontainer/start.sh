set -e
# Codespaces公開URLを取得
API_URL=$(gp url 8000)
FRONT_URL=$(gp url 3000)

# API 起動（Laravel）
if [ -d apps/api ]; then
  cd apps/api
  # APP_URL を公開URLに合わせる
  if grep -q '^APP_URL=' .env; then
    sed -i "s|^APP_URL=.*|APP_URL=${API_URL}|" .env
  else
    echo "APP_URL=${API_URL}" >> .env
  fi
  php artisan config:clear || true
  php artisan route:clear || true
  php artisan serve --host=0.0.0.0 --port=8000 >/tmp/api.log 2>&1 &
  cd - >/dev/null
fi

# Web 起動（Vite）
if [ -d apps/web ]; then
  cd apps/web
  echo "VITE_API_BASE=${API_URL}" > .env.local
  # --host/--strictPortで外部から確実に見えるように
  npm run dev -- --host --port 3000 --strictPort >/tmp/web.log 2>&1 &
  cd - >/dev/null
fi

echo "Front: ${FRONT_URL}"
echo "API  : ${API_URL}"