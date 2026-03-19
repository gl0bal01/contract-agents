# Changelog

All notable changes to contract-agents will be documented in this file.

## [1.4.0] - 2026-03-19

### Added
- spec-book-editor for manuscript developmental editing, continuity checking, and pacing feedback
- spec-book-writer for long-form book writing with consistent voice, tone, and genre conventions
- mkt-book-marketer for self-publishing launch strategy, metadata optimization, and retail copy
- spec-osint-investigator for open source intelligence, people-finding (TraceLabs-style), due diligence, and competitive research

### Changed
- Total agents: 121 → 125
- Specialized count: 19 → 22
- Marketing count: 16 → 17

## [1.3.1] - 2026-03-14

### Fixed
- Fixed agent count inconsistency: README table now matches actual file counts (was summing to 124, actual is 121)
- Engineering count corrected: 22 → 23 (added missing eng-rapid-prototyper, eng-security-engineer to catalog)
- Specialized count corrected: 24 → 19 (removed inflated count)
- Removed vague "production-ready" claim from subtitle, replaced with verifiable "specialized, consistent, and human-guided"

### Changed
- Renamed spec-orchestrator.md → contract-orchestrator.md to match its role as the master orchestrator
- contract-orchestrator now has explicit Agent tool delegation instructions (Core Rule, Workflow, How to Delegate sections)
- contract-orchestrator listed as its own row in the naming table (not under spec-*)

## [1.3.0] - 2026-03-12

### Contract Improvements (v2.0)
- Added Operating Goals: constant velocity, smallest correct change, reviewability, staff engineer bar
- Added Assumption Surfacing: explicit assumption stating before non-trivial work
- Added Confusion Management: stop on ambiguous reqs, ask clarifying questions
- Added Security section: first-class security requirements checklist
- Added Verification Ladder: 4-level verification strategy (lint → tests → full → manual)
- Added Task Management: `tasks/todo.md` format for multi-step tracking
- Added Sub-Agent Delegation Policy: orchestrator-only rule + handoff packet format
- Expanded Quality Gates: 9 items (was 6), added security & confusion checks

### Contract v2.0 Refinements
- Made AGENTS_CONTRACT.md universal (works for all agent types: engineering, marketing, design, support, etc.)
- Removed tech-specific terminology (public API, database schemas, lint/typecheck → "significant work", "persistent data", "automated checks")
- Added note for non-version-controlled work in Commit Discipline
- Simplified Evidence Rules to accept URLs/screenshots/research for non-code work
- Contract reduced from 259 to ~170 lines

### Changed
- AGENTS_CONTRACT.md: v1.1 → v2.0
- All agents now governed by v2.0 contract with enhanced operational rigor

## [1.2.0] - 2026-03-11

### Infrastructure
- Added Makefile for simplified installation (`make install`)
- Added support for 5 tools: Kilo CLI, Claude Code, Cursor, Goose, OpenCode
- Replaced complex bash install.sh with lean Makefile

### Changed
- Simplified install process using Makefile
- Updated README with Makefile commands
- Agent files now install directly from `agents/` directory
- Removed AGENTS.md (consolidated into README)
- Removed examples/ (duplicates)

## [1.1.0] - 2026-03-11

### Architecture & Security
- Black-box architecture workflow agents (spec-arch-analyzer, spec-arch-debugger, spec-arch-implementer, spec-arch-orchestrator, spec-arch-planner)
- eng-reverse-engineer for binary analysis and decompilation
- test-malware-analyst for malware analysis and threat intelligence
- test-docker-security-auditor for container security hardening
- test-penetration-tester for security testing and vulnerability assessment
- spec-digital-forensics for DFIR, incident response, and evidence collection

### Data & AI
- eng-data-scientist for ML, statistics, and experimental design
- eng-prompt-engineer for AI prompt optimization and RAG systems
- eng-cloud-architect for AWS/Azure/GCP strategy and cost optimization
- eng-reliability-engineer for SRE practices, SLIs/SLOs, and error budgets

### Product & Business
- prod-competitive-intelligence for competitor analysis and market monitoring
- mkt-monetization-optimizer for pricing and revenue optimization
- pm-indie-business-strategist for solo developer business strategy
- spec-brutalist-critic for unfiltered project viability assessment

### Developer Experience
- eng-docs-educator for documentation and educational content
- eng-browser-extension-developer for Chrome/Firefox/Edge extension development

### Changed
- Total agents: 101 → 121
- Standardized all output formats to pipe style
- Preserved domain rules while removing boilerplate
- Updated README with "How to Use Agents Like Employees" section
- Added examples/ with getting-started guide and workflow examples

## [1.0.0] - 2026-03-10

### Added
- Initial release of contract-agents
- AGENTS_CONTRACT.md with shared rules for all agents
- 101 agents across 10 divisions with flattened structure
- Division prefix naming (eng-*, test-*, design-*, mkt-*, prod-*, pm-*, game-*, spatial-*, spec-*, support-*)
- Verification scripts for contract compliance and token counting
- Agent template for easy contribution

### Changed
- Migrated from agency-agents with new branding and structure
- Flattened directory structure (all agents at root level)
- All agents now follow shared contract
- Evidence requirements (3+ file:line citations)
- Approval gates for risky operations

### Based On
- [agency-agents](https://github.com/msitarzewski/agency-agents) by @msitarzewski
- [black-box-architecture](https://github.com/gl0bal01/black-box-architecture) by @gl0bal01
