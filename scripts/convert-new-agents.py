#!/usr/bin/env python3
"""
Convert new agents to contract-agents format.
"""

import re
from pathlib import Path

TARGET_DIR = Path("/home/dev/projects/contract-agents")

# Mapping of agent names to contract-agents naming
AGENT_MAPPING = {
    'arch-analyzer.md': ('arch-analyzer', 'Architecture agent - explore codebase to map module boundaries, coupling, and black-box violations', 'spec'),
    'arch-debugger.md': ('arch-debugger', 'Architecture agent - isolate bugs to module boundaries and fix without breaking contracts', 'spec'),
    'arch-implementer.md': ('arch-implementer', 'Architecture agent - execute approved plans with small verifiable changes', 'spec'),
    'arch-orchestrator.md': ('arch-orchestrator', 'Architecture agent - coordinate architectural work by delegating to specialists', 'spec'),
    'arch-planner.md': ('arch-planner', 'Architecture agent - design black-box module boundaries and implementation roadmap', 'spec'),
    'brutalist-critic.md': ('brutalist-critic', 'Harsh unfiltered assessment of project viability, business potential, or market fit', 'spec'),
    'indie-business-strategist.md': ('indie-business-strategist', 'Business strategy for indie developers: bootstrap, pricing, time management, revenue diversification', 'pm'),
    'docs-educator.md': ('docs-educator', 'Documentation specialist - create/improve README, tutorials, API docs, and educational content', 'eng'),
    'docker-security-auditor.md': ('docker-security-auditor', 'Docker and container security - audit Dockerfiles, containers, and Tailscale integration', 'test'),
    'monetization-optimizer.md': ('monetization-optimizer', 'Monetization optimization - pricing, conversion, upsells, churn reduction, and LTV maximization', 'mkt'),
}

# Division-specific outputs
OUTPUTS = {
    'test': 'FINDINGS | EVIDENCE | ISSUES | VERDICT',
    'design': 'DESIGN | RATIONALE | ALTERNATIVES',
    'prod': 'STATUS | BLOCKERS | NEXT STEPS | INSIGHTS',
    'pm': 'STATUS | BLOCKERS | NEXT STEPS',
    'mkt': 'RESULT | HOW TO VERIFY | POTENTIAL CONCERNS | NEXT',
    'spec': 'RESULT | HOW TO VERIFY | POTENTIAL CONCERNS | NEXT',
    'eng': 'RESULT | HOW TO VERIFY | POTENTIAL CONCERNS | NEXT',
    'support': 'RESOLUTION | CAUSE | PREVENTION',
}

def extract_domain_rules(content):
    """Extract domain rules section from content."""
    # Look for domain rules or core expertise sections
    patterns = [
        r'## Domain Rules\s*\n(.*?)(?=\n##|\n---|\Z)',
        r'## Your Core Expertise\s*\n(.*?)(?=\n##|\n---|\Z)',
        r'## Expertise\s*\n(.*?)(?=\n##|\n---|\Z)',
    ]

    for pattern in patterns:
        rules_match = re.search(pattern, content, re.DOTALL)
        if rules_match:
            rules_text = rules_match.group(1).strip()
            # Extract bullet points and numbered lists
            bullets = re.findall(r'^\s*[-*•]\s+(.+)$', rules_text, re.MULTILINE)
            if bullets and len(bullets) > 0:
                return bullets[:10]  # Max 10 rules
    return None

def convert_agent(filename):
    """Convert agent to contract-agents format."""
    filepath = TARGET_DIR / filename

    if filename not in AGENT_MAPPING:
        print(f"SKIP: {filename} - not in mapping")
        return

    name, description, division = AGENT_MAPPING[filename]

    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
    except Exception:
        print(f"SKIP: {filename} - can't read")
        return

    # Extract domain rules
    domain_rules = extract_domain_rules(content)

    # Build contract-agents format
    lines = []

    # Minimal frontmatter
    lines.append('---')
    lines.append(f'name: {name}')
    lines.append(f'description: {description}')
    lines.append('---')
    lines.append('')

    # Include domain rules if found
    if domain_rules:
        lines.append('## Domain Rules')
        lines.append('')
        for bullet in domain_rules:
            lines.append(f'- {bullet}')
        lines.append('')
        lines.append('---')
        lines.append('')

    # Output section
    output_format = OUTPUTS.get(division, OUTPUTS['spec'])
    lines.append('## Output')
    lines.append('')
    lines.append(output_format)
    lines.append('')
    lines.append('---')

    new_content = '\n'.join(lines)

    with open(filepath, 'w') as f:
        f.write(new_content)

    lines_count = len(new_content.split('\n'))
    rules_count = len(domain_rules) if domain_rules else 0
    print(f"Converted: {filename} -> {lines_count} lines, {rules_count} domain rules")

def main():
    for filename in AGENT_MAPPING.keys():
        convert_agent(filename)

    print(f"\n=== SUMMARY ===")
    print(f"Agents converted: {len(AGENT_MAPPING)}")

if __name__ == "__main__":
    main()
