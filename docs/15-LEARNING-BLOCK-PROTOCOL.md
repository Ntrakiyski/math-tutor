# Learning Block Protocol

## Purpose

The agent selects a learning-block type and returns validated configuration. React renders a trusted component. The learner interacts. A structured event returns to the agent.

```text
agent decision
→ protocol turn
→ schema validation
→ trusted React component
→ learner event
→ deterministic evaluation
→ updated state
→ next agent turn
```

The protocol prevents arbitrary generated UI code.

## Turn envelope

Every agent turn must conform to `schemas/agent-response.schema.json`.

```json
{
  "protocolVersion": "1.0",
  "responseId": "resp_01",
  "sessionId": "session_uuid",
  "learnerId": "learner_sister",
  "mode": "teaching",
  "objective": {
    "topicIds": ["g2_sub_regroup"],
    "thinkingCompetencyIds": ["decomposition", "next_action"],
    "reasonBg": "Повтаряща се грешка при изваждане на единици без прегрупиране."
  },
  "blocks": [
    {
      "id": "block_01",
      "type": "base_ten_blocks",
      "promptBg": "Покажи 42 − 18 и размени една десетица.",
      "config": {
        "operation": "subtraction",
        "left": 42,
        "right": 18,
        "interaction": "drag_regroup"
      },
      "topicIds": ["g2_sub_regroup"],
      "thinkingCompetencyIds": ["representation_switching"],
      "supportLevel": 4,
      "scored": true,
      "submitMode": "explicit",
      "accessibility": {}
    }
  ],
  "evaluation": {
    "contentItemId": "slice_sub_02",
    "expectedAnswer": {"kind": "number", "value": 24, "tolerance": 0},
    "misconceptionTags": ["subtract_smaller_digit_from_larger", "forgot_borrow"],
    "recordPersonaEvidence": true
  },
  "nextTurnPolicy": {
    "waitFor": "learner_event",
    "allowFreeText": true,
    "maxRetries": 2
  }
}
```

## Supported MVP block types

| Type | Purpose |
|---|---|
| `message` | Short coach text |
| `multiple_choice` | One selected option |
| `multi_select` | Several selected options |
| `numeric_input` | Integer, decimal, or rational input |
| `binary_choice` | Yes/no or two-way decision |
| `step_choice` | Select the next useful step |
| `step_order` | Arrange dependent steps |
| `known_unknown_sort` | Sort facts into known and unknown |
| `place_value_chart` | Build or decompose a number |
| `base_ten_blocks` | Visual regrouping and place value |
| `number_line` | Place, compare, or move along values |
| `error_spotter` | Identify the first incorrect step |
| `fraction_bar` | Deferred until fractions are implemented |
| `confidence_check` | Record confidence after selected attempts |
| `reflection_choice` | Record perceived strategy usefulness |
| `profile_confirmation` | Correct provisional persona claims |
| `achievement_card` | Show an evidence-backed achievement |
| `session_summary` | Show the completed micro-goal and next step |

## Rendering rule

Each block type maps to one React component in a registry.

```text
block.type
→ registry lookup
→ typed props
→ component
```

Unknown block types render a recoverable error card in development and are rejected before reaching the learner in production.

## Interaction event

Every meaningful action conforms to `schemas/interaction-event.schema.json`.

```json
{
  "eventId": "event_uuid",
  "sessionId": "session_uuid",
  "learnerId": "learner_sister",
  "responseId": "resp_01",
  "blockId": "block_01",
  "contentItemId": "slice_sub_02",
  "eventType": "submitted",
  "occurredAt": "2026-08-02T12:00:00Z",
  "payload": {
    "answer": 24,
    "regrouped": true
  },
  "metrics": {
    "durationMs": 18200,
    "changeCount": 1,
    "hintCount": 0,
    "confidence": "mostly",
    "supportLevel": 4
  }
}
```

## Deterministic evaluation

The agent does not decide basic correctness from prose.

Evaluation priority:

1. deterministic math validator;
2. exact structured-state validator;
3. rubric validator for decomposition;
4. model judgment only for bounded explanation evidence.

The resulting evaluation is persisted before the next turn.

## UI-generation decision

Primary MVP:

```text
custom Learning Block Protocol
+ React registry
+ Eve adapter
```

CopilotKit is not required.

Fallback:

```text
same protocol and registry
+ CopilotKit/AG-UI transport
```

The product content, widgets, state, and admin view must not depend on which transport is used.

## Streaming

Text may stream, but scored learning blocks should be emitted only after their configuration passes schema validation.

Do not render partially generated question options.

## Versioning

- Protocol version starts at `1.0`.
- Content version starts at `0.1.0`.
- Persist both versions with sessions and attempts.
- Breaking protocol changes require a new protocol version.
