# Adaptive Math Learning Agent

## Product Vision and Highest-Level Direction

**Initial implementation scope:** Mathematics aligned to the Bulgarian education system for grades 4–8, including remediation of earlier foundations.

**Strategic curriculum horizon:** Mathematical knowledge, thinking competencies, and life-transfer principles from grade 4 through grade 12.

## Vision

The product is an adaptive mathematics learning environment delivered through a simple conversational interface.

The learner does not navigate a traditional course, watch long lessons, or complete a fixed worksheet sequence. Instead, the learner interacts with a persistent AI math coach through chat. The coach responds using short messages and interactive mathematical experiences: buttons, diagrams, manipulatives, number lines, fraction builders, step sequences, exams, and visual explanations.

The chat is the container. The real product is a continuously adapting sequence of mathematical experiences selected for one specific learner.

The system should understand:

1. what the learner is expected to know;
2. what the learner currently understands;
3. which prerequisites are missing;
4. which misconceptions are present;
5. whether success comes from understanding or familiar surface patterns;
6. how the learner decomposes unfamiliar problems;
7. which representations make concepts understandable;
8. how much support is currently required;
9. what the learner is likely to forget;
10. what motivates, frustrates, or protects the learner’s attention;
11. what should happen next.

## Deep product purpose

Math is the training ground. Decomposition is the transferable life skill.

The product should teach the learner how to:

```text
face an unfamiliar problem
→ identify the desired outcome
→ separate known from unknown
→ break the unknown into smaller parts
→ choose the smallest useful next action
→ solve one part at a time
→ reconstruct the result
→ verify the result independently
```

This way of thinking applies to equations and geometry, but also to presentations, studying, planning, creative work, technical problems, and other complex tasks.

The learner should gradually internalize:

> I do not need to solve the entire problem immediately. I need to identify and complete the next useful step.

## Product thesis

A learner enrolled in grade 7 or grade 8 should not automatically receive grade-level material if foundational knowledge is missing.

The system must first discover the learner’s actual knowledge state and then build a dignified recovery path through missing prerequisites toward the expected grade-level outcomes.

The product replaces broad labels such as “bad at math” or “2nd-grade level” with a precise, actionable model:

- understands counting and simple addition;
- has weak place-value understanding;
- performs subtraction without conceptual regrouping;
- remembers multiplication facts but cannot explain equal groups;
- understands fractions visually but not symbolically;
- succeeds on familiar-looking tasks but not novel representations;
- can follow prepared steps but cannot yet create a decomposition;
- learns better from number lines than verbal explanation;
- loses confidence after several consecutive errors.

The product promise is:

> Rebuild the exact mathematical foundations you are missing, teach you how to break unfamiliar problems into manageable parts, and gradually make you able to solve and verify them independently.

## Five product pillars

### Mathematical understanding

Know what the learner understands, what is missing, what is fragile, and what depends on support.

### Decomposition and thinking

Teach the learner to identify goals, knowns, unknowns, subproblems, sequence, reconstruction, and verification.

### Personalization

Continuously discover how this learner best understands, persists, asks for help, and responds to challenge.

### Learning integrity

Verify that progress comes from structural understanding rather than recognition, guessing, answer memory, or repeated layout.

### Experience and motivation

Deliver learning through short conversation, voice, widgets, animation, truthful achievement, and emotional safety.

## Governing principles

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
- the context and examples;
- the coach presentation style;
- the timing and type of life-transfer insight.

Personalization should be hypothesis-driven:

```text
ask
→ observe
→ form a cautious hypothesis
→ personalize
→ test
→ validate, revise, or reject
```

Onboarding creates initial hypotheses, not permanent learner categories.

### Simplification

Simplification means reducing cognitive load without reducing mathematical truth.

The product teaches one meaningful idea at a time, progressively reveals complexity, favors visual and interactive explanation, and avoids long instructional paragraphs.

> Never give a paragraph when the learner can understand by touching, moving, selecting, comparing, grouping, ordering, or constructing something.

The product may borrow the immediacy of short-form content, but not its fragmentation. Short interactions must remain connected to one coherent objective.

### Gamification

Gamification should reward real learning:

- trying again;
- asking for help;
- correcting a misconception;
- detecting a misleading surface pattern;
- decomposing a difficult task;
- changing strategy deliberately;
- remembering later;
- solving independently;
- explaining reasoning;
- transferring a skill to a new context.

It must not create shame, speed pressure, streak anxiety, fabricated rankings, or empty engagement.

## The five learner models

### Expected Competency Model

Defines what the learner should know according to Bulgarian curriculum expectations and official exam formats.

### Current Mathematical State

Tracks what the learner reliably understands, what is developing, what is missing, what has been forgotten, and what still requires support.

### Learner Persona Model

Tracks how the learner learns best: useful representations, explanation length, hint style, step size, frustration patterns, motivation, interaction preferences, and evidence about which strategies actually improve learning.

### Active Learning Plan

Chooses the current target, missing prerequisites, review items, next candidate skills, thinking competency, and the reason for each next step.

### Learning Evidence and Progress

Records attempts, interactions, hints, misconceptions, decomposition behavior, independent successes, delayed retention, representation transfer, and life-transfer evidence.

## Two connected curricula

The product needs two parallel curriculum layers.

```text
Mathematics curriculum
What mathematical knowledge should be acquired?

Thinking curriculum
What way of thinking should be developed through that mathematics?
```

The thinking curriculum should include decomposition, abstraction, representation switching, estimation, assumptions, reversibility, evidence, counterexamples, uncertainty, optimization, iteration, precision, and reconstruction.

These principles should be mapped across grades 4–12 rather than treated as optional motivational content.

## Three forms of mastery

The system should distinguish:

```text
Content mastery
Understands the mathematical concept.

Thinking mastery
Can decompose, represent, reason, select strategies, and verify.

Transfer mastery
Can apply the same principle in a different or real-life context.
```

## Core learning loop

```text
Observe the learner
→ interpret what the action reveals
→ determine whether the success reflects understanding or surface recognition
→ update mathematical state
→ update thinking and decomposition state
→ update personalization evidence
→ choose the next learning objective
→ choose a teaching strategy
→ render the correct widget or explanation
→ test the structure in another form
→ collect and validate new evidence
```

## Product experience

The interface is primarily a chat stream containing:

- coach messages;
- learner replies;
- interactive widgets;
- visual demonstrations;
- short Manim animations;
- diagnostic checks;
- guided decomposition;
- mastery, transfer, and retention checks;
- short personalized life-transfer insights.

The learner should rarely need to formulate complex prompts. The app should offer useful actions such as:

- I do not understand;
- show me;
- give me a hint;
- break it down;
- make it easier;
- use smaller numbers;
- show with objects;
- show on a number line;
- explain another way;
- let me try;
- challenge me;
- help me choose the first step.

## Learning integrity

One correct answer is evidence, not proof of mastery.

Important skills should be verified through:

- different numbers and layouts;
- different representations;
- unfamiliar contexts;
- error diagnosis;
- construction tasks;
- delayed review;
- independent reconstruction;
- transfer outside the familiar format.

The system should detect when familiar-format performance is much stronger than novel-format performance and respond with better teaching rather than shame.

## Emotional safety

The product should respond to observable behavior without creating broad psychological labels.

It may record that direct correction increases abandonment or that an attainable warm-up improves persistence. It should not claim that a learner is lazy, damaged, aggressive by nature, or defined by a temporary defensive reaction.

The agent should preserve dignity by treating mistakes as useful information, offering choices, praising specific actions, reducing cognitive load when necessary, and creating a clear path back into the problem.

## Voice and character direction

Voice and character presentation may create familiarity and emotional connection.

Use licensed voices, original product voices, or explicitly authorized voice clones. Do not clone copyrighted characters or identifiable performers without authorization.

A safer direction is a set of original coach archetypes, potentially with anime-inspired presentation, whose effectiveness is validated through learning evidence rather than assumed from preference alone.

## Knowledge and curriculum direction

The curriculum layer combines:

- official Bulgarian mathematics programs for grades 4–8 initially;
- official grade 4 and grade 7 NVO materials for calibration;
- foundational prerequisite structure from Marble Skill Taxonomy;
- a custom Bulgarian competency bridge;
- a grade 4–12 thinking-competency graph;
- original and openly licensed assessment structures;
- teacher review.

The most important curriculum assets will be:

1. an independently authored mathematical competency graph connecting missing foundations to current Bulgarian grade expectations;
2. a connected thinking-competency graph explaining which transferable reasoning principle each topic trains.

## Teaching and explanation

The agent should choose trusted prebuilt React widgets rather than generate unrestricted UI code.

React widgets are responsible for active learning: selecting, dragging, constructing, ordering, comparing, decomposing, and answering.

Manim Community is responsible for precise animated explanations.

```text
Manim explains
React lets the learner act
The interaction becomes evidence
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

Declared preferences and observed behavior should remain distinct. When they conflict, the system should preserve both and test respectfully rather than deciding that the learner is lying.

## Product north star

> A learner faces a large unfamiliar problem without immediately giving up, guessing, or searching for a familiar answer pattern. She identifies what she knows, breaks the problem into smaller parts, chooses the next useful action, solves progressively, reconstructs the result, and verifies it independently.

Math provides the measurable environment where this way of thinking is trained. The long-term value is the learner beginning to approach the rest of life in the same way.

## Current platform direction

- **Eve** — persistent teaching agent and learning-session orchestration.
- **React + Vite** — chat interface and interactive widget renderer.
- **InsForge** — product persistence and learner data platform.
- **Manim Community** — controlled mathematical animation layer.
- **Marble Skill Taxonomy** — foundational prerequisite source.

These are directional choices. Detailed technical design comes after the learning model, curriculum sources, thinking curriculum, and content strategy are validated.
