set -eux

# Basic deps
sudo apt-get update -y
sudo apt-get install -y software-properties-common curl unzip git ca-certificates lsb-release gnupg

# PHP 8.3
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install -y php8.3 php8.3-cli php8.3-mbstring php8.3-xml php8.3-curl php8.3-zip php8.3-bcmath php8.3-intl

# Composer
if ! command -v composer >/dev/null 2>&1; then
  php -r "copy('https://getcomposer.org/installer','composer-setup.php');"
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  rm composer-setup.php
fi

# Node.js & pnpm
if ! command -v node >/dev/null 2>&1; then
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi
npm install -g pnpm

# Laravel準備
if [ -d apps/api ]; then
  cd apps/api
  [ -f .env ] || cp .env.example .env || true
  composer install --no-interaction --prefer-dist || true
  php artisan key:generate || true
  grep -q '^SESSION_DOMAIN=' .env || echo "SESSION_DOMAIN=.github.dev" >> .env
  grep -q '^SANCTUM_STATEFUL_DOMAINS=' .env || echo "SANCTUM_STATEFUL_DOMAINS=.github.dev" >> .env
  cd - >/dev/null
fi

# Web準備
if [ -d apps/web ]; then
  cd apps/web
  pnpm install || npm install
  cd - >/dev/null
fi
echo "✅ setup.sh finished successfully"
