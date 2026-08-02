# Adaptive Math Learning Agent

## Product Vision and Highest-Level Direction

**Scope:** Mathematics for learners aligned to the Bulgarian education system, initially grades 4–8.

## Vision

The product is an adaptive mathematics learning environment delivered through a simple conversational interface.

The learner does not navigate a traditional course, watch long lessons, or complete a fixed worksheet sequence. Instead, the learner interacts with a persistent AI math coach through chat. The coach responds using short messages and interactive mathematical experiences: buttons, diagrams, manipulatives, number lines, fraction builders, step sequences, exams, and visual explanations.

The chat is the container. The real product is a continuously adapting sequence of mathematical experiences selected for one specific learner.

The system should understand:

1. what the learner is expected to know;
2. what the learner currently understands;
3. which prerequisites are missing;
4. which misconceptions are present;
5. which representations make concepts understandable;
6. how much support is currently required;
7. what the learner is likely to forget;
8. what motivates or frustrates the learner;
9. what should happen next.

## Product thesis

A learner enrolled in grade 7 or grade 8 should not automatically receive grade-level material if foundational knowledge is missing.

The system must first discover the learner's actual knowledge state and then build a dignified recovery path through missing prerequisites toward the expected grade-level outcomes.

The product replaces broad labels such as “bad at math” or “2nd-grade level” with a precise, actionable model:

- understands counting and simple addition;
- has weak place-value understanding;
- performs subtraction without conceptual regrouping;
- remembers multiplication facts but cannot explain equal groups;
- understands fractions visually but not symbolically;
- learns better from number lines than verbal explanation;
- loses confidence after several consecutive errors.

The product promise is:

> Rebuild the exact mathematical foundations you are missing, in the right order, through an adaptive coach that learns how you learn.

## Three governing principles

### Personalization

Personalization goes beyond easier or harder questions. The system adapts:

- the next mathematical objective;
- the size of the learning step;
- the representation;
- the explanation length;
- the amount of guidance;
- the question format;
- the timing of review;
- the pace of the session;
- the encouragement style;
- the challenge level;
- the context and examples.

### Simplification

Simplification means reducing cognitive load without reducing mathematical truth.

The product teaches one meaningful idea at a time, progressively reveals complexity, favors visual and interactive explanation, and avoids long instructional paragraphs.

> Never give a paragraph when the learner can understand by touching, moving, selecting, comparing, grouping, ordering, or constructing something.

### Gamification

Gamification should reward real learning:

- trying again;
- asking for help;
- correcting a misconception;
- remembering later;
- solving independently;
- explaining reasoning;
- transferring a skill to a new context.

It must not create shame, speed pressure, streak anxiety, or empty engagement.

## The five learner models

### Expected Competency Model

Defines what the learner should know according to Bulgarian grades 4–8, school expectations, and official exam formats.

### Current Mathematical State

Tracks what the learner reliably understands, what is developing, what is missing, what has been forgotten, and what still requires support.

### Learner Persona Model

Tracks how the learner learns best: useful representations, explanation length, hint style, step size, frustration patterns, motivation, and interaction preferences.

### Active Learning Plan

Chooses the current target, missing prerequisites, review items, next candidate skills, and the reason for each next step.

### Learning Evidence and Progress

Records attempts, interactions, hints, misconceptions, independent successes, delayed retention, and transfer.

## Core learning loop

```text
Observe the learner
→ interpret what the action reveals
→ update mathematical state
→ update personalization evidence
→ choose the next learning objective
→ choose a teaching strategy
→ render the correct widget or explanation
→ collect the next interaction
```

## Product experience

The interface is primarily a chat stream containing:

- coach messages;
- learner replies;
- interactive widgets;
- visual demonstrations;
- short Manim animations;
- diagnostic checks;
- guided practice;
- mastery and retention checks.

The learner should rarely need to formulate complex prompts. The app should offer useful actions such as:

- I do not understand;
- show me;
- give me a hint;
- make it easier;
- use smaller numbers;
- show with objects;
- show on a number line;
- explain another way;
- let me try;
- challenge me.

## Knowledge and curriculum direction

The curriculum layer combines:

- official Bulgarian mathematics programs for grades 4–8;
- official grade 4 and grade 7 NVO materials for calibration;
- foundational prerequisite structure from Marble Skill Taxonomy;
- a custom Bulgarian competency bridge;
- original and openly licensed assessment structures;
- teacher review.

The most important curriculum asset will be the independently authored competency graph connecting missing foundations to current Bulgarian grade expectations.

## Teaching and explanation

The agent should choose trusted prebuilt React widgets rather than generate unrestricted UI code.

React widgets are responsible for active learning: selecting, dragging, constructing, ordering, comparing, and answering.

Manim Community is responsible for precise animated explanations.

```text
Manim explains
React lets the learner act
```

Every animation should normally end with a learner action.

## Always-on learning

The system continuously improves its model of the learner through structured evidence.

It should learn at four levels:

1. during each interaction;
2. after each session;
3. across many sessions;
4. through reviewed aggregate product improvements.

Always-on learning does not mean the agent silently rewrites its own core instructions. Core behavior remains reviewed and versioned.

## Product north star

The learner opens the app, speaks or types naturally, and the coach understands:

- what she is trying to learn;
- what foundations are missing;
- how she best understands the concept;
- how much challenge she can handle today;
- which interactive mathematical experience should appear next.

The system should personalize not only content, but the path, representation, interaction, support, timing, language, context, and emotional difficulty of learning mathematics.

## Current platform direction

- **Eve** — persistent teaching agent and learning-session orchestration.
- **React + Vite** — chat interface and interactive widget renderer.
- **InsForge** — product persistence and learner data platform.
- **Manim Community** — controlled mathematical animation layer.
- **Marble Skill Taxonomy** — foundational prerequisite source.

These are directional choices. Detailed technical design comes after the learning model, curriculum sources, and content strategy are validated.
