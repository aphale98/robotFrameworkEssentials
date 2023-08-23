*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Login Page
    Open Login Page

Title Should Start With
    Title Should Start With    Google

*** Keywords ***
Open Login Page
    Create Webdriver       Chrome
    Go To   https://google.com
    Title Should Be    Google


Title Should Start With
    [Arguments]    ${expected}
    ${title} =    Get Title
    Should Start With    ${title}    ${expected}
    Close Browser