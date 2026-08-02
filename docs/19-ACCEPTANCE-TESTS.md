# Acceptance Tests

## Test layers

- content validation;
- unit tests;
- protocol contract tests;
- storage integration tests;
- agent integration tests;
- Playwright end-to-end tests;
- manual learner pilot.

## Content validation

Must pass:

- manifest version and checksums;
- unique IDs;
- valid topic references;
- valid prerequisite references;
- acyclic dependency graph;
- valid answers;
- all diagnostic items reference existing topics;
- all first-slice items reference existing topics;
- every topic has an exam blueprint;
- every block type is registered or explicitly deferred.

## Contract tests

### Agent response

Reject:

- unknown protocol version;
- unknown block type;
- missing block ID;
- invalid support level;
- scored block without evaluation;
- malformed options;
- partially streamed scored block.

### Interaction event

Reject:

- unknown block ID;
- duplicate event ID;
- submission after block completion;
- malformed payload;
- invalid confidence value.

## Storage tests

- seed is idempotent;
- one learner exists;
- session creates;
- block and event persist;
- attempt persists once;
- skill state updates atomically;
- persona hypothesis preserves history;
- review queue persists;
- browser refresh returns identical state;
- agent restart resumes the session.

## Placement fixtures

Create deterministic test profiles:

### Fixture A — foundation grade 2

- fails grade 4 anchors;
- fails grade 3 arithmetic;
- passes grade 2 place value and simple operations.

Expected:

```text
recommended band: 2
first target: lowest failed critical grade 2 topic
```

### Fixture B — mixed grade 4

- strong number sense;
- weak multiplication and division;
- moderate word-problem decomposition.

Expected:

```text
recommended band: 3 or 4 with domain breakdown
first target: multiplicative prerequisite
```

### Fixture C — grade 6 with surface dependence

- strong familiar items;
- weak changed-format items.

Expected:

```text
surface dependence flagged
no reliable mastery
novel-format learning plan
```

### Fixture D — grade 7 ready

- passes grade 4–6 anchors;
- passes most grade 7 anchors;
- one algebra gap.

Expected:

```text
recommended band: 7
first target: the algebra prerequisite
```

## Learner E2E happy path

1. Open `/`.
2. Complete onboarding.
3. Confirm provisional profile.
4. Begin diagnostic.
5. Branch downward from grade 4.
6. Receive placement result.
7. Start place-value/regrouping lesson.
8. Submit an incorrect answer.
9. Receive a representation switch.
10. Complete guided action.
11. Solve changed values independently.
12. Pass novel-format word problem.
13. Earn an evidence-backed achievement.
14. End the session.
15. Refresh.
16. Resume with persisted next step.
17. Open `/admin`.
18. Inspect all relevant evidence.

## Recovery E2E paths

### Random clicking

- submit implausibly fast changing answers;
- no mastery credit;
- agent reduces choices and support step;
- admin shows the signal.

### Ask for answer

- agent offers a hint or demonstration;
- after demonstration, different values are required;
- demonstrated success is not marked independent.

### Agent invalid block

- invalid response is rejected;
- one regeneration attempt occurs;
- safe static fallback renders;
- error appears in logs/admin, not to learner.

### InsForge temporary failure

- duplicate submissions are prevented;
- learner sees retry state;
- progress is not advanced before persistence succeeds.

### Mid-session refresh

- active block and completed events restore;
- no duplicate attempt is created.

## Admin tests

- placement override updates active plan and creates audit note;
- target override persists;
- persona rejection preserves old evidence;
- reset onboarding requires confirmation;
- JSON export contains all learner state;
- no admin secret appears in browser source.

## Mastery tests

- one correct familiar answer does not advance to mastery;
- guided success counts less than independent success;
- novel transfer is required;
- delayed review can promote provisional to reliable;
- failed delayed review marks skill fragile;
- repeated critical misconception marks remediation.

## Gamification tests

- no achievement without trigger evidence;
- no fabricated percentile text;
- XP event corresponds to an achievement or explicit learning action;
- repeated event does not award duplicate achievement.

## MVP acceptance

The MVP is accepted only when:

- every automated test above passes;
- the developer completes the E2E happy path;
- the operator verifies the admin evidence;
- one real learner completes onboarding, diagnostic, and at least one teaching micro-goal;
- no product clarification remains unresolved.
