# Contract-Agents

> Professional AI agents governed by a shared contract — efficient, coordinated, and production-ready.

**Principle:** All agents follow `AGENTS_CONTRACT.md` — scope discipline, evidence requirements, approval gates, commit discipline, and continuous learning.

## Quick Start

```bash
# Clone this repo
git clone https://github.com/[your-username]/contract-agents.git

# Copy agents to your Claude Code directory
cp -r contract-agents/*.md ~/.claude/agents/
```

## Agent Naming

- `eng-*` — Engineering (frontend, backend, DevOps, etc.)
- `test-*` — Testing & QA
- `design-*` — Design & UX
- `mkt-*` — Marketing & Growth
- `prod-*` — Product Management
- `pm-*` — Project Management
- `game-*` — Game Development
- `spatial-*` — Spatial Computing
- `spec-*` — Specialized agents
- `support-*` — Support & Operations

## Invocation Examples

```
"Use eng-frontend-developer to build this React component"
"Use test-evidence-collector to verify the UI"
"Use spec-orchestrator to coordinate this workflow"
```

## Architecture

All agents governed by [`AGENTS_CONTRACT.md`](AGENTS_CONTRACT.md) containing:
- Scope discipline
- Evidence requirements (3+ `file:line` citations)
- Approval gates for risky operations
- Commit discipline
- Self-improvement loop

Individual agents contain only domain-specific rules.

## License

MIT — Based on [agency-agents](https://github.com/msitarzewski/agency-agents) by @msitarzewski
