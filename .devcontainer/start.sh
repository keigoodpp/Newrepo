set -e
API_URL=$(gp url 8000)
FRONT_URL=$(gp url 3000)

# Laravel API起動
if [ -d apps/api ]; then
  cd apps/api
  sed -i "s|^APP_URL=.*|APP_URL=${API_URL}|" .env || echo "APP_URL=${API_URL}" >> .env
  php artisan config:clear || true
  php artisan serve --host=0.0.0.0 --port=8000 >/tmp/api.log 2>&1 &
  cd - >/dev/null
fi

# Web(Vite)起動
if [ -d apps/web ]; then
  cd apps/web
  echo "VITE_API_BASE=${API_URL}" > .env.local
  pnpm run dev -- --host --port 3000 --strictPort >/tmp/web.log 2>&1 &
  cd - >/dev/null
fi

echo "Front: ${FRONT_URL}"
echo "API  : ${API_URL}"
