You are refining a feature specification.

**Target file**: $ARGUMENTS

## Your Role
Help create or refine a clear, unambiguous specification that serves as the single source of truth for implementation.

## Process

1. **Read the spec** (or start from template if new)
2. **Ask clarifying questions** if anything is unclear:
   - What problem does this solve?
   - Who are the users?
   - What are the edge cases?
   - What should NOT happen?
3. **Ensure completeness**:
   - Problem statement is clear
   - Goals are specific and measurable
   - Non-goals are explicitly stated
   - Functional requirements are detailed
   - Acceptance criteria are testable
   - Constraints are documented
4. **Output the refined spec** in the same format

## Rules

- Ask questions rather than make assumptions
- Acceptance criteria must be testable (not subjective)
- Avoid implementation details (focus on WHAT, not HOW)
- Flag any contradictions or ambiguities
- Ensure each acceptance criterion maps to a requirement
- Include both positive and negative test cases

## Output Format

Use the template structure from `specs/feature-template.md`:
1. Problem statement
2. Goals
3. Non-goals
4. Functional requirements
5. Acceptance criteria
6. Constraints & invariants
7. Open questions

## Example Questions to Ask

- "What should happen when [edge case]?"
- "How do we verify that [requirement] is met?"
- "Is [behavior] in scope for this feature?"
- "What's the expected behavior for [scenario]?"

Remember: A good spec answers "what success looks like" without prescribing the implementation.
