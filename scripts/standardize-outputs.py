#!/usr/bin/env python3
"""
Standardize all agent outputs to pipe format.
"""

import re
from pathlib import Path

TARGET_DIR = Path("/home/dev/projects/contract-agents")

# Division-specific outputs
OUTPUTS = {
    'test': 'FINDINGS | EVIDENCE | ISSUES | VERDICT',
    'design': 'DESIGN | RATIONALE | ALTERNATIVES',
    'prod': 'STATUS | BLOCKERS | NEXT STEPS | INSIGHTS',
    'pm': 'STATUS | BLOCKERS | NEXT STEPS',
    'support': 'RESOLUTION | CAUSE | PREVENTION',
    # Default for everyone else
    'default': 'RESULT | HOW TO VERIFY | POTENTIAL CONCERNS | NEXT',
}

def standardize_output(filepath):
    """Standardize output section to pipe format."""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception:
        return False

    # Get division from filename
    division = filepath.stem.split('-')[0]

    # Get the correct output format
    output_format = OUTPUTS.get(division, OUTPUTS['default'])

    # Replace the Output section
    pattern = r'## Output\s*\n.*?(?=---\s*$|\Z)'
    replacement = f'## Output\n\n{output_format}\n\n---'

    new_content = re.sub(pattern, replacement, content, flags=re.DOTALL)

    with open(filepath, 'w') as f:
        f.write(new_content)

    return True

def main():
    count = 0

    for filepath in TARGET_DIR.glob("*.md"):
        name = filepath.name

        # Skip non-agents
        if name in ['README.md', 'AGENTS_CONTRACT.md', 'LICENSE', 'CHANGELOG.md', 'TODO.md']:
            continue
        if name.startswith('template'):
            continue

        if standardize_output(filepath):
            count += 1
            print(f"Updated: {name}")

    print(f"\n=== SUMMARY ===")
    print(f"Agents updated: {count}")

if __name__ == "__main__":
    main()
