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

1. Open this repo in GitHub Codespaces.
2. Wait for dependencies install to finish.
3. Run the dev services:
   - Web: `npm -w apps/web run dev -- --host 0.0.0.0 --port 3000` (Vite on 3000).
   - API: `cd apps/api && php artisan serve --host=0.0.0.0 --port 8000` (Laravel on 8000).
4. Access forwarded ports in the Codespaces UI from your phone:
   - Web UI: 3000.
   - API: 8000 (`/api/health` returns JSON).

## CI/CD

- Basic CI validates the web app build on push/PR. Amplify Hosting and ECS integration will be wired next.

## Next Steps

- Add Amplify Hosting with PR previews.
- Add ECS Fargate + RDS scaffolding in `infra/`.
