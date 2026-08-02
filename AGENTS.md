# AGENTS.md

## Mission

Build the single-learner Math Tutor MVP exactly as specified in `MVP.md` and `DEVELOPER-HANDOFF.md`.

Do not ask the owner to choose between unspecified alternatives. Use the defaults and decision rules in this repository.

## Mandatory read order

1. `MVP.md`
2. `DEVELOPER-HANDOFF.md`
3. `docs/12-FIRST-LEARNER-JOURNEY.md`
4. `docs/13-MASTERY-AND-PROGRESSION.md`
5. `docs/15-LEARNING-BLOCK-PROTOCOL.md`
6. `docs/16-ROUTES-AND-ADMIN.md`
7. `docs/17-ENVIRONMENT-AND-SETUP.md`
8. `docs/18-IMPLEMENTATION-PLAN.md`
9. `docs/19-ACCEPTANCE-TESTS.md`

## Non-negotiable product rules

- One learner; no auth.
- Bulgarian learner-facing UI.
- `/` learner route and `/admin` operator route.
- No arbitrary model-generated React, HTML, JavaScript, or CSS.
- The agent returns only validated Learning Block Protocol data.
- Mathematical correctness must be deterministic where possible.
- One correct answer is not mastery.
- Vary presentation before advancing.
- Track declared preference separately from observed evidence.
- Never persist broad psychological labels.
- Never fabricate percentile or ranking claims.
- Every achievement must be supported by recorded evidence.
- Content IDs in `data/mvp/` are stable.
- Learner state and persona state are separate.
- The browser must not receive InsForge administrative credentials.

## Technical defaults

- Node.js 24 or newer.
- TypeScript strict mode.
- React + Vite.
- Eve primary runtime.
- Vercel AI Gateway for the model.
- InsForge Postgres through `@insforge/sdk`.
- Zod validation at every agent/UI and content boundary.
- npm workspaces unless the existing scaffold establishes another package manager.
- Vitest for unit and contract tests.
- Playwright for the learner and admin acceptance flows.

## Framework fallback

Attempt the Eve integration spike first.

Switch the interaction layer to CopilotKit/AG-UI only when the exact failure criteria in `docs/18-IMPLEMENTATION-PLAN.md` are met. Preserve the protocol, content, storage schema, routes, and product behavior.

## Content use

- Load versioned content from `data/mvp/`.
- Validate hashes and schemas during startup in development and tests.
- Do not silently generate production questions outside the defined generator specs.
- Model-generated candidate questions must pass deterministic answer validation before display.
- The static diagnostic and first-slice items are the initial source of truth.

## Completion behavior

Before declaring work complete:

- run content validation;
- run unit tests;
- run contract tests;
- run the full Playwright happy path;
- run the failure/recovery paths;
- verify persistence after refresh and agent restart;
- verify `/admin` reflects the learner interactions;
- update `PROJECT-STATUS.md`.
