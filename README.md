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
4. Get preview URLs from the terminal (auto-printed after attach):
   - Web: `https://<codespace>-3000.app.github.dev`
   - API: `https://<codespace>-8000.app.github.dev`
5. Open on your phone: just tap the printed links. Ports are auto-set to Public.

Notes:
- Laravel `.env` is created on demand and the app key is generated automatically.
- The devcontainer forwards ports 3000 and 8000 and sets them Public automatically in Codespaces.
- Database defaults to SQLite for development; MySQL is optional.

## Preview URL helper

Use the helper to print preview URLs and optionally comment them to the current PR if the GitHub CLI is authenticated:

```bash
./tools/post-preview-url.sh       # prints both 3000 and 8000
./tools/post-preview-url.sh 3000  # prints only port 3000
./tools/post-preview-url.sh 8000  # prints only port 8000
```

Output example:

```text
🔗 Preview (3000): https://<codespace>-3000.app.github.dev
🔗 Preview (8000): https://<codespace>-8000.app.github.dev
```

## Phone testing in Codespaces

Open this repo in Codespaces and wait for auto-start logs. After attach:

- Web URL: `https://<codespace>-3000.app.github.dev`
- API URL: `https://<codespace>-8000.app.github.dev`

Both ports are automatically forwarded and set to Public, so you can open these links directly on your phone. If you need to reprint the links, run:

```bash
./tools/post-preview-url.sh
```

If `gh pr view` succeeds, the script will also add a PR comment with the same URL.

## CI/CD

- Basic CI validates the web app build on push/PR. Amplify Hosting and ECS integration will be wired next.

## Next Steps

- Add Amplify Hosting with PR previews.
- Add ECS Fargate + RDS scaffolding in `infra/`.
