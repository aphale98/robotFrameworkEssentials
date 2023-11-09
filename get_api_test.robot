*** Settings ***
Library    RequestsLibrary
Library    DateTime

*** Variables ***
${base_URL}     https://httpbin.org/
@{headers}      Accept=application/json

*** Test Cases ***
Fetch data from URL
    [Documentation]    Test basic API functionality
    Create Session    mydata    ${base_URL}

    ${response}=    GET On Session     mydata     get
    Log    ${response.headers}

    # Validations
    ${status_code}=     Convert To String       ${response.status_code}
    Should Be Equal    ${status_code}   200

    # Additional Tests
    Should Contain    ${response.text}    "url": "${base_URL}get"

    # Simulate Error Response (Negative Testing)
    ${error_response}=    Get Request     mydata     status/404
    ${error_status_code}=     Convert To String       ${error_response.status_code}
    Should Be Equal    ${error_status_code}   404
