# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
pnpm dev          # Start development server
pnpm build        # Production build
pnpm preview      # Preview production build locally
pnpm check        # Type-check with svelte-check
pnpm lint         # Check formatting (Prettier) and lint (ESLint)
pnpm format       # Auto-format with Prettier
```

No test runner is configured in this project.

## Architecture

**Stack:** SvelteKit 2 + Svelte 5 + TypeScript + Tailwind CSS 4, deployed to Cloudflare Workers via
`@sveltejs/adapter-cloudflare`.

**Content:** Blog posts (`src/posts/`) and project pages (`src/projects/`) are Markdown files processed by MDSvex.
Projects are locale-suffixed (e.g., `my-project.en.md`, `my-project.cs.md`).

**Internationalization:** The site supports English and Czech. `svelte-i18n` is initialized in `src/routes/+layout.ts`,
translations live in `src/locales/en.json` and `src/locales/cs.json`. Locale is persisted to localStorage.

**API Routes:**

- `POST /api/forms` — Contact form submission; validates with Zod, posts to Discord via `WEBHOOK_URL` env var.
- `GET /api/projects?locale=` — Dynamically loads locale-specific project markdown via `import.meta.glob`.
- `GET /api/posts` — Dynamically loads all blog posts via `import.meta.glob`; skips files prefixed with `_`.

**Components:** Reusable UI lives in `src/lib/components/`. Icons are SVG components in `src/lib/icons/`. Zod validation
schemas are in `src/lib/validations/`.

**Environment:** Requires `WEBHOOK_URL` in `.env` for the contact form Discord webhook.
