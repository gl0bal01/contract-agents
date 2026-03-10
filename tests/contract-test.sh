#!/bin/bash
# Verify all agents reference the contract

echo "Checking agent contract compliance..."

FAILED=0
TOTAL=0

for agent in $(find /home/dev/projects/contract-agents -name "*.md" -type f -maxdepth 1 ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" | grep -E "^(eng|test|design|mkt|prod|pm|game|spatial|spec|support)-"); do
    TOTAL=$((TOTAL + 1))

    if ! grep -q "AGENTS_CONTRACT" "$agent"; then
        echo "❌ Missing contract reference: $agent"
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "Results: $((TOTAL - FAILED))/$TOTAL agents compliant"
echo "Failed: $FAILED"

if [ $FAILED -eq 0 ]; then
    echo "✅ All agents reference the contract!"
    exit 0
else
    echo "❌ Some agents missing contract reference"
    exit 1
fi
