.PHONY: help install install-kilo install-claude install-cursor install-goose install-opencode test clean

AGENTS_DIR := agents

# Scope: global (default) installs user-wide; local installs into a project
SCOPE ?= global

# Local path: defaults to current directory when SCOPE=local
LOCAL_PATH ?= $(PWD)

# Division filter: when set, installs only <DIVISION>-*.md agents
# (AGENTS_CONTRACT.md and contract-orchestrator.md are always included)
DIVISION ?=

# Destinations per scope
ifeq ($(SCOPE),global)
  DEST_KILO := $(HOME)/.kilo/agents
  DEST_CLAUDE := $(HOME)/.claude/agents
  DEST_CURSOR := $(HOME)/.cursor/rules
  DEST_GOOSE := $(HOME)/.goose/agents
  DEST_OPENCODE := $(HOME)/.config/opencode/agent
else ifeq ($(SCOPE),local)
  DEST_KILO := $(LOCAL_PATH)/.kilo/agents
  DEST_CLAUDE := $(LOCAL_PATH)/.claude/agents
  DEST_CURSOR := $(LOCAL_PATH)/.cursor/rules
  DEST_GOOSE := $(LOCAL_PATH)/.goose/agents
  DEST_OPENCODE := $(LOCAL_PATH)/.opencode/agent
else
  $(error SCOPE must be 'global' or 'local', got '$(SCOPE)')
endif

# Source file set: either all .md or contract + orchestrator + one division
ifeq ($(DIVISION),)
  FILES := $(AGENTS_DIR)/*.md
else
  FILES := $(AGENTS_DIR)/AGENTS_CONTRACT.md $(AGENTS_DIR)/contract-orchestrator.md $(AGENTS_DIR)/$(DIVISION)-*.md
endif

# Clean target glob — current divisions only (post-v3.0)
AGENT_GLOB := eng-*.md test-*.md design-*.md mkt-*.md prod-*.md pm-*.md game-*.md spec-*.md

help:
	@echo "Contract-Agents Makefile"
	@echo ""
	@echo "Usage: make <target> [SCOPE=<global|local>] [LOCAL_PATH=<path>] [DIVISION=<prefix>]"
	@echo ""
	@echo "Targets:"
	@echo "  install            Install to all supported tools"
	@echo "  install-kilo       Install to Kilo CLI"
	@echo "  install-claude     Install to Claude Code"
	@echo "  install-cursor     Install to Cursor"
	@echo "  install-goose      Install to Goose"
	@echo "  install-opencode   Install to OpenCode"
	@echo "  test               Run validation tests"
	@echo "  clean              Remove installed agents"
	@echo ""
	@echo "Options:"
	@echo "  SCOPE=global       (default) Install to user-wide tool directories"
	@echo "  SCOPE=local        Install to LOCAL_PATH/.{tool}/..."
	@echo "  LOCAL_PATH=~/proj  (default \$$PWD) Target when SCOPE=local"
	@echo "  DIVISION=eng       Install only <prefix>-*.md plus contract + orchestrator"
	@echo ""
	@echo "Examples:"
	@echo "  make install"
	@echo "  make install SCOPE=local LOCAL_PATH=~/myapp"
	@echo "  make install-claude DIVISION=eng"
	@echo "  make install-claude SCOPE=local DIVISION=mkt"

install: install-kilo install-claude install-cursor install-goose install-opencode

install-kilo:
	@mkdir -p $(DEST_KILO)
	@cp $(FILES) $(DEST_KILO)/ 2>/dev/null || true
	@echo "Installed to Kilo [$(SCOPE)]: $(DEST_KILO)"

install-claude:
	@mkdir -p $(DEST_CLAUDE)
	@cp $(FILES) $(DEST_CLAUDE)/ 2>/dev/null || true
	@echo "Installed to Claude Code [$(SCOPE)]: $(DEST_CLAUDE)"

install-cursor:
	@mkdir -p $(DEST_CURSOR)
	@cp $(FILES) $(DEST_CURSOR)/ 2>/dev/null || true
	@echo "Installed to Cursor [$(SCOPE)]: $(DEST_CURSOR)"

install-goose:
	@mkdir -p $(DEST_GOOSE)
	@cp $(FILES) $(DEST_GOOSE)/ 2>/dev/null || true
	@echo "Installed to Goose [$(SCOPE)]: $(DEST_GOOSE)"

install-opencode:
	@mkdir -p $(DEST_OPENCODE)
	@cp $(FILES) $(DEST_OPENCODE)/ 2>/dev/null || true
	@echo "Installed to OpenCode [$(SCOPE)]: $(DEST_OPENCODE)"

test:
	@./tests/contract-test.sh
	@./tests/token-check.sh

clean:
	@for dir in $(DEST_KILO) $(DEST_CLAUDE) $(DEST_CURSOR) $(DEST_GOOSE) $(DEST_OPENCODE); do \
		rm -f $$dir/$(AGENT_GLOB) 2>/dev/null; \
	done
	@echo "Cleaned contract-agents from all install directories"
