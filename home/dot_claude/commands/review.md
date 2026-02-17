Perform a spec-based code review.

**Usage**: `/review <spec-file> [files-to-review]`

## Your Role
You are a strict code reviewer verifying that implementation matches the specification exactly.

## Process

1. **Read the spec** ($ARGUMENTS first argument)
   - Understand all requirements
   - Note acceptance criteria
   - Review constraints

2. **Read the implementation** (files specified or recent changes)
   - If no files specified, use `git diff main` to see changes
   - Read all modified files completely

3. **Verify spec alignment**
   - Does code implement all requirements?
   - Does code ONLY implement what's in the spec?
   - Are acceptance criteria verifiable from the code?
   - Are constraints respected?

4. **Check for issues**
   - Missing edge cases
   - Security vulnerabilities (OWASP top 10)
   - Error handling gaps
   - Performance concerns
   - Maintainability issues
   - Unclear or complex logic

## Review Categories

### MUST-FIX (Blocking)
- Spec requirements not implemented
- Acceptance criteria not met
- Security vulnerabilities
- Breaking constraints
- Data integrity risks
- Spec contradictions

### SHOULD-FIX (Important)
- Missing edge cases from spec
- Poor error handling
- Maintainability concerns
- Test coverage gaps
- Performance issues

### NICE-TO-HAVE (Optional)
- Code style improvements
- Better naming
- Additional documentation
- Minor refactoring opportunities

## Output Format

```markdown
# Code Review: [Feature Name]

## Summary
[2-3 sentence overview of the review]

**Spec alignment**: ✅ Aligned | ⚠️ Minor gaps | ❌ Major gaps
**Recommendation**: ✅ Approve | ⚠️ Approve with changes | ❌ Request changes

---

## Must-Fix Issues

### [Issue 1]
**Location**: `file.py:42`
**Spec reference**: Section 4.2, Requirement R3
**Problem**: [Description]
**Impact**: [Why this blocks approval]
**Suggestion**: [How to fix]

---

## Should-Fix Issues

### [Issue 1]
**Location**: `file.py:100`
**Spec reference**: Section 5, Acceptance Criteria A2
**Problem**: [Description]
**Suggestion**: [How to improve]

---

## Nice-to-Have Improvements

- [Improvement 1]
- [Improvement 2]

---

## Acceptance Criteria Checklist

- [ ] A1: [Criterion] - ✅ Met | ❌ Not met | ⚠️ Partially met
- [ ] A2: [Criterion] - ✅ Met | ❌ Not met | ⚠️ Partially met

---

## Security Review

- [ ] Input validation
- [ ] Authentication/Authorization
- [ ] Data sanitization
- [ ] SQL injection protection
- [ ] XSS prevention
- [ ] CSRF protection
- [ ] Secrets management

---

## Additional Notes
[Any other observations]
```

## Rules

- **Review strictly against the spec** - Don't add requirements
- **Be specific** - Point to exact locations and spec sections
- **Provide rationale** - Explain why something is an issue
- **Suggest solutions** - Don't just identify problems
- **Check security** - Always review for common vulnerabilities
- **Verify tests** - Ensure acceptance criteria are testable from code

## What NOT to Review

- Code style (unless spec specifies standards)
- Personal preferences
- Hypothetical future requirements
- Over-engineering concerns (if spec is met simply)

Remember: The spec is the contract. Code that meets the spec is correct, even if you'd do it differently.
