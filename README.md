<p align="center">
  <img src="./assets/readme/hero.svg" width="100%" alt="Math Tutor — adaptive mathematics learning for Bulgarian grades 4 to 8">
</p>

<p align="center">
  <strong>Personalized</strong> · <strong>Interactive</strong> · <strong>Evidence-led</strong>
</p>

<p align="center">
  <a href="./docs/00-PRODUCT-VISION.md">Product vision</a> ·
  <a href="./docs/01-LEARNING-SYSTEM.md">Learning system</a> ·
  <a href="./docs/10-DECOMPOSITION-AND-LIFE-TRANSFER.md">Decomposition</a> ·
  <a href="./PROJECT-STATUS.md">Project status</a>
</p>

## What this is

**Math Tutor** is a product vision for an adaptive mathematics coach aligned initially to the Bulgarian education system for **grades 4–8**, with a longer-term mathematical-thinking curriculum extending through **grade 12**.

The learner works through a simple chat interface. Instead of returning long explanations, the coach can render interactive questions, number lines, manipulatives, diagrams, step builders, exams, and short visual demonstrations directly inside the conversation.

> The chat is the container. The real product is a continuously adapting sequence of mathematical experiences selected for one specific learner.

## Why it needs to exist

A child can be enrolled in grade 7 while still missing essential foundations from much earlier grades. A normal grade-level course starts too high, repeats failure, and usually describes the result only as “weak at math.”

Math Tutor should identify something more useful:

- what the learner is expected to know;
- what the learner reliably understands now;
- which prerequisite is missing;
- which misconception is causing the error;
- whether success comes from understanding or familiar surface patterns;
- how the learner approaches an unfamiliar problem;
- which explanation or representation works best;
- what the learner should experience next.

The intended outcome is a dignified recovery path from the learner’s real starting point toward current school expectations.

## The deeper goal: teach decomposition

Math is the training ground. Decomposition is the transferable life skill.

The learner should gradually become able to:

```text
face an unfamiliar problem
→ identify the desired outcome
→ separate known from unknown
→ break the unknown into smaller parts
→ choose the next useful action
→ solve one part at a time
→ reconstruct the result
→ verify it independently
```

This is not useful only for equations or geometry. The same method applies to a presentation, an exam plan, a creative project, learning a new skill, or any large problem that initially feels impossible.

> The learner does not need to solve the entire problem immediately. The learner needs to identify and complete the next useful step.

Read the full direction in [Decomposition, Mathematical Thinking, and Life Transfer](./docs/10-DECOMPOSITION-AND-LIFE-TRANSFER.md).

## Five product pillars

| Pillar | Purpose |
|---|---|
| **Mathematical understanding** | Know what is understood, missing, fragile, or dependent on support. |
| **Decomposition and thinking** | Teach how to structure unfamiliar problems and reconstruct solutions. |
| **Personalization** | Discover how this learner best understands, persists, and responds to challenge. |
| **Learning integrity** | Verify understanding rather than recognition, guessing, or memorized layouts. |
| **Experience and motivation** | Deliver learning through short chat, voice, widgets, animation, achievement, and emotional safety. |

## The learning system

<p align="center">
  <img src="./assets/readme/learning-system.svg" width="100%" alt="Five learner models feeding an adaptive teaching decision and interactive learning experience">
</p>

The system is organized around five connected models:

| Model | Question it answers |
|---|---|
| **Expected Competency** | What should the learner know according to curriculum and exam expectations? |
| **Current Mathematical State** | What is mastered, developing, missing, forgotten, or dependent on support? |
| **Learner Persona** | How does this learner understand, persist, ask for help, and respond to challenge? |
| **Active Learning Plan** | Which objective, prerequisite, review item, thinking principle, and strategy should come next? |
| **Learning Evidence** | What happened, and what proves that understanding or independence changed? |

Every answer, hint, retry, hesitation, decomposition choice, representation switch, and delayed review can improve the next teaching decision.

## Two connected curricula

The product needs two parallel curriculum layers:

```text
Mathematics curriculum
What mathematical knowledge should be acquired?

Thinking curriculum
What way of thinking should be developed through that mathematics?
```

The thinking curriculum includes decomposition, abstraction, representation switching, estimation, assumptions, reversibility, evidence, counterexamples, uncertainty, optimization, iteration, precision, and reconstruction.

The initial product implementation focuses on Bulgarian grades 4–8. The thinking-curriculum horizon extends through grade 12 so later algebra, functions, statistics, probability, geometry, trigonometry, modelling, and calculus can be connected to increasingly advanced reasoning and life-transfer principles.

## Learning happens through interaction

The agent should communicate with the shortest useful combination of conversation and UI:

```text
short message
+ interactive explanation
+ learner action
+ feedback
+ next action
```

Possible learning elements include:

- multiple-choice and multi-select questions;
- number lines and place-value charts;
- base-ten blocks and grouped objects;
- fraction bars and fraction builders;
- decomposition trees and step ordering;
- error spotting and counterexample tasks;
- coordinate planes and geometry diagrams;
- confidence checks and guided hints;
- short animated mathematical explanations.

> Never give a paragraph when the learner can understand by touching, moving, selecting, comparing, grouping, ordering, or constructing something.

### React and Manim have different jobs

| Layer | Responsibility |
|---|---|
| **React widgets** | Let the learner select, drag, construct, compare, order, decompose, and answer. |
| **Manim Community** | Produce controlled, precise animations that explain transformations and abstract ideas. |

```text
Manim explains
→ React lets the learner act
→ the result becomes new evidence
```

## Learning integrity

A correct answer is evidence, not proof of mastery.

The system should test important concepts through:

- different numbers, wording, and layouts;
- different representations;
- unfamiliar contexts;
- error diagnosis;
- construction and decomposition;
- delayed review;
- independent reconstruction;
- transfer outside the familiar format.

A learner who performs well on familiar-looking tasks but poorly on novel forms may be recognizing surface patterns rather than understanding the structure. The system should detect this and teach differently, without shame.

Read [Learning Integrity and Hypothesis-Driven Personalization](./docs/11-LEARNING-INTEGRITY-AND-PERSONALIZATION.md).

## Personalization means more than difficulty

The system should adapt:

- the next mathematical objective;
- the size of each step;
- the representation used;
- the explanation length;
- the level of guidance;
- the practice format;
- the timing of review;
- the challenge level;
- the encouragement style;
- the context and examples;
- the coach presentation style;
- the timing of life-transfer insights.

Personalization follows a validation loop:

```text
ask
→ observe
→ form a cautious hypothesis
→ personalize
→ test
→ validate, revise, or reject
```

Onboarding answers are useful, but they are not permanent truth. The system should keep declared preferences separate from observed learning evidence and preserve disagreement respectfully.

Persona claims must remain narrow. Prefer:

> Number lines improve decimal-magnitude performance.

Avoid broad labels such as:

> The learner is visual.

Read the full direction in [Learner Persona](./docs/02-LEARNER-PERSONA.md).

## Attention and emotional safety

The product should borrow the immediacy of short-form content, not its fragmentation.

Useful sessions may contain one decision per turn, minimal text, immediate response, a coherent objective, and a natural stopping point. The goal is not endless engagement. It is to gradually strengthen the learner’s ability to stay with one problem.

The system should respond to observable behavior without turning temporary reactions into identity labels. It may learn that direct correction increases abandonment or that an attainable warm-up improves persistence. It should not label the learner as lazy, damaged, or aggressive by nature.

## Bulgarian grades 4–8

The initial competency graph combines several layers:

| Source layer | Role |
|---|---|
| **Bulgarian Ministry programs** | Define grade-level expectations, terminology, and learning outcomes. |
| **Grade 4 and grade 7 NVO** | Calibrate official question style, difficulty, scoring, and readiness. |
| **Marble Skill Taxonomy** | Seed foundational micro-skills and prerequisite relationships. |
| **Custom Bulgarian competency bridge** | Connect missing foundations to grade 4–8 outcomes. |
| **Thinking Competency Graph** | Connect math topics to decomposition, reasoning, verification, and life transfer. |
| **Original and openly licensed tasks** | Build the adaptive assessment and teaching library. |
| **Teacher review** | Validate sequencing, language, difficulty, and mathematical accuracy. |

Grade enrollment does not determine the starting point. The system should find the lowest important missing prerequisite and work upward without framing easier material as failure.

See [Curriculum Graph](./docs/03-CURRICULUM-GRAPH.md), [Assessment Library](./docs/04-ASSESSMENT-LIBRARY.md), and [Source Strategy](./docs/07-SOURCE-STRATEGY.md).

## Three governing principles

| Personalization | Simplification | Gamification |
|---|---|---|
| Adapt the path, representation, support, timing, language, and challenge. | Reduce cognitive load while preserving mathematical truth. | Reward understanding, decomposition, correction, retention, persistence, and independence. |

Gamification must not create shame, speed pressure, streak anxiety, fabricated rankings, or empty engagement. Mistakes should reveal the next useful step.

## Current platform direction

These are directional choices rather than a finished technical specification:

- **Eve** — persistent teaching agent and session orchestration;
- **React + Vite** — conversational interface and trusted interactive widgets;
- **InsForge** — product data, learner state, evidence, and persistence;
- **Manim Community** — controlled mathematical animation layer;
- **Marble Skill Taxonomy** — foundational prerequisite source.

Detailed implementation follows validation of the learning model, curriculum sources, thinking curriculum, and assessment strategy.

## Documentation

| Document | Purpose |
|---|---|
| [Product Vision](./docs/00-PRODUCT-VISION.md) | Highest-level product direction and north star |
| [Learning System](./docs/01-LEARNING-SYSTEM.md) | The five models and adaptive loop |
| [Learner Persona](./docs/02-LEARNER-PERSONA.md) | Evidence-based personalization |
| [Curriculum Graph](./docs/03-CURRICULUM-GRAPH.md) | Bulgarian grades 4–8 competency direction |
| [Assessment Library](./docs/04-ASSESSMENT-LIBRARY.md) | Diagnostic, mastery, retention, transfer, and exam strategy |
| [Chat and Widget Learning](./docs/05-CHAT-AND-WIDGET-LEARNING.md) | Learning through conversation and rendered UI |
| [Manim Visual Explanations](./docs/06-MANIM-VISUAL-EXPLANATIONS.md) | Animated explanation principles |
| [Source Strategy](./docs/07-SOURCE-STRATEGY.md) | Official, open, licensed, and reference sources |
| [Gamification](./docs/08-GAMIFICATION.md) | Learning-centered motivation |
| [Current Decisions](./docs/09-DECISIONS.md) | Agreed direction and boundaries |
| [Decomposition and Life Transfer](./docs/10-DECOMPOSITION-AND-LIFE-TRANSFER.md) | The thinking curriculum and transferable principles |
| [Learning Integrity and Personalization](./docs/11-LEARNING-INTEGRITY-AND-PERSONALIZATION.md) | Anti-pattern matching, onboarding hypotheses, attention, and safety |
| [Resources](./resources/README.md) | Source catalogue and acquisition status |

## Project status

This repository is currently in the **product definition and curriculum research** phase.

Established so far:

- the product vision;
- Bulgarian grades 4–8 as the initial formal scope;
- grade 4–12 as the thinking-curriculum horizon;
- the five-model learning system;
- decomposition as a first-class competency;
- learning integrity and anti-surface-pattern assessment;
- the custom learner persona direction;
- hypothesis-driven personalization;
- chat-native interactive learning;
- Manim Community for controlled explanations;
- the official and open-source content strategy.

The next work is curriculum acquisition, grade-by-grade mathematical and thinking-competency mapping, assessment classification, widget-family definition, source licensing review, and validation with a Bulgarian mathematics teacher.

Track the current state in [PROJECT-STATUS.md](./PROJECT-STATUS.md).
