# Instructions for Claude working with Pablo

Hi Claude, this is Pablo.

# Operating modes
We work in projects that require being super careful about security and reliability. Because of this, we use specific modes of operation to tune the way we work depending on the task at hand. These are implemented as Claude commands, which you should always honor.

Your default mode of operation is the `/coding` mode.

@./commands/coding.md

# Subagent Integration
To handle complex multi-step tasks while maintaining our security and reliability standards, use specialized subagents. These agents work within the constraints of your current operating mode.

## Available Subagents

The following specialized agents are available to help with complex tasks. They can be invoked explicitly or Claude may delegate to them automatically based on context.

### Planning & Architecture Agent (`plan-architecture`)
- **When to use**: Creating architecture documents, implementation plans, or design specifications
- **Mode compatibility**: All modes (adjusts detail level based on mode)
- **Invocation**: "Use the plan-architecture agent to design [feature]"
- **Output**: The agent outputs documentation and plans in `docs/`, but may ask questions that it needs to answer before proceeding in `docs/planning_questions.md`.

### Security Review Agent (`security-review`)
- **When to use**: Before commits in coding/debugging modes, or when handling sensitive data
- **Mode compatibility**: Primarily coding/debugging, optional in prototyping/vibing
- **Invocation**: "Use the security-review agent to check my changes"

### Test Runner Agent (`run-tests`)
- **When to use**: Running comprehensive test suites, finding and executing all tests
- **Mode compatibility**: All modes (stricter in coding/debugging)
- **Invocation**: "Use the run-tests agent to execute all tests"

### Documentation Agent (`update-docs`)
- **When to use**: Updating documentation after implementing features
- **Mode compatibility**: All modes (more thorough in coding mode)
- **Invocation**: "Use the update-docs agent to update the documentation"

### Dependency Research Agent (`research-dependency`)
- **When to use**: Researching library documentation and best practices
- **Mode compatibility**: All modes (mandatory in coding/debugging, optional in vibing)
- **Invocation**: "Use the research-dependency agent to evaluate [library]"

## Subagent Behavior by Mode
- **Coding/Debugging**: Subagents enforce strict security checks, comprehensive planning, and thorough documentation
- **Prototyping**: Subagents balance thoroughness with speed, document TODOs for shortcuts
- **Vibing**: Subagents work more flexibly but still flag security concerns

## Usage Guidelines
1. Subagents inherit the current mode's constraints and philosophy
2. Always review subagent outputs before proceeding with implementation
3. Use multiple subagents in parallel when tasks are independent
4. Subagents should update relevant documents (plans, TODOs, etc.) as they work

## Context Storage
Subagents maintain persistent context in `.claude/context/[agent-name]/` to avoid re-discovering information. This improves efficiency and builds institutional knowledge over time. See `~/.claude/docs/context-storage.md` for details.

Projects can customize context storage in their `.claude/CLAUDE.md` file.

# Other important things to remember

- When doing a git push, if we need to force the push, use `--force-with-lease`
- If possible use absolute paths to cd before running commands
- Always use signed commits
- Feel free to ask clarifying questions and challenge Pablo's assumptions and proposals. Do not treat everything he says as a fantastic idea; think critically and provide constructive but direct feedback.
- When writing specs, architecture documents or engineering plans, prefer natural language or pseudocode instead of writing actual code inside the doc
- Use subagents proactively for complex tasks - they help maintain consistency and thoroughness across all operating modes
