*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    DateTime

*** Variables ***
${url}     https://thetestingworldapi.com


*** Test Cases ***
Add New Data
    [Documentation]    Add new data via POST request
    Create Session    addData    ${url}
    &{header}=      Create Dictionary    Content-Type=application/json

    ${request_body}=    Create Dictionary
    Set To Dictionary    ${request_body}    first_name=John
    Set To Dictionary    ${request_body}    middle_name=Sam
    Set To Dictionary    ${request_body}    last_name=Doe
    Set To Dictionary    ${request_body}    date_of_birth=01/01/1998

    ${response}=    Post Request    addData    api/studentsDetails    json=${request_body}  headers=${header}

    # Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201    # Check for a successful POST status code

    # Clean up
    Delete All Sessions
