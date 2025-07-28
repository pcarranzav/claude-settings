# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is Pablo's claude-settings repository - a configuration management system for Claude Code that provides custom commands and settings to ensure consistent coding practices across projects.

## Key Commands

### Installation and Setup
```bash
# Install settings to ~/.claude/
./install.sh

# Verify installation
ls -la ~/.claude/
ls -la ~/.claude/commands/
```

### Git Operations
When committing changes to this repository, ensure the installation script remains executable:
```bash
chmod +x install.sh
```

## Architecture

The repository consists of:

1. **home_CLAUDE.md** - The main settings file that gets installed to `~/.claude/CLAUDE.md`. This file references the custom command modes and sets `/coding` as the default mode.

2. **commands/** directory - Contains mode-specific instructions:
   - `coding.md` - Default mode emphasizing security, reliability, and careful planning
   - `debugging.md` - Mode for debugging issues
   - `prototyping.md` - Mode for rapid prototyping
   - `vibing.md` - Mode for casual coding

3. **install.sh** - Installation script that copies files to the appropriate Claude configuration directory (`~/.claude/`)

## Development Guidelines

When modifying this repository:

1. Any changes to command files should maintain the security-first philosophy established in the coding mode
2. The installation script uses `set -e` for error handling - maintain this pattern
3. File paths in the installation script are relative to the repository root
4. The @ syntax in home_CLAUDE.md (e.g., `@./commands/coding.md`) is used to reference command files

## Testing Changes

After making changes:
1. Run the installation script to test it works correctly
2. Verify files are copied to the correct locations
3. Check that Claude properly recognizes the custom commands in a new session