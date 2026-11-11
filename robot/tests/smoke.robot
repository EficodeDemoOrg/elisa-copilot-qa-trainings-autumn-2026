*** Settings ***
Library    Browser
Suite Setup    New Browser    chromium    headless=True
Suite Teardown    Close Browser

*** Variables ***
${BASE_URL}    http://localhost:51734

*** Test Cases ***
Home page loads with the expected title
    New Page    ${BASE_URL}
    ${title}=    Get Title
    Should Be Equal    ${title}    Team Skills Matrix
