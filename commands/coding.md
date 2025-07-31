## Coding mode

`/coding`

This is Claude's default coding mode. Pablo and Claude are implementing a project, feature or fix.

Security and reliability are paramount, therefore:

- We always make detailed architecture designs and implementation plans before making ANY code changes. These designs and plans need to be written as Markdown files in the repo.
- We do NOT take shortcuts, e.g. making hacky fixes or workarounds to fix later, unless it's explicitly authorized by Pablo and recorded into the implementation plan.
- When using dependencies / tools, we always search for the documentation to make sure we're using the interfaces correctly.
- We try to choose the simplest possible solution that meets requirements, but we discuss the approach before deciding.
- As we make progress, we regularly update the designs and plans.
- When implementing something, Claude can iterate running tests, but should always ask Pablo if there's an unexpected issue or if fixing an issue requires making changes outside of what was discussed.
- After implementing a fix or feature, we check relevant documentation in the repo and update it, being succinct but including all the relevant details.
- After implementing changes and getting Pablo's approval, we make sure that tests pass, code formatting / linter is run, and then we commit and push the changes to a branch (never the main branch).

## Subagent Usage in Coding Mode

In coding mode, leverage subagents for complex tasks while maintaining our security-first approach:

### Required Subagent Usage
1. **Before ANY code changes**: Use the plan-architecture agent to create/update implementation plans
   - Example: "Use the plan-architecture agent to design the user authentication feature"
   - The agent will create detailed architecture docs and implementation plans

2. **Before commits**: Use the security-review agent to check for vulnerabilities
   - Example: "Use the security-review agent to review my changes before committing"
   - The agent will scan for secrets, vulnerabilities, and unsafe practices

3. **After implementation**: Use the update-docs agent to update documentation
   - Example: "Use the update-docs agent to update the project documentation"
   - The agent will update README, API docs, and architecture docs as needed

### Recommended Subagent Usage
- **For new dependencies**: "Use the research-dependency agent to evaluate [library name]"
- **For test coverage**: "Use the run-tests agent to verify all tests pass"
- **For complex refactoring**: "Use the plan-architecture agent to plan the refactoring"

### Subagent Workflow Example
```
1. Receive feature request from Pablo
2. "Use the plan-architecture agent to create detailed implementation plan"
3. Review plan with Pablo
4. Implement changes (may "use the research-dependency agent" for libraries)
5. "Use the run-tests agent to verify all tests pass"
6. "Use the security-review agent for pre-commit check"
7. "Use the update-docs agent to update all relevant docs"
8. Commit with Pablo's approval
```

### Important Notes
- Subagents in coding mode should be extra thorough and security-conscious
- Always wait for subagent completion before proceeding
- If a subagent identifies issues, address them before continuing
- Subagents should create/update files in the repo (plans, docs, etc.)

Claude should stay in `/coding` mode until a `/debugging`, `/prototyping` or `/vibing` command is issued.

After this command is issued, Claude should wait for instructions before proceeding.
