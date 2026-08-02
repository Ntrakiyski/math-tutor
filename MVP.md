# Math Tutor MVP

## Status

This document defines the first buildable version of Math Tutor.

It intentionally narrows the wider product vision into one complete learning experience for one learner: the creator's sister.

The MVP is not a demonstration chat, a generic question generator, or a partial course. It must prove that the system can learn about one learner, locate her actual mathematical starting point, teach adaptively, verify real understanding, and show meaningful progress.

---

## 1. MVP promise

> After a short interactive onboarding and adaptive diagnostic, Math Tutor identifies the learner's recommended mathematical starting level, creates a provisional learner profile, begins teaching and assessing at the appropriate level, adapts its strategy from observed behavior, and measures progress over repeated sessions.

The MVP should prove this complete loop:

```text
Onboard the learner
→ form initial personalization hypotheses
→ diagnose current mathematical state
→ estimate the correct starting level
→ select the next learning objective
→ teach through chat and interactive widgets
→ verify understanding in varied forms
→ update mathematical progress and learner persona
→ show the result in the admin view
→ continue from the updated state next session
```

---

## 2. Product purpose

Math is the measurable training ground. The deeper purpose is to help the learner develop a reliable way of approaching unfamiliar problems.

The learner should gradually learn to:

1. identify the goal;
2. separate what is known from what is unknown;
3. break a large problem into smaller parts;
4. choose the next useful action;
5. solve one part at a time;
6. reconstruct the complete answer;
7. verify that the result makes sense;
8. apply the same thinking outside mathematics.

The strongest progress signal is not the number of completed questions.

It is:

> How much less help does the learner need to understand, decompose, solve, reconstruct, and verify an unfamiliar problem?

---

## 3. MVP user and environment

### Learner

- One learner only.
- Bulgarian-speaking.
- Currently enrolled in grade 7.
- Her actual knowledge may begin several grades earlier.
- She may have low attention tolerance, low confidence, and a tendency to answer by recognizing familiar-looking tasks rather than understanding the mathematical structure.

### Operator

The operator is the learner's brother.

He needs to:

- inspect what the system believes about her;
- see strengths, gaps, misconceptions, and progress;
- understand why the agent selected a learning path;
- inspect persona hypotheses and their evidence;
- correct or override inaccurate assumptions;
- maintain the personalization direction during the MVP.

### Environment

- One browser-based application.
- One persistent learner profile.
- No registration.
- No login.
- No authentication.
- No multi-user support.
- No roles or permissions.
- No production privacy system.
- No native mobile application.
- The app may run locally or on a private deployment.

The MVP may use one fixed learner identifier internally.

---

## 4. Routes

### `/`

The learner experience.

It contains:

- onboarding;
- chat;
- generated learning widgets;
- diagnostic exams;
- teaching interactions;
- achievements;
- short session summaries;
- continuation from the previous state.

The learner should not need to navigate a traditional course dashboard.

### `/admin`

An open operator view. It is intentionally not protected in the MVP.

It should show:

- recommended starting level;
- confidence in that estimate;
- mathematical state by domain and skill;
- strengths and missing prerequisites;
- known or suspected misconceptions;
- decomposition ability;
- familiar-format versus novel-format performance;
- current learning plan;
- recent attempts and sessions;
- support and hints required;
- persona hypotheses;
- evidence supporting each hypothesis;
- strategies that appear effective or ineffective;
- achievements and progress over time.

The admin view should also allow the operator to:

- correct a persona hypothesis;
- confirm or reject an assumption;
- adjust its confidence;
- add a useful observation;
- change the current learning target;
- reset a diagnostic or session;
- inspect the raw interaction history when needed.

The admin route exists to help the operator learn how to help the learner, not only to display analytics.

---

## 5. What "starting level" means

The application should present a simple recommended starting level to the learner, but internally it must avoid reducing her to one global grade label.

A learner may have different levels across domains.

Example:

```text
Recommended starting point: Grade 3 foundations

Number sense: Grade 4 level
Addition and subtraction: Grade 3 level
Multiplication and division: Grade 2–3 level
Fractions: Grade 3 level
Word-problem decomposition: early foundation
Geometry: not yet sufficiently assessed
```

The MVP should therefore maintain:

1. one learner-facing recommended starting band;
2. a domain-specific state in the admin view;
3. a skill-specific state used by the learning engine.

The starting level is provisional. It should change when new evidence contradicts the original diagnostic.

---

## 6. MVP mathematical scope

The wider product targets Bulgarian mathematics from grade 4 upward and may later map thinking principles through grade 12.

The MVP needs enough coverage to locate a meaningful starting point, but it does not need a complete grade 2–8 curriculum.

### Diagnostic coverage

The adaptive diagnostic should sample the following foundational domains:

1. number sense and place value;
2. addition and subtraction;
3. multiplication and division foundations;
4. fractions and decimals foundations;
5. simple proportional thinking and algebra readiness;
6. mathematical word-problem decomposition;
7. confidence, guessing, and surface-pattern dependence.

The diagnostic may branch approximately from grade 2 foundations through grade 7 readiness, but it must clearly state that the estimate covers the supported domains rather than every topic in the Bulgarian curriculum.

### Initial teaching depth

The first deeply supported learning path is:

```text
Number sense and place value
→ addition and subtraction
→ regrouping
→ simple multi-step word problems
→ decomposition and reconstruction
```

The second supported path, when the first loop works, is:

```text
Multiplication and division foundations
→ fraction meaning
→ fraction comparison
```

### Why this is the correct first slice

It tests nearly every important product capability:

- prerequisite diagnosis;
- common misconceptions;
- concrete and symbolic representations;
- visual widgets;
- adaptive hints;
- decomposition;
- learning integrity;
- delayed review;
- persona updates;
- measurable reduction in support.

---

## 7. Onboarding

Onboarding is an interactive conversation, not a long form.

Its goal is to create useful provisional hypotheses while giving the learner control over the experience.

### Onboarding should collect

- preferred language and communication style;
- preferred session length;
- interests, including anime or other themes;
- topics the learner believes are difficult;
- how she normally reacts when stuck;
- whether she prefers selecting, typing, or manipulating elements;
- preferred coach style;
- attitude toward challenge, hints, and timers;
- any upcoming test or immediate school goal.

### Experience-based preference checks

Do not only ask abstract questions such as "Do you learn visually?"

Show small alternatives:

- one short text explanation;
- one visual explanation;
- one interactive explanation.

Then compare:

- what she says she prefers;
- what she actually uses;
- what produces better transfer;
- what keeps her engaged.

### Onboarding output

At the end, the app should show a provisional summary:

```text
Here is what I think so far:

- Short interactions may work better for you.
- You may prefer selecting over typing.
- Visual examples may help with unfamiliar problems.
- You want to improve enough to handle your current schoolwork.

I may be wrong. We will keep testing and adjusting this together.
```

The learner can correct the summary.

Onboarding answers create hypotheses, not permanent categories.

---

## 8. Adaptive diagnostic

The diagnostic should feel like a sequence of short interactions rather than one formal exam.

### Diagnostic behavior

1. Begin near a reasonable middle anchor.
2. Move down when a prerequisite is missing.
3. Move up when performance is independent and reliable.
4. sample several domains rather than only one operation;
5. distinguish correctness from guessing or recognition;
6. stop when sufficient evidence exists rather than asking every possible question.

### Evidence collected

- correctness;
- response time;
- answer changes;
- hints requested;
- confidence selected;
- familiar versus unfamiliar presentation;
- success across representations;
- ability to identify the first step;
- ability to separate known and unknown information;
- ability to reconstruct a solution;
- willingness to continue after mistakes.

### Diagnostic output

The system should create:

- recommended starting band;
- domain-level estimates;
- clear strengths;
- highest-priority gaps;
- blocked skills and missing prerequisites;
- initial misconceptions;
- initial decomposition baseline;
- initial surface-dependence estimate;
- provisional learner persona;
- first learning objective.

The learner should receive a positive, simple explanation. Detailed evidence belongs in `/admin`.

---

## 9. Core learning loop

Each session should normally last approximately 5–12 minutes and focus on one meaningful objective.

```text
Easy re-entry or warm-up
→ prerequisite check
→ one short explanation or demonstration
→ guided learner action
→ independent attempt
→ novel-format integrity check
→ specific achievement feedback
→ next-step or stopping point
```

### Every interaction follows

```text
Observe
→ evaluate mathematical meaning
→ update learner state
→ update personalization evidence
→ choose the next objective or strategy
→ render the next learning block
```

### Assistance ladder

```text
Independent attempt
→ short prompt
→ strategic hint
→ guided step selection
→ interactive demonstration
→ worked example
→ imitation with new values
```

The amount of support used affects the mastery estimate.

### Strategy switching

When the learner remains stuck, the system should change something meaningful:

- reduce the step size;
- use smaller numbers;
- switch from symbolic to concrete;
- switch representation;
- ask for the first step instead of the full answer;
- present an error-spotting task;
- provide an attainable recovery question;
- stop the session at a healthy point.

It should not repeatedly rephrase the same explanation.

---

## 10. Learning integrity

The MVP must distinguish real understanding from:

- familiar layout recognition;
- remembered answer position;
- memorized procedures without meaning;
- copying the last example;
- guessing;
- rapid random selection.

### Important skill checks should vary

- numbers;
- wording;
- layout;
- answer order;
- representation;
- story context;
- problem direction;
- delay before review.

### MVP mastery stages

```text
Observed once
→ potentially understood

Repeated with variation
→ developing

Independent novel-format success
→ provisionally mastered

Successful delayed review
→ reliably mastered
```

### Separate outcomes

The application should track:

- **Content mastery** — understands the mathematical idea.
- **Thinking mastery** — can decompose, represent, reason, select a strategy, reconstruct, and verify.
- **Transfer mastery** — can apply the same structure in a different format or context.

---

## 11. Personalization model

The MVP builds a small, inspectable learner persona.

### MVP personalization fields

- preferred explanation length;
- selecting versus typing preference;
- effective representation by domain;
- effective hint level;
- ideal step size;
- frustration threshold;
- useful warm-up style;
- effective encouragement style;
- useful session length;
- explicit interests;
- response to increased challenge;
- response to timers or speed pressure.

### Evidence types

| Evidence type | Meaning |
|---|---|
| Explicit preference | The learner stated it directly. |
| Operator observation | The brother added or confirmed it. |
| Temporary session state | Useful now but not assumed to be permanent. |
| Forming hypothesis | Some evidence supports it. |
| Stable strategy pattern | Repeated evidence across sessions supports it. |

### Personalization loop

```text
Ask
→ observe
→ form a cautious hypothesis
→ personalize
→ measure the outcome
→ ask for feedback
→ validate, revise, or reject
```

The system may adapt using a hypothesis, but must not present that hypothesis as a permanent fact about the learner.

### Admin correction

The operator must be able to inspect and edit the persona because the purpose of the MVP is partly to discover what actually helps his sister.

---

## 12. Generated UI and learning blocks

The MVP will not allow the agent to generate arbitrary React code.

Instead, the frontend contains a registry of trusted learning components. The agent selects a component and provides validated configuration data.

### Initial learning-block types

- assistant message;
- quick-select buttons;
- multiple choice;
- multi-select;
- numeric input;
- confidence check;
- step ordering;
- first-step selection;
- error spotting;
- number line;
- place-value chart;
- base-ten blocks;
- grouped objects;
- simple fraction bar;
- achievement card;
- session summary.

### Example response shape

```json
{
  "blocks": [
    {
      "type": "message",
      "text": "Let’s separate the tens and ones first."
    },
    {
      "type": "base_ten_blocks",
      "id": "task_204",
      "config": {
        "target": 42,
        "instruction": "Build 42 using tens and ones."
      }
    }
  ],
  "objective": "place_value_tens_ones"
}
```

The learner's interaction returns a structured event that can be evaluated and stored.

### Why this approach

It gives the agent freedom to choose the correct teaching experience while keeping:

- rendering predictable;
- interactions testable;
- mathematics validatable;
- the user experience consistent;
- the frontend secure;
- analytics structured.

Open-ended generative UI can be reconsidered after the product proves which component families are genuinely missing.

---

## 13. Agent and UI framework decision

### Primary MVP direction

Use:

- **Eve** for agent instructions, skills, tools, durable sessions, and learning orchestration;
- **React + Vite** for the learner and admin interfaces;
- a small custom **Learning Block Protocol** between the agent and frontend;
- **InsForge** for persistence;
- prebuilt React components for all learning blocks.

The UI-generation contract should remain independent from Eve. Eve selects and configures blocks, but the block schema belongs to the product.

This allows the agent runtime to be replaced later without rebuilding the learner interface or content library.

### Eve technical spike

Before building the full application, prove one end-to-end interaction:

```text
Learner sends a message
→ Eve receives the session state
→ Eve selects a learning block
→ the block streams to the Vite frontend
→ React renders it
→ the learner interacts
→ the event returns to Eve
→ Eve continues the same session
→ the state survives a restart
```

### Spike pass criteria

- streaming works;
- the session can pause for learner input;
- structured block data is preserved;
- a widget response can continue the same agent run or session;
- the frontend is not tied to a Next.js-only integration;
- state can be resumed after refresh.

### CopilotKit decision

CopilotKit is a valid alternative or acceleration layer because it already provides React chat UI, backend tool rendering, generative UI patterns, shared state, and an AG-UI-based connection between agents and frontends.

For this MVP, it is not required because:

- the learner interface is highly custom;
- the required UI is constrained and prebuilt;
- we do not need arbitrary generative UI;
- a second UI framework may add complexity before the learning loop is proven.

Use CopilotKit if the Eve-to-Vite spike reveals that we would otherwise spend significant time building chat streaming, agent events, interruption handling, and tool-result rendering.

### Fallback direction

If Eve cannot support the required web interaction cleanly:

1. keep the Learning Block Protocol and React component registry;
2. replace only the agent transport/runtime;
3. use CopilotKit with an AG-UI-compatible backend or a small custom AG-UI adapter;
4. preserve all learner, curriculum, assessment, and persona models.

The framework is replaceable. The learning system is the product.

---

## 14. Persistence

Use InsForge as the persistent state layer.

No authentication model is required.

The MVP needs to preserve:

- learner profile;
- onboarding answers;
- persona hypotheses;
- mathematical skill state;
- decomposition state;
- diagnostic results;
- attempts and widget events;
- sessions and summaries;
- misconceptions;
- strategy effectiveness;
- achievements;
- current learning plan;
- scheduled reviews.

The learner must continue from the previous state after closing and reopening the app.

---

## 15. Gamification foundation

The MVP needs enough gamification to make progress visible and meaningful.

### Reward real behavior

- asking for help;
- trying again;
- decomposing a problem;
- identifying a trap;
- correcting a misconception;
- switching strategy;
- solving independently;
- remembering after time has passed;
- applying knowledge in a new form.

### Initial achievements

- **Problem Breaker** — decomposed a difficult task into useful smaller steps.
- **Trap Detector** — avoided or explained a misleading familiar pattern.
- **No-Hint Win** — solved independently.
- **Strategy Switcher** — changed approach effectively.
- **Comeback** — recovered after repeated mistakes.
- **Memory Keeper** — succeeded on a delayed review.
- **Explain It** — demonstrated why an answer works.
- **New Situation** — transferred the idea to an unfamiliar form.

### Feedback rule

Feedback must describe real evidence.

Use:

> Last time you needed three hints. This time you found the first step yourself.

Do not invent rankings, percentiles, or claims such as "top 5%" without real data.

The MVP does not need a complex economy, store, collectible system, or social leaderboard.

---

## 16. Admin view minimum sections

### Overview

- recommended starting band;
- current objective;
- recent progress;
- latest session result;
- next review.

### Mathematical state

- domain and skill status;
- strengths;
- gaps;
- blocked prerequisites;
- retention status;
- support dependency.

### Thinking state

- goal identification;
- known/unknown separation;
- subproblem creation;
- step ordering;
- reconstruction;
- verification;
- independence.

### Learning integrity

- familiar-format accuracy;
- novel-format accuracy;
- surface-dependence signals;
- confidence calibration;
- guessing or random-click patterns.

### Persona

- explicit preferences;
- forming hypotheses;
- stable strategy patterns;
- confidence and evidence;
- manual correction controls.

### History

- sessions;
- attempts;
- rendered learning blocks;
- learner actions;
- hints and strategy switches;
- achievements.

---

## 17. MVP development sequence

### Phase 0 — Integration spike

Prove Eve, Vite, structured learning blocks, learner interaction, persistence, and session continuation.

### Phase 1 — Application shell

Build:

- `/` learner route;
- `/admin` route;
- persistent single learner;
- chat stream;
- component registry;
- basic session history.

### Phase 2 — Onboarding and persona seed

Build:

- interactive onboarding;
- experience-based preference checks;
- provisional persona;
- learner correction;
- admin inspection.

### Phase 3 — Adaptive diagnostic

Build:

- branching diagnostic;
- supported domain checks;
- starting-band estimate;
- decomposition baseline;
- surface-dependence checks;
- diagnostic report.

### Phase 4 — First teaching vertical slice

Build:

- place value;
- addition and subtraction;
- regrouping;
- word-problem decomposition;
- assistance ladder;
- novel-format mastery checks;
- progress updates.

### Phase 5 — Personalization loop

Build:

- strategy hypotheses;
- strategy-performance evidence;
- representation switching;
- frustration recovery;
- admin correction;
- session-to-session adaptation.

### Phase 6 — Gamification and review

Build:

- achievements;
- truthful progress feedback;
- delayed review;
- session summary;
- visible reduction in support.

### Phase 7 — Second mathematical path

Add multiplication, division foundations, and introductory fractions only after the first vertical slice works end to end.

---

## 18. MVP success criteria

The MVP is successful when:

1. the learner completes onboarding;
2. the app creates a provisional, inspectable persona;
3. the adaptive diagnostic estimates a supported starting level;
4. the admin view shows domain-specific strengths and gaps;
5. the app identifies at least one meaningful prerequisite gap or misconception;
6. the learner begins at the recommended level rather than her enrolled grade by default;
7. the agent renders different prebuilt learning widgets as needed;
8. the learning strategy changes when the learner remains stuck;
9. persona hypotheses update from observed behavior;
10. the operator can inspect and correct those hypotheses;
11. progress is measured separately from persona;
12. understanding is tested in a novel format;
13. the learner can resume after closing the app;
14. at least one delayed review is completed;
15. the system can show a reduction or increase in support required over time.

### Primary pilot metric

> Reduction in support required to decompose, solve, reconstruct, and verify an unfamiliar problem.

### Supporting metrics

- session completion;
- voluntary return;
- independent success rate;
- novel-format success;
- delayed retention;
- useful hint rate;
- frustration recovery;
- accuracy of the operator-reviewed persona;
- difference between familiar and unfamiliar task performance.

---

## 19. MVP definition of done

The MVP is complete when one learner can:

1. open the application without logging in;
2. complete onboarding;
3. receive an adaptive mathematical diagnostic;
4. receive a provisional recommended starting level;
5. begin a personalized learning session;
6. interact with several rendered widget types;
7. receive adaptive hints and representation changes;
8. demonstrate understanding in a different format;
9. earn a truthful achievement;
10. end the session with stored progress;
11. return later and continue;
12. complete a delayed review.

And the operator can:

1. open `/admin` without authentication;
2. inspect the learner's mathematical and thinking state;
3. inspect attempts and progress;
4. inspect persona hypotheses and their evidence;
5. correct or override assumptions;
6. see which teaching strategies appear to work;
7. see why the next learning objective was selected.

---

## 20. Explicit non-goals

The MVP does not include:

- authentication;
- multiple learners;
- guardian accounts;
- teacher accounts;
- permissions;
- production privacy or compliance work;
- voice cloning;
- anime character voices;
- native mobile applications;
- a complete grade 4–8 curriculum;
- a complete grade 4–12 thinking curriculum;
- every mathematical domain;
- arbitrary AI-generated React code;
- open-ended generative UI;
- a full Manim animation library;
- complex social features;
- leaderboards;
- a marketplace;
- a complete gamification economy;
- predictive machine-learning models;
- production scaling;
- generalized therapy, emotional diagnosis, or life coaching.

---

## 21. Final MVP principle

The MVP should remain small in breadth but complete in intelligence.

It is better to deeply support one diagnostic and teaching path that genuinely learns about the learner than to offer hundreds of shallow lessons.

The MVP must prove:

```text
The system understands where she should start.
The system changes how it teaches based on her behavior.
The system can tell recognition from understanding.
The system measures whether she needs less help over time.
The operator can inspect and improve the personalization.
```

Once this loop works reliably for one learner, the product can expand its curriculum, widgets, voices, characters, users, and deployment model without changing its central architecture.