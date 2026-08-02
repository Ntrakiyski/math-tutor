# Current Product Decisions

## Product purpose

- Mathematics is the measurable training environment.
- Decomposition is the central transferable life skill.
- The product should teach the learner to reduce unfamiliar problems into smaller parts, identify knowns and unknowns, choose the next useful action, reconstruct the result, and verify it independently.
- Life-transfer insights are part of the learning model, not generic motivational decoration.

## Scope

- Mathematics only.
- Initial formal implementation scope: Bulgarian grades 4–8.
- Earlier foundations are included when required for remediation.
- Strategic thinking-curriculum horizon: grades 4–12.
- The main interface is chat with rendered interactive UI.
- Learning should happen through actions, not long text lessons.

## Product pillars

1. Mathematical understanding.
2. Decomposition and thinking.
3. Personalization.
4. Learning integrity.
5. Experience and motivation.

## Intelligence layers

- Expected Competency Model.
- Math Learning Model.
- Custom Learner Persona Model.
- Active Learning Plan.
- Learning Evidence and Progress.
- Decomposition and Thinking Competency state.
- Eve Teaching Agent as instructional orchestrator.

## Personalization

- Build a custom hosted Learner Persona Engine.
- Do not use the Personal Model repository.
- Persona claims must be evidence-backed, scoped, inspectable, and correctable.
- Mathematical mastery remains separate from learner persona.
- Declared preferences and observed learning evidence remain distinct.
- Onboarding creates provisional hypotheses, not fixed categories.
- Personalization follows an ask, observe, hypothesize, test, validate, revise loop.
- Conflicts between declared and observed preferences are preserved and tested respectfully.
- Broad psychological labels are prohibited; use observable operational evidence.

## Learning integrity

- One correct answer is evidence, not proof of mastery.
- Important skills must be tested across different representations, layouts, numbers, wording, contexts, and delayed reviews.
- The system should distinguish familiar-format success from novel-format transfer.
- Surface-pattern recognition, guessing, and answer-position memory must not be mistaken for understanding.
- Content mastery, thinking mastery, and transfer mastery are separate outcomes.

## Attention and emotional safety

- Borrow the immediacy of short-form content, not its fragmentation.
- Use short coherent interactions with clear session boundaries and natural stopping points.
- Do not optimize for endless engagement.
- Gradually strengthen the learner’s ability to remain with one problem.
- Treat mistakes as useful information.
- Do not humiliate learners through grade labels, public comparison, or announced downgrades.
- Record observable behavior, not unsupported claims about hidden identity or personality.

## Curriculum

- Bulgarian Ministry programs define official expectations.
- Marble supports foundational prerequisite structure.
- Build a custom Bulgarian grade 4–8 mathematical competency graph.
- Build a connected grade 4–12 Thinking Competency Graph.
- Map mathematical topics to decomposition, abstraction, representation, estimation, assumptions, reversibility, evidence, counterexamples, uncertainty, optimization, iteration, precision, reconstruction, and life transfer.
- OSSU Math is reference-only and not an exam library.
- Grade 4 and grade 7 NVO are central assessment calibration sources.
- Life-transfer principles should be identified during curriculum and exam analysis rather than added later.

## Experience

- Prebuilt trusted React widgets.
- The agent selects and configures widgets.
- Do not execute unrestricted model-generated UI code.
- Use Manim Community Edition for controlled animated explanations.
- Manim explains; React verifies active understanding.
- Decomposition trees, known/unknown sorting, step ordering, reconstruction, and error diagnosis are core widget families.
- Voice and character personalization are optional experience layers.
- Use licensed voices, original voices, or explicitly authorized clones only.
- Original anime-inspired coach archetypes are preferred over unauthorized character imitation.

## Motivation

- Reward decomposition, strategy changes, error detection, retention, transfer, persistence, and independence.
- Praise must be specific and truthful.
- Do not fabricate rankings or percentile claims.
- Gamification must not create shame, speed pressure, streak anxiety, or empty engagement.

## Current non-goals

- all school subjects;
- teacher administration platform;
- social learning network;
- unrestricted content scraping;
- copying commercial textbooks;
- broad psychological profiling;
- unauthorized character or voice cloning;
- self-modifying agent instructions;
- endless-scroll engagement mechanics;
- premature implementation architecture.
