# Changelog

## [1.1.0] - 2026-03-11

### Added
- Architecture workflow agents (spec-arch-analyzer, spec-arch-debugger, spec-arch-implementer, spec-arch-orchestrator, spec-arch-planner)
- spec-brutalist-critic for unfiltered project viability assessment
- pm-indie-business-strategist for solo developer business strategy
- eng-docs-educator for documentation and educational content
- test-docker-security-auditor for container security hardening
- mkt-monetization-optimizer for pricing and revenue optimization
- eng-browser-extension-developer for Chrome/Firefox/Edge extension development
- test-penetration-tester for security testing and vulnerability assessment

### Changed
- Total agents: 101 → 113
- Standardized all output formats to pipe style
- Preserved domain rules while removing boilerplate

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
