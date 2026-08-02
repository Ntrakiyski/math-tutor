# Environment and Setup

## Runtime decisions

- Node.js 24 or newer.
- React + Vite for the web application.
- Eve for the primary agent runtime.
- Vercel AI Gateway for model access.
- InsForge Postgres for learner state.
- Repository JSON files for versioned curriculum and assessment content.
- No authentication.

## Environment file

Copy:

```bash
cp .env.example .env
```

Fill these required values:

```env
AI_GATEWAY_API_KEY=
INSFORGE_BASE_URL=
INSFORGE_ANON_KEY=
```

Optional provisioning credential:

```env
INSFORGE_ADMIN_API_KEY=
```

The full contract is in `.env.example`.

## Variable reference

| Variable | Required | Used by | Purpose |
|---|---:|---|---|
| `AI_GATEWAY_API_KEY` | Yes | Agent | Eve model access through Vercel AI Gateway |
| `AI_MODEL` | Defaulted | Agent | String model ID; default is `anthropic/claude-sonnet-5` |
| `INSFORGE_BASE_URL` | Yes | Agent/storage adapter | InsForge project URL |
| `INSFORGE_ANON_KEY` | Yes | Agent/storage adapter | Unauthenticated SDK access for the single-user MVP |
| `INSFORGE_ADMIN_API_KEY` | Provisioning only | CLI/developer | Schema and administrative setup |
| `PORT` | Defaulted | Agent | Agent HTTP port, default `3001` |
| `HOST` | Defaulted | Agent | Agent bind host |
| `CORS_ORIGIN` | Defaulted | Agent | Web origin |
| `PRIMARY_LEARNER_ID` | Defaulted | Agent | Fixed ID `learner_sister` |
| `CONTENT_DATA_DIR` | Defaulted | Agent/content loader | MVP content directory |
| `CONTENT_VERSION` | Defaulted | Agent | Required content manifest version |
| `DATA_BACKEND` | Defaulted | Agent | `insforge` |
| `VITE_AGENT_BASE_URL` | Defaulted | Web | Math Tutor agent/API URL |
| `VITE_APP_LOCALE` | Defaulted | Web | Bulgarian locale |
| `VITE_PRIMARY_LEARNER_ID` | Defaulted | Web | Fixed learner ID |
| `VITE_ENABLE_ADMIN` | Defaulted | Web | Enables `/admin` |
| `ENABLE_MANIM` | No | Agent | Deferred capability |
| `MANIM_RENDERER_URL` | No | Agent | Deferred renderer endpoint |
| `COPILOTKIT_PUBLIC_API_KEY` | No | Web | Only for documented fallback |

## InsForge setup

### Create or link the project

Use the current InsForge CLI or MCP workflow.

The developer should install current InsForge skills before implementing infrastructure:

```bash
npx skills add insforge/insforge-skills
```

Then create/link a project with the current CLI:

```bash
npx @insforge/cli create
# or
npx @insforge/cli link
```

The CLI and skills are the source of truth for current commands.

### Apply schema

Run:

```text
database/schema.sql
database/seed.sql
```

The developer may use InsForge MCP, CLI raw SQL, or Database Studio.

### SDK

Install:

```bash
npm install @insforge/sdk@latest
```

Initialize server-side:

```ts
import { createClient } from "@insforge/sdk";

export const insforge = createClient({
  baseUrl: process.env.INSFORGE_BASE_URL!,
  anonKey: process.env.INSFORGE_ANON_KEY!,
});
```

Do not expose the admin key in browser code.

## Eve setup

Scaffold into `apps/agent`:

```bash
npx eve@latest init apps/agent
```

After installation, read:

```text
apps/agent/node_modules/eve/docs/README.md
```

The installed package documentation is the implementation source of truth.

Use:

```env
AI_GATEWAY_API_KEY=
AI_MODEL=anthropic/claude-sonnet-5
```

Build and self-host:

```bash
eve build
PORT=3001 eve start --host 0.0.0.0
```

Eve stores local workflow state under:

```text
.eve/.workflow-data
```

Mount that directory on persistent storage if the agent is containerized.

## Web setup

Create React/Vite in `apps/web`:

```bash
npm create vite@latest apps/web -- --template react-ts
```

Install core dependencies:

```bash
npm install zod
```

Do not install CopilotKit unless the Eve spike fails.

## Local ports

| Service | URL |
|---|---|
| Web | `http://localhost:5173` |
| Agent/API | `http://localhost:3001` |
| Optional Manim | `http://localhost:8000` |

## Local development without credentials

Contract tests and content validation must run without external credentials.

Agent integration and persistence tests require the three required values.

Do not replace missing credentials with committed mock secrets. Use a test adapter and fixtures.

## Content startup validation

On development startup:

1. load `data/mvp/manifest.json`;
2. verify `CONTENT_VERSION`;
3. verify file checksums;
4. validate topic references and acyclic prerequisites;
5. validate diagnostic and slice items;
6. validate schemas;
7. fail fast with an actionable message.

## Deployment

For the MVP, one host may run both the built Vite app and Eve service, or they may run separately.

The deployment must preserve:

- InsForge connectivity;
- `.eve/.workflow-data`;
- `/eve/` routes;
- `/.well-known/workflow/` callbacks;
- the Math Tutor API routes;
- browser CORS origin.

No production auth hardening is required for the private MVP environment.
