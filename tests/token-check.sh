#!/bin/bash
# Count lines in agents to verify slimming

echo "Agent line counts:"
find /home/dev/projects/contract-agents/agents -maxdepth 1 -name "*.md" -type f ! -name "AGENTS_CONTRACT.md" | while read -r agent; do
    lines=$(wc -l < "$agent")
    [[ $lines -gt 100 ]] && echo "[WARN] $lines lines - $agent (over 100)"
done
echo "Total KB: $(find /home/dev/projects/contract-agents/agents -maxdepth 1 -name "*.md" -type f ! -name "AGENTS_CONTRACT.md" -exec wc -c {} + | tail -1 | awk '{print $1}')"
