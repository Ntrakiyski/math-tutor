# Implementation Plan

## Rule

Build one complete vertical loop before expanding curriculum, widgets, animation, or visual polish.

## Phase 0 — integration spike

Time-box: one developer workday.

Prove:

```text
browser learner message
→ Math Tutor API
→ Eve session
→ validated Learning Block turn
→ React component
→ interaction event
→ deterministic evaluation
→ continued Eve session
→ persisted state
→ resume after restart
```

### Spike fixture

Use:

```text
content item: slice_sub_03
block: binary_choice
learner answer: no
next block: slice_sub_04 step_choice
```

### Eve pass criteria

- returns a valid protocol envelope;
- browser can post a structured interaction event;
- the same session continues;
- session state resumes after agent restart;
- response blocks can be logged and inspected;
- the implementation does not require arbitrary generated UI;
- total adapter complexity remains small and isolated.

### Fallback criteria

Switch the interaction layer to CopilotKit/AG-UI only when one of these remains unresolved after the time-box:

- no stable way to continue a session from structured UI events;
- no stable way to emit validated structured blocks;
- browser transport requires invasive Eve-specific coupling;
- session resume cannot be made reliable;
- custom channel work exceeds the size of the actual MVP learning implementation.

### Fallback action

- keep Eve if it can remain the agent runtime behind an adapter;
- otherwise use CopilotKit's supported agent backend;
- preserve all protocol schemas;
- preserve routes;
- preserve content IDs;
- preserve database schema;
- preserve evaluation and mastery logic.

Do not redesign the product.

## Phase 1 — repository and storage foundation

Deliver:

- npm workspace;
- `apps/web`;
- `apps/agent`;
- shared contracts;
- content loader and validator;
- InsForge adapter;
- schema and seed applied;
- `/api/state`;
- `/` and `/admin` shells;
- local workflow persistence.

Exit criteria:

- cold start creates/resolves `learner_sister`;
- content pack loads with zero validation errors;
- refresh preserves a test state.

## Phase 2 — onboarding

Deliver:

- all 12 onboarding steps;
- explicit preference storage;
- experience samples;
- forming persona hypotheses;
- editable provisional summary;
- onboarding resume after refresh;
- admin persona view.

Exit criteria:

- complete onboarding once;
- refresh halfway and resume;
- correct a hypothesis in `/admin`;
- history remains visible.

## Phase 3 — adaptive diagnostic

Deliver:

- diagnostic item renderer;
- grade-band branching;
- domain scores;
- critical gap detection;
- confidence capture;
- rapid-click signal;
- placement result;
- diagnostic admin trace.

Exit criteria:

- fixture learner profiles place at expected bands;
- mixed domain performance does not collapse into a misleading single score;
- lowest critical prerequisite becomes the first target.

## Phase 4 — first teaching slice

Deliver trusted components:

- multiple choice;
- multi-select;
- numeric input;
- binary choice;
- step choice;
- step order;
- known/unknown sort;
- place-value chart;
- base-ten blocks;
- number line;
- error spotter;
- confidence check;
- reflection choice;
- achievement card;
- session summary.

Deliver learning logic for:

- place value;
- addition;
- subtraction with regrouping;
- word-problem decomposition;
- representation switching;
- novel-format verification.

Exit criteria:

- run the full first slice;
- trigger a misconception;
- switch strategy;
- reduce support;
- pass a novel-format check;
- schedule retention.

## Phase 5 — personalization, admin, gamification

Deliver:

- strategy trials;
- persona hypothesis updates;
- operator corrections;
- full admin sections;
- achievements;
- XP;
- truthful feedback;
- session summaries;
- data export.

Exit criteria:

- observed strategy evidence changes a later teaching decision;
- explicit and observed preferences can conflict without data loss;
- achievement evidence is inspectable.

## Phase 6 — reliability

Deliver:

- idempotent event writes;
- retry behavior;
- invalid block fallback;
- persistence failure recovery;
- content hash validation;
- unit tests;
- contract tests;
- Playwright tests;
- basic logs.

## Parallel content stream

May continue while development proceeds:

- official curriculum acquisition;
- NVO indexing;
- grade 4–8 topic review;
- teacher review;
- more item generation.

Do not merge unreviewed production content into the active MVP version without a version bump.

## Developer completion order

The developer should implement in the phase order above.

Do not begin Manim, voice, advanced fractions, or grade 8 content before Phase 5 exits successfully.
