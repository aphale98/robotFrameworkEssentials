*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    DateTime

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com


*** Test Cases ***
Test GET Request
    [Documentation]    Test a GET request
    Create Session    API    ${base_url}
    ${response}=    Get Request    API    /users
    Should Be Equal As Integers    ${response.status_code}    200
    Delete All Sessions

Test POST Request
    [Documentation]    Test a POST request
    Create Session    API    https://jsonplaceholder.typicode.com

    ${request_body}=    Evaluate    json.dumps({'title': 'foo', 'body': 'bar', 'userId': 1})
    ${headers}=    Create Dictionary    Content-Type=application/json; charset=UTF-8

    ${response}=    Post Request    API    /posts    data=${request_body}    headers=${headers}

    Should Be Equal As Strings    ${response.status_code}    201    # Check for a successful POST status code
    Delete All Sessions



Test PUT Request
    [Documentation]    Test a PUT request
    Create Session    API    ${base_url}
    ${request_body}=    Create Dictionary
    Set To Dictionary    ${request_body}    title=updated_foo
    Set To Dictionary    ${request_body}    body=updated_bar

    ${headers}      Create Dictionary    Content-Type=application/json; charset=UTF-8
    ${response}=    PUT On Session    API    /posts/1    json=${request_body}    headers=${headers}
    Should Be Equal As Integers   ${response.status_code}    200    # Check for a successful PUT status code
    Delete All Sessions

Test DELETE Request
    [Documentation]    Test a DELETE request
    Create Session    API    ${base_url}
    ${response}=    Delete Request    API    /posts/1
    Should Be Equal As Integers   ${response.status_code}    200    # Check for a successful DELETE status code
    Delete All Sessions
