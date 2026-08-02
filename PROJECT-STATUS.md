# Project Status

## Current state

The repository is ready to be delivered to a developer for the first single-learner MVP.

Start with:

1. [`MVP.md`](./MVP.md)
2. [`DEVELOPER-HANDOFF.md`](./DEVELOPER-HANDOFF.md)
3. [`AGENTS.md`](./AGENTS.md)
4. [`docs/18-IMPLEMENTATION-PLAN.md`](./docs/18-IMPLEMENTATION-PLAN.md)
5. [`docs/19-ACCEPTANCE-TESTS.md`](./docs/19-ACCEPTANCE-TESTS.md)

The developer should not need product clarification. The only external values the owner must provide are the credentials listed in [`.env.example`](./.env.example).

## Product decisions fixed

- One learner only: the creator's sister.
- No login, authentication, registration, roles, or multi-user support.
- One persistent learner profile.
- Learner route at `/`.
- Open operator route at `/admin`.
- Bulgarian learner-facing content.
- Onboarding creates provisional personalization hypotheses.
- The adaptive diagnostic estimates a learner-facing starting band and domain-specific state.
- The first deep teaching slice covers place value, addition, subtraction, regrouping, and word-problem decomposition.
- Progress, persona, thinking ability, surface dependence, and strategy effectiveness remain separately inspectable.
- The agent selects trusted prebuilt React learning blocks and returns validated configuration.
- The frontend never executes arbitrary model-generated React code.
- Primary direction: Eve + React/Vite + Learning Block Protocol + InsForge.
- CopilotKit/AG-UI remains a documented fallback only if the Eve-to-Vite integration spike fails.
- Manim, voice, authentication, and multiple learners are deferred.

## MVP content ready

The authoritative content pack is [`data/mvp/`](./data/mvp/), version `0.1.0`.

| Data | Count | Status |
|---|---:|---|
| Mathematical domains | 10 | Ready |
| Thinking competencies | 12 | Ready |
| Topics | 66 | Ready for MVP; teacher review required |
| Prerequisite edges | 115 | Ready for MVP; teacher review required |
| Placement diagnostic items | 60 | Ready for implementation |
| First-slice teaching and assessment items | 32 | Ready for implementation |
| Topic exam blueprints | 66 | Ready |
| Deterministic generator specifications | 15 | Ready as contracts |
| Onboarding steps | 12 | Ready |
| Achievements | 10 | Ready |

The static placement diagnostic covers grade bands 2–7. Every topic has an exam blueprint covering direct assessment, numeric variation, representation transfer, error diagnosis, decomposition, novel transfer, 24-hour retention, and 72-hour transfer retention.

The repository does **not** yet contain the complete production Bulgarian grade 4–8 curriculum or a fully ingested official exam corpus. Official sources are catalogued in [`data/sources/official-bulgaria.json`](./data/sources/official-bulgaria.json). MVP development must proceed against the original seed pack rather than wait for the later production content stream.

## Contracts and persistence ready

- Learning Block Protocol: [`docs/15-LEARNING-BLOCK-PROTOCOL.md`](./docs/15-LEARNING-BLOCK-PROTOCOL.md)
- JSON schemas: [`schemas/`](./schemas/)
- Database schema: [`database/schema.sql`](./database/schema.sql)
- Database seed: [`database/seed.sql`](./database/seed.sql)
- Routes and admin behavior: [`docs/16-ROUTES-AND-ADMIN.md`](./docs/16-ROUTES-AND-ADMIN.md)
- Environment setup: [`docs/17-ENVIRONMENT-AND-SETUP.md`](./docs/17-ENVIRONMENT-AND-SETUP.md)
- Agent and learning-engine boundary: [`docs/20-AGENT-AND-LEARNING-ENGINE.md`](./docs/20-AGENT-AND-LEARNING-ENGINE.md)

Content references, dependency references, duplicate IDs, dependency cycles, JSON schemas, and sample state/event contracts were validated before commit.

## Development entry point

The first task is the integration spike:

```text
learner message
→ Eve session
→ validated structured learning block
→ React/Vite render
→ learner interaction event
→ continued agent session
→ persisted state after refresh or restart
```

If the spike passes, implement the phases in [`docs/18-IMPLEMENTATION-PLAN.md`](./docs/18-IMPLEMENTATION-PLAN.md).

If it fails according to the documented criteria, preserve the Learning Block Protocol and use CopilotKit/AG-UI as the interaction transport without changing the curriculum, learner state, widgets, or product behavior.

## Parallel production-content work

This can continue while the MVP is developed:

1. acquire and checksum official curriculum PDFs;
2. acquire and classify grade 4 and grade 7 NVO materials;
3. map official outcomes and exam items to topics;
4. author equivalent original items;
5. review topic sequencing and content with a Bulgarian mathematics teacher;
6. test difficulty and wording with learners;
7. publish a new versioned content pack.

## Explicitly deferred

- production authentication and privacy systems;
- multiple learners;
- guardian or teacher accounts;
- protected admin route;
- native mobile applications;
- voice or character implementation;
- Manim rendering service;
- complete grade 4–8 production curriculum coverage;
- grade 9–12 mathematical curriculum mapping;
- open-ended generative UI;
- complex gamification economy;
- production scaling.
