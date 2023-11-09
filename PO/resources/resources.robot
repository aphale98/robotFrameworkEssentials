*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary


*** Variables ***
${user_name}                aamanphale
${invalid_password}         123445
${url}                      https://rahulshettyacademy.com/loginpagePractise/
${browser_name}             Chrome
${Error_Message_Login}      css:.alert-danger


*** Keywords ***

Open the browser with the Mortgage payment url
    Create Webdriver    ${browser_name}
    Go To   ${url}

Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

Wait until Element is located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}

Close Browser session
    Close Browser
