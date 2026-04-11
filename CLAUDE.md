# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Contract-Agents is a collection of 53 AI agent definitions (Markdown files) governed by a shared contract (`agents/AGENTS_CONTRACT.md` v2.0). Agents are organized into 10 divisions by prefix (`eng-*`, `test-*`, `design-*`, `mkt-*`, `prod-*`, `pm-*`, `game-*`, `spatial-*`, `spec-*`, `support-*`) plus a `contract-orchestrator`. The project is tool-agnostic — agents install into Claude Code, Kilo CLI, Goose, and OpenCode.

## Commands

```bash
make test          # Runs tests/contract-test.sh (frontmatter validation) and tests/token-check.sh (line count warnings)
make install       # Install agents globally to all detected tools
make install-claude DIVISION=eng  # Install specific division to specific tool
make clean         # Remove installed agents from all tool directories
```

## Architecture

- **`agents/AGENTS_CONTRACT.md`** — The shared contract all agents inherit. When contract rules conflict with agent-specific rules, the contract wins.
- **`agents/<prefix>-<name>.md`** — Individual agent definitions. Each is minimal: YAML frontmatter (`name`, `displayName`, `description`) + domain-specific rules + output format. Shared behavior lives in the contract, not duplicated per agent.
- **`agents/contract-orchestrator.md`** — Special orchestrator agent that delegates to specialists via the Agent tool but never does work itself.
- **`templates/agent-template.md`** — Canonical template for creating new agents.
- **`tasks/lessons.md`** — Agents read this at session start and append lessons after corrections (part of the contract's self-improvement loop).
- **`tasks/todo.md`** — Multi-step task tracking per the contract's task management rules.
- **`scripts/`** — Python utilities for bulk agent modifications (slimming, standardizing outputs).

## Creating/Editing Agents

1. Use the division prefix matching the agent's domain (see README for prefix table).
2. Follow `templates/agent-template.md` format: YAML frontmatter → domain rules → output section.
3. Keep agents minimal — put shared rules in `AGENTS_CONTRACT.md`, not in individual agents.
4. The contract-test validates: presence of `---` frontmatter delimiters, `name:` field, and `description:` field.
5. Token-check warns if any agent exceeds 100 lines — agents should be concise.
6. Run `make test` after changes to validate.

## Key Constraints

- The contract (`AGENTS_CONTRACT.md`) is the single source of truth for cross-cutting rules. Never duplicate contract rules into individual agent files.
- Only the orchestrator spawns sub-agents; leaf agents request delegation but don't spawn.
- Agent filenames must match the pattern `<division-prefix>-<name>.md`.
