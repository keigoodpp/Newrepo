# AWS Learning Portal Monorepo

This repository hosts a mobile-first PWA (Next.js) and an API backend (PHP), plus infrastructure as code. It is optimized for phone-only development using GitHub Codespaces and PR-based previews.

## Structure

- `apps/web`: Next.js PWA (HMR-ready)
- `apps/api`: PHP API placeholder (to be replaced with Laravel)
- `infra/`: IaC placeholders (CDK/Terraform to be added)
- `.github/workflows`: CI for basic build validation
- `.devcontainer/`: Codespaces configuration (Node.js + PHP, port forwarding)
- `docker-compose.yml`: Local two-service dev (optional in Codespaces)

## Quick Start (Codespaces)

1. Open this repo in GitHub Codespaces
2. Wait for dependencies install to finish
3. Run the dev services:
   - Web: `npm run dev` (Next.js on 3000)
   - API: `php -S 0.0.0.0:8000 -t apps/api/public`
4. Access forwarded ports in the Codespaces UI from your phone:
   - Web UI: 3000
   - API: 8000 (`/health` returns OK)

## CI/CD

- Basic CI validates the web app builds on push/PR. Amplify Hosting and ECS integration will be wired next.

## Next Steps

- Replace `apps/api` placeholder with a Laravel app (Cashier/Filament to follow)
- Add Amplify Hosting with PR previews
- Add ECS Fargate + RDS scaffolding in `infra/`