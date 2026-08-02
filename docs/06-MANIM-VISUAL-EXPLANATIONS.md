# Manim Community Visual Explanations

## Decision

Use **Manim Community Edition** as the controlled mathematical animation layer.

React widgets remain the primary interactive learning mechanism.

```text
Manim explains
React lets the learner act
```

## Best uses

- transformations;
- regrouping;
- fraction equivalence;
- number-line movement;
- algebraic balance;
- geometric relationships;
- transition between representations;
- visualizing abstract ideas.

## Active-learning rule

Animations should normally end with a learner action.

```text
Watch
→ predict
→ manipulate
→ answer
→ explain or choose why
```

## Controlled templates

Use approved animation families such as place-value decomposition, carrying, regrouping, multiplication arrays, division grouping, fraction construction, equivalent fractions, negative-number movement, equation balance, and geometric transformations.

The agent configures values, pace, labels, and representation. It should not execute unrestricted generated animation code.

## Personalization

The learner persona may influence speed, number of steps, pause points, label density, repetition, representation, and whether the learner predicts before the transformation.

## Rendering strategy

1. pre-rendered common explanations;
2. parameterized template animations;
3. rare reviewed custom explanations.
