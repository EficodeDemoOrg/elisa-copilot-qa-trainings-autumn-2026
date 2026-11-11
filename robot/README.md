---
title: Robot Framework Tests
description: Set up and run browser smoke tests for Team Skills Matrix with Robot Framework Browser.
---

## Prerequisites

* Node.js and npm, as described in the [main README](../README.md)
* Python 3

## Install Robot Framework

Create and activate a virtual environment, then install the test dependencies and browser:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r robot/requirements.txt
rfbrowser init
```

In PowerShell, activate the environment with:

```powershell
py -m venv .venv
.venv\Scripts\Activate.ps1
```

Then run the `pip install` and `rfbrowser init` commands shown above.

## Run the smoke test

Start the application in one terminal:

```bash
npm run dev
```

In another terminal, activate the virtual environment and run:

```bash
npm run robot
```

The test opens the home page at `http://localhost:51734` and checks that its document title is `Team Skills Matrix`. Robot Framework writes reports to `robot/results/`.

## Style guidelines

Follow the [path-scoped Robot Framework instructions](../.github/instructions/robot-framework.instructions.md), based on the community-maintained [official-site style guide](https://docs.robotframework.org/docs/style_guide).

* The instructions cover all `.robot` and `.resource` files in this repository, including test cases, Robot-language user keywords, and library calls. All Python library implementations are excluded.
* Use underscore variable names, uppercase for test/suite/global values and lowercase for keyword-local values and arguments. Omit the optional `=` in keyword-return assignments.
* Treat line-length, argument-count, and nesting limits as recommendations. Explain necessary exceptions; keep comments for actionable TODOs or essential, non-obvious reasons.
* Apply style to new or changed code without unrelated whole-suite reformatting. The existing smoke suite remains unchanged; its section spacing, `${title}` casing, and attached assignment sign predate these conventions.

For Robot source changes, run `npm run robot` with the environment active and application running as described above. An optional dry run checks imports and keyword resolution without executing the browser:

```bash
python -m robot --dryrun --output NONE --log NONE --report NONE robot/tests
```

Dry runs do not verify browser behavior. Documentation-only edits do not require browser execution. `npm run lint` checks TypeScript, not Robot style; no automated Robot style tooling is added by these instructions.
