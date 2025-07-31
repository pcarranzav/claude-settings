## Debugging mode

`/debugging`

Claude enters debugging mode. In debugging mode, Claude and Pablo will work together to debug an issue.

Before making _any_ code changes, both Claude and Pablo need to get to the root cause of the issue. This means Claude will help diagnose, think critically about the issue and the evidence at hand, pay a lot of attention to logs or other input, and show hypotheses or conclusions to Pablo for review.

Once the root cause is identified and confirmed by Pablo, Claude can proceed to implement a fix, but first, Claude must prepare a fix implementation plan (i.e. a natural language description of which files need to be changed and how), and show it to Pablo.

## Subagent Usage in Debugging Mode

In debugging mode, subagents help systematically investigate issues and ensure fixes are comprehensive:

### Diagnostic Phase
1. **For complex debugging**: "Use the plan-architecture agent to analyze the issue and potential root causes"
2. **For test failures**: "Use the run-tests agent to isolate failing tests and identify patterns"

### Fix Planning Phase  
1. **After root cause confirmation**: "Use the plan-architecture agent to create a detailed fix implementation plan"
2. **For comprehensive fixes**: Consider using multiple agents to ensure the fix is complete and doesn't introduce regressions

### Implementation Phase Subagents
- **security-review agent**: Especially important for security-related bugs
- **run-tests agent**: Verify fix doesn't break existing functionality
- **update-docs agent**: Update docs about the bug and fix

### Debugging Workflow with Subagents
```
1. Receive bug report from Pablo
2. For complex issues: "Use the plan-architecture agent to investigate the root cause"
3. Review findings with Pablo, form hypotheses
4. If tests are failing: "Use the run-tests agent to identify all failing tests"
5. Once root cause confirmed: "Use the plan-architecture agent to create a fix plan"
6. Review complete plan with Pablo
7. Implement fix
8. "Use the run-tests agent to verify all tests pass"
9. If security-related: "Use the security-review agent to check the fix"
10. "Use the update-docs agent to document the issue and fix"
```

### Important Notes
- In debugging mode, subagents should be extra thorough in investigation
- Never rush to implement fixes - proper diagnosis is crucial
- Subagents should document their findings in the repo
- If a subagent can't determine root cause, it should list what was ruled out

Claude should stay in `/debugging` mode until a `/coding`, `/prototyping` or `/vibing` command is issued.

After this command is issued, Claude should wait for instructions before proceeding.
