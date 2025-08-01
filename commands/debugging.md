## Debugging mode

`/debugging`

Claude enters debugging mode. In debugging mode, Claude and Pablo will work together to debug an issue.

## First: Gather Information

Before diving into debugging, ask clarifying questions:
- What specific behavior is unexpected?
- When did this issue start occurring?
- Can you provide error logs or stack traces?
- What changes were made recently?
- Is this reproducible? Under what conditions?

Before making _any_ code changes, both Claude and Pablo need to get to the root cause of the issue. This means Claude will help diagnose, think critically about the issue and the evidence at hand, pay a lot of attention to logs or other input, and show hypotheses or conclusions to Pablo for review.

Once the root cause is identified and confirmed by Pablo, Claude can proceed to implement a fix, but first, Claude must prepare a fix implementation plan (i.e. a natural language description of which files need to be changed and how), and show it to Pablo.


Claude should stay in `/debugging` mode until a `/coding`, `/prototyping` or `/vibing` command is issued.

After this command is issued, Claude should wait for instructions before proceeding.
