# Examples

This directory contains example outputs demonstrating how contract-agents can be orchestrated together to tackle real-world tasks.

## Why This Exists

The contract-agents repo defines specialized agents across engineering, design, marketing, product, support, spatial computing, and project management. Agent definitions alone don't show what happens when you **deploy them all at once** on a single mission.

These examples answer the question: *"What does it actually look like when multiple agents collaborate?"*

## Contents

### [getting-started.md](./getting-started.md)

**What:** A "Hello World" example for learning how contract-agents work.

**The scenario:** Adding user profile pages to a web app. You don't know where to start.

**What you'll learn:**
- How to use spec-orchestrator when you're unsure
- How agents hand off work to each other
- How to use quality gates before shipping

**Agents used:**
| Agent | Role |
|-------|------|
| spec-orchestrator | Coordinates the workflow, identifies which specialists are needed |
| eng-backend-architect | API and database design |
| design-ui-designer | Layout and visual design |
| eng-frontend-developer | React implementation |
| test-api-tester | API verification |
| test-reality-checker | Production readiness gate |

**Key takeaway:** Start with spec-orchestrator when you don't know which agents to use. Let it figure out the specialists and sequence.

---

### [nexus-spatial-discovery.md](./nexus-spatial-discovery.md)

**What:** A complete product discovery exercise where 8 agents worked in parallel to evaluate a software opportunity and produce a unified plan.

**The scenario:** Web research identified an opportunity at the intersection of AI agent orchestration and spatial computing. Multiple agents were deployed simultaneously to produce:

- Market validation and competitive analysis
- Technical architecture (8-service system design with full SQL schema)
- Brand strategy and visual identity
- Go-to-market and growth plan
- Customer support operations blueprint
- UX research plan with personas and journey maps
- 35-week project execution plan with 65 sprint tickets
- Spatial interface architecture specification

**Agents used:**
| Agent | Role |
|-------|------|
| prod-trend-researcher | Market validation, competitive landscape |
| eng-backend-architect | System architecture, data model, API design |
| design-brand-guardian | Positioning, visual identity, naming |
| mkt-growth-hacker | GTM strategy, pricing, launch plan |
| support-responder | Support tiers, onboarding, community |
| design-ux-researcher | Personas, journey maps, design principles |
| pm-project-shepherd | Phase plan, sprints, risk register |
| spatial-xr-interface-architect | Spatial UI specification |

**How to run this workflow:**

```
"Use spec-orchestrator to coordinate a multi-agent product discovery for [your idea].
Deploy prod-trend-researcher, eng-backend-architect, design-brand-guardian,
mkt-growth-hacker, support-responder, design-ux-researcher, pm-project-shepherd,
and spatial-xr-interface-architect in parallel to produce a unified plan."
```

**Key takeaway:** All 8 agents ran in parallel and produced coherent, cross-referencing plans without coordination overhead. The output demonstrates the ability to go from "find an opportunity" to "here's the full blueprint" in a single session.

---

### [workflow-landing-page.md](./workflow-landing-page.md)

**What:** Ship a conversion-optimized landing page in one day using 4 agents.

**The scenario:** You need a landing page for a new product launch. It needs to look great, convert visitors, and be live by end of day.

**Agents used:**
| Agent | Role |
|-------|------|
| mkt-content-creator | Write the copy |
| design-ui-designer | Design the layout and component specs |
| eng-frontend-developer | Build it |
| mkt-growth-hacker | Optimize for conversion |

**Key takeaway:** Parallel kickoff (copy + design at same time) saves time. Quality gate prevents shipping unoptimized pages.

---

### [workflow-startup-mvp.md](./workflow-startup-mvp.md)

**What:** A step-by-step example of coordinating multiple agents to go from idea to shipped MVP.

**The scenario:** Building a SaaS MVP — a team retrospective tool for remote teams. 4 weeks to ship.

**Agents used:**
| Agent | Role |
|-------|------|
| prod-sprint-prioritizer | Break project into weekly sprints |
| design-ux-researcher | Validate the idea with user research |
| eng-backend-architect | Design API and data model |
| eng-frontend-developer | Build the React app |
| mkt-growth-hacker | Plan launch strategy |
| test-reality-checker | Gate each milestone |

**Key takeaway:** Sequential handoffs with quality gates prevents building the wrong thing. Reality checks at midpoint and before launch save you from shipping broken code.

## Adding New Examples

If you run an interesting multi-agent exercise, consider adding it here. Good examples show:

- Multiple agents collaborating on a shared objective
- The breadth of agent capabilities
- Real-world applicability of the agent definitions
