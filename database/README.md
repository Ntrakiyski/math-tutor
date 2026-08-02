# Database

## Target

InsForge Postgres.

## Files

- `schema.sql` — complete MVP schema and admin views.
- `seed.sql` — idempotent single-learner seed.

## Apply order

```text
1. schema.sql
2. seed.sql
```

## Runtime content

Curriculum and assessment content stays versioned in `data/mvp/`.

The database stores learner-specific state:

- onboarding;
- persona;
- sessions;
- messages;
- learning blocks;
- events;
- attempts;
- placement;
- mastery;
- thinking;
- strategy trials;
- reviews;
- achievements;
- admin notes.

## Security posture

This MVP intentionally has no authentication and no protected admin route.

Do not expose `INSFORGE_ADMIN_API_KEY` to the browser.

The application should still access InsForge through the agent/backend to keep one data path and avoid coupling React components to storage.
