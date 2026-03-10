# Getting Started: Your First Multi-Agent Workflow

> A simple "Hello World" example to learn how contract-agents work.

## The Scenario

You want to add a new feature to your web app — user profile pages. You don't know where to start or which agents to use.

## Step 1: Let the Orchestrator Figure It Out

```
Use spec-orchestrator to help me add user profile pages to my web app.

The app is a React + Node.js task manager. I need:
- Profile page with avatar, bio, skills
- Edit profile form
- Profile viewing by other users

Coordinate the necessary agents and tell me what needs to happen.
```

**What happens:** spec-orchestrator analyzes the request and delegates to the right specialists:
- `eng-backend-architect` — designs the API endpoints and database schema
- `eng-frontend-developer` — builds the React components
- `design-ui-designer` — specifies the layout and visual design
- `test-api-tester` — verifies the endpoints work correctly

## Step 2: Work Through Each Specialist

The orchestrator returns with a coordinated plan. Now you work through each agent:

```
Use eng-backend-architect to design the API for user profiles.

Here's the context: [paste orchestrator's plan]

Design the database schema and REST endpoints.
```

```
Use design-ui-designer to create the profile page layout.

Here's the context: [paste orchestrator's plan]

Create a clean, modern profile page design.
```

```
Use eng-frontend-developer to build the profile pages.

Here's the design: [paste design-ui-designer output]
Here's the API spec: [paste eng-backend-architect output]

Build the React components.
```

```
Use test-api-tester to verify the profile API endpoints.

Here's the API spec: [paste eng-backend-architect output]

Create test cases and verify the endpoints work.
```

## Step 3: Review and Ship

```
Use test-reality-checker to verify the feature is ready.

Profile pages implementation:
- API: [summary]
- Frontend: [summary]
- Tests: [summary]

Give me a GO / NO-GO decision for shipping this feature.
```

## Key Pattern

| Phase | Agent | Purpose |
|-------|-------|---------|
| Planning | spec-orchestrator | Figure out what needs to happen |
| Backend | eng-backend-architect | Design the API and data model |
| Design | design-ui-designer | Specify how it should look |
| Frontend | eng-frontend-developer | Build the UI |
| Testing | test-api-tester | Verify it works |
| Gate | test-reality-checker | Confirm it's ready to ship |

## Next Steps

Once you're comfortable with this pattern:
1. Try the [Startup MVP workflow](workflow-startup-mvp.md) for a larger project
2. Try the [Landing Page workflow](workflow-landing-page.md) for a time-boxed sprint
3. Use spec-orchestrator directly for your own projects

## Tips

- Always paste previous agent outputs into the next agent — context matters
- Use quality gates (test-reality-checker) before shipping
- Start with spec-orchestrator when you're unsure which agents to use
- Read [AGENTS_CONTRACT.md](../AGENTS_CONTRACT.md) to understand how all agents behave
