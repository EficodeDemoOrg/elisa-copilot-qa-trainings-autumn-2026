*** Settings ***
Documentation     Verify skill inventory creation and deletion.

Library           Browser

Suite Setup       New Browser    chromium    headless=True
Suite Teardown    Close Browser


*** Variables ***
${BASE_URL}    http://localhost:51734


*** Test Cases ***
Add a skill with its values and remove it
    [Documentation]    Create a unique skill, verify its persisted values, and delete it.
    ${ID}    Evaluate    uuid.uuid4().hex    modules=uuid
    ${SKILL_NAME}    Set Variable    Robot skill ${ID}
    ${SKILL_ROW}    Set Variable    tr:has-text("${SKILL_NAME}")
    New Page    ${BASE_URL}/skills
    Fill Text    input[placeholder="Name"]    ${SKILL_NAME}
    Fill Text    input[placeholder="Category"]    Robot testing
    Fill Text    input[placeholder="Description (optional)"]    Browser test skill
    Select Options By    form select    value    4
    Click    form button:has-text("Add")

    Wait For Elements State    ${SKILL_ROW}    visible
    Reload
    Wait For Elements State    ${SKILL_ROW}    visible
    Get Text    ${SKILL_ROW} >> td:nth-child(1) >> div:nth-child(1)    ==    ${SKILL_NAME}
    Get Text    ${SKILL_ROW} >> td:nth-child(1) >> div:nth-child(2)    ==    Browser test skill
    Get Text    ${SKILL_ROW} >> td:nth-child(2)    ==    Robot testing
    Get Property    ${SKILL_ROW} >> select    value    ==    4

    Click    ${SKILL_ROW} >> button:has-text("Delete")
    Wait For Elements State    ${SKILL_ROW}    detached
    ${RESPONSE_PROMISE}    Promise To    Wait For Response    **/api/skills
    Reload
    ${RESPONSE}    Wait For    ${RESPONSE_PROMISE}
    Should Be Equal As Integers    ${RESPONSE}[status]    200
    ${SKILL_NAMES}    Evaluate    [skill["name"] for skill in $RESPONSE["body"]]
    Should Not Contain    ${SKILL_NAMES}    ${SKILL_NAME}
    Wait For Elements State    ${SKILL_ROW}    detached
    [Teardown]    Delete Skill If Present    ${SKILL_ROW}

Update a skill target and keep it after reload
    [Documentation]    Create a unique skill, update its target, and verify the change persists.
    ${ID}    Evaluate    uuid.uuid4().hex    modules=uuid
    ${SKILL_NAME}    Set Variable    Robot skill ${ID}
    ${SKILL_ROW}    Set Variable    tr:has-text("${SKILL_NAME}")
    New Page    ${BASE_URL}/skills
    Fill Text    input[placeholder="Name"]    ${SKILL_NAME}
    Fill Text    input[placeholder="Category"]    Robot testing
    Fill Text    input[placeholder="Description (optional)"]    Browser test skill
    Select Options By    form select    value    4
    Click    form button:has-text("Add")

    Wait For Elements State    ${SKILL_ROW}    visible
    ${RESPONSE_PROMISE}    Promise To    Wait For Response    **/api/skills/*
    Select Options By    ${SKILL_ROW} >> select    value    2
    ${RESPONSE}    Wait For    ${RESPONSE_PROMISE}
    Should Be Equal As Integers    ${RESPONSE}[status]    200
    Get Property    ${SKILL_ROW} >> select    value    ==    2
    Reload
    Wait For Elements State    ${SKILL_ROW}    visible
    Get Property    ${SKILL_ROW} >> select    value    ==    2
    [Teardown]    Delete Skill If Present    ${SKILL_ROW}


*** Keywords ***
Delete Skill If Present
    [Documentation]    Remove the test skill after an assertion or action failure.
    [Arguments]    ${skill_row}
    ${count}    Get Element Count    ${skill_row}
    IF    ${count} > 0
        Click    ${skill_row} >> button:has-text("Delete")
        Wait For Elements State    ${skill_row}    detached
    END

