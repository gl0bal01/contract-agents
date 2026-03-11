# Contract-Agents

> Professional AI agents governed by a shared contract — efficient, coordinated, and production-ready.

## What Makes Contract-Agents Different?

**All agents follow [`AGENTS_CONTRACT.md`](AGENTS_CONTRACT.md)** — a shared contract that ensures:

- **Scope Discipline** — Touch only what's required
- **Evidence Requirements** — 3+ `file:line` citations for claims
- **Approval Gates** — Hard stops for risky operations
- **Commit Discipline** — Safe, bisectable history
- **Self-Improvement** — Agents learn from corrections

## Quick Start

```bash
# Clone this repo
git clone https://github.com/gl0bal01/contract-agents.git

# Copy agents to your Claude Code directory
cp contract-agents/*.md ~/.claude/agents/

# Copy the shared contract (required)
cp contract-agents/AGENTS_CONTRACT.md ~/.claude/
```

## Best Practices

**Before using any agent, read [`AGENTS_CONTRACT.md`](AGENTS_CONTRACT.md)** — it defines the rules all agents follow.

**Invocation patterns:**
- `"Use eng-frontend-developer to build this React component"`
- `"Use test-evidence-collector to verify the UI"`
- `"Use spec-orchestrator to coordinate this multi-agent workflow"`
- `"List all test-* agents to see QA options"`

**Key agents:**
- `spec-orchestrator.md` — Main orchestrator for multi-agent workflows. Use this when coordinating complex tasks across multiple agents.
- Individual agents — Use for domain-specific work (eng-*, test-*, design-*, etc.)

**Agent files are minimal** — Shared rules live in AGENTS_CONTRACT.md. Each agent adds only domain-specific behavior.

## How to Use Agents Like Employees

Think of this system as your team. You are the executive who sets direction.

### Mental Model

| Component | Role |
|-----------|------|
| You | Executive — sets goals and direction |
| AGENTS_CONTRACT.md | Employee handbook — how everyone works |
| spec-orchestrator | Project manager / producer |
| pm-senior | Strategic advisor |
| Division agents (eng-*, test-*, etc.) | Specialists you delegate to |

### Where to Start?

**Don't know which agent to use? Start with one of these:**

| Situation | Use this agent |
|-----------|----------------|
| Big task, need multiple specialists | `spec-orchestrator` |
| Need strategic guidance first | `pm-senior` |
| Want to see available specialists | `"List all [prefix]-* agents"` |
| Know exactly what you need | Delegate directly to the agent |

### Example Workflows

**1. Let the orchestrator figure it out:**
```
"Use spec-orchestrator to help me launch a new SaaS product.
Coordinate the necessary agents across engineering, design, marketing, and product."
```

**2. Get strategic direction first:**
```
"Use pm-senior to help me plan this feature. Identify what needs
to happen and which agents to use."
```

**3. Direct delegation (when you know what you need):**
```
"Use eng-frontend-developer to build this React component"
"Use test-evidence-collector to verify the UI"
"Use mkt-growth-hacker to design a user acquisition campaign"
```

### Quick Reference Pattern

1. `"List all [prefix]-* agents"` — See your options
2. `"Use [agent-name] to [specific task]"` — Delegate the work
3. `"Use spec-orchestrator to coordinate [goal]"` — Let it figure out who does what

## Agent Naming

| Prefix | Division | Count |
|--------|----------|-------|
| `eng-*` | Engineering | 22 |
| `test-*` | Testing & QA | 11 |
| `design-*` | Design & UX | 8 |
| `mkt-*` | Marketing & Growth | 16 |
| `prod-*` | Product Management | 5 |
| `pm-*` | Project Management | 7 |
| `game-*` | Game Development | 19 |
| `spatial-*` | Spatial Computing | 6 |
| `spec-*` | Specialized agents | 24 |
| `support-*` | Support & Operations | 6 |

## Agent Catalog

### Engineering (`eng-*`)

```
eng-ai-engineer.md              eng-prompt-engineer.md
eng-backend-architect.md         eng-reliability-engineer.md
eng-browser-extension-developer.md eng-reverse-engineer.md
eng-cloud-architect.md           eng-senior-developer.md
eng-data-engineer.md             eng-solidity-engineer.md
eng-data-scientist.md            eng-technical-writer.md
eng-devops-automator.md          eng-threat-detection-engineer.md
eng-docs-educator.md             eng-wechat-developer.md
eng-embedded-firmware-engineer.md
eng-incident-commander.md
eng-mobile-app-builder.md
eng-optimization-architect.md
eng-frontend-developer.md
```

### Testing (`test-*`)

```
test-accessibility-auditor.md    test-performance-benchmarker.md
test-api-tester.md               test-results-analyzer.md
test-docker-security-auditor.md  test-tool-evaluator.md
test-evidence-collector.md       test-workflow-optimizer.md
test-malware-analyst.md
test-penetration-tester.md
test-reality-checker.md
```

### Design (`design-*`)

```
design-brand-guardian.md         design-image-prompt-engineer.md
design-inclusive-visuals-specialist.md design-ux-architect.md
design-ui-designer.md            design-ux-researcher.md
design-visual-storyteller.md     design-whimsy-injector.md
```

### Marketing (`mkt-*`)

```
mkt-app-store-optimizer.md       mkt-instagram-curator.md
mkt-baidu-seo.md                 mkt-kuaishou-strategist.md
mkt-bilibili-strategist.md       mkt-reddit-builder.md
mkt-china-ecommerce.md           mkt-seo-strategist.md
mkt-content-creator.md           mkt-social-strategist.md
mkt-growth-hacker.md             mkt-tiktok-strategist.md
mkt-monetization-optimizer.md    mkt-wechat-account.md
mkt-xiaohongshu-specialist.md    mkt-zhihu-strategist.md
```

### Product (`prod-*`)

```
prod-competitive-intelligence.md prod-nudge-engine.md
prod-feedback-synthesizer.md     prod-sprint-prioritizer.md
prod-trend-researcher.md
```

### Project Management (`pm-*`)

```
pm-experiment-tracker.md         pm-indie-business-strategist.md
pm-jira-steward.md               pm-project-shepherd.md
pm-senior.md                     pm-studio-operations.md
pm-studio-producer.md
```

### Game Development (`game-*`)

**Cross-engine:**
```
game-audio-engineer.md           game-narrative-designer.md
game-designer.md                 game-technical-artist.md
game-level-designer.md
```

**Unity:**
```
game-unity-architect.md          game-unity-multiplayer.md
game-unity-shader.md             game-unity-tool-dev.md
```

**Unreal:**
```
game-unreal-artist.md            game-unreal-multiplayer.md
game-unreal-builder.md           game-unreal-engineer.md
```

**Godot:**
```
game-godot-multiplayer.md         game-godot-scripter.md
game-godot-shader.md
```

**Roblox:**
```
game-roblox-avatar.md            game-roblox-designer.md
game-roblox-scripter.md
```

### Specialized (`spec-*`)

```
spec-analytics-reporter.md       spec-identity-operator.md
spec-arch-analyzer.md            spec-identity-trust.md
spec-arch-debugger.md            spec-lsp-engineer.md
spec-arch-implementer.md         spec-model-qa.md
spec-arch-orchestrator.md        spec-orchestrator.md
spec-arch-planner.md             spec-report-distribution.md
spec-blockchain-auditor.md       spec-sales-extraction.md
spec-brutalist-critic.md         spec-digital-forensics.md
spec-compliance-auditor.md
spec-cultural-strategist.md
spec-data-consolidation.md
spec-dev-advocate.md
```

### Support (`support-*`)

```
support-analytics.md              support-legal.md
support-executive-summary.md     support-responder.md
support-finance.md               support-infrastructure.md
```

## Invocation Examples

```
"Use eng-frontend-developer to build this React component"
"Use test-evidence-collector to verify the UI"
"Use spec-orchestrator to coordinate this workflow"
"List all test-* agents to see QA options"
```

## Architecture

```
contract-agents/
├── eng-*.md              # Engineering agents
├── test-*.md             # Testing agents
├── design-*.md           # Design agents
├── mkt-*.md              # Marketing agents
├── prod-*.md             # Product agents
├── pm-*.md               # Project Management agents
├── game-*.md             # Game Development agents
├── spatial-*.md          # Spatial Computing agents
├── spec-*.md             # Specialized agents
├── support-*.md          # Support agents
├── AGENTS_CONTRACT.md    # Shared contract (read this first!)
├── templates/            # Agent template
├── tasks/                # Lessons learned, task tracking
├── scripts/              # Refactor tools
├── tests/                # Verification scripts
└── docs/                 # Documentation
```

## Token Efficiency

| Metric | Value |
|--------|-------|
| Total agents | 121 |
| Flattened structure | All agents at root |
| Division prefixes | 10 divisions |
| Target avg size | ~2-3 KB per agent |

## Contributing

When adding new agents:
1. Use division prefix (see catalog above)
2. Follow [`templates/agent-template.md`](templates/agent-template.md)
3. Reference `AGENTS_CONTRACT.md` at top
4. Keep under 100 lines (~3 KB)

## License

MIT — Based on [agency-agents](https://github.com/msitarzewski/agency-agents) by @msitarzewski

Inspired by [black-box-architecture](https://github.com/gl0bal01/black-box-architecture) by @gl0bal01
