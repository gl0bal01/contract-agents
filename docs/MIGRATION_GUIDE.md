# Migration Guide: v1.x to v2.0

## What Changed
- Added `AGENTS_CONTRACT.md` with shared rules
- Slimmed agents from ~8-15 KB to ~2-3 KB each
- Added approval gates for risky operations
- Added evidence-based claim requirements
- Added self-improvement loop via `tasks/lessons.md`

## For Users
No action required. Agents work the same way, but now:
- They ask for approval before risky changes
- They provide `file:line` evidence for claims
- They learn from corrections over time

## For Contributors
When adding new agents:
1. Use `templates/agent-template.md`
2. Add only domain-specific rules
3. Reference `AGENTS_CONTRACT.md` at top
4. Keep agent under 100 lines

## Token Savings
- Before: ~800 KB total
- After: ~250 KB total
- Reduction: ~70%
