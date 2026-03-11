#!/bin/bash
# Verify all agents have proper frontmatter format

FAILED=0; TOTAL=0
for agent in $(find /home/dev/projects/contract-agents/agents -maxdepth 1 -name "*.md" -type f); do
    basename=$(basename "$agent")
    if ! echo "$basename" | grep -qE "^(eng|test|design|mkt|prod|pm|game|spatial|spec|support)-"; then continue; fi
    TOTAL=$((TOTAL + 1))
    grep -q "^---$" "$agent" || { echo "[FAIL] Missing frontmatter: $agent"; FAILED=$((FAILED + 1)); continue; }
    grep -q "^name:" "$agent" || { echo "[FAIL] Missing name field: $agent"; FAILED=$((FAILED + 1)); }
    grep -q "^description:" "$agent" || { echo "[FAIL] Missing description field: $agent"; FAILED=$((FAILED + 1)); }
done

echo "Results: $((TOTAL - FAILED))/$TOTAL compliant | Failed: $FAILED"
[[ $FAILED -eq 0 ]] && echo "[PASS] All agents have proper format!" || echo "[FAIL] Some agents have format issues"
exit $FAILED
