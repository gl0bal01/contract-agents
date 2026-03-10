#!/bin/bash
# Count lines in agents to verify slimming

echo "Agent line counts:"

find /home/dev/projects/contract-agents -name "*.md" -type f -maxdepth 1 ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" | while read -r agent; do
    lines=$(wc -l < "$agent")
    if [ $lines -gt 100 ]; then
        echo "⚠️  $lines lines - $agent (over 100)"
    fi
done

echo ""
echo "Total KB:"
find /home/dev/projects/contract-agents -name "*.md" -type f -maxdepth 1 ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" -exec wc -c {} + | tail -1
