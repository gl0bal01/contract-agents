# Contract-Agents

> Professional AI agents governed by a shared contract — efficient, coordinated, and production-ready.

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Agents](https://img.shields.io/badge/Agents-101+-blue.svg)

## What Makes Contract-Agents Different?

**All agents follow [`AGENTS_CONTRACT.md`](AGENTS_CONTRACT.md)** — a shared contract that ensures:

- ✅ **Scope Discipline** — Touch only what's required
- ✅ **Evidence Requirements** — 3+ `file:line` citations for claims
- ✅ **Approval Gates** — Hard stops for risky operations
- ✅ **Commit Discipline** — Safe, bisectable history
- ✅ **Self-Improvement** — Agents learn from corrections

## Quick Start

```bash
# Clone this repo
git clone https://github.com/[your-username]/contract-agents.git

# Copy agents to your Claude Code directory
cp contract-agents/*.md ~/.claude/agents/
```

## Agent Naming

| Prefix | Division | Count |
|--------|----------|-------|
| `eng-*` | Engineering | 16 |
| `test-*` | Testing & QA | 8 |
| `design-*` | Design & UX | 8 |
| `mkt-*` | Marketing & Growth | 15 |
| `prod-*` | Product Management | 4 |
| `pm-*` | Project Management | 6 |
| `game-*` | Game Development | 19 |
| `spatial-*` | Spatial Computing | 6 |
| `spec-*` | Specialized agents | 13 |
| `support-*` | Support & Operations | 6 |

## Agent Catalog

### 🏗️ Engineering (`eng-*`)

```
eng-ai-engineer.md              eng-frontend-developer.md
eng-backend-architect.md         eng-optimization-architect.md
eng-data-engineer.md             eng-senior-developer.md
eng-devops-automator.md          eng-solidity-engineer.md
eng-embedded-firmware-engineer.md eng-technical-writer.md
eng-incident-commander.md        eng-threat-detection-engineer.md
eng-mobile-app-builder.md        eng-wechat-developer.md
```

### 🧪 Testing (`test-*`)

```
test-accessibility-auditor.md    test-performance-benchmarker.md
test-api-tester.md               test-results-analyzer.md
test-evidence-collector.md       test-tool-evaluator.md
test-reality-checker.md          test-workflow-optimizer.md
```

### 🎨 Design (`design-*`)

```
design-brand-guardian.md         design-image-prompt-engineer.md
design-inclusive-visuals-specialist.md design-ux-architect.md
design-ui-designer.md            design-ux-researcher.md
design-visual-storyteller.md     design-whimsy-injector.md
```

### 📈 Marketing (`mkt-*`)

```
mkt-app-store-optimizer.md       mkt-instagram-curator.md
mkt-baidu-seo.md                 mkt-kuaishou-strategist.md
mkt-bilibili-strategist.md       mkt-reddit-builder.md
mkt-china-ecommerce.md           mkt-seo-strategist.md
mkt-content-creator.md           mkt-social-strategist.md
mkt-growth-hacker.md             mkt-tiktok-strategist.md
mkt-wechat-account.md            mkt-xiaohongshu-specialist.md
mkt-xiaohongshu-specialist.md    mkt-zhihu-strategist.md
```

### 📊 Product (`prod-*`)

```
prod-feedback-synthesizer.md     prod-nudge-engine.md
prod-sprint-prioritizer.md       prod-trend-researcher.md
```

### 📋 Project Management (`pm-*`)

```
pm-experiment-tracker.md         pm-jira-steward.md
pm-project-shepherd.md           pm-senior.md
pm-studio-operations.md          pm-studio-producer.md
```

### 🎮 Game Development (`game-*`)

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

### 🔧 Specialized (`spec-*`)

```
spec-analytics-reporter.md       spec-identity-operator.md
spec-blockchain-auditor.md       spec-identity-trust.md
spec-compliance-auditor.md       spec-lsp-engineer.md
spec-cultural-strategist.md       spec-model-qa.md
spec-data-consolidation.md       spec-orchestrator.md
spec-dev-advocate.md             spec-report-distribution.md
spec-sales-extraction.md
```

### 🛟 Support (`support-*`)

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
| Total agents | 101 |
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
