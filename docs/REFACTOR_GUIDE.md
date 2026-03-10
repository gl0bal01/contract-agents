# Agent Refactoring Guide

## Goal
Slim each agent from 8-15 KB to 2-3 KB while preserving domain-specific expertise.

## Sections to Remove
- `## 🧠 Your Identity & Memory` → Remove (move personality to contract if needed)
- `## 💭 Your Communication Style` → Remove (add to contract as general rule)
- `## 🎯 Your Success Metrics` → Remove unless domain-specific
- `## 🚀 Advanced Capabilities` → Remove unless critical
- `## 🤖 Available Specialist Agents` → Remove (agent catalog in README)
- Verbose workflow sections → Keep only essential steps

## Sections to Keep
- `## Your Specialty` (2-3 sentences)
- `## When To Use` (3-5 bullets)
- `## Domain-Specific Rules` (the unique value)
- `## Critical Difference from Generic X` (one sentence)
- Brief code examples (1 per major deliverable)

## Refactor Checklist per Agent
- [ ] Read current agent
- [ ] Identify domain-specific rules (keep these)
- [ ] Remove redundant sections
- [ ] Add contract reference at top
- [ ] Verify agent still makes sense
- [ ] Test: `cat agent | wc -l` (should be < 100 lines)
- [ ] Commit: `git add agent && git commit -m "refactor: slim [agent-name]"`
