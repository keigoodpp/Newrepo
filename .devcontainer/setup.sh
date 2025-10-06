set -e
# ----- 共通ツール -----
sudo apt-get update -y
sudo apt-get install -y curl unzip
# composer（なければ）
if ! command -v composer >/dev/null 2>&1; then
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  rm -f composer-setup.php
fi
# Node系
npm i -g pnpm
# ----- Web -----
if [ -d apps/web ]; then
  cd apps/web
  npm i || pnpm i || true
  # Vite のHMRが github.dev でも安定するように
  if [ -f vite.config.ts ] && ! grep -q "clientPort: 443" vite.config.ts; then
    sed -i 's/server:\s*{[^}]*}/server: { host: true, port: 3000, strictPort: true, hmr: { clientPort: 443 } }/g' vite.config.ts || true
  fi
  cd - >/dev/null
fi
# ----- API(Laravel想定) -----
if [ -d apps/api ]; then
  cd apps/api
  [ -f .env ] || cp .env.example .env || true
  composer install --no-interaction --prefer-dist || true
  php artisan key:generate || true
  # CORS/セッションを github.dev に合わせる
  grep -q '^SESSION_DOMAIN=' .env || echo "SESSION_DOMAIN=.github.dev" >> .env
  grep -q '^SANCTUM_STATEFUL_DOMAINS=' .env || echo "SANCTUM_STATEFUL_DOMAINS=.github.dev" >> .env
  cd - >/dev/null
fi
