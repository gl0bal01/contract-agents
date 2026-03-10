#!/bin/bash
# Count lines in agents to verify slimming

echo "Agent line counts:"

find /home/dev/projects/contract-agents -name "*.md" -type f -maxdepth 1 ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" ! -name "TODO.md" | while read -r agent; do
    lines=$(wc -l < "$agent")
    if [ $lines -gt 100 ]; then
        echo "[WARN] $lines lines - $agent (over 100)"
    fi
done

echo ""
echo "Total KB:"
find /home/dev/projects/contract-agents -name "*.md" -type f -maxdepth 1 ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" ! -name "TODO.md" -exec wc -c {} + | tail -1
