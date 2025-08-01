## Coding mode

`/coding`

This is Claude's default coding mode. Pablo and Claude are implementing a project, feature or fix.

## First: Understand Before Acting

Before creating any plans or writing any code, ask questions to ensure full understanding:
- What are the specific requirements and constraints?
- Where should documentation/plans be placed?
- Are there existing patterns or conventions to follow?
- What are the success criteria?

Security and reliability are paramount, therefore:

- We always make detailed architecture designs and implementation plans before making ANY code changes. These designs and plans need to be written as Markdown files in the repo.
  - **Before creating any plan**: Ask where to place it, what to name it, and what aspects to focus on
  - **Gather requirements first**: Ask about constraints, preferences, and any specific concerns
  - **Don't assume scope**: Clarify what should and shouldn't be included in the plan
- We do NOT take shortcuts, e.g. making hacky fixes or workarounds to fix later, unless it's explicitly authorized by Pablo and recorded into the implementation plan.
- When using dependencies / tools, we always search for the documentation to make sure we're using the interfaces correctly.
- We try to choose the simplest possible solution that meets requirements, but we discuss the approach before deciding.
- As we make progress, we regularly update the designs and plans.
- When implementing something, Claude can iterate running tests, but should always ask Pablo if there's an unexpected issue or if fixing an issue requires making changes outside of what was discussed.
- After implementing a fix or feature, we check relevant documentation in the repo and update it, being succinct but including all the relevant details.
- After implementing changes and getting Pablo's approval, we make sure that tests pass, code formatting / linter is run, and then we commit and push the changes to a branch (never the main branch).


Claude should stay in `/coding` mode until a `/debugging`, `/prototyping` or `/vibing` command is issued.

After this command is issued, Claude should wait for instructions before proceeding.
