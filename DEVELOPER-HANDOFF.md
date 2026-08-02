# Developer Handoff

## Purpose

This repository is ready to be handed to a developer for the first Math Tutor MVP.

The developer should not need product clarification. The only external inputs still required are:

1. a Vercel AI Gateway key;
2. an InsForge project base URL;
3. an InsForge anon key;
4. optionally, an InsForge admin API key for provisioning.

All product behavior, MVP scope, content data, routes, state contracts, progression rules, and acceptance criteria are defined in the repository.

## Read in this order

1. [`MVP.md`](./MVP.md)
2. [`DEVELOPER-HANDOFF.md`](./DEVELOPER-HANDOFF.md)
3. [`docs/12-FIRST-LEARNER-JOURNEY.md`](./docs/12-FIRST-LEARNER-JOURNEY.md)
4. [`docs/13-MASTERY-AND-PROGRESSION.md`](./docs/13-MASTERY-AND-PROGRESSION.md)
5. [`docs/14-CONTENT-DATA-STATUS.md`](./docs/14-CONTENT-DATA-STATUS.md)
6. [`docs/15-LEARNING-BLOCK-PROTOCOL.md`](./docs/15-LEARNING-BLOCK-PROTOCOL.md)
7. [`docs/16-ROUTES-AND-ADMIN.md`](./docs/16-ROUTES-AND-ADMIN.md)
8. [`docs/17-ENVIRONMENT-AND-SETUP.md`](./docs/17-ENVIRONMENT-AND-SETUP.md)
9. [`docs/18-IMPLEMENTATION-PLAN.md`](./docs/18-IMPLEMENTATION-PLAN.md)
10. [`docs/19-ACCEPTANCE-TESTS.md`](./docs/19-ACCEPTANCE-TESTS.md)
11. [`AGENTS.md`](./AGENTS.md)

## Fixed product decisions

- One learner only.
- No authentication, registration, roles, or protected routes.
- Bulgarian learner-facing copy.
- `/` is the learner experience.
- `/admin` is an open operator view.
- The application resumes one persistent learner state.
- The learner starts with onboarding, then an adaptive placement diagnostic.
- Diagnostic bands cover foundational grade 2 through grade 7.
- The first deep teaching slice is place value, addition, subtraction with regrouping, and word-problem decomposition.
- Progress, persona, decomposition, surface dependence, and strategy effectiveness are separate records.
- The agent selects trusted learning blocks; it never returns arbitrary React code.
- The web app renders validated configuration from the Learning Block Protocol.
- Eve is the primary agent runtime.
- InsForge is the persistence backend.
- CopilotKit/AG-UI is a fallback interaction layer only if the Eve integration spike fails the criteria in the implementation plan.
- Manim and voice are not required for MVP completion.
- Content in `data/mvp/` is the authoritative MVP seed pack.

## Repository implementation target

```text
apps/
  web/       React + Vite learner and admin application
  agent/     Eve agent, tools, instructions, skills, and HTTP adapter
packages/
  contracts/ Shared TypeScript types and Zod schemas
  content/   Load and validate data/mvp
  learning/  Placement, mastery, next-step, and evaluation logic
  storage/   InsForge persistence adapter
data/
  mvp/       Versioned MVP content and policies
schemas/     JSON contracts
database/    InsForge Postgres schema and seed
```

The developer may create this structure during implementation. Do not rename the routes, protocol fields, content IDs, or learner ID without updating all relevant documents and data.

## Framework boundary

The browser depends on the Math Tutor API and Learning Block Protocol, not on Eve-specific client internals.

```text
React/Vite
→ Math Tutor API adapter
→ Eve session and tools
→ learning engine
→ InsForge
```

This boundary allows the agent runtime or frontend-agent transport to change without rewriting widgets, content, or learner state.

## Required implementation behavior

### Cold start

- If the database contains no learner, apply `database/seed.sql`.
- Load `data/mvp/manifest.json`.
- Validate all content files and schemas.
- Start onboarding at `/`.

### Onboarding

- Render all steps from `data/mvp/onboarding.json`.
- Save explicit answers separately from observations.
- Create forming persona hypotheses.
- Do not treat onboarding answers as verified teaching facts.
- Finish with an editable provisional profile summary.

### Diagnostic

- Start at grade band 4.
- Apply the branching and placement rules in `data/mvp/mastery-policy.json`.
- Use static items from `data/mvp/diagnostic-items.json`.
- Return a recommended starting band and domain-specific results.
- Choose the lowest critical missing prerequisite as the first learning target.
- Never tell the learner that a grade band is her permanent identity.

### Teaching

- Use items from `data/mvp/first-slice-items.json`.
- Use trusted learning blocks only.
- Change support level and representation according to the mastery policy.
- Record every meaningful interaction.
- Verify learning in a changed or novel format before advancing.

### Admin

- Show the full state described in `docs/16-ROUTES-AND-ADMIN.md`.
- Allow the operator to correct persona hypotheses, add notes, and override the current target.
- Keep an audit record of overrides.

### Persistence

- Persist learner state, sessions, messages, blocks, events, attempts, diagnostic results, persona hypotheses, reviews, and achievements.
- Refreshing the browser or restarting the agent must not lose completed work.
- Mount `.eve/.workflow-data` if the agent is containerized.

## Definition of done

The MVP is complete when one learner can:

1. open the app with no login;
2. complete onboarding;
3. complete an adaptive diagnostic;
4. receive a recommended starting level;
5. begin the first personalized learning path;
6. interact with rendered widgets;
7. receive strategy changes based on errors and behavior;
8. pass a novel-format understanding check;
9. return later and resume;
10. see truthful achievements;

and the operator can inspect and correct the resulting state at `/admin`.

## Data truth

The repository now contains enough original data to build and demonstrate the MVP:

- 66 topics;
- 115 prerequisite edges;
- 60 placement diagnostic items;
- 32 first-slice teaching and assessment items;
- 66 topic exam blueprints;
- 15 deterministic generator specifications;
- 12 onboarding steps;
- 10 achievements;
- mastery and placement rules.

This is not yet the complete production Bulgarian curriculum or a fully ingested official NVO archive. That distinction is intentional and documented. The developer must build the MVP against the seed pack and must not wait for the later production content stream.

## External source policy

Official Bulgarian curriculum and exam pages are catalogued in `data/sources/official-bulgaria.json`. Raw official PDFs and commercial textbook content are not committed to this public repository. Production content acquisition, rights review, item tagging, and teacher review happen after the MVP learning loop is proven.
