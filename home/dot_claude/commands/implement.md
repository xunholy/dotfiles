Execute the next task in the implementation plan.

**Plan file**: $ARGUMENTS

## Workflow

This command runs the complete implementation loop:

### 1. Engineer Phase
Use the `engineer` agent to implement the next incomplete task:
- Read the task from the plan
- Read the spec for context
- Implement ONLY what the spec requires
- Make small, incremental changes
- Update or add tests for behavior changes
- Stop if the spec is ambiguous

### 2. Tester Phase
Use the `tester` agent to validate:
- Run all relevant tests
- Verify acceptance criteria are met
- Check test coverage for new code
- Report failures with:
  - Command run
  - Failing output
  - Suspected cause
- Flag spec mismatches (code correct but doesn't match spec)

### 3. Reviewer Phase
Use the `reviewer` agent to review:
- Code matches the spec exactly
- No missing edge cases
- No security risks introduced
- Code is maintainable and clear
- Output:
  - Summary
  - Must-fix issues
  - Should-fix issues
  - Nice-to-have improvements

## Execution Flow

```
Read plan → Identify next task → Run engineer agent
                                         ↓
                                 Implementation complete
                                         ↓
                                  Run tester agent
                                         ↓
                                  Tests passing?
                                    ↙         ↘
                                  YES         NO
                                   ↓           ↓
                          Run reviewer    Fix issues
                                   ↓           ↓
                            Review passed? ← ←
                                   ↓
                           Mark task complete
                                   ↓
                            Commit changes
```

## Rules

- **Stop immediately on test failures** - Fix before proceeding
- **Stop on spec ambiguity** - Clarify spec, don't guess
- **One task at a time** - Complete full cycle before next task
- **Commit only when verified** - All three phases must pass
- **Update plan if needed** - Mark tasks complete, add new ones if discovered

## Commit Message Format

```
[Task N] Brief description

Spec: specs/[feature-name].md
Section: [Spec section reference]

Changes:
- [Change 1]
- [Change 2]

Verified by:
- Engineer: implemented per spec
- Tester: all acceptance criteria pass
- Reviewer: approved with [N] minor suggestions
```

## Error Handling

**Test failure** → Tester reports issue → Engineer fixes → Re-test
**Spec mismatch** → Flag in plan → Request human decision (update code or spec?)
**Ambiguity** → Block task → Request spec clarification
**Review concerns** → Must-fix: block until resolved; Should-fix: note for later

## Agent Invocation

```bash
# Run each agent in sequence
Task engineer with: "Implement task N from $ARGUMENTS according to spec"
Task tester with: "Validate task N implementation against acceptance criteria"
Task reviewer with: "Review task N implementation for spec alignment"
```

## Success Criteria

Task is complete when:
- [ ] Implementation matches spec exactly
- [ ] All tests pass
- [ ] Acceptance criteria verified
- [ ] Code review approved (no must-fix issues)
- [ ] Changes committed with proper message
- [ ] Plan updated to mark task complete
