---
name: create-robot-browser-test-case
description: 'Create and run Robot Framework Browser UI tests by inspecting application behavior and existing test conventions'
user-invocable: true
disable-model-invocation: false
---

# Create Robot Framework Browser Test Case

## Overview

Create or extend browser UI tests using Robot Framework and the Browser library. Follow this workflow in the target repository; do not assume a particular application, command, port, or fixture.

## Prerequisites

Use the target repository's applicable instructions and its documented Robot Framework Browser environment, browser installation, application setup, and test commands. If a prerequisite is missing, report it and follow the repository's setup guidance within the user's authorization.

## Workflow

1. Establish the behavior and expected results from the request and relevant requirements. Ask for clarification when important acceptance criteria, scope, or expected behavior are ambiguous.
2. Discover applicable custom instructions, test documentation, existing Robot suites and resources, Browser keywords, fixtures, and configuration. Inspect the application code and relevant user flow to determine how the behavior is exposed and which existing helpers and setup to reuse. Follow local instructions rather than restating them.
3. Choose focused scenarios that check observable outcomes, including relevant edge cases. Use the existing test structure, stable selectors and synchronization, isolated test data, and appropriate cleanup. Avoid fixed sleeps and changes unrelated to the requested test.
4. Implement the test with the existing Browser library and repository conventions. Do not silently add dependencies, alter generated fixtures or reports, or change application behavior to make a test pass.
5. Discover the documented application startup, readiness checks, test selection, output locations, and required validation commands. Use an existing application only when its target and data are safe; otherwise start an isolated instance. Do not overwrite existing reports or shared data, and stop only processes you started.
6. Run the new or changed test against the application, then run any wider suite required by the repository. A dry run can check syntax and keyword resolution but does not establish browser behavior. Inspect failures and relevant logs, fix test issues, and rerun. Report application defects or blockers instead of masking them or changing application behavior without authorization.
7. Review the changes and report the test and behavior covered, exact commands and results, relevant artifacts, cleanup, and any unverified behavior or remaining blockers.

## Troubleshooting

Distinguish missing dependencies, application readiness, selector or test errors, and application defects. If runtime execution is unavailable, state the reason and any checks completed; never present a dry run or an unexecuted test as a passing browser test.

