# Adaptive Math Learning Agent

A documentation-first project for a deeply personalized mathematics learning experience aligned initially to the Bulgarian education system for grades 4–8.

The learner interacts through a simple chat interface. The teaching agent renders interactive mathematical widgets, visual demonstrations, questions, diagnostic checks, exams, and short animated explanations directly inside the conversation.

The product is built around three principles:

1. **Personalization** — the learning path, explanation, representation, difficulty, support, timing, and motivation adapt to the learner.
2. **Simplification** — mathematics is reduced to the smallest meaningful next action without reducing mathematical truth.
3. **Gamification** — rewards represent real learning, recovery, retention, persistence, and independence.

## Core learning model

```text
Expected competency
        ↓
Current mathematical state
        ↓
Strengths, gaps, misconceptions, and blocked prerequisites
        ↓
Learner persona and effective teaching strategies
        ↓
Personalized next steps
        ↓
Interactive learning and assessment
        ↓
Evidence and progress
        ↓
Updated learner state
```

## Main product components

- **Expected Competency Model** — what a learner should know in Bulgarian grades 4–8.
- **Math Learning Model** — what the learner currently understands and where knowledge is fragile.
- **Learner Persona Model** — how this learner learns most effectively.
- **Active Learning Plan** — what should happen next and why.
- **Learning Evidence Model** — what happened and what proves progress.
- **Eve Teaching Agent** — chooses the next objective and teaching approach.
- **React widget experience** — lets the learner select, move, construct, compare, order, and answer.
- **Manim Community explanations** — provides controlled, precise animated explanations.
- **InsForge** — intended product data and persistence layer.
- **Marble Skill Taxonomy** — an initial source for foundational prerequisite structure.

## Documentation map

| Document | Purpose |
|---|---|
| [Product Vision](docs/00-PRODUCT-VISION.md) | Highest-level product direction |
| [Learning System](docs/01-LEARNING-SYSTEM.md) | The five learner models and adaptive loop |
| [Learner Persona](docs/02-LEARNER-PERSONA.md) | Evidence-based personalization model |
| [Curriculum Graph](docs/03-CURRICULUM-GRAPH.md) | Bulgarian grades 4–8 competency direction |
| [Assessment Library](docs/04-ASSESSMENT-LIBRARY.md) | Diagnostic, mastery, retention, and exam strategy |
| [Chat and Widgets](docs/05-CHAT-AND-WIDGET-LEARNING.md) | Learning through conversation and rendered UI |
| [Manim Explanations](docs/06-MANIM-VISUAL-EXPLANATIONS.md) | Role of animation in active learning |
| [Source Strategy](docs/07-SOURCE-STRATEGY.md) | Official, open, licensed, and reference sources |
| [Gamification](docs/08-GAMIFICATION.md) | Learning-centered motivation principles |
| [Decisions](docs/09-DECISIONS.md) | Current product decisions and boundaries |
| [Resources](resources/README.md) | Source catalogue and acquisition status |

## Current scope

The first curriculum scope is **mathematics for Bulgarian grades 4–8**, including remediation of missing foundations from earlier grades when those gaps block current learning.

The project is currently focused on preserving product direction, curriculum sources, learning principles, and content strategy. It intentionally avoids premature implementation detail.
