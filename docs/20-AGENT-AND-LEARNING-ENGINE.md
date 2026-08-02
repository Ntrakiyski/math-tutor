# Agent and Learning Engine Boundary

## Principle

The agent is the adaptive teacher.

The learning engine is the source of truth for mathematical state, evaluation, placement, progression, and content eligibility.

The agent may choose how to teach. It may not invent what the learner has mastered.

## Responsibilities

| Responsibility | Owner |
|---|---|
| Mathematical correctness | Deterministic validator |
| Placement scores | Learning engine |
| Mastery transitions | Learning engine |
| Prerequisite graph | Versioned content |
| Candidate next topics | Learning engine |
| Teaching strategy | Agent |
| Tone and concise wording | Agent |
| Learning-block selection | Agent within allowed registry |
| Persona hypothesis proposal | Agent |
| Persona evidence and confidence | Persona service/learning engine |
| Achievement trigger | Deterministic rules |
| Learner-facing feedback | Agent using verified evidence |

## Decision loop

```text
1. Read current learner state.
2. Read active goal and due reviews.
3. Ask learning engine for ranked candidate actions.
4. Choose a teaching strategy.
5. Select a versioned content item or validated generator.
6. Emit a Learning Block Protocol turn.
7. Receive interaction event.
8. Run deterministic evaluation.
9. Persist event and evaluation.
10. Update skill, thinking, persona, review, and gamification state.
11. Continue or close the micro-goal.
```

## Candidate actions

The engine returns a small list, for example:

```json
[
  {
    "action": "remediate",
    "topicId": "g2_sub_regroup",
    "reason": "critical misconception repeated",
    "priority": 0.96
  },
  {
    "action": "retention_review",
    "topicId": "g2_place_value_1000",
    "reason": "24-hour review due",
    "priority": 0.78
  }
]
```

The model does not scan the entire curriculum graph in its prompt.

## Required Eve tools

### `get_learner_state`

Returns compact current placement, active skills, thinking state, persona, session state, and due reviews.

### `get_candidate_actions`

Returns ranked next actions with reasons.

### `get_content_item`

Returns a static versioned item by ID or a candidate item matching a blueprint slot.

### `validate_generated_item`

Checks schema, mathematical answer, distractors, topic alignment, and supported block type.

### `record_interaction`

Persists the normalized learner event idempotently.

### `evaluate_attempt`

Returns correctness, score, misconception evidence, independence, familiarity, and thinking evidence.

### `apply_learning_update`

Applies versioned mastery and progression rules. The model cannot write arbitrary scores.

### `record_persona_evidence`

Adds explicit or observed evidence to a scoped hypothesis.

### `get_strategy_history`

Returns which strategies were tried for the current learner/topic and outcomes.

### `schedule_review`

Creates a retention or misconception review.

### `award_achievement`

Awards only when a deterministic trigger is satisfied.

### `finish_session`

Creates the session summary and next plan.

## Eve instructions

The always-on instructions should establish:

- Bulgarian learner-facing language;
- one decision per turn;
- short explanations;
- active interaction before long prose;
- no shame;
- no fixed grade identity labels;
- no fabricated rankings;
- ask, observe, hypothesize, test, revise;
- never mark mastery from conversation alone;
- use tools before making state claims;
- emit only supported learning blocks;
- end at a meaningful stopping point.

## Eve skills

Create focused skills for:

- onboarding;
- adaptive diagnostic;
- selecting the next topic;
- teaching with concrete representations;
- teaching decomposition;
- responding to regrouping misconceptions;
- changing support level;
- checking learning integrity;
- responding to random clicking;
- responding to frustration;
- truthful gamification;
- session conclusion.

## Prompt context budget

Provide the agent only:

- current objective;
- relevant skill state;
- relevant prerequisites;
- latest misconception evidence;
- relevant persona hypotheses;
- recent interaction window;
- selected content item;
- allowed block types.

Do not provide the full topic graph, full session history, or raw event store in every turn.

## Generated content rule

For the MVP, prefer static items.

A generated item may be used only when:

- it follows one generator specification;
- its exact answer is deterministically computed;
- its block validates;
- its wording is short and Bulgarian;
- it does not duplicate the latest item;
- it is tagged as familiar, varied, or novel.

If validation fails twice, use a static fallback.

## Session reflection

After a completed session, a durable workflow may propose:

- persona evidence;
- strategy outcome;
- session summary;
- review schedule;
- next candidate objective.

Every proposal remains evidence-linked. Core instructions and mastery rules are not self-modified.
