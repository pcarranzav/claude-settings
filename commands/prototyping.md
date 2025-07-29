## Prototyping mode

`/prototyping`

This is Claude's mode of operation when Pablo and him are working on a proof of concept or MVP.

These are the main things that Claude will keep in mind in this mode:
- Security and reliability are important, but we may take shortcuts or leave things for later. HOWEVER, any such shortcuts or pending items need to be documented into a TODO.md at the root of the repo.
- Even when prototyping, we always make detailed architecture designs and implementation plans before making ANY code changes. These designs and plans need to be written as Markdown files in the repo.
- When using dependencies / tools, we always search for the documentation to make sure we're using the interfaces correctly.
- We try to choose the simplest possible solution that meets requirements, but we discuss the approach before deciding.
- As we make progress, we regularly update the designs and plans.
- When implementing something, Claude can iterate running tests, but should always ask Pablo if there's an unexpected issue or if fixing an issue requires making changes outside of what was discussed.
- After implementing a fix or feature, we check relevant documentation in the repo and update it, being succinct but including all the relevant details.
- After implementing changes and getting Pablo's approval, we make sure that tests pass, code formatting / linter is run. These may only be skipped if we haven't implemented tests/formatting yet. Then we commit and push the changes to a branch (never the main branch, unless it's the initial commit).

## Subagent Usage in Prototyping Mode

In prototyping mode, subagents help balance speed with necessary planning and documentation:

### Planning & Architecture  
1. **MVP Planning**: "Use the plan-architecture agent to create a quick MVP plan focusing on core functionality"
2. **Lightweight Design**: "Use the plan-architecture agent to design [component] with minimal complexity"

### Implementation Support
1. **Quick Library Check**: "Use the research-dependency agent to find a simple solution for [functionality]"
2. **Documentation**: "Use the update-docs agent to maintain TODO.md with shortcuts taken"

### Prototyping Workflow with Subagents
```
1. Receive prototype/MVP request from Pablo
2. "Use the plan-architecture agent to create a rapid MVP plan"
3. Review approach with Pablo
4. During implementation:
   - "Use the research-dependency agent for quick library evaluation"
   - Update TODO.md manually or with update-docs agent
5. Before commit, ensure TODO.md documents all shortcuts
6. If tests exist: "Use the run-tests agent to run basic tests"
```

### Prototyping-Specific Guidelines
- Subagents should flag critical security issues even in prototype mode
- Documentation can be lighter but must capture all deferred work
- Subagents should prioritize "good enough" solutions
- Always document upgrade paths in TODO.md

### TODO.md Structure Example
```markdown
# TODO - Technical Debt and Future Work

## High Priority (Security/Reliability)
- [ ] Add input validation to user forms
- [ ] Implement proper error handling in API client

## Medium Priority (Performance/Scale)  
- [ ] Replace naive search with proper indexing
- [ ] Add caching layer

## Low Priority (Nice to Have)
- [ ] Add comprehensive logging
- [ ] Improve UI polish
```

Claude should stay in `/prototyping` mode until a `/debugging`, `/coding` or `/vibing` command is issued.