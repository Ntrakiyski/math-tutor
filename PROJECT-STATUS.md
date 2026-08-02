# Project Status

## Established

- Product vision preserved and expanded.
- Bulgarian grades 4–8 selected as the initial formal implementation scope.
- Grade 4–12 selected as the strategic thinking-curriculum horizon.
- Five-model learner system defined.
- Decomposition defined as the central transferable life skill.
- Mathematical understanding, decomposition, personalization, learning integrity, and experience defined as the five product pillars.
- Content mastery, thinking mastery, and transfer mastery separated.
- Custom learner persona direction defined.
- Hypothesis-driven personalization loop defined.
- Declared preferences and observed learning evidence separated.
- Surface-pattern recognition and false mastery identified as core product risks.
- Learning-integrity verification methods documented.
- Attention design and emotional-safety principles documented.
- Chat and rendered-widget learning direction defined.
- Manim Community selected for controlled animated explanations.
- Voice and anime-inspired coach presentation recorded as optional later experience layers.
- Official and open-source strategy documented.
- Initial Bulgarian Ministry source pages catalogued.
- The single-learner MVP has been fully scoped in [`MVP.md`](./MVP.md).

## MVP decisions

- One learner only: the creator's sister.
- No login, authentication, registration, roles, or multi-user support.
- One persistent learner profile.
- Learner route at `/`.
- Open operator route at `/admin`.
- Onboarding creates provisional personalization hypotheses.
- Adaptive diagnostic estimates a learner-facing starting band and domain-specific state.
- First deep teaching slice: place value, addition, subtraction, regrouping, and word-problem decomposition.
- Progress, persona, thinking ability, surface dependence, and strategy effectiveness remain separately inspectable.
- The agent selects from trusted prebuilt React learning blocks rather than generating arbitrary UI code.
- Primary direction: Eve + React/Vite + custom Learning Block Protocol + InsForge.
- CopilotKit remains an optional acceleration or fallback layer if the Eve-to-Vite integration creates unnecessary transport and rendering work.

## Core documents

- [`MVP.md`](./MVP.md)
- `docs/00-PRODUCT-VISION.md`
- `docs/01-LEARNING-SYSTEM.md`
- `docs/10-DECOMPOSITION-AND-LIFE-TRANSFER.md`
- `docs/11-LEARNING-INTEGRITY-AND-PERSONALIZATION.md`

## Development entry point

The planning phase is sufficiently complete to begin development.

The first task is a narrow integration spike proving:

```text
learner message
→ Eve session
→ structured learning block
→ React/Vite render
→ learner interaction event
→ continued agent session
→ persisted state after refresh or restart
```

If the spike passes, continue with the application shell, onboarding, adaptive diagnostic, first teaching vertical slice, personalization loop, admin inspection, and gamification foundation defined in `MVP.md`.

If the spike fails because Eve does not integrate cleanly with the custom Vite learner experience, preserve the Learning Block Protocol and evaluate CopilotKit/AG-UI as the frontend-agent interaction layer without changing the product's learning models.

## Parallel curriculum work

Development can begin while these content tasks continue:

1. Acquire and index official curriculum PDFs.
2. Acquire and index NVO grade 4 and grade 7 materials.
3. Draft the grade-by-grade mathematical competency outline.
4. Map grade 4–8 topics to thinking principles and life-transfer opportunities.
5. Define decomposition competency levels and observable evidence.
6. Define the first learning-integrity assessment taxonomy.
7. Define anti-surface-pattern question variations.
8. Define the first production learning-block catalogue.
9. Review source licences.
10. Validate curriculum sequencing with a Bulgarian mathematics teacher.

## Explicitly deferred

- production authentication and privacy systems;
- multiple learners;
- guardian or teacher accounts;
- protected admin route;
- native mobile applications;
- voice or character implementation;
- complete grade 4–8 curriculum coverage;
- grade 9–12 mathematical curriculum mapping;
- open-ended generative UI;
- complex gamification economy;
- production scaling.
