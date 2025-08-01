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

echo -e "${BLUE}Installing Claude custom settings...${NC}"

# Create directories if they don't exist
echo "Creating directories..."
mkdir -p "$COMMANDS_DIR"

# Copy CLAUDE.md
echo "Installing CLAUDE.md..."
cp home_CLAUDE.md "$CLAUDE_DIR/CLAUDE.md"

# Copy command files
echo "Installing command files..."
cp commands/*.md "$COMMANDS_DIR/"

# Verify installation
echo -e "\n${GREEN}Installation complete!${NC}"
echo -e "Installed files:"
echo -e "  - $CLAUDE_DIR/CLAUDE.md"
for cmd in commands/*.md; do
    echo -e "  - $COMMANDS_DIR/$(basename "$cmd")"
done

echo -e "\n${GREEN}Claude will now use your custom settings and commands.${NC}"