#!/usr/bin/env python3
"""
Proper slim script - preserve domain rules, remove boilerplate only.
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

DEFAULT_OUTPUT = """**RESULT** — What was produced
**HOW TO VERIFY** — Confirmation
**NEXT** — Suggested action"""

def extract_domain_rules(content):
    """Extract domain rules section from content."""
    # Look for Domain Rules section with its content
    rules_match = re.search(
        r'## Domain Rules\s*\n(.*?)(?=\n##|\n---|\Z)',
        content,
        re.DOTALL
    )
    if rules_match:
        rules_text = rules_match.group(1).strip()
        # Extract bullet points
        bullets = re.findall(r'^\s*[-*•]\s+(.+)$', rules_text, re.MULTILINE)
        if bullets:
            return bullets
    return None

def proper_slim_agent(filepath, original_content):
    """Convert agent to proper slim format, preserving domain rules."""
    print(f"Processing: {filepath.name}")

    # Backup
    with open(filepath.with_suffix('.bak5'), 'w') as f:
        f.write(original_content)

    # Parse frontmatter
    fm_match = re.match(r'^---\n(.*?)\n---', original_content, re.DOTALL)
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

    # Extract domain rules
    domain_rules = extract_domain_rules(original_content)

    # Get division from filename
    division = filepath.stem.split('-')[0]

    # Check if custom output
    output = OUTPUTS.get(division, None)

    # Build proper slim agent
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

    # Output section (custom or default)
    lines.append('## Output')
    lines.append('')
    if output:
        lines.append(output)
    else:
        lines.append(DEFAULT_OUTPUT)
    lines.append('')
    lines.append('---')

    new_content = '\n'.join(lines)

    with open(filepath, 'w') as f:
        f.write(new_content)

    lines_count = len(new_content.split('\n'))
    rules_count = len(domain_rules) if domain_rules else 0
    print(f"  -> {lines_count} lines, {rules_count} domain rules")
    return lines_count

def main():
    # First, restore all agents from HEAD~1
    print("=== STEP 1: Restoring from git history ===\n")

    # Get list of agent files
    agent_files = []
    for filepath in TARGET_DIR.glob("*.md"):
        name = filepath.name
        if name in ['README.md', 'AGENTS_CONTRACT.md', 'LICENSE', 'CHANGELOG.md', 'TODO.md']:
            continue
        if name.startswith('template'):
            continue
        agent_files.append(filepath)

    # Restore each file from HEAD~1
    import subprocess
    for filepath in agent_files:
        subprocess.run([
            'git', 'show', f'HEAD~1:{filepath.name}'
        ], stdout=open(filepath, 'w'), stderr=subprocess.DEVNULL)

    print(f"Restored {len(agent_files)} agent files\n")

    print("=== STEP 2: Re-slimming with domain rules preserved ===\n")

    total_lines = 0
    count = 0
    with_rules = 0

    for filepath in agent_files:
        try:
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()

            lines = proper_slim_agent(filepath, content)
            if lines:
                total_lines += lines
                count += 1

                # Check if file has domain rules
                if '## Domain Rules' in open(filepath).read():
                    with_rules += 1

        except Exception as e:
            print(f"  ERROR: {e}")

    print(f"\n=== SUMMARY ===")
    print(f"Agents processed: {count}")
    print(f"Agents with domain rules: {with_rules}")
    print(f"Total lines: {total_lines}")
    print(f"Average per agent: {total_lines // count if count else 0}")
    print(f"\nBackup files saved as *.bak5")

if __name__ == "__main__":
    main()
