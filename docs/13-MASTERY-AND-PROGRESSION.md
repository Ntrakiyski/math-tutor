# Mastery and Progression

## Principle

A correct answer is evidence, not proof of mastery.

The MVP tracks three outcomes separately:

```text
Content mastery
Does the learner understand the mathematical idea?

Thinking mastery
Can the learner decompose, represent, reason, and verify?

Transfer mastery
Can the learner use the same structure in a changed or unfamiliar context?
```

## Skill states

| State | Meaning |
|---|---|
| `unseen` | No meaningful evidence |
| `observed` | At least one meaningful attempt |
| `developing` | Some positive evidence, still unstable or supported |
| `provisional_mastery` | Independent varied success, retention not yet confirmed |
| `reliable_mastery` | Independent varied success plus delayed retention |
| `fragile` | Previously successful, but failed a delayed or novel-format check |
| `needs_remediation` | Repeated critical misconception in more than one representation |

The exact weights and transitions are stored in `data/mvp/mastery-policy.json`.

## Support ladder

```text
0 — independent
1 — short prompt
2 — strategic hint
3 — guided step selection
4 — interactive demonstration
5 — worked example
6 — imitation with changed values
```

Progress means support decreases while accuracy, explanation, and transfer remain stable.

## Provisional mastery

A topic reaches provisional mastery when:

- at least 5 of the 6 mastery slots are correct;
- the direct slot is correct;
- the novel-transfer slot is correct;
- at least 4 successes are independent;
- no critical misconception remains active;
- at most one hint is used across the decisive attempts.

The six slots are defined in `topic-exam-blueprints.json`.

## Reliable mastery

Provisional mastery becomes reliable when:

- a delayed review is passed;
- the learner still succeeds without full support;
- the latest two attempts do not repeat a critical misconception.

## Placement algorithm

### Start

Start at grade band 4.

### Move

- score `>= 0.80`: move up one band;
- score `< 0.50`: move down one band;
- score `0.50–0.79`: remain and perform a deeper check.

### Final recommended band

Choose the highest band where:

- overall evidence is at least `0.70`;
- no diagnostic-critical domain is below `0.50`.

### First teaching target

Choose the lowest diagnostic-critical prerequisite below `0.60` on the path toward the learner's present grade and goal.

A learner may have different effective levels by domain. Preserve the domain profile; do not force one number to describe everything.

## Surface dependence

Track:

```text
familiar-format accuracy
novel-format accuracy
representation-transfer accuracy
```

A high familiar score and low novel score indicates likely surface dependence.

This does not reduce XP or punish the learner. It blocks mastery and triggers changed formats.

## Confidence calibration

After selected items, ask:

- guessing;
- unsure;
- mostly sure;
- can explain why.

Important patterns:

- correct + low confidence: confirm once;
- incorrect + high confidence: investigate misconception;
- correct + high confidence + independent: increase variation;
- rapidly changing confidence: do not infer a stable trait.

## Decomposition progression

Track separately:

1. identifies the goal;
2. separates known and unknown;
3. selects relevant information;
4. creates subproblems;
5. orders dependencies;
6. selects the next useful action;
7. solves parts;
8. reconstructs;
9. verifies;
10. works independently.

Progression:

```text
agent creates breakdown
→ learner chooses first step
→ learner orders prepared steps
→ learner selects useful subproblems
→ learner creates the breakdown
→ independent decomposition
```

## Next-action policy

Apply in order:

1. active frustration/random behavior;
2. critical misconception;
3. missing hard prerequisite;
4. retention review due;
5. current micro-goal;
6. novel-format verification;
7. next unlocked topic.

## Session stopping policy

Stop when:

- the current micro-goal is complete;
- attention has declined across two interactions;
- the learner chooses to stop;
- the session reaches the preferred duration;
- further repetition would add engagement but little learning value.

Never create an infinite question feed.
