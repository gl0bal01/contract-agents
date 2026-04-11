# Contract-Agents

![License](https://img.shields.io/badge/license-MIT-blue)
![Agents](https://img.shields.io/badge/agents-52-brightgreen)
![Contract](https://img.shields.io/badge/contract-v2.0-orange)
![Claude Code](https://img.shields.io/badge/Claude%20Code-compatible-blueviolet)
![Kilo CLI](https://img.shields.io/badge/Kilo%20CLI-tested-blueviolet)
![Goose](https://img.shields.io/badge/Goose-tested-blueviolet)
![OpenCode](https://img.shields.io/badge/OpenCode-tested-blueviolet)

> Professional AI agents governed by a shared contract — specialized, consistent, and human-guided.

> You set the direction. They do the work. That's the deal.


```
┌─────────────────────────────────────────────┐
│         CONTRACT-AGENTS                     │
│                                             │
│   52 AI Agents • 8 Divisions • 1 Contract   │
│                                             │
│   eng-*  test-*  design-*  mkt-*  prod-*    │
│   pm-*   game-*  spec-*                     │
└─────────────────────────────────────────────┘
```


## What Makes Contract-Agents Different?

**All agents follow [`AGENTS_CONTRACT.md`](agents/AGENTS_CONTRACT.md) v2.0** — a shared contract that opens with:

> *"Shared rules for all agents. Individual agent files add domain-specific rules on top. **When instructions conflict, this contract wins.**"*

The contract defines 12 global rules and a delegation policy. Key sections (quoted from the contract):

- **Operating Goals** — *"Smallest correct change: surgical diffs over 'cleanup'"*
- **Scope Discipline** — *"Touch only what's required. Do NOT refactor unrelated code, rename/reformat without asking"*
- **Confusion Management** — *"If requirements are ambiguous: 1. STOP 2. Name the exact ambiguity"*
- **Evidence Rules** — *"Support claims with evidence... provide specific evidence (file:line for code, URLs/screenshots/research for non-code)"*
- **Security** — *"Treat security as first-class: Avoid injection, unsafe deserialization, secrets in logs, insecure defaults"*
- **Approval Gates** — *"Stop and request explicit approval before: Adding dependencies, Changing public interfaces..."*
- **Verification** — *"Prefer automated → focused tests → full suite → manual review"*
- **Commit Discipline** — *"Checkpoint before significant work"*
- **Self-Improvement** — *"After correction: Update tasks/lessons.md"*
- **Delegation Policy** — *"Only the orchestrator spawns sub-agents. Leaf agents request delegation but don't spawn."*

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

Tested with: Kilo CLI, Claude Code, Goose, OpenCode

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
| pm-project-shepherd | Strategic advisor / cross-functional coordinator |
| Division agents (eng-*, test-*, etc.) | Specialists you delegate to |

### Where to Start?

**Don't know which agent to use? Start with one of these:**

| Situation | Use this agent |
|-----------|----------------|
| Big task, need multiple specialists | `contract-orchestrator` |
| Need strategic guidance first | `pm-project-shepherd` |
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
"Use pm-project-shepherd to help me plan this feature. Identify what needs
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
| `eng-*` | Engineering | 18 |
| `test-*` | Testing & QA | 7 |
| `design-*` | Design & UX | 2 |
| `mkt-*` | Marketing & Growth | 6 |
| `prod-*` | Product Management | 4 |
| `pm-*` | Project Management | 2 |
| `game-*` | Game Development | 8 |
| `spec-*` | Specialized agents | 4 |
| `contract-orchestrator` | Orchestration | 1 |

## Agent Catalog

### Engineering (`eng-*`)

```
eng-api-designer.md                  eng-frontend-developer.md
eng-backend-architect.md             eng-git-workflow.md
eng-browser-extension-developer.md   eng-go-engineer.md
eng-cloud-architect.md               eng-kubernetes-operator.md
eng-data-engineer.md                 eng-mobile-app-builder.md
eng-data-scientist.md                eng-prompt-engineer.md
eng-database-migration-specialist.md eng-reliability-engineer.md
                                     eng-reverse-engineer.md
                                     eng-rust-engineer.md
                                     eng-security-engineer.md
                                     eng-solidity-engineer.md
```

### Testing (`test-*`)

```
test-accessibility-auditor.md    test-load-tester.md
test-docker-security-auditor.md  test-malware-analyst.md
test-evidence-collector.md       test-penetration-tester.md
                                 test-reality-checker.md
```

### Design (`design-*`)

```
design-ui-designer.md            design-ux-architect.md
```

### Marketing (`mkt-*`)

```
mkt-book-marketer.md             mkt-seo-strategist.md
mkt-email-marketer.md            mkt-tiktok-strategist.md
mkt-growth-hacker.md             mkt-youtube-strategist.md
```

### Product (`prod-*`)

```
prod-feedback-synthesizer.md     prod-sprint-prioritizer.md
prod-pricing-strategist.md       prod-trend-researcher.md
```

### Project Management (`pm-*`)

```
pm-indie-business-strategist.md  pm-project-shepherd.md
```

### Game Development (`game-*`)

**Godot:**
```
game-godot-multiplayer.md        game-godot-shader.md
game-godot-scripter.md
```

**Unity:**
```
game-unity-architect.md          game-unity-shader.md
```

**Unreal:**
```
game-unreal-engineer.md
```

**Cross-engine:**
```
game-level-designer.md           game-technical-artist.md
```

### Specialized (`spec-*`)

```
spec-book-editor.md              spec-digital-forensics.md
spec-book-writer.md              spec-osint-investigator.md
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
├── agents/               # 52 agent definitions
│   ├── eng-*.md          # Engineering (18)
│   ├── test-*.md         # Testing (7)
│   ├── design-*.md       # Design (2)
│   ├── mkt-*.md          # Marketing (6)
│   ├── prod-*.md         # Product (4)
│   ├── pm-*.md           # Project Management (2)
│   ├── game-*.md         # Game Development (8)
│   ├── spec-*.md         # Specialized (4)
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

## License

- MIT License - see [LICENSE](LICENSE) for details.
- Based on [agency-agents](https://github.com/msitarzewski/agency-agents) by @msitarzewski and inspired by [black-box-architecture](https://github.com/gl0bal01/black-box-architecture).

