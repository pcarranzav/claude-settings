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
ls -la ~/.claude/agents/
ls -la ~/.claude/docs/
```

### Git Operations
When committing changes to this repository, ensure the installation script remains executable:
```bash
chmod +x install.sh
```

## Architecture

The repository consists of:

1. **home_CLAUDE.md** - The main settings file that gets installed to `~/.claude/CLAUDE.md`. This file references the custom command modes, sets `/coding` as the default mode, and integrates the subagent system.

2. **commands/** directory - Contains mode-specific instructions:
   - `coding.md` - Default mode emphasizing security, reliability, and careful planning
   - `debugging.md` - Mode for debugging issues
   - `prototyping.md` - Mode for rapid prototyping
   - `vibing.md` - Mode for casual coding
   
3. **agents/** directory - Contains specialized subagent definitions:
   - `plan-architecture.md` - Architecture and planning specialist
   - `security-review.md` - Security vulnerability scanner
   - `run-tests.md` - Test discovery and execution
   - `update-docs.md` - Documentation maintenance
   - `research-dependency.md` - Library research and evaluation

4. **docs/** directory - Contains documentation:
   - `context-storage.md` - Explains the persistent context storage system for agents

5. **install.sh** - Installation script that copies files to the appropriate Claude configuration directories (`~/.claude/`, `~/.claude/commands/`, `~/.claude/agents/`, `~/.claude/docs/`)

## Development Guidelines

When modifying this repository:

1. Any changes to command files should maintain the security-first philosophy established in the coding mode
2. The installation script uses `set -e` for error handling - maintain this pattern
3. File paths in the installation script are relative to the repository root
4. The @ syntax in home_CLAUDE.md (e.g., `@./commands/coding.md`) is used to reference command files
5. Subagents follow the Claude Code subagent format with YAML frontmatter containing name, description, and tools
6. Agent context storage paths follow the pattern `.claude/context/[agent-name]/`
7. All agents should include context storage and collaboration sections

## Testing Changes

After making changes:
1. Run the installation script to test it works correctly
2. Verify files are copied to the correct locations
3. Check that Claude properly recognizes the custom commands in a new session
4. Test subagent invocation with commands like "Use the plan-architecture agent to design a feature"
5. Verify agents can create and read context storage files

## Key Features

### Operating Modes
The system uses persistent operating modes that shape Claude's behavior throughout a session:
- `/coding` (default) - Security-first development with comprehensive planning
- `/debugging` - Systematic issue investigation and fix planning  
- `/prototyping` - Rapid development with documented shortcuts
- `/vibing` - Casual coding with minimal constraints

### Subagent Integration
Specialized agents handle complex tasks while respecting the current mode's constraints:
- Agents inherit mode philosophy (stricter in coding, looser in vibing)
- Can be invoked explicitly or through automatic delegation
- Maintain persistent context to improve over time
- Collaborate by referencing each other when appropriate

### Context Storage
Agents store knowledge in `.claude/context/[agent-name]/` for efficiency and consistency across sessions. Projects can customize this via their own `.claude/CLAUDE.md` file.