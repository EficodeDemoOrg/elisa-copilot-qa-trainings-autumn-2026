# 📜 1. Custom Instructions Exercises

In these exercises, you will:
- Read project-wide and path-scoped custom instructions
- Understand how instructions scope to different files
- Create a new path-scoped instructions file

## 🔍 Exercise 1.1: Examine the existing custom instructions

Get familiar with how this repo layers project-wide and path-scoped instructions before writing your own.

1. Open the project-wide instructions file at [.github/copilot-instructions.md](.github/copilot-instructions.md) and read through it. Note that it has **no YAML frontmatter** and applies to every Copilot request in this workspace.
1. Open the [.github/instructions/](.github/instructions/) folder and review the files in it.
1. Compare the YAML frontmatter of the file. Take a note of the `applyTo` attribute.

## 🧪 Exercise 1.2: Scaffold a new path-scoped instructions file

Create a new instructions file that defines the conventions of Robot Framework resource files.

1. Let's plan the file before creating it. Make sure you have "Copilot" harness selected (in VS Code) and select Plan mode in the chat panel's mode menu.
1. Use the following prompt or similar to create the plan for the instructions file:
    ```text
    Help me plan a GitHub Copilot custom instructions file for Robot Framework keyword libraries.

    First, inspect the project’s existing Robot Framework setup and instructions. Then ask me focused questions to establish the conventions. Cover, as relevant:
    - Whether the instructions target resource files, Python libraries, or both
    - File organization and abstraction layers
    - Keyword naming, arguments, documentation, and return values
    - Assertions, error handling, shared state, and setup/teardown
    - Scope and validation of the instructions file

    Offer practical options and explain their trade-offs briefly. Ask follow-up questions where my choices need clarification; do not assume project conventions I haven’t confirmed.

    Once we’ve agreed on the conventions, produce a concise implementation plan that identifies the proposed file, its scope, the rules it will contain, and how to verify it. Do not create or modify repository files unless I approve the plan.
    ```
1. Review and if needed, iterate the plan with Copilot. Implement the plan.
1. Open the generated instructions file and review its contents. Confirm the YAML frontmatter contains `applyTo` attribute with correct path.
1. Skim through the contents. Do the proposed convention make sense? Iterate the file with Copilot if necessary.

## 💡 Exercise 1.3: Brainstorm Robot Framework custom instructions

List other ways you could use custom instructions for Robot Framework development.
- What other path-scoped instructions would be useful?
- Is there something that should be add to the project-wide instructions to make the code easier to test with automation?

Write the ideas down, they will be discussed at the end of the training.
