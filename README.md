# AWS Learning Portal Monorepo

This repository hosts a mobile-first PWA built with **React + Vite** for the frontend and a **Laravel API** backend. It is optimized for phone-only development using GitHub Codespaces and PR-based previews.

## Structure

- `apps/web`: React + Vite PWA (HMR-ready)
- `apps/api`: Laravel API
- `infra/`: IaC placeholders (CDK/Terraform to be added)
- `.github/workflows`: CI for basic build validation
- `.devcontainer/`: Codespaces configuration (PHP + Node.js + MySQL)
- `docker-compose.yml`: Local two-service dev environment (optional in Codespaces)

## Quick Start (Codespaces)

Codespaces will install dependencies and auto-start both the frontend (Vite) and backend (Laravel) on attach.

1. Open this repo in GitHub Codespaces.
2. Wait until `apps/api` Composer install and `apps/web` npm install complete.
3. On first attach, services start automatically:
   - Web (Vite): Port 3000
   - API (Laravel): Port 8000
4. Verify preview URLs from terminal:
   - Web: `./tools/post-preview-url.sh 3000`
   - API: `./tools/post-preview-url.sh 8000`
5. Access from your phone via the printed `https://<codespace>-PORT.app.github.dev` URLs.

Notes:
- Laravel `.env` is created from `.env.example` if missing and app key is generated automatically.
- Database defaults to SQLite for development; MySQL is not required.

## CI/CD

- Basic CI validates the web app build on push/PR. Amplify Hosting and ECS integration will be wired next.

## Next Steps

- Add Amplify Hosting with PR previews.
- Add ECS Fargate + RDS scaffolding in `infra/`.
