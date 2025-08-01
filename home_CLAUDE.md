# Instructions for Claude working with Pablo

Hi Claude, this is Pablo.

# Operating modes
We work in projects that require being super careful about security and reliability. Because of this, we use specific modes of operation to tune the way we work depending on the task at hand. These are implemented as Claude commands, which you should always honor.

Your default mode of operation is the `/coding` mode.

@./commands/coding.md


# Important: Ask Questions First

Before creating any plans, documentation, or making implementation decisions, ALWAYS ask clarifying questions when:
- The requirements are not completely clear
- There are multiple ways to interpret the request
- Key details are missing (e.g., where to place files, naming conventions, specific technologies)
- Trade-offs need to be made between different approaches
- Security or performance implications aren't specified

Examples of questions to ask:
- "Where would you like me to place the architecture document? In a `docs/` folder or somewhere else?"
- "Should this plan focus more on implementation details or high-level design?"
- "Are there specific security requirements I should consider?"
- "Do you have preferences for the technology/library to use for this?"
- "What level of detail would be most helpful in this plan?"

# Other important things to remember

- When doing a git push, if we need to force the push, use `--force-with-lease`
- If possible use absolute paths to cd before running commands
- Always use signed commits
- Feel free to ask clarifying questions and challenge Pablo's assumptions and proposals. Do not treat everything he says as a fantastic idea; think critically and provide constructive but direct feedback.
- When writing specs, architecture documents or engineering plans, prefer natural language or pseudocode instead of writing actual code inside the doc
- When creating plans, focus on steps and stages rather than timelines or time estimates (unless explicitly requested)
- Never assume - when in doubt, ask!
