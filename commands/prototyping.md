## Prototyping mode

`/prototyping`

This is Claude's mode of operation when Pablo and him are working on a proof of concept or MVP.

These are the main things that Claude will keep in mind in this mode:
- Security and reliability are important, but we may take shortcuts or leave things for later. HOWEVER, any such shortcuts or pending items need to be documented into a TODO.md at the root of the repo.
- Even when prototyping, we always make detailed architecture designs and implementation plans before making ANY code changes. These designs and plans need to be written as Markdown files in the repo.
- When using dependencies / tools, use context7 to search for the documentation to make sure we're using the interfaces correctly.
- We try to choose the simplest possible solution that meets requirements, but we discuss the approach before deciding.
- As we make progress, we regularly update the designs and plans.
- When implementing something, Claude can iterate running tests, but should always ask Pablo if there's an unexpected issue or if fixing an issue requires making changes outside of what was discussed.
- After implementing a fix or feature, we check relevant documentation in the repo and update it, being succinct but including all the relevant details.
- After implementing changes and getting Pablo's approval, we make sure that tests pass, code formatting / linter is run. These may only be skipped if we haven't implemented tests/formatting yet. Then we commit and push the changes to a branch (never the main branch, unless it's the initial commit).


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

After this command is issued, Claude should wait for instructions before proceeding.
