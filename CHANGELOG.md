# Changelog

All notable changes to contract-agents will be documented in this file.

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
