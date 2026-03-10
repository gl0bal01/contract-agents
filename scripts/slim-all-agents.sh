#!/bin/bash
# Slim all agents to black-box style: remove emojis, verbose sections, redundant content

set -e

TARGET="/home/dev/projects/contract-agents"

echo "Slimming agents to black-box style..."
echo ""

# Count before
BEFORE=$(find "$TARGET" -maxdepth 1 -name "*.md" -type f ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" ! -name "TODO.md" | xargs wc -l 2>/dev/null | tail -1 | awk '{print $1}')
echo "Total lines before: $BEFORE"
echo ""

# Function to slim an agent file
slim_agent() {
    local file="$1"

    # Backup
    cp "$file" "$file.bak"

    # Read content
    content=$(cat "$file")

    # Remove emojis from content (common emoji patterns)
    content=$(echo "$content" | sed -E 's/^[[:space:]]*[-*•]+[[:space:]]*[🎭🚀🎯💻📊📢🎨💾🛟🔌🎬🥽🎮🕹️📈📉📋🎨✅❌⚠️📝🔍💡💭🔄📦⚙️🛠️🎁🌐💬📚📖🚨🔒📌🌟⭐💯❤️🔥💎🏆🎉✨📸💻🖥️💾🔎🧠🎪🎢🎭🤖👾📊📈📉🗂️📁🏗️⚡🌟🤝🆔🚀💻🔌📱💡🎯📌📍⭐🌟💫🔥💪🎵🎶🎹🎻🎸🎺🎷🎻🎬🎥📸📹📺🖼️🖌️🎨✏️✒️📝📋📅📆🗓️🔍🔎🧮💰💳💎💱💴💵🔧🔨⚒️🛠️⛏️🔩⚙️🧲💣🧨🧰🧯🛎️🏺🧵🧶🧻🧼🧽🧴🧷🧹🧺🧻🧼🧽🧴🧷🧹🧺🪞🪠🪣🪡🪢][[:space:]]*//g')

    # Remove common verbose sections
    # These sections appear in many agency-agents and should be removed
    content=$(echo "$content" | sed '/^##[[:space:]]*Role Definition$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Core Capabilities$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Specialized Skills$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Decision Framework$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Your Core Mission$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Your Identity[[:space:]]*& Memory$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*What[[:space:]]*Makes This Special$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Your Technical[[:space:]]*Deliverables$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Your Workflow[[:space:]]*Process$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Your Deliverable Template$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Your Communication[[:space:]]*Style$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Learning[[:space:]]*& Memory$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Your Success[[:space:]]*Metrics$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Advanced[[:space:]]*Capabilities$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Available[[:space:]]*Specialist[[:space:]]*Agents$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Critical[[:space:]]*Rules[[:space:]]*You[[:space:]]*Must[[:space:]]*Follow$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Mandatory[[:space:]]*Process$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*Testing[[:space:]]*Methodology$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*On[[:space:]]*Demand$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')
    content=$(echo "$content" | sed '/^##[[:space:]]*What[[:space:]]*This[[:space:]]*Is$/,/^##[[:space:]]*[A-Z]/{ /^##[[:space:]]*[A-Z]/!d; }')

    # Remove "color:" line from frontmatter
    content=$(echo "$content" | sed '/^color:/d')

    # Remove "tools:" line from frontmatter
    content=$(echo "$content" | sed '/^tools:/d')

    # Remove "model:" line from frontmatter (optional - can be useful)
    # content=$(echo "$content" | sed '/^model:/d')

    # Remove emoji-only lines
    content=$(echo "$content" | sed '/^[[:space:]]*##[[:space:]]*[🎭🚀🎯💻📊📢🎨💾🛟🔌🎬🥽🎮🕹️📈📉📋🎨✅❌⚠️📝🔍💡💭🔄📦⚙️🛠️🎁🌐💬📚📖🚨🔒📌🌟⭐💯❤️🔥💎🏆🎉✨📸💻🖥️💾🔎🧠🎪🎢🎭🤖👾📊📈📉🗂️📁🏗️⚡🌟🤝🆔🚀💻🔌📱💡🎯📌📍⭐🌟💫🔥💪🎵🎶🎹🎻🎸🎺🎷🎻🎬🎥📸📹📺🖼️🖌️🎨✏️✒️📝📋📅📆🗓️🔍🔎🧮💰💳💎💱💴💵🔧🔨⚒️🛠️⛏️🔩⚙️🧲💣🧨🧰🧯🛎️🏺🧵🧶🧻🧼🧽🧴🧷🧹🧺🧻🧼🧽🧴🧷🧹🧺🪞🪠🪣🪡🪢][[:space:]]*$/d')

    # Write back
    echo "$content" > "$file"

    # Report
    local lines=$(wc -l < "$file")
    echo "✅ Slimmed: $file ($lines lines)"
}

# Find all agent files and slim them
for file in "$TARGET"/*.md; do
    # Skip non-agent files
    [[ "$(basename "$file")" =~ ^(README|AGENTS_CONTRACT|LICENSE|CHANGELOG|TODO)\.md$ ]] && continue
    [[ "$(basename "$file")" =~ ^template ]] && continue

    slim_agent "$file"
done

# Count after
AFTER=$(find "$TARGET" -maxdepth 1 -name "*.md" -type f ! -name "README.md" ! -name "AGENTS_CONTRACT.md" ! -name "LICENSE" ! -name "CHANGELOG.md" ! -name "TODO.md" | xargs wc -l 2>/dev/null | tail -1 | awk '{print $1}')
echo ""
echo "Total lines after: $AFTER"
echo "Reduction: $(echo "$BEFORE - $AFTER" | bc) lines ($(echo "scale=1; ($BEFORE - $AFTER) * 100 / $BEFORE" | bc)% removed)"

echo ""
echo "⚠️  Backup files saved as *.bak"
echo "Review changes and remove backups when satisfied:"
echo "  find . -name '*.bak' -delete"
