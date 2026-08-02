# Learning Integrity and Hypothesis-Driven Personalization

## Purpose

The product must distinguish real understanding from surface recognition, guessing, memorized answer patterns, and compliance.

It must also personalize without turning onboarding answers or weak behavioral signals into permanent labels.

These two requirements are connected:

```text
Ask
→ observe
→ form a cautious hypothesis
→ personalize
→ test the hypothesis
→ validate, revise, or reject it
```

## Learning integrity

Learning integrity answers:

> How do we know the learner understands rather than recognizing a familiar-looking task or recalling a previous answer?

A correct answer can result from:

- conceptual understanding;
- procedural understanding;
- memorized layout;
- familiar wording;
- answer-position memory;
- guessing;
- copying the last demonstrated step;
- recognizing a superficial pattern.

The system should treat one correct answer as evidence, not proof of mastery.

## Surface dependence

A learner may perform well when a task resembles previous tasks and fail when the same mathematical structure appears differently.

The system should compare performance across:

- familiar and unfamiliar layouts;
- different numbers;
- different wording;
- different answer positions;
- visual and symbolic representations;
- direct exercises and word problems;
- immediate and delayed assessment;
- guided and independent attempts.

A useful signal is the gap between familiar-format and novel-format performance.

```text
High familiar accuracy
+ Low novel accuracy
= likely surface dependence
```

The product should not shame the learner for this. It should recognize that the skill is not yet structurally reliable and choose a better learning experience.

## Verification methods

For important skills, use several forms of evidence.

### Surface variation

Keep the mathematical structure while changing numbers, layout, colors, wording, and answer order.

### Representation variation

Move between:

```text
equation
→ objects
→ diagram
→ number line
→ table
→ word problem
→ construction task
```

### Structural transfer

Place the same relationship inside a different story or mathematical domain.

### Error diagnosis

Ask the learner to locate where a worked solution became invalid.

### Construction

Ask the learner to create an example, representation, decomposition, or counterexample.

### Explanation selection

Ask why an answer works using carefully designed reasoning options rather than requiring long free text every time.

### Delayed retention

Return to the idea later without the familiar context.

### Independent reconstruction

Ask the learner to build the solution process rather than repeat the previous one.

## Attention design

The product should accept the learner’s current attention reality without copying an infinite-scroll product.

The principle is:

> Borrow the immediacy of short-form content, not its fragmentation.

Useful patterns include:

- one meaningful decision per turn;
- short interactions;
- immediate visible response;
- minimal text;
- changing representations when useful;
- attainable opening questions;
- clear session boundaries;
- natural stopping points;
- one coherent objective per session.

A short session can still have continuity:

```text
attainable re-entry
→ prerequisite check
→ one explanation
→ guided action
→ independent attempt
→ reflection and stop
```

The product should gradually strengthen the learner’s ability to stay with one problem rather than merely entertain her indefinitely.

## Personalization evidence streams

The system should maintain two distinct evidence streams.

### Declared profile

What the learner or guardian explicitly says:

- interests;
- preferred coach style;
- voice or text preference;
- dislike of timers;
- desired challenge level;
- current goals;
- upcoming tests;
- accessibility needs.

Declared preferences matter because they provide agency and context.

They are not automatically proven teaching strategies.

### Observed learning profile

What the learner actually does:

- which representations improve independent performance;
- which explanation lengths are completed or skipped;
- whether voice is requested and actually used;
- whether challenge is chosen but abandoned;
- what happens after several errors;
- whether a warm-up improves persistence;
- whether immediate success survives delayed review;
- whether familiar layouts outperform novel ones;
- how much support is required.

Observed evidence should improve teaching decisions without being described as proof of hidden motives or personality.

## Preserve disagreement

Declared and observed evidence can conflict.

Example:

```text
Declared:
“I prefer text explanations.”

Observed hypothesis:
“Short animated demonstrations currently produce stronger independent transfer.”
```

The system should preserve both and test them respectfully.

A suitable agent response might be:

> You said you prefer text, but the short visual version helped last time. Which one should we try first today?

The system should not conclude that the learner is lying.

## Onboarding creates hypotheses

Onboarding should not place the learner into a fixed category such as:

- visual learner;
- low-attention learner;
- weak student;
- aggressive learner;
- anime learner.

Instead, it creates provisional hypotheses:

- may prefer short interactions;
- may prefer selection over typing;
- may respond positively to anime-inspired presentation;
- may need an attainable success before unfamiliar work;
- may avoid tasks when uncertainty becomes visible;
- may benefit from concrete representations before symbols.

Each hypothesis should have:

- scope;
- source;
- confidence;
- evidence count;
- validation state;
- last-confirmed date;
- expiry or review date.

## Onboarding structure

Onboarding should feel like a short interactive conversation rather than a form.

### Goals and context

Ask about:

- what the learner wants to become easier;
- upcoming tests;
- topics that feel impossible;
- what normally happens when the learner gets stuck;
- preferred session length.

### Experience sampling

Do not ask only abstract questions such as “Do you prefer visual learning?”

Show short alternatives:

- a text explanation;
- a visual explanation;
- an interactive explanation.

Then compare declared preference with actual learning evidence.

### Motivation style

Allow initial selection among coach styles such as:

- calm and supportive;
- direct and fast;
- competitive challenge;
- funny and playful;
- quiet anime-inspired mentor.

Treat the choice as a starting preference, then validate whether it improves engagement and learning.

### Initial diagnostic

The first diagnostic should observe:

- mathematical state;
- decomposition ability;
- surface recognition versus structural understanding;
- confidence calibration;
- reaction to uncertainty;
- support requirements;
- interaction preference.

### Provisional persona summary

Present a correctable summary:

> Here is what I think so far. Short questions may work better for you. You seem comfortable selecting answers but less comfortable explaining them. Visual examples may help with unfamiliar problems. Is any of this wrong?

The language should communicate that the model is forming rather than judging.

## Observable emotional safety

The product should respond to observable behavior without creating broad psychological labels.

Store evidence such as:

- random selection increases after three consecutive errors;
- direct correction language increases abandonment;
- a small successful warm-up improves persistence;
- the learner requests shorter explanations after difficult questions;
- timers reduce accuracy or increase guessing.

Do not store unsupported claims such as:

- the learner is hateful;
- the learner is damaged;
- the learner is lazy;
- the learner is aggressive by nature.

The agent should preserve dignity by:

- treating mistakes as useful information;
- avoiding grade-based humiliation;
- reducing difficulty without announcing a downgrade;
- offering choices;
- praising specific actions;
- creating a fast recovery after frustration;
- avoiding long explanations during defensive moments.

## Motivation and achievement

Feedback should be specific and truthful.

Useful examples:

- You solved that without a hint.
- You noticed the trap before answering.
- Last time you needed three steps shown; this time you created them.
- You remembered this after five days.
- You changed strategy when the first one did not work.
- You explained why the answer is correct.
- You used the same idea in a completely different form.

Do not fabricate claims such as “you are in the top 5%” unless supported by real, appropriate comparative data and suitable consent.

Potential achievement categories include:

- **Problem Breaker** — decomposed a difficult task;
- **Trap Detector** — identified misleading surface similarity;
- **No-Hint Win** — solved independently;
- **Strategy Switcher** — deliberately changed approach;
- **Memory Keeper** — retained a skill after delay;
- **Explain It** — justified the reasoning;
- **Comeback** — recovered after mistakes;
- **New Situation** — transferred a skill to an unfamiliar context.

## Voice and character personalization

Voice can support connection, guidance, motivation, and accessibility.

Possible uses:

- reading a short question;
- introducing a challenge;
- narrating a visual explanation;
- guiding decomposition;
- celebrating a genuine achievement;
- offering a calm recovery choice.

Use licensed voices, original product voices, or explicitly authorized voice clones.

Do not clone copyrighted characters or identifiable voice performers without authorization.

A safer product direction is to create original coach archetypes with anime-inspired presentation, such as:

- calm strategist;
- energetic challenger;
- protective older-sibling style;
- funny problem solver;
- quiet mentor;
- direct competitive coach.

The persona model can then learn which style improves persistence and understanding.

## Five product pillars

The latest direction can be summarized as:

1. **Mathematical understanding** — know what is understood and missing.
2. **Decomposition and thinking** — teach how to structure unfamiliar problems.
3. **Personalization** — discover how this learner best understands and persists.
4. **Learning integrity** — verify understanding rather than recognition or guessing.
5. **Experience and motivation** — deliver learning through short conversation, voice, widgets, animation, achievement, and emotional safety.

## Personalization loop

```text
Ask what the learner believes about herself
→ observe what she actually does
→ create scoped hypotheses
→ select a personalized teaching experiment
→ measure what changes
→ ask for feedback
→ compare feedback with behavior
→ confirm, revise, or discard the hypothesis
```

Personalization is therefore not an onboarding profile assembled once. It is a permanent process of respectful experimentation and validation.
