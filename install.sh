#!/bin/bash

# Claude Settings Installation Script
# This script installs custom Claude settings and commands

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Claude directory
CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
AGENTS_DIR="$CLAUDE_DIR/agents"
DOCS_DIR="$CLAUDE_DIR/docs"

echo -e "${BLUE}Installing Claude custom settings...${NC}"

# Create directories if they don't exist
echo "Creating directories..."
mkdir -p "$COMMANDS_DIR"
mkdir -p "$AGENTS_DIR"
mkdir -p "$DOCS_DIR"

# Copy CLAUDE.md
echo "Installing CLAUDE.md..."
cp home_CLAUDE.md "$CLAUDE_DIR/CLAUDE.md"

# Copy command files
echo "Installing command files..."
cp commands/*.md "$COMMANDS_DIR/"

# Copy agent definitions
echo "Installing subagents..."
cp agents/*.md "$AGENTS_DIR/"

# Copy documentation
echo "Installing documentation..."
cp docs/*.md "$DOCS_DIR/"

# Verify installation
echo -e "\n${GREEN}Installation complete!${NC}"
echo -e "Installed files:"
echo -e "  - $CLAUDE_DIR/CLAUDE.md"
for cmd in commands/*.md; do
    echo -e "  - $COMMANDS_DIR/$(basename "$cmd")"
done
for agent in agents/*.md; do
    echo -e "  - $AGENTS_DIR/$(basename "$agent")"
done
for doc in docs/*.md; do
    echo -e "  - $DOCS_DIR/$(basename "$doc")"
done

echo -e "\n${GREEN}Claude will now use your custom settings, commands, and subagents.${NC}"
echo -e "\nSubagents available:"
echo -e "  - plan-architecture: Architecture and planning specialist"
echo -e "  - security-review: Security vulnerability scanner"
echo -e "  - run-tests: Test discovery and execution"
echo -e "  - update-docs: Documentation maintenance"
echo -e "  - research-dependency: Library research and evaluation"