#!/usr/bin/env python3
"""
Final slim script - convert ALL agents to ultra-slim format.
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

def final_slim_agent(filepath):
    """Convert agent to ultra-slim format."""
    print(f"Processing: {filepath.name}")

    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
    except Exception:
        print(f"  SKIP: Can't read file")
        return

    # Skip if already slim (no "Agent v1.0" header)
    if not re.search(r'^#.*Agent v1\.0', content, re.MULTILINE):
        print(f"  SKIP: Already slim")
        return

    # Backup
    with open(filepath.with_suffix('.bak4'), 'w') as f:
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
    print(f"  -> {lines} lines")
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
            lines = final_slim_agent(filepath)
            if lines:
                total_lines += lines
                count += 1
        except Exception as e:
            print(f"  ERROR: {e}")

    print(f"\n=== SUMMARY ===")
    print(f"Agents slimmed: {count}")
    print(f"Total lines: {total_lines}")
    print(f"Average per agent: {total_lines // count if count else 0}")
    print(f"\nBackup files saved as *.bak4")

if __name__ == "__main__":
    main()
