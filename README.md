# Contract-Agents

![License](https://img.shields.io/badge/license-MIT-blue)
![Agents](https://img.shields.io/badge/agents-121-brightgreen)
![Contract](https://img.shields.io/badge/contract-v2.0-orange)
![Claude Code](https://img.shields.io/badge/Claude%20Code-compatible-blueviolet)
![Kilo CLI](https://img.shields.io/badge/Kilo%20CLI-compatible-blueviolet)
![Goose](https://img.shields.io/badge/Goose-compatible-blueviolet)
![OpenCode](https://img.shields.io/badge/OpenCode-compatible-blueviolet)

> Professional AI agents governed by a shared contract — specialized, consistent, and human-guided.

> You set the direction. They do the work. That's the deal.


```
┌─────────────────────────────────────────────┐
│         CONTRACT-AGENTS                     │
│                                             │
│   121 AI Agents • 10 Divisions • 1 Contract │
│                                             │
│   eng-*  test-*  design-*  mkt-*  prod-*    │
│   pm-*   game-*  spatial-*  spec-* support- │
└─────────────────────────────────────────────┘
```


## What Makes Contract-Agents Different?

**All agents follow [`AGENTS_CONTRACT.md`](agents/AGENTS_CONTRACT.md) v2.0** — a shared contract that ensures:

- **Operating Goals** — Constant velocity, smallest correct change, staff engineer bar
- **Scope Discipline** — Touch only what's required
- **Confusion Management** — Stop on ambiguous reqs, ask clarifying questions
- **Evidence Rules** — Support claims with evidence (file:line for code, URLs/research for non-code)
- **Security First** — First-class security requirements
- **Approval Gates** — Hard stops for risky operations
- **Verification** — automated → tests → full → manual
- **Commit Discipline** — Safe, bisectable history
- **Self-Improvement** — Agents learn from corrections
- **Delegation Policy** — Orchestrator-only sub-agent spawning

## Quick Start

### Option 1: Makefile (Recommended)

```bash
# Clone this repo
git clone https://github.com/gl0bal01/contract-agents.git
cd contract-agents

# Install globally (default — user-wide config)
make install

# Install to a specific tool
make install-kilo
make install-claude
make install-goose
make install-opencode

# Install locally (per-project)
make install SCOPE=local

# Install locally to a specific project
make install SCOPE=local LOCAL_PATH=~/my-project

# Install only one division
make install-claude DIVISION=eng
```

### Option 2: Manual Install

```bash
# Global (user-wide)
cp agents/*.md ~/.claude/agents/              # Claude Code
cp agents/*.md ~/.kilo/agents/               # Kilo CLI
cp agents/*.md ~/.goose/agents/              # Goose
cp agents/*.md ~/.config/opencode/agents/    # OpenCode

# Local (per-project)
cp agents/*.md /path/to/project/.claude/agents/
cp agents/*.md /path/to/project/.opencode/agents/
```

Supported tools: Kilo CLI, Claude Code, Goose, OpenCode

## Best Practices

**Before using any agent, read [`AGENTS_CONTRACT.md`](agents/AGENTS_CONTRACT.md)** — it defines the rules all agents follow.

**Invocation patterns:**
- `"Use eng-frontend-developer to build this React component"`
- `"Use test-evidence-collector to verify the UI"`
- `"Use contract-orchestrator to coordinate this multi-agent workflow"`
- `"List all test-* agents to see QA options"`

**Key agents:**
- `contract-orchestrator.md` — Main orchestrator for multi-agent workflows. It will always present a proposed pipeline (which agents, in what order, and why) and wait for your approval before delegating anything.
- Individual agents — Use for domain-specific work (eng-*, test-*, design-*, etc.)

**Agent files are minimal** — Shared rules live in AGENTS_CONTRACT.md. Each agent adds only domain-specific behavior. Every agent includes a contract directive (`> **Contract**: Read AGENTS_CONTRACT.md before proceeding.`) so the contract is loaded regardless of which tool you use.

## How to Use Agents Like Employees

Think of this system as your team. You are the executive who sets direction.

### Mental Model

| Component | Role |
|-----------|------|
| You | Executive — sets goals and direction |
| AGENTS_CONTRACT.md | Employee handbook — how everyone works |
| contract-orchestrator | Project manager / producer |
| pm-senior | Strategic advisor |
| Division agents (eng-*, test-*, etc.) | Specialists you delegate to |

### Where to Start?

**Don't know which agent to use? Start with one of these:**

| Situation | Use this agent |
|-----------|----------------|
| Big task, need multiple specialists | `contract-orchestrator` |
| Need strategic guidance first | `pm-senior` |
| Want to see available specialists | `"List all [prefix]-* agents"` |
| Know exactly what you need | Delegate directly to the agent |

### Example Workflows

**1. Let the orchestrator figure it out:**
```
"Use contract-orchestrator to help me launch a new SaaS product.
Coordinate the necessary agents across engineering, design, marketing, and product."
```
The orchestrator will reply with a proposed pipeline listing every agent it plans to use, in order, before doing anything. Approve or ask it to adjust.


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
3. `"Use contract-orchestrator to coordinate [goal]"` — Let it figure out who does what

## Agent Naming

| Prefix | Division | Count |
|--------|----------|-------|
| `eng-*` | Engineering | 23 |
| `test-*` | Testing & QA | 11 |
| `design-*` | Design & UX | 8 |
| `mkt-*` | Marketing & Growth | 16 |
| `prod-*` | Product Management | 5 |
| `pm-*` | Project Management | 7 |
| `game-*` | Game Development | 19 |
| `spatial-*` | Spatial Computing | 6 |
| `spec-*` | Specialized agents | 19 |
| `support-*` | Support & Operations | 6 |
| `contract-orchestrator` | Orchestration | 1 |

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
eng-frontend-developer.md
eng-incident-commander.md
eng-mobile-app-builder.md
eng-optimization-architect.md
eng-rapid-prototyper.md
eng-security-engineer.md
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
spec-arch-orchestrator.md
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
"Use contract-orchestrator to coordinate this workflow"
"List all test-* agents to see QA options"
```

## Architecture

```
contract-agents/
├── agents/               # 121 agent definitions
│   ├── eng-*.md          # Engineering (23)
│   ├── test-*.md         # Testing (11)
│   ├── design-*.md       # Design (8)
│   ├── mkt-*.md          # Marketing (16)
│   ├── prod-*.md         # Product (5)
│   ├── pm-*.md           # Project Management (7)
│   ├── game-*.md         # Game Development (19)
│   ├── spatial-*.md      # Spatial Computing (6)
│   ├── spec-*.md         # Specialized (19)
│   ├── support-*.md      # Support (6)
│   ├── AGENTS_CONTRACT.md # Shared contract
│   └── contract-orchestrator.md # Master orchestrator
├── templates/            # Agent template
├── tasks/               # Lessons learned
├── scripts/             # Utilities
├── tests/               # Validation
├── docs/                # Documentation
└── Makefile             # Install commands
```

## Developer Commands

```bash
make help                                     # Show targets and options
make install                                  # Global install, all tools
make install SCOPE=local                      # Local install to current project
make install SCOPE=local LOCAL_PATH=~/myapp   # Local install to specific project
make install-kilo DIVISION=eng                # Global, eng agents to Kilo
make install-claude DIVISION=mkt              # Global, mkt agents to Claude
make test                                     # Run validation
make clean                                    # Remove installs
```

## Contributing

1. Use division prefix (see catalog above)
2. Follow standard format: frontmatter + contract directive + domain rules + output
3. Include `> **Contract**: Read `AGENTS_CONTRACT.md` before proceeding.` after frontmatter
4. Add 4-6 domain-specific rules (not duplicating AGENTS_CONTRACT.md)
5. Keep agents minimal — shared rules in AGENTS_CONTRACT.md
6. Test: `make test`

## Disclaimer

Contract-Agents provides agent definitions and installation tooling as-is. The authors are not responsible for any damage, data loss, or unintended behavior resulting from the use or misuse of these agents. AI agents can produce incorrect, incomplete, or harmful outputs — always review their work before applying it. You are solely responsible for how you use, configure, and deploy these agents in your environment.

## License

- MIT License - see [LICENSE](LICENSE) for details.
- Based on [agency-agents](https://github.com/msitarzewski/agency-agents) by @msitarzewski and inspired by [black-box-architecture](https://github.com/gl0bal01/black-box-architecture).

