#!/usr/bin/env python3
"""
Ultra-slim agents - remove ALL boilerplate that's now in AGENTS_CONTRACT.md
"""

import os
import re
from pathlib import Path

TARGET_DIR = Path("/home/dev/projects/contract-agents")

# Division-specific outputs (only include if customizing)
OUTPUTS = {
    'test': 'FINDINGS | EVIDENCE | ISSUES | VERDICT',
    'design': 'DESIGN | RATIONALE | ALTERNATIVES',
    'prod': 'STATUS | BLOCKERS | NEXT STEPS | INSIGHTS',
    'pm': 'STATUS | BLOCKERS | NEXT STEPS',
}

# Division-specific protocols (only include if customizing)
PROTOCOLS = {
    'game': 'Understand platform → Implement → Test → Optimize',
    'eng': 'Understand → Design → Implement → Test → Document',
}

def ultra_slim_agent(filepath):
    """Make agent ultra-slim by removing all boilerplate."""
    print(f"Ultra-slimming: {filepath.name}")

    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
    except Exception:
        print(f"  SKIP: Can't read file")
        return

    # Backup
    with open(filepath.with_suffix('.bak3'), 'w') as f:
        f.write(content)

    # Parse frontmatter
    fm_match = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    if not fm_match:
        print(f"  SKIP: No frontmatter")
        return

    frontmatter = fm_match.group(1)
    name = None
    description = None

    for line in frontmatter.split('\n'):
        if ':' in line:
            key, value = line.split(':', 1)
            key = key.strip()
            value = value.strip()
            if key == 'name':
                name = value
            elif key == 'description':
                description = value

    if not name or not description:
        print(f"  SKIP: Missing name or description")
        return

    # Get division from filename
    division = filepath.stem.split('-')[0]

    # Check if custom protocol
    protocol = PROTOCOLS.get(division, None)

    # Check if custom output
    output = OUTPUTS.get(division, None)

    # Build ultra-slim agent
    lines = []

    # Minimal frontmatter
    lines.append('---')
    lines.append(f'name: {name}')
    lines.append(f'description: {description}')
    lines.append('---')
    lines.append('')

    # Only include protocol if custom
    if protocol:
        lines.append('## Protocol')
        lines.append('')
        lines.append(f'{protocol}')
        lines.append('')
        lines.append('---')
        lines.append('')

    # Include domain rules if any (extract from original)
    # Look for ### headings followed by bullets
    rules_section = re.search(r'## (?:Domain Rules|### .+?)\n(.*?)(?=\n##|\n\n---|\Z)', content, re.DOTALL)
    has_rules = False
    if rules_section:
        rules_text = rules_section.group(2)
        bullets = re.findall(r'^[-*•]\s+(.+)$', rules_text, re.MULTILINE)
        if bullets and len(bullets) > 0 and len(bullets) < 20:  # Reasonable number
            lines.append('## Domain Rules')
            lines.append('')
            for bullet in bullets[:6]:  # Max 6 rules
                lines.append(f'- {bullet}')
            lines.append('')
            lines.append('---')
            lines.append('')
            has_rules = True

    # Output section (custom or default)
    lines.append('## Output')
    lines.append('')
    if output:
        lines.append(output)
    else:
        lines.append('**RESULT** — What was produced')
        lines.append('**HOW TO VERIFY** — Confirmation')
        lines.append('**NEXT** — Suggested action')
    lines.append('')
    lines.append('---')

    new_content = '\n'.join(lines)

    with open(filepath, 'w') as f:
        f.write(new_content)

    lines = len(new_content.split('\n'))
    print(f"  → {lines} lines")
    return lines

def main():
    total_lines = 0
    count = 0

    for filepath in TARGET_DIR.glob("*.md"):
        name = filepath.name

        # Skip non-agents
        if name in ['README.md', 'AGENTS_CONTRACT.md', 'LICENSE', 'CHANGELOG.md', 'TODO.md']:
            continue
        if name.startswith('template'):
            continue

        try:
            lines = ultra_slim_agent(filepath)
            total_lines += lines
            count += 1
        except Exception as e:
            print(f"  ERROR: {e}")

    print(f"\n=== SUMMARY ===")
    print(f"Agents processed: {count}")
    print(f"Total lines: {total_lines}")
    print(f"Average per agent: {total_lines // count if count else 0}")
    print(f"\n⚠️  Backup files saved as *.bak3")

if __name__ == "__main__":
    main()
