# 🎯 2. Agentic Skills Exercises

In these exercises, you will:
- Inspect existing skill definitions and their YAML frontmatter
- Create a custom skill with model invocation
- Test your skill in the Copilot chat
- Configure skill visibility and accessibility

## 🔍 Exercise 2.1: Inspect the existing skill

Learn the structure of a working skill definition before creating your own.

1. If you haven't already done so, run the development server and setup Robot Framework according to the instructions in the README at the project root.
1. Open the file `.github/skills/create-robot-browser-test-case/SKILL.md`
1. Identify the YAML frontmatter fields (`name`, `description`, `user-invocable`, `disable-model-invocation`). Hover over each one to see an explanation of its purpose.
1. Close the SKILL.md file.
1. Issue the folllowing prompt. After issuing it, observe the chat. Is the skill utilized for creating the test case? Look for text "Read skill create-robot-browser-test-case".
    ```text
    Create a Robot Framework test case that adds a skill to a user’s profile.

    1. Crete a new skill in the skill inventory
    1. Select an existing user and the new skill in their profile.
    2. Verify the new skill appears on the correct profile.
    3. Remove the skill and verify it no longer appears.
    ```
1. Run Robot Framework tests. Does the new test pass?
    ```text
    npm run robot
    ```
1. Test that you are able to execute the skill as a slash command by typing `/create-robot-browser-test-case`. Does the skill appear in the list as you start typing its name?

## 🛠️ Exercise 2.2: Generate a new skill

Create a custom skill that runs test coverage, analyzes which parts of the codebase need more tests, and provides prioritized recommendations.

1. Open the file `.github/skills/review-robot-test-case`. Note that the file is currently empty.
1. Scaffold a new skill in this file with the following prompt:
    ```text
    Create a reusable Copilot skill in this file for reviewing a specific Robot Framework test case. Use repository conventions and keep the review read-only.

    Report actionable, evidence-based findings in a table with location, problem, impact, and recommendation. Order findings by severity using High, Medium, and Low labels, with traffic light color coding.
    ```
1. Verify that the skill has been created in the [.github/skills/](.github/skills/) folder and review its contents.
1. Test the skill by selecting a Robot Framework test case and running the skill as a slash command in the Copilot chat.
1. Verify that the skill generates an appropriate report.

## ⚙️ Exercise 2.3: Configure skill visibility

Control when a skill is available by adjusting its frontmatter settings.

1. Open the review-robot-test-case skill definition you created.
1. Add the `user-invocable` and `disable-model-invocation` fields in the frontmatter if they are not already there. 
1. Make sure `user-invocable` is set to `false`.
1. Try to run `/test-coverage` in the Copilot chat. Observe that the skill no longer appears as a slash command since it is no longer user-invocable.
1. Change `user-invocable` back to `true` to restore the slash command.

## 💡 Exercise 2.4: Brainstorm other skills

List other ways you could use agentic skills for Robot Framework development.
- What other reusable tasks in this project could become a skill?
- Which skills would benefit from being model-invocable, user-invocable, or both?

Write the ideas down, they will be discussed at the end of the training.