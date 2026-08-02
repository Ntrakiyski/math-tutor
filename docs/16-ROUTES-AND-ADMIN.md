# Routes and Admin

## Required routes

The MVP has exactly two user-facing routes.

```text
/
Learner experience

/admin
Operator inspection and maintenance
```

No authentication or route protection is required.

## `/` learner route

The root route contains one continuous conversational learning experience.

### State resolution

```text
No onboarding
→ onboarding

Onboarding complete, no diagnostic
→ diagnostic

Active session exists
→ resume active session

Review is due
→ short review first

Otherwise
→ continue active learning plan
```

### Learner interface

Required elements:

- conversation history;
- current learning block;
- optional short free-text input;
- context-sensitive actions;
- loading/streaming state;
- explicit stop action;
- recovery state if the agent fails;
- session completion card.

Do not add:

- a course catalogue;
- grade selection;
- learner profile selection;
- settings screens;
- progress dashboard;
- left navigation;
- social features.

The learner should remain inside the conversation.

### Context actions

Depending on the block:

- `Не разбирам`
- `Покажи ми`
- `Малка подсказка`
- `По-лесни числа`
- `Друг начин`
- `Нека опитам сама`
- `Защо работи?`
- `Спираме за днес`

## `/admin` operator route

The admin route is open and optimized for inspection, not polished consumer UX.

### Required sections

#### Overview

- current recommended starting band;
- confidence;
- current school grade;
- active learning target;
- latest session;
- total XP;
- next due review.

#### Diagnostic

- all diagnostic items shown;
- answer;
- correctness;
- time;
- confidence;
- hint/support;
- path taken through grade bands;
- final placement explanation;
- domain-specific results.

#### Skills

For every topic:

- state;
- mastery;
- conceptual understanding;
- procedural accuracy;
- independence;
- retention;
- confidence;
- support level;
- misconceptions;
- last attempt;
- next review.

Filter by grade, domain, state, and critical gap.

#### Decomposition

Show separate scores and evidence for:

- goal identification;
- known/unknown separation;
- relevant information;
- subproblem creation;
- ordering;
- next action;
- reconstruction;
- verification;
- independence.

#### Learning integrity

- familiar-format accuracy;
- varied-format accuracy;
- novel-format accuracy;
- surface-dependence estimate;
- suspicious rapid/random interactions;
- latest transfer checks.

#### Persona

For each hypothesis:

- claim;
- category and scope;
- explicit or observed source;
- confidence;
- evidence count;
- supporting events;
- status;
- last confirmation;
- operator note.

Operator actions:

- activate;
- reject;
- mark conflicted;
- edit note;
- create explicit override;
- supersede.

Never overwrite history silently.

#### Strategy effectiveness

Show trials such as:

```text
symbolic explanation
→ failed

base-ten blocks
→ guided success

changed values without blocks
→ independent success
```

Include topic, strategy, before/after, outcome, and evidence.

#### Sessions

- session list;
- mode;
- objective;
- status;
- start/end;
- attempts;
- summary;
- full conversation;
- blocks and events.

#### Reviews

- pending;
- overdue;
- completed;
- cancelled;
- source attempt.

#### Achievements

- earned achievements;
- evidence;
- XP;
- timestamps.

#### Raw data

Read-only JSON views for:

- learner profile;
- skill states;
- thinking states;
- current plan;
- latest agent response;
- latest interaction events.

### Required operator actions

- correct recommended band;
- set current target topic;
- add admin note;
- correct/reject persona hypothesis;
- mark a skill for review;
- reset onboarding;
- reset diagnostic;
- export learner data as JSON.

Destructive resets require one confirmation modal. No password is required.

## Admin API

The web app should use these stable endpoints or equivalent route handlers:

```text
GET  /api/state
POST /api/session/start
POST /api/session/:id/message
POST /api/session/:id/events
POST /api/session/:id/stop

GET  /api/admin/overview
GET  /api/admin/diagnostic
GET  /api/admin/skills
GET  /api/admin/thinking
GET  /api/admin/persona
GET  /api/admin/sessions
GET  /api/admin/reviews
GET  /api/admin/export

POST /api/admin/placement-override
POST /api/admin/target-override
POST /api/admin/persona/:id/correct
POST /api/admin/reviews
POST /api/admin/reset
```

The exact server implementation can be an Eve channel, Nitro route, or thin application adapter. The browser contract should remain stable.

## Error behavior

### Agent unavailable

Show:

```text
Връзката с треньора прекъсна. Отговорът ти е запазен.
[Опитай отново]
```

### Invalid learning block

Do not render it to the learner. Log it, ask the agent to regenerate once, then use a safe static fallback item.

### Persistence failure

Do not advance the learning state. Keep the local event in memory, show a retry state, and prevent duplicate submissions with an idempotency key.
