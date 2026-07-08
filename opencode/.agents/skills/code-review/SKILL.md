---
name: code-review
description: >
  Comprehensive code review orchestrator. Launches 6 specialized review subagents in parallel
  (security, linting, test coverage, code quality, architecture, and product/business rules).
  Aggregates findings into a unified report. Use when reviewing PRs, branches, or specific
  files for quality, security, and correctness concerns.
---

# Code Review Skill

Orchestrate a comprehensive multi-perspective code review by dispatching all specialized
review subagents in parallel, then aggregating their findings into a unified report.

## When to use this skill
- Reviewing a pull request or branch
- Quality assessment of specific files or modules
- Pre-release code audit
- Refactoring candidates that need multi-angle evaluation
- Security-sensitive code that needs thorough review

## Review subagents

All review subagents are **read-only** (no write permission). They analyze and report, never modify code.

| Subagent | Focus |
|----------|-------|
| `code-security` | OWASP Top 10, CVE patterns, input validation, auth/authz, injection, data exposure |
| `code-lint` | Style consistency, formatting, naming conventions, dead code, commented-out code |
| `code-test-coverage` | Coverage gaps, edge case handling, test quality, mocking patterns |
| `code-quality` | Cyclomatic/cognitive complexity, code duplication, maintainability index, code smells |
| `code-architect` | SOLID compliance, design patterns, separation of concerns, coupling/cohesion |
| `code-product` | Business rule verification, dependency graph, domain alignment, API contract |

## Review workflow

### Phase 1: Scope identification
1. Identify the files/changes to review (user input, git diff, or file list)
2. If scope is large (>20 files), ask the user to narrow down or prioritize modules
3. Communicate to each subagent which files to focus on

### Phase 2: Parallel review
Launch ALL 6 review subagents simultaneously via the Task tool.
Each subagent receives:
- The file paths or diff to review
- Any specific concerns or context from the user
- Instruction to return findings in their standard output format

### Phase 3: Aggregation
1. Collect all findings from the 6 subagents
2. Deduplicate findings that overlap between subagents
3. Categorize by severity: Critical → High → Medium → Low
4. Group by file/module for readability

### Phase 4: Report
Present a unified report with sections:

```markdown
## Code Review Report

### Summary
- Total findings: N
- Critical: X | High: Y | Medium: Z | Low: W
- Reviewed files: list

### Critical Issues
(findings that must be addressed before merge)

### High Priority
(findings that should be addressed soon)

### Medium Priority
(findings worth addressing)

### Low Priority / Nice to Have
(style improvements, suggestions)

### Per-File Breakdown
(optional, for large reviews)
```

## Critical rules
1. **Never edit files** — this skill is read-only, reviews only
2. **Launch all 6 subagents in parallel** — don't sequence them unless memory constrained
3. **Be specific about scope** — tell each subagent exactly which files to review
4. **Present findings clearly** — the user should understand what to fix and why
5. **Prioritize ruthlessly** — critical security issues before style nits
6. **No false urgency** — label severity accurately, don't inflate to sound important
