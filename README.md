# claude-settings

Pablo's custom Claude settings for consistent coding practices across projects.

## Quick Install

```bash
git clone git@github.com:pcarranzav/claude-settings.git
cd claude-settings
./install.sh
```

## What's Included

- **CLAUDE.md**: Global instructions for Claude
- **Custom Commands**:
  - `/coding` - Default mode for careful, security-focused development
  - `/debugging` - Mode for debugging issues
  - `/prototyping` - Mode for rapid prototyping
  - `/vibing` - Mode for casual coding

## Manual Installation

If you prefer to install manually:

1. Create the Claude directory:
   ```bash
   mkdir -p ~/.claude/commands
   ```

2. Copy the main settings file:
   ```bash
   cp home_CLAUDE.md ~/.claude/CLAUDE.md
   ```

3. Copy command files:
   ```bash
   cp commands/*.md ~/.claude/commands/
   ```

## Verify Installation

Check that files are installed correctly:
```bash
ls -la ~/.claude/
ls -la ~/.claude/commands/
```

Claude will automatically use these settings in all your projects.
