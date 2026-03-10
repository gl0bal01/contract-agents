#!/bin/bash
# Migrate agents from agency-agents to contract-agents with new naming convention

set -e

SOURCE="/home/dev/projects/agency-agents"
TARGET="/home/dev/projects/contract-agents"

echo "Starting agent migration..."
echo "Source: $SOURCE"
echo "Target: $TARGET"
echo ""

MIGRATED=0
SKIPPED=0

# Define migration function
migrate_agent() {
    local old_path="$1"
    local new_name="$2"
    local source_file="$SOURCE/$old_path"
    local target_file="$TARGET/$new_name"

    if [ -f "$source_file" ]; then
        # Read source content
        content=$(cat "$source_file")

        # Update contract reference if present (from ../AGENTS_CONTRACT.md to AGENTS_CONTRACT.md)
        content="${content//\[AGENTS_CONTRACT.md\](..\/AGENTS_CONTRACT.md)/[AGENTS_CONTRACT.md](AGENTS_CONTRACT.md)}"

        # Write to target
        echo "$content" > "$target_file"

        echo "✅ Migrated: $old_path → $new_name"
        MIGRATED=$((MIGRATED + 1))
    else
        echo "⚠️  Skipped (not found): $old_path"
        SKIPPED=$((SKIPPED + 1))
    fi
}

# Engineering agents
migrate_agent "engineering/engineering-frontend-developer.md" "eng-frontend-developer.md"
migrate_agent "engineering/engineering-backend-architect.md" "eng-backend-architect.md"
migrate_agent "engineering/engineering-ai-engineer.md" "eng-ai-engineer.md"
migrate_agent "engineering/engineering-devops-automator.md" "eng-devops-automator.md"
migrate_agent "engineering/engineering-mobile-app-builder.md" "eng-mobile-app-builder.md"
migrate_agent "engineering/engineering-rapid-prototyper.md" "eng-rapid-prototyper.md"
migrate_agent "engineering/engineering-security-engineer.md" "eng-security-engineer.md"
migrate_agent "engineering/engineering-senior-developer.md" "eng-senior-developer.md"
migrate_agent "engineering/engineering-data-engineer.md" "eng-data-engineer.md"
migrate_agent "engineering/engineering-embedded-firmware-engineer.md" "eng-embedded-firmware-engineer.md"
migrate_agent "engineering/engineering-incident-response-commander.md" "eng-incident-commander.md"
migrate_agent "engineering/engineering-solidity-smart-contract-engineer.md" "eng-solidity-engineer.md"
migrate_agent "engineering/engineering-technical-writer.md" "eng-technical-writer.md"
migrate_agent "engineering/engineering-threat-detection-engineer.md" "eng-threat-detection-engineer.md"
migrate_agent "engineering/engineering-wechat-mini-program-developer.md" "eng-wechat-developer.md"
migrate_agent "engineering/engineering-autonomous-optimization-architect.md" "eng-optimization-architect.md"

# Testing agents
migrate_agent "testing/testing-evidence-collector.md" "test-evidence-collector.md"
migrate_agent "testing/testing-reality-checker.md" "test-reality-checker.md"
migrate_agent "testing/testing-accessibility-auditor.md" "test-accessibility-auditor.md"
migrate_agent "testing/testing-api-tester.md" "test-api-tester.md"
migrate_agent "testing/testing-performance-benchmarker.md" "test-performance-benchmarker.md"
migrate_agent "testing/testing-test-results-analyzer.md" "test-results-analyzer.md"
migrate_agent "testing/testing-tool-evaluator.md" "test-tool-evaluator.md"
migrate_agent "testing/testing-workflow-optimizer.md" "test-workflow-optimizer.md"

# Design agents
migrate_agent "design/design-brand-guardian.md" "design-brand-guardian.md"
migrate_agent "design/design-ui-designer.md" "design-ui-designer.md"
migrate_agent "design/design-ux-architect.md" "design-ux-architect.md"
migrate_agent "design/design-ux-researcher.md" "design-ux-researcher.md"
migrate_agent "design/design-visual-storyteller.md" "design-visual-storyteller.md"
migrate_agent "design/design-whimsy-injector.md" "design-whimsy-injector.md"
migrate_agent "design/design-image-prompt-engineer.md" "design-image-prompt-engineer.md"
migrate_agent "design/design-inclusive-visuals-specialist.md" "design-inclusive-visuals-specialist.md"

# Marketing agents (shorten names where appropriate)
migrate_agent "marketing/marketing-growth-hacker.md" "mkt-growth-hacker.md"
migrate_agent "marketing/marketing-content-creator.md" "mkt-content-creator.md"
migrate_agent "marketing/marketing-twitter-engager.md" "mkt-twitter-engager.md"
migrate_agent "marketing/marketing-tiktok-strategist.md" "mkt-tiktok-strategist.md"
migrate_agent "marketing/marketing-instagram-curator.md" "mkt-instagram-curator.md"
migrate_agent "marketing/marketing-reddit-community-builder.md" "mkt-reddit-builder.md"
migrate_agent "marketing/marketing-app-store-optimizer.md" "mkt-app-store-optimizer.md"
migrate_agent "marketing/marketing-social-media-strategist.md" "mkt-social-strategist.md"
migrate_agent "marketing/marketing-xiaohongshu-specialist.md" "mkt-xiaohongshu-specialist.md"
migrate_agent "marketing/marketing-wechat-official-account.md" "mkt-wechat-account.md"
migrate_agent "marketing/marketing-zhihu-strategist.md" "mkt-zhihu-strategist.md"
migrate_agent "marketing/marketing-baidu-seo-specialist.md" "mkt-baidu-seo.md"
migrate_agent "marketing/marketing-bilibili-content-strategist.md" "mkt-bilibili-strategist.md"
migrate_agent "marketing/marketing-kuaishou-strategist.md" "mkt-kuaishou-strategist.md"
migrate_agent "marketing/marketing-seo-specialist.md" "mkt-seo-strategist.md"

# Product agents
migrate_agent "product/product-sprint-prioritizer.md" "prod-sprint-prioritizer.md"
migrate_agent "product/product-trend-researcher.md" "prod-trend-researcher.md"
migrate_agent "product/product-feedback-synthesizer.md" "prod-feedback-synthesizer.md"
migrate_agent "product/product-behavioral-nudge-engine.md" "prod-nudge-engine.md"

# Project Management agents
migrate_agent "project-management/project-management-studio-producer.md" "pm-studio-producer.md"
migrate_agent "project-management/project-management-project-shepherd.md" "pm-project-shepherd.md"
migrate_agent "project-management/project-management-studio-operations.md" "pm-studio-operations.md"
migrate_agent "project-management/project-management-experiment-tracker.md" "pm-experiment-tracker.md"
migrate_agent "project-management/project-manager-senior.md" "pm-senior.md"
migrate_agent "project-management/project-management-jira-workflow-steward.md" "pm-jira-steward.md"

# Game Development - Unity
migrate_agent "game-development/unity/unity-architect.md" "game-unity-architect.md"
migrate_agent "game-development/unity/unity-shader-graph-artist.md" "game-unity-shader.md"
migrate_agent "game-development/unity/unity-editor-tool-developer.md" "game-unity-tool-dev.md"
migrate_agent "game-development/unity/unity-multiplayer-engineer.md" "game-unity-multiplayer.md"

# Game Development - Unreal
migrate_agent "game-development/unreal-engine/unreal-systems-engineer.md" "game-unreal-engineer.md"
migrate_agent "game-development/unreal-engine/unreal-technical-artist.md" "game-unreal-artist.md"
migrate_agent "game-development/unreal-engine/unreal-multiplayer-architect.md" "game-unreal-multiplayer.md"
migrate_agent "game-development/unreal-engine/unreal-world-builder.md" "game-unreal-builder.md"

# Game Development - Godot
migrate_agent "game-development/godot/godot-gameplay-scripter.md" "game-godot-scripter.md"
migrate_agent "game-development/godot/godot-multiplayer-engineer.md" "game-godot-multiplayer.md"
migrate_agent "game-development/godot/godot-shader-developer.md" "game-godot-shader.md"

# Game Development - Roblox
migrate_agent "game-development/roblox-studio/roblox-systems-scripter.md" "game-roblox-scripter.md"
migrate_agent "game-development/roblox-studio/roblox-experience-designer.md" "game-roblox-designer.md"
migrate_agent "game-development/roblox-studio/roblox-avatar-creator.md" "game-roblox-avatar.md"

# Game Development - Cross-engine
migrate_agent "game-development/game-designer.md" "game-designer.md"
migrate_agent "game-development/level-designer.md" "game-level-designer.md"
migrate_agent "game-development/technical-artist.md" "game-technical-artist.md"
migrate_agent "game-development/game-audio-engineer.md" "game-audio-engineer.md"
migrate_agent "game-development/narrative-designer.md" "game-narrative-designer.md"

# Spatial Computing
migrate_agent "spatial-computing/xr-interface-architect.md" "spatial-xr-interface.md"
migrate_agent "spatial-computing/macos-spatial-metal-engineer.md" "spatial-metal-engineer.md"
migrate_agent "spatial-computing/xr-immersive-developer.md" "spatial-xr-dev.md"
migrate_agent "spatial-computing/xr-cockpit-interaction-specialist.md" "spatial-cockpit.md"
migrate_agent "spatial-computing/terminal-integration-specialist.md" "spatial-terminal.md"
migrate_agent "spatial-computing/visionos-spatial-engineer.md" "spatial-visionos.md"

# Specialized agents
migrate_agent "specialized/agents-orchestrator.md" "spec-orchestrator.md"
migrate_agent "specialized/lsp-index-engineer.md" "spec-lsp-engineer.md"
migrate_agent "specialized/data-analytics-reporter.md" "spec-analytics-reporter.md"
migrate_agent "specialized/data-consolidation-agent.md" "spec-data-consolidation.md"
migrate_agent "specialized/report-distribution-agent.md" "spec-report-distribution.md"
migrate_agent "specialized/sales-data-extraction-agent.md" "spec-sales-extraction.md"
migrate_agent "specialized/agentic-identity-trust.md" "spec-identity-trust.md"
migrate_agent "specialized/identity-graph-operator.md" "spec-identity-operator.md"
migrate_agent "specialized/specialized-cultural-intelligence-strategist.md" "spec-cultural-strategist.md"
migrate_agent "specialized/specialized-developer-advocate.md" "spec-dev-advocate.md"
migrate_agent "specialized/specialized-model-qa.md" "spec-model-qa.md"
migrate_agent "specialized/blockchain-security-auditor.md" "spec-blockchain-auditor.md"
migrate_agent "specialized/compliance-auditor.md" "spec-compliance-auditor.md"

# Support agents
migrate_agent "support/support-support-responder.md" "support-responder.md"
migrate_agent "support/support-analytics-reporter.md" "support-analytics.md"
migrate_agent "support/support-finance-tracker.md" "support-finance.md"
migrate_agent "support/support-infrastructure-maintainer.md" "support-infrastructure.md"
migrate_agent "support/support-legal-compliance-checker.md" "support-legal.md"
migrate_agent "support/support-executive-summary-generator.md" "support-executive-summary.md"

echo ""
echo "Migration complete!"
echo "Migrated: $MIGRATED agents"
echo "Skipped: $SKIPPED agents"
echo ""
echo "Files in target:"
ls -1 "$TARGET"/*.md 2>/dev/null | wc -l
