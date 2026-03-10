#!/bin/bash
# Verify all agents have proper frontmatter format

echo "Checking agent format compliance..."

FAILED=0
TOTAL=0

for agent in $(find /home/dev/projects/contract-agents -name "*.md" -type f -maxdepth 1 ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" ! -name "TODO.md"); do
    # Check if basename matches prefix pattern
    basename=$(basename "$agent")
    if ! echo "$basename" | grep -qE "^(eng|test|design|mkt|prod|pm|game|spatial|spec|support)-"; then
        continue
    fi
    TOTAL=$((TOTAL + 1))

    # Check for frontmatter
    if ! grep -q "^---$" "$agent"; then
        echo "[FAIL] Missing frontmatter: $agent"
        FAILED=$((FAILED + 1))
        continue
    fi

    # Check for name field
    if ! grep -q "^name:" "$agent"; then
        echo "[FAIL] Missing name field: $agent"
        FAILED=$((FAILED + 1))
    fi

    # Check for description field
    if ! grep -q "^description:" "$agent"; then
        echo "[FAIL] Missing description field: $agent"
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "Results: $((TOTAL - FAILED))/$TOTAL agents compliant"
echo "Failed: $FAILED"

if [ $FAILED -eq 0 ]; then
    echo "[PASS] All agents have proper format!"
    exit 0
else
    echo "[FAIL] Some agents have format issues"
    exit 1
fi
