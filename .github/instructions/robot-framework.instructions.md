---
description: "Use when editing Robot Framework test cases or user keywords in .robot and .resource files."
applyTo: "**/*.robot,**/*.resource"
---

# Robot Framework Instructions

## Scope and project context

* Apply these rules to Robot test suites and Robot-language user keywords, including resource files anywhere in this repository.
* Robot-side library imports and calls are in scope. Python library implementations of every kind and Python, YAML, or JSON variable-file implementations are not.
* The current browser smoke suite uses Browser against `http://localhost:51734` and expects the title `Team Skills Matrix`. Preserve its behavior.
* Apply style to new or changed code. Do not reformat unrelated tests, extract resources, change dependencies, or edit generated reports and database fixtures unless requested.

## Test and user-keyword structure

* Order present sections as `*** Comments ***`, `*** Settings ***`, `*** Variables ***`, `*** Test Cases ***`, then `*** Keywords ***`. Omit unused sections; resource files contain no test cases.
* Order suite settings as documentation, metadata, libraries, resources, variable imports, suite setup/teardown, test setup/teardown, template, timeout, then tags.
* Group library imports as built-in, third-party, then custom. Alphabetical ordering within each group is optional.
* Within a test, order present settings as `[Documentation]`, `[Tags]`, `[Timeout]`, `[Setup]`, then `[Template]`. Follow with static assignments, actions, verification, and `[Teardown]` at the bottom.
* Within a keyword, order present settings as `[Documentation]`, `[Tags]`, `[Arguments]`, `[Timeout]`, then `[Setup]`. Put static assignments before action calls and `[Teardown]` at the bottom when used.
* Keep tests readable as actions and checks. Move `FOR` and `WHILE` iteration into user keywords where practical.
* Alphabetize user keyword definitions in resource files for navigation.
* Prefer self-explanatory names and useful `[Documentation]`. Reserve comments for actionable TODOs or essential, non-obvious reasons; do not narrate the code.

## Variables and assignment

* Use underscore names. Global, suite, and test variables are uppercase, including values assigned directly in tests: `${BASE_URL}`, `${PAGE_TITLE}`.
* Keyword arguments and local variables are lowercase: `${first_name}`, `${display_name}`. Loop variables may use lowercase names.
* Do not shadow suite/global variables in narrower scopes. Case, spaces, and underscores do not distinguish Robot variable names.
* Declare simple variables before composite variables that reference them. Supply defaults for variables needed to resolve settings and import paths.
* Use the appropriate `${SCALAR}`, `@{LIST}`, or `&{DICTIONARY}` declaration form. Variables declared in suite/resource variable sections use suite-scope casing.
* Prefer keyword-local values. Document non-local variable changes; set test-scope variables in tests rather than resource keywords when practical.
* Omit the optional assignment `=`: `${PAGE_TITLE}    Get Title`. Do not change `=` in named arguments, defaults, or dictionary entries.
* Preserve externally defined environment names, API keys, and attribute casing when their external contract matters.

## Whitespace, alignment, and continuation

* Use four spaces between cells, with extra spaces allowed for alignment. Do not use tabs.
* Keep section headers, suite settings, variable declarations, and test/keyword names at column one. Indent bodies by four spaces and each nested block by another four.
* Align branch markers and `END` with their block opener. Aim for at most five indentation levels, including the initial body level, allowing four nested block levels.
* Aim for lines of at most 120 characters and remove trailing whitespace.
* Put no blank line immediately after a section header, two blank lines between sections, and one blank line after the final section.
* Separate related suite-setting groups with one blank line. Keep variable declarations contiguous, including their continuation rows.
* Do not put blank lines between local settings or between local settings and their test/keyword body.
* Separate tests and keywords with one blank line, except where section spacing takes precedence. Use at most one blank line between logical body blocks, not between every call.
* Align suite-setting values after the longest setting name with at least four spaces. Separate library import arguments with four spaces or consistently aligned columns.
* Put `...` at the start of each continued row, aligned with its containing statement, not at an extra indentation level. Never put it at the end of the previous row.
* Do not insert blank continuation rows, marker-only rows, or blank lines within a continued statement.
* For multiline `[Arguments]`, keep the first argument on the setting's line. Put subsequent arguments one per continued row, aligned with the first argument.
* Keep short calls on one line when they fit. For multiline calls, keep the first argument with the keyword, then put subsequent arguments one per row with four spaces after `...`. Keep call layout consistent within a test.
* Aim for at most five keyword arguments. Put required positional arguments before default-valued positional arguments; consider a list or dictionary for larger input sets.
* Keep keyword names containing embedded arguments on one physical line.
* Align continued variable values with the initial value. In executable bodies, use an appropriate combining keyword such as `Catenate` for multiline scalars; preserve separators and string contents.
* Keep short lists/dictionaries on one line or put each item/key-value pair on its own aligned continuation row. Never split an individual item or pair; extract long scalar values first.
* For comments, put a space after `#` and match the relevant block indentation. Separate an inline comment from code by four spaces.

## Templates

* Left-align template columns and separate them by at least four spaces, measured from the longest entry in each column.
* Use capitalized, aligned column headings for suite-wide templates. Omit headings for per-test templates when they would obscure local settings.
* Keep rows within each templated test contiguous and logically ordered. Separate different tests using the normal test-spacing rule.
* Apply the same keyword rules to template keyword definitions.

## Examples

The following examples are illustrative, not a request to migrate the existing smoke suite.

### Browser suite

```robot
*** Settings ***
Documentation     Check the application title.

Library           Browser

Suite Setup       New Browser    chromium    headless=True
Suite Teardown    Close Browser


*** Variables ***
${BASE_URL}          http://localhost:51734
${EXPECTED_TITLE}    Team Skills Matrix


*** Test Cases ***
Home page shows the product title
    [Documentation]    Verify the home page's document title.
    New Page    ${BASE_URL}
    ${PAGE_TITLE}    Get Title
    Should Be Equal    ${PAGE_TITLE}    ${EXPECTED_TITLE}

```

### Resource user keyword

```robot
*** Settings ***
Documentation    Helpers for display names.


*** Keywords ***
Build Display Name
    [Documentation]    Join name parts using the requested separator.
    [Arguments]    ${first_name}
    ...            ${last_name}
    ...            ${separator}=${SPACE}
    ${display_name}    Catenate    SEPARATOR=${separator}    ${first_name}    ${last_name}
    Log Many    ${first_name}
    ...    ${last_name}
    ...    ${display_name}
    RETURN    ${display_name}

```

### Suite-wide template

```robot
*** Settings ***
Documentation    Verify matching word pairs.

Test Template    Value Should Match


*** Test Cases ***    ACTUAL    EXPECTED
Matching words        one       one
                      two       two


*** Keywords ***
Value Should Match
    [Documentation]    Check that a word matches its expected value.
    [Arguments]    ${actual}    ${expected}
    Should Be Equal    ${actual}    ${expected}

```

## Validation and change boundaries

* For Robot source changes, activate the environment described in [the Robot README](../../robot/README.md), start the application with `npm run dev`, and run `npm run robot`.
* A dry run can check imports and keyword resolution without executing the browser. With the existing environment active, use `python -m robot --dryrun --output NONE --log NONE --report NONE robot/tests`. It does not prove runtime behavior.
* Documentation-only changes do not require browser execution. Review examples for valid syntax, exact spacing, casing, and preserved literal values; use an existing Robot environment for an optional dry run.
* `npm run lint` checks TypeScript, not Robot style. Do not claim automated Robot style enforcement or install a linter/formatter without a separate request.
* Review the final diff for unintended changes. Preserve test behavior and report validation failures explicitly.

## Source and project adaptations

These rules paraphrase the community-maintained [Robot Framework style guide](https://docs.robotframework.org/docs/style_guide), labeled version `0.10b` when reviewed.

* This project chooses underscore variable names and omits the optional assignment sign from the guide's permitted alternatives.
* The 120-character, five-argument, and five-indentation-level limits are recommendations. Explain necessary exceptions rather than altering behavior to satisfy a style budget.
* Essential why-comments are allowed in addition to TODOs, relaxing the guide's TODO-only policy to match project guidance.
* Continuation markers retain their statement's indentation without additional nesting, consistent with the guide's executable examples.
* Robot examples end with a blank line after their final section. Markdown documents retain one terminal newline.
* Use signatures and settings supported by the installed Robot version. Do not copy errors from source examples, invent mandatory Title Case names, or add keyword-count/length limits not established by the guide.
