# AWS Learning Portal Monorepo

This repository hosts a mobile-first PWA built with **React + Vite** for the frontend and a **Laravel API** backend. It is optimized for phone-only development using GitHub Codespaces and PR-based previews.

## Structure

- `apps/web`: React + Vite PWA (HMR-ready)
- `apps/api`: Laravel API
- `infra/`: IaC placeholders (CDK/Terraform to be added)
- `.github/workflows`: CI for basic build validation
- `.devcontainer/`: Codespaces configuration (PHP + Node.js + MySQL)
- `docker-compose.yml`: Local two-service dev environment (optional in Codespaces)

## Quick Start (Codespaces or Local Devcontainer)

The devcontainer uses `mcr.microsoft.com/devcontainers/php:8.3` with Node 20. On first attach, it installs dependencies for both apps and starts both servers so you can preview immediately.

1. Open this repo in GitHub Codespaces (or locally in VS Code and "Reopen in Container").
2. Wait for dependency install to finish:
   - API: `composer install` in `apps/api`
   - Web: `npm install` in `apps/web`
3. On attach, both servers start automatically:
   - Vite dev server on port 3000
   - Laravel server on port 8000
4. Get preview URLs from the terminal:
   - Web: `./tools/post-preview-url.sh 3000`
   - API: `./tools/post-preview-url.sh 8000`
5. Open on your phone: copy the printed `https://<codespace>-PORT.app.github.dev` link and paste it into your mobile browser. Codespaces URLs are public by default when you share the forwarded port.

Notes:
- Laravel `.env` is created on demand and the app key is generated automatically.
- The devcontainer forwards ports 3000 and 8000. If prompted in Codespaces, set ports to Public to access from mobile.
- Database defaults to SQLite for development; MySQL is optional.

## Preview URL helper

Use the helper to print the preview URL and optionally comment it to the current PR if the GitHub CLI is authenticated:

```bash
./tools/post-preview-url.sh 3000
./tools/post-preview-url.sh 8000
```

Output example:

```text
🔗 Preview: https://<codespace>-3000.app.github.dev
```

If `gh pr view` succeeds, the script will also add a PR comment with the same URL.

## CI/CD

- Basic CI validates the web app build on push/PR. Amplify Hosting and ECS integration will be wired next.

## Next Steps

- Add Amplify Hosting with PR previews.
- Add ECS Fargate + RDS scaffolding in `infra/`.
