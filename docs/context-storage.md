# Context Storage for Claude Agents

This document describes the standardized context storage system for Claude agents to maintain persistent knowledge across sessions.

## Default Structure

By default, agents store context in `.claude/context/[agent-name]/` within each repository:

```
.claude/
├── CLAUDE.md          # Repo-specific overrides (optional)
└── context/
    ├── plan-architecture/
    │   ├── patterns.md
    │   ├── decisions.md
    │   └── tech-stack.md
    ├── run-tests/
    │   ├── test-config.md
    │   ├── test-patterns.md
    │   └── coverage-baseline.md
    ├── update-docs/
    │   ├── doc-structure.md
    │   ├── doc-style.md
    │   └── api-inventory.md
    ├── research-dependency/
    │   ├── evaluated-deps.md
    │   ├── rejected-deps.md
    │   └── security-alerts.md
    └── security-review/
        ├── security-patterns.md
        ├── past-vulnerabilities.md
        └── sensitive-areas.md
```

## Benefits

1. **Efficiency**: Agents don't need to rediscover information on every invocation
2. **Consistency**: Maintains institutional knowledge about the codebase
3. **Learning**: Agents improve over time by building on past discoveries
4. **Collaboration**: Agents can share knowledge through these files

## Agent-Specific Context Files

### plan-architecture
- `patterns.md` - Architectural patterns discovered in the codebase
- `decisions.md` - Past architectural decisions and their rationale
- `tech-stack.md` - Current technology stack, constraints, and conventions

### run-tests
- `test-config.md` - Test commands, frameworks, and configurations
- `test-patterns.md` - Test file locations and naming conventions
- `coverage-baseline.md` - Coverage metrics to track improvements

### update-docs
- `doc-structure.md` - Map of documentation files and their purposes
- `doc-style.md` - Documentation conventions and patterns
- `api-inventory.md` - APIs/interfaces requiring documentation

### research-dependency
- `evaluated-deps.md` - Previously researched dependencies with verdicts
- `rejected-deps.md` - Dependencies rejected with reasons
- `security-alerts.md` - Known security issues to watch for

### security-review
- `security-patterns.md` - Security patterns and anti-patterns in the codebase
- `past-vulnerabilities.md` - Previously found issues to prevent regression
- `sensitive-areas.md` - Code areas requiring extra scrutiny

## Repository-Specific Overrides

Projects can customize context storage by adding instructions to their `.claude/CLAUDE.md` file:

```markdown
# Context Storage Configuration

## Custom Location
Store agent context in `docs/.claude-context/` instead of `.claude/context/`

## Additional Context Files
- run-tests: Add `performance-benchmarks.md` for tracking performance tests
- security-review: Add `compliance-requirements.md` for regulatory needs
```

## Best Practices

1. **Check First**: Agents should always check context files before searching
2. **Update Regularly**: Keep context files current with new discoveries
3. **Share Knowledge**: Reference other agents' context when relevant
4. **Respect Privacy**: Don't store sensitive information in context files
5. **Version Control**: Consider whether to commit context files (usually yes for shared knowledge)

## Implementation Notes

When creating context files, agents should:
1. Create directories as needed using appropriate tools
2. Use Markdown format for human readability
3. Include timestamps for time-sensitive information
4. Keep files focused and well-organized
5. Clean up outdated information periodically