# Current Product Decisions

## Product

- Mathematics only.
- Initial formal curriculum scope: Bulgarian grades 4–8.
- Earlier foundations are included when required for remediation.
- The main interface is chat with rendered interactive UI.
- Learning should happen through actions, not long text lessons.

## Intelligence layers

- Expected Competency Model.
- Math Learning Model.
- Custom Learner Persona Model.
- Active Learning Plan.
- Learning Evidence and Progress.
- Eve Teaching Agent as instructional orchestrator.

## Personalization

- Build a custom hosted Learner Persona Engine.
- Do not use the Personal Model repository.
- Persona claims must be evidence-backed, scoped, inspectable, and correctable.
- Mathematical mastery remains separate from learner persona.

## Curriculum

- Bulgarian Ministry programs define official expectations.
- Marble supports foundational prerequisite structure.
- Build a custom Bulgarian grade 4–8 competency graph.
- OSSU Math is reference-only and not an exam library.
- Grade 4 and grade 7 NVO are central assessment calibration sources.

## Experience

- Prebuilt trusted React widgets.
- The agent selects and configures widgets.
- Do not execute unrestricted model-generated UI code.
- Use Manim Community Edition for controlled animated explanations.
- Manim explains; React verifies active understanding.

## Core principles

1. Personalization.
2. Simplification.
3. Learning-centered gamification.

## Current non-goals

- all school subjects;
- teacher administration platform;
- social learning network;
- unrestricted content scraping;
- copying commercial textbooks;
- broad psychological profiling;
- self-modifying agent instructions;
- premature implementation architecture.
