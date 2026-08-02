# Content Data Status

## Direct answer

The repository now contains enough content data to build the agreed MVP.

It does **not** contain a complete production-grade Bulgarian curriculum and official exam corpus.

The distinction is explicit so a developer can begin immediately without assuming that later curriculum acquisition is already finished.

## MVP seed pack

Source of truth:

```text
data/mvp/
```

Current version: `0.1.0`

| Data | Count | MVP status |
|---|---:|---|
| Mathematical domains | 10 | Ready |
| Thinking competencies | 12 | Ready |
| Topics | 66 | Ready for MVP; teacher review required |
| Prerequisite edges | 115 | Ready for MVP; teacher review required |
| Placement diagnostic items | 60 | Ready for implementation |
| First-slice teaching/assessment items | 32 | Ready for implementation |
| Topic exam blueprints | 66 | Ready |
| Generator specifications | 15 | Ready as implementation contracts |
| Onboarding steps | 12 | Ready |
| Achievements | 10 | Ready |
| Mastery and placement policy | 1 versioned policy | Ready |

## Placement coverage

The static diagnostic covers grade bands 2–7 so the app can find a starting point below the formal grade 4–8 product scope.

The diagnostic is original MVP content. It is not a reproduction of official Bulgarian exams.

## First deep teaching slice

Content is ready for:

- place value;
- comparison of numbers;
- addition with and without regrouping;
- subtraction with and without regrouping;
- regrouping through zero;
- known/unknown sorting;
- subproblem selection;
- step ordering;
- reconstruction;
- checking;
- a short life-transfer example.

## Exams for every topic

Every topic has a versioned exam blueprint with:

- direct item;
- numeric variation;
- representation transfer;
- error diagnosis;
- decomposition item;
- novel transfer;
- 24-hour retention;
- 72-hour transfer retention.

Not every topic has a full set of static questions yet.

MVP behavior:

- use static placement items for level estimation;
- use static first-slice items for the initial teaching path;
- use generator specifications only after deterministic validators are implemented;
- never show an unvalidated generated answer.

## Official Bulgarian data

Catalogued in:

```text
data/sources/official-bulgaria.json
```

Catalogued sources include:

- mathematics curriculum pages for grades 4–8;
- grade 4 NVO archive;
- grade 7 NVO archive;
- current grade 7 NVO model;
- olympiad/competition archives;
- approved textbook lists;
- Digital Backpack.

Current status:

```text
catalogued
not fully downloaded
not decomposed into items
not mapped to every topic
not cleared for republication
```

Raw official PDFs are intentionally not committed to this public repository.

## Production content stream after MVP

After the learning loop works:

1. acquire official PDFs and preserve checksums;
2. extract official outcomes;
3. map outcomes to topics;
4. classify official exam items;
5. author equivalent original items;
6. review with a Bulgarian mathematics teacher;
7. test difficulty and wording with learners;
8. publish a new content version.

## Developer instruction

Do not block MVP development waiting for the full official corpus.

Use the `0.1.0` seed pack exactly as defined. Display internal/admin badges for content review status, but do not show those badges to the learner.
