# First Learner Journey

## Goal

The first complete journey must prove that Math Tutor can learn about one learner, estimate her actual mathematical starting point, start at an appropriate prerequisite, adapt its teaching, and preserve progress.

## Entry behavior

The learner opens `/`.

The application checks the fixed learner record `learner_sister`.

```text
No learner state
→ onboarding

Onboarding complete, diagnostic incomplete
→ resume diagnostic

Diagnostic complete, due retention review exists
→ begin with a short review

Diagnostic complete, no review due
→ resume the active learning plan
```

There is no login or learner selection.

## Journey 1 — first visit

### 1. Welcome

The coach explains in no more than two short messages:

- this is not a normal test;
- the goal is to find the best starting point;
- wrong answers help choose the next step;
- the learner can ask for help or stop.

Render buttons:

- `Започваме`
- `Как работи?`

### 2. Interactive onboarding

Render the steps from `data/mvp/onboarding.json`.

The onboarding must:

- use buttons and small interactions;
- ask only one decision per turn;
- record explicit preferences;
- include both a short text and a visual experience sample;
- observe response time, changes, and performance;
- generate provisional hypotheses;
- show an editable summary.

The learner can correct the summary before continuing.

### 3. Diagnostic introduction

The coach says:

> Ще започнем от средата и ще се движим нагоре или надолу. Това не е оценка за теб. Търсим мястото, от което ученето ще стане най-лесно.

Start at grade band 4.

### 4. Adaptive placement

Use `data/mvp/diagnostic-items.json` and the rules in `mastery-policy.json`.

The diagnostic should:

- sample several domains;
- move down if foundational performance is below threshold;
- move up when performance is strong;
- perform a same-band deep check for mixed evidence;
- record confidence and support;
- detect rapid random selection;
- compare at least one familiar and one changed format;
- stop when placement confidence is sufficient.

The learner should normally see 12–24 items, not all 60.

### 5. Placement result

Show a learner-friendly result:

```text
Най-добрата начална точка е около [band].
Най-силно: [strength].
Първо ще укрепим: [critical gap].
```

Do not say:

```text
Ти си на ниво втори клас.
```

The admin view may show the estimated grade band and confidence.

### 6. First attainable success

Before the difficult target, choose one short item that the learner is likely to complete successfully.

This is not fake progress. It establishes a calm re-entry and provides a baseline for support and confidence.

### 7. First deep teaching slice

The intended path is:

```text
place value
→ addition
→ subtraction with regrouping
→ word-problem decomposition
```

The actual first target is the lowest critical gap detected.

Use:

- place-value chart;
- base-ten blocks;
- step choice;
- error spotting;
- known/unknown sorting;
- step ordering;
- numeric input.

### 8. Strategy adaptation

Examples:

```text
Two errors in symbolic format
→ switch to base-ten blocks

Correct with a hint
→ repeat with new values and less support

Correct in a familiar layout
→ present a changed or contextual format

Rapid random clicking
→ shrink to one decision and offer an attainable success

Correct independently and confidently
→ move to a novel-format item
```

### 9. Learning-integrity check

Before marking provisional mastery:

- change values;
- change layout;
- change context or representation;
- require a useful first step or reconstruction;
- remove the immediately preceding visual support.

### 10. Specific feedback

Use evidence-backed feedback:

- `Този път реши без подсказка.`
- `Преди ти показах стъпките. Сега ги подреди сама.`
- `Разпозна капана и смени стратегията.`
- `Запомни това след пауза.`

Do not use fabricated rankings or generic praise after every click.

### 11. Natural stopping point

End after completing one meaningful micro-goal.

Show:

- what changed;
- what comes next;
- any earned achievement;
- optional `Още една кратка задача`;
- `Приключваме за днес`.

### 12. Persistence

After the session:

- save summary;
- update skill and thinking states;
- update persona evidence;
- create retention reviews;
- save achievements and XP;
- persist the next learning target.

## Journey 2 — returning learner

On return:

1. greet briefly;
2. show one relevant prior fact;
3. run a due retention check or a short warm-up;
4. resume the learning plan;
5. use the latest operational persona;
6. preserve the option to correct the agent.

## Failure and recovery paths

### Learner refuses

Offer:

- one easier question;
- a two-minute session;
- stop for now.

Record refusal as a session event, not a personality trait.

### Learner asks for the answer

Do not reveal the final answer immediately.

Offer:

- first step;
- visual representation;
- smaller numbers;
- similar worked example.

After a full demonstration, require an imitation item with different values.

### Learner clicks randomly

Detect likely random interaction from speed, repeated changes, and inconsistent confidence.

Respond by:

- reducing choices;
- asking one concrete action;
- avoiding punishment;
- not recording the result as mastery evidence.

### Learner becomes frustrated

- acknowledge briefly;
- reduce cognitive load;
- switch representation;
- create one genuine attainable success;
- end after the current micro-goal if attention continues to decline.

### Learner succeeds too easily

Move upward or increase structural variation. Do not repeat easy items for engagement.

### Declared preference conflicts with observed behavior

Preserve both.

Example:

```text
Explicit: prefers text.
Observed: visual regrouping improved independent accuracy in four trials.
```

Test both again later. Do not call the learner dishonest.

## Admin observation after first journey

At `/admin`, the operator must see:

- onboarding answers;
- provisional persona;
- diagnostic path and item results;
- recommended band and confidence;
- domain strengths;
- critical gaps;
- repeated misconceptions;
- decomposition baseline;
- surface-dependence signal;
- teaching strategies tried;
- next target;
- session summary;
- raw interaction events.
