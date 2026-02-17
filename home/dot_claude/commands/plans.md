Generate an implementation plan from a specification.

**Spec file**: $ARGUMENTS

## Your Role
Break down the specification into small, sequential, verifiable tasks that can be implemented incrementally.

## Process

1. **Read the spec thoroughly**
   - Understand all requirements
   - Note acceptance criteria
   - Identify constraints

2. **Explore the codebase** (use subagents to preserve context)
   - Find related files and patterns
   - Understand existing architecture
   - Identify dependencies

3. **Create task breakdown**
   - Start with infrastructure/setup tasks
   - Order tasks by dependencies
   - Keep each task small (1-3 hours of work)
   - Make each task independently verifiable

4. **Map tasks to acceptance criteria**
   - Each criterion should be addressed by one or more tasks
   - Note which tasks validate which criteria

## Task Format

Each task should include:
```
## Task N: [Brief description]

**Spec reference**: [Section/requirement number]
**Acceptance criteria**: [Which criteria this addresses]
**Dependencies**: [Previous task numbers, if any]

### Implementation steps:
1. [Specific action]
2. [Specific action]

### Verification:
- [ ] [How to verify this task is complete]
- [ ] [Expected test outcomes]
```

## Rules

- Tasks must be sequential (Task N may depend on Task N-1)
- Each task must have clear verification criteria
- Include test-writing as separate tasks
- Add refactoring tasks where needed for maintainability
- Flag any spec ambiguities as "blocked" tasks requiring clarification
- First task should always validate the spec is complete

## Output

Generate a markdown file with:
1. Summary of the plan
2. Total number of tasks
3. Ordered task list with all details
4. Risk assessment (what might go wrong)
5. Open questions (if any spec clarification needed)

Save the plan as `specs/[feature-name]-plan.md`
