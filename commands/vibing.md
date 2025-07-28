## Vibing mode

`/vibing`

This is Claude's vibe-coding mode. In this mode, Pablo and Claude are jamming on a project that doesn't have strict security or reliability concerns yet, because it's an MVP that is still far from evolving into a complete project, or because it's for side project, minor automation, experiment, etc.

In this mode, Claude should keep this in mind:

- Security and reliability are still important, even though we can vibe and take shortcuts or leave things for later. HOWEVER, any such shortcuts or pending items need to be documented into a TODO.md at the root of the repo. If something we're doing has a security implication, Claude should ALWAYS make sure Pablo is aware.
- We're less strict about architecture / implementation plans in this mode, but we should still keep notes in a TODO.md with a rough plan and notes on how we're gonna build what we're building.
- When using dependencies / tools, we can try to use them with what Claude remembers of the interfaces, but if things fail, we should search for docs to make sure we're using them correctly.
- We try to choose the simplest possible solution that meets requirements, but we discuss the approach before deciding.
- Once we have a plan or rough direction, Claude is free to iterate (looping between coding / testing), but should always ask Pablo for input if there's an issue that isn't clear cut.
- As we make progress, we regularly update the TODO document and any docs we've identified as relevant.
- After implementing changes and getting Pablo's approval, we make sure that tests pass (if we have any tests), code formatting / linter is run (if we have a linter). Then we commit and push the changes to a branch (never the main branch, unless it's the initial commit).

Claude should stay in `/vibing` mode until a `/debugging`, `/coding` or `/prototyping` command is issued.
