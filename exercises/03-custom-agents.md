# 🤖 3. Custom Agents Exercises

In these exercises, you will:
- Explore existing agent definitions and configurations
- Create a custom agent specialized for a specific task
- Define default models and tool restrictions
- Test your custom agent on real code

## 💬 Exercise 3.1: Inspect an existing agent

Read through a working agent definition from start to finish so you become familiar with the required structure before authoring your own.

1. Open the file `.github/agents/robot-keyword-refactorer.agent.md`
1. Identify the YAML frontmatter fields (`name`, `description`, `tools`, `user-invocable`, `disable-model-invocation`). Hover over each one to see an explanation of its purpose.
1. Activate the custom agent. VS Code: While Copilot harness is selected, click the small plus icon in the lower left side corner of the prompt input field. Select `agent` and then `Robot Keyword Refactorer` from the list.
1. Open the file `skills.robot`. Issue the following prompt:
    ```text
    Detect keyword refactoring opportunities
    ```
1. The custom agent should be able to recommend refactoring the engineering skill creation to be refactored into a keyword. Continue with the following prompt (assuming the recommendation in question is item 1):
    ```text
    Refactor item 1 in a resource file
    ```
1. Verify that the refactoring was succesful and that the instructions created in exercise 1 were respected.

## 🧪 Exercise 3.2: Create a new custom agent

Create a custom agent that specializes in planning Robot Framework test cases.

1. Scaffold a new custom agent with the following prompt or similar:
    ```text
    Create a user-invocable custom agent named "Test Planner". The agent should:
      - read the feature description in the user's prompt
      - explore the codebase and existing tests to understand the feature and its context
      - ask the developer clarifying questions when requirements are unclear
      - map requirements to prioritized test scenarios, explaining the priorities
      - plan Robot Framework test cases for those scenarios
      - identify reusable existing keywords and recommend shared keywords to add to resource files
      - present the plan and obtain the developer's explicit permission before implementing any test cases
    ```
1. Verify that the agent has been created in the agents folder and review its contents.
1. Inspect the user interface and choose a suitable use case to test. Select the new custom agent, describe the use case in the chat, and ask it to plan test cases for the feature.

## 🎯 Exercise 3.3: Define the default model for the agent
1. Open the Test Planner agent definition created in exercise 3.2.
1. Review the [model comparison documentation](https://docs.github.com/en/enterprise-cloud@latest/copilot/reference/ai-models/model-comparison) and choose a model suited to test planning that is available to your GitHub organization.
1. Add the chosen model to the agent frontmatter, replacing the placeholder with its name (VS Code auto-completes the model name as you start typing its name):
    ```yaml
    model: <chosen model>
    ```
1. Activate the agent in the agent menu. Observe that the default model is automatically selected in the model selector.

## 🔧 Exercise 3.4: Configure custom agent tools
1. Open the Test Planner agent definition
1. If there are no tools defined, add the following tools section to the front matter:
    ```yaml
    ---
    name: Test Planner
    description: ...
    tools:
        - read
        - search
        - edit
    ---
    ```
1. Click on the "Configure tools" link above the tools section (VS Code). Add additional tools if you think something useful is missing.

## 💡 Exercise 3.5: Brainstorm other custom agents

List other ways you could use custom agents for Robot Framework development.
- What other specialized tasks would benefit from a dedicated custom agent rather than a skill or plain prompt?
- Which tool restrictions or default models would make sense for those agents?

Write the ideas down, they will be discussed at the end of the training.
