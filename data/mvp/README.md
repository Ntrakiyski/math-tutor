# Math Tutor MVP Data

Version: `0.1.0`

This directory is the authoritative content and policy pack for the first single-learner MVP.

## Files

| File | Purpose |
|---|---|
| `manifest.json` | Version, counts, checksums, and readiness |
| `domains.json` | Mathematical domain definitions |
| `thinking-competencies.json` | Transferable thinking competencies |
| `topics.json` | 66 mathematical topics across diagnostic bands 2–7 |
| `dependencies.json` | Hard prerequisite graph |
| `diagnostic-items.json` | 60 static placement items |
| `first-slice-items.json` | 32 teaching and assessment items for the first deep path |
| `topic-exam-blueprints.json` | Mastery and retention blueprint for every topic |
| `question-generator-specs.json` | Deterministic generator contracts |
| `onboarding.json` | 12 onboarding steps |
| `mastery-policy.json` | Placement, mastery, support, and next-action rules |
| `achievements.json` | Evidence-backed gamification |
| `admin-metrics.json` | Required admin metrics |
| `sample-agent-turn.json` | Protocol example |
| `sample-interaction-event.json` | Learner event example |
| `sample-learner-state.json` | Persisted state example |

## Status labels

### `ready_for_implementation`

The content is sufficient for the developer to build and test the MVP.

### `teacher_review_required`

The content is original and mathematically checked for basic correctness, but a Bulgarian mathematics teacher should review terminology, sequence, and difficulty before external release.

### `blueprint_only_requires_item_generation`

The topic has a complete exam structure, but not a full static item set. This does not block the initial placement diagnostic or first teaching slice.

## Content rules

- Stable IDs must not be changed casually.
- New content requires a version bump.
- Every question must reference existing topic IDs.
- Every scored item must have a deterministic answer or bounded rubric.
- Model-generated items must follow `question-generator-specs.json`.
- Never activate generated content until its answer validates.
- Preserve familiar, varied, and novel item distinctions.
- Persist the content version with every session and attempt.

## Diagnostic use

Start at grade band 4 and branch using `mastery-policy.json`.

Do not show all 60 items. Select enough evidence to place the learner confidently.

## First deep slice

Use `first-slice-items.json` to teach:

```text
place value
→ addition
→ subtraction with regrouping
→ word-problem decomposition
→ reconstruction
→ life-transfer reflection
```

## Full curriculum note

This data pack is intentionally an MVP seed, not the complete official Bulgarian curriculum or NVO archive. See `docs/14-CONTENT-DATA-STATUS.md`.
