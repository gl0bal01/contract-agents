#!/usr/bin/env python3
"""
Rewrite all contract-agents in black-box style.
Extracts key info and rewrites in clean, consistent format.
"""

import os
import re
import json
from pathlib import Path

TARGET_DIR = Path("/home/dev/projects/contract-agents")

# Domain-specific rule extraction patterns
DOMAIN_RULES = {
    'eng': ['Component Design', 'Performance', 'Architecture', 'Security', 'Testing'],
    'test': ['Evidence', 'Quality Standards', 'Testing Protocol', 'Automation'],
    'design': ['Design Principles', 'Accessibility', 'Visual', 'Brand'],
    'mkt': ['Growth Framework', 'Channels', 'Content', 'Metrics'],
    'prod': ['Prioritization', 'Research', 'Feedback', 'Strategy'],
    'pm': ['Coordination', 'Timeline', 'Stakeholders', 'Delivery'],
    'game': ['Engine-specific', 'Performance', 'Cross-platform', 'Platform'],
    'spatial': ['Spatial', 'Immersive', 'Platform', 'Performance'],
    'spec': ['Domain', 'Integration', 'Architecture', 'Quality'],
    'support': ['Response', 'Metrics', 'Escalation', 'Documentation'],
}

def extract_role_description(content, name):
    """Extract role description from content."""
    # Look for first paragraph after role definition or similar
    patterns = [
        r'## Role Definition\s*\n(.+?)(?=\n##|\n\n|\Z)',
        r'## Core Capabilities\s*\n(.+?)(?=\n##|\Z)',
        r'## (.+?)\s*\n(.+?)(?=\n##|\n\n-|\*|\Z)',
    ]

    for pattern in patterns:
        match = re.search(pattern, content, re.MULTILINE | re.DOTALL)
        if match:
            desc = match.group(1).strip()
            # Clean up - remove bullet points, excessive detail
            desc = re.sub(r'^[-*•]\s+', '', desc, flags=re.MULTILINE)
            desc = re.sub(r'\n.*', '. ', desc)  # Take first sentence
            return desc.split('.')[0] + '.' if '.' in desc else desc

    # Fallback: generate from name
    name_parts = name.replace('-', ' ').replace('.md', '').split()
    if 'engineer' in name_parts or 'developer' in name_parts:
        return f"{' '.join(name_parts)} for software development."
    return f"{' '.join(name_parts)} specialist."

def extract_rules(content, division):
    """Extract domain-specific rules from content."""
    rules = []

    # Look for rule sections
    rule_sections = {
        'eng': ['Component', 'Performance', 'Architecture', 'Security', 'Testing', 'API'],
        'test': ['Evidence', 'Quality', 'Testing', 'Protocol', 'Standard'],
        'design': ['Design', 'Accessibility', 'Visual', 'Brand', 'UI', 'UX'],
        'mkt': ['Growth', 'Channel', 'Content', 'Viral', 'Funnel', 'Metrics'],
        'prod': ['Prioritization', 'Research', 'Feedback', 'Strategy', 'Roadmap'],
        'pm': ['Timeline', 'Stakeholder', 'Coordination', 'Delivery', 'Scope'],
        'game': ['Engine', 'Platform', 'Performance', 'Cross-platform', 'Multiplayer'],
        'spatial': ['Spatial', 'XR', 'Immersive', 'Platform', 'Interface'],
        'spec': ['Domain', 'Integration', 'Architecture', 'Quality', 'System'],
        'support': ['Response', 'Escalation', 'Documentation', 'SLA', 'Metrics'],
    }

    sections = rule_sections.get(division, [])

    for section in sections:
        # Find section and extract bullet points
        pattern = rf'## {section}.*?\n(.*?)(?=\n## |\n\n[A-Z]|$)'
        match = re.search(pattern, content, re.IGNORECASE | re.DOTALL)
        if match:
            bullets = re.findall(r'^[-*•]\s+(.+)$', match.group(1), re.MULTILINE)
            for bullet in bullets:
                # Clean up bullet
                bullet = re.sub(r'\*\*', '', bullet)  # Remove bold
                bullet = re.sub(r'`', '', bullet)      # Remove code
                bullet = bullet.strip()
                if len(bullet) > 10 and len(bullet) < 150:  # Reasonable length
                    rules.append((section, bullet))

    return rules[:6]  # Max 6 rules

def generate_agent(name, content):
    """Generate slim agent in black-box style."""

    # Parse frontmatter
    frontmatter_match = re.match(r'^---\n(.*?)\n---', content, re.DOTALL)
    frontmatter = {}
    if frontmatter_match:
        fm = frontmatter_match.group(1)
        for line in fm.split('\n'):
            if ':' in line:
                key, value = line.split(':', 1)
                frontmatter[key.strip()] = value.strip()

    # Determine division from filename
    division = name.split('-')[0] if '-' in name else 'spec'

    # Extract/determine role description
    description = frontmatter.get('description', extract_role_description(content, name))

    # Extract rules
    rules = extract_rules(content, division)

    # Generate protocol based on division
    protocols = {
        'eng': "1. Understand requirements → 2. Design solution → 3. Implement → 4. Test → 5. Document",
        'test': "1. Understand what to test → 2. Design test cases → 3. Execute tests → 4. Report results",
        'design': "1. Understand user need → 2. Design solution → 3. Create mockups → 4. Validate with users",
        'mkt': "1. Analyze current state → 2. Identify opportunity → 3. Design campaign → 4. Measure results",
        'prod': "1. Research → 2. Analyze → 3. Prioritize → 4. Recommend",
        'pm': "1. Define scope → 2. Identify stakeholders → 3. Coordinate → 4. Track delivery",
        'game': "1. Understand platform → 2. Implement feature → 3. Test on target platform → 4. Optimize",
        'spatial': "1. Understand spatial context → 2. Design for immersion → 3. Implement → 4. Test on device",
        'spec': "1. Understand requirement → 2. Analyze → 3. Execute → 4. Report",
        'support': "1. Understand issue → 2. Research → 3. Resolve → 4. Document",
    }

    protocol = protocols.get(division, "1. Understand context → 2. Execute task → 3. Verify results")

    # Build the agent content
    output = []

    # Frontmatter
    output.append("---")
    output.append(f"name: {frontmatter.get('name', name.replace('.md', '').replace('-', ' ').title())}")
    output.append(f"description: {description}")
    output.append("---")
    output.append("")

    # Header
    title = frontmatter.get('name', name.replace('.md', '').replace('-', ' ').title())
    output.append(f"# {title} Agent v1.0")
    output.append("")
    output.append(f"**Role**: {description}")
    output.append("")
    output.append("Follows `AGENTS_CONTRACT.md`.")
    output.append("")
    output.append("---")
    output.append("")

    # Session Start
    output.append("## Session Start")
    output.append("- Review `tasks/lessons.md` for relevant patterns")
    output.append("")
    output.append("---")
    output.append("")

    # Protocol
    output.append("## Protocol")
    output.append("")
    output.append(f"{protocol}")
    output.append("")
    output.append("---")
    output.append("")

    # Domain Rules (if we have any)
    if rules:
        output.append("## Domain Rules")
        output.append("")

        # Group rules by category
        current_cat = None
        for cat, rule in rules:
            if cat != current_cat:
                current_cat = cat
                output.append(f"### {cat.title()}")
                output.append("")
            output.append(f"- {rule}")
        output.append("")
        output.append("---")
        output.append("")

    # Output format
    output.append("## Output")
    output.append("")

    output_formats = {
        'eng': "**RESULT** — What was built\n**HOW TO VERIFY** — Test commands\n**POTENTIAL CONCERNS** — What to watch\n**NEXT** — Follow-up work",
        'test': "**FINDINGS** — What was found\n**EVIDENCE** — Screenshots/logs\n**ISSUES** — Problems found\n**VERDICT** — Pass/Fail",
        'design': "**DESIGN** — Proposed solution\n**RATIONALE** — Why this approach\n**ALTERNATIVES** — Other options considered",
        'mkt': "**CAMPAIGN** — What to run\n**EXPECTED RESULTS** — Metrics to hit\n**TIMELINE** — When to measure",
        'prod': "**INSIGHTS** — What the data says\n**RECOMMENDATIONS** — What to do\n**PRIORITY** — Ranking",
        'pm': "**STATUS** — Current state\n**BLOCKERS** — What's blocking\n**NEXT STEPS** — What's needed",
        'game': "**IMPLEMENTATION** — What was built\n**TESTING** — How it was tested\n**PERFORMANCE** — FPS/memory/etc",
        'spatial': "**EXPERIENCE** — Spatial design\n**INTERACTIONS** — How it works\n**PERFORMANCE** — Frame rate",
        'spec': "**RESULT** — What was accomplished\n**VERIFICATION** — How to confirm\n**NEXT** — Suggested action",
        'support': "**RESOLUTION** — What was done\n**CAUSE** — Why it happened\n**PREVENTION** — How to avoid recurrence",
    }

    output.append(output_formats.get(division, "**RESULT** — What was produced\n**HOW TO VERIFY** — Confirmation\n**NEXT** — Follow-up"))
    output.append("")
    output.append("---")

    return '\n'.join(output)

def process_agent(filepath):
    """Process a single agent file."""
    print(f"Processing: {filepath.name}")

    # Read original
    with open(filepath, 'r') as f:
        content = f.read()

    # Backup
    backup_path = filepath.with_suffix('.md.bak2')
    with open(backup_path, 'w') as f:
        f.write(content)

    # Generate new content
    name = filepath.stem
    new_content = generate_agent(name, content)

    # Write new content
    with open(filepath, 'w') as f:
        f.write(new_content)

    lines = len(new_content.split('\n'))
    print(f"  → {lines} lines")
    return lines

def main():
    """Process all agent files."""
    total_lines = 0
    count = 0

    # Find all agent files (not templates, docs, etc.)
    for filepath in TARGET_DIR.glob("*.md"):
        name = filepath.name

        # Skip non-agents
        if name in ['README.md', 'AGENTS_CONTRACT.md', 'LICENSE', 'CHANGELOG.md', 'TODO.md']:
            continue
        if name.startswith('template'):
            continue

        try:
            lines = process_agent(filepath)
            total_lines += lines
            count += 1
        except Exception as e:
            print(f"  ERROR: {e}")

    print(f"\n=== SUMMARY ===")
    print(f"Agents processed: {count}")
    print(f"Total lines: {total_lines}")
    print(f"Average per agent: {total_lines // count if count else 0}")
    print(f"\n⚠️  Backup files saved as *.bak2")
    print(f"   Originals preserved. Remove backups when satisfied.")

if __name__ == "__main__":
    main()
