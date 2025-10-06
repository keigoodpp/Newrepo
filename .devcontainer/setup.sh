set -e
sudo apt-get update -y
sudo apt-get install -y curl unzip
if ! command -v composer >/dev/null 2>&1; then
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  rm -f composer-setup.php
fi
npm i -g pnpm

# Webセットアップ
if [ -d apps/web ]; then
  cd apps/web
  npm i || pnpm i || true
  cd - >/dev/null
fi

# APIセットアップ
if [ -d apps/api ]; then
  cd apps/api
  [ -f .env ] || cp .env.example .env || true
  composer install --no-interaction --prefer-dist || true
  php artisan key:generate || true
  grep -q '^SESSION_DOMAIN=' .env || echo "SESSION_DOMAIN=.github.dev" >> .env
  grep -q '^SANCTUM_STATEFUL_DOMAINS=' .env || echo "SANCTUM_STATEFUL_DOMAINS=.github.dev" >> .env
  cd - >/dev/null
fi
