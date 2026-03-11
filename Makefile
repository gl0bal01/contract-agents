.PHONY: help install install-kilo install-claude install-cursor install-goose install-opencode test clean

AGENTS_DIR := agents
DEST_KILO := $(HOME)/.kilo/agents
DEST_CLAUDE := $(HOME)/.claude/agents
DEST_CURSOR := $(PWD)/.cursor/rules
DEST_GOOSE := $(HOME)/.goose/agents
DEST_OPENCODE := $(PWD)/.opencode/agent
AGENT_GLOB := eng-*.md test-*.md design-*.md mkt-*.md prod-*.md pm-*.md game-*.md spatial-*.md spec-*.md support-*.md

help:
	@echo "Contract-Agents Makefile"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  install            Install to all detected tools"
	@echo "  install-kilo       Install to Kilo CLI"
	@echo "  install-claude     Install to Claude Code"
	@echo "  install-cursor     Install to Cursor"
	@echo "  install-goose      Install to Goose"
	@echo "  install-opencode   Install to OpenCode"
	@echo "  test               Run validation tests"
	@echo "  clean              Remove installed agents"

install: install-kilo install-claude install-cursor install-goose install-opencode

install-kilo:
	@mkdir -p $(DEST_KILO)
	@cp $(AGENTS_DIR)/*.md $(DEST_KILO)/ 2>/dev/null || true
	@echo "Installed to Kilo: $(DEST_KILO)"

install-claude:
	@mkdir -p $(DEST_CLAUDE)
	@cp $(AGENTS_DIR)/*.md $(DEST_CLAUDE)/ 2>/dev/null || true
	@echo "Installed to Claude Code: $(DEST_CLAUDE)"

install-cursor:
	@mkdir -p $(DEST_CURSOR)
	@cp $(AGENTS_DIR)/*.md $(DEST_CURSOR)/ 2>/dev/null || true
	@echo "Installed to Cursor: $(DEST_CURSOR)"

install-goose:
	@mkdir -p $(DEST_GOOSE)
	@cp $(AGENTS_DIR)/*.md $(DEST_GOOSE)/ 2>/dev/null || true
	@echo "Installed to Goose: $(DEST_GOOSE)"

install-opencode:
	@mkdir -p $(DEST_OPENCODE)
	@cp $(AGENTS_DIR)/*.md $(DEST_OPENCODE)/ 2>/dev/null || true
	@echo "Installed to OpenCode: $(DEST_OPENCODE)"

test:
	@./tests/contract-test.sh
	@./tests/token-check.sh

clean:
	@for dir in $(DEST_KILO) $(DEST_CLAUDE) $(DEST_CURSOR) $(DEST_GOOSE) $(DEST_OPENCODE); do \
		rm -f $$dir/$(AGENT_GLOB) 2>/dev/null; \
	done
	@echo "Cleaned contract-agents from all install directories"
