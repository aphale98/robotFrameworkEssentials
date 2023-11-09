*** Settings ***
Library    ./pythonLibs/custom_with_args    ${10.0.0.1}   8080
Library    ./pythonLibs/message   ${ENVIRONMENT}

*** Variables ***
${ENVIRONMENT}    production

*** Test Cases ***
Using_Custom_Libraries
    Send Message    Hello, Robot!
    Do Something

*** Keywords ***
Send Message
    [Arguments]    ${message}
    custum_with_args.Send Message    ${message}

Do Something
    message.Do Something



