*** Settings ***
Library    BuiltIn
Library    Collections
Library    OperatingSystem

*** Test Cases ***
Run Tests from JSON
    ${json} =    Get File    ${CURDIR}/suite.json
    ${parsed_json} =    Evaluate    json.loads($json)

    ${suite_name} =    Get From Dictionary    ${parsed_json}    name
    Log    Running test suite: ${suite_name}

    ${tests} =    Get From Dictionary    ${parsed_json}    tests
    FOR    ${test}    IN    @{tests}
        ${test_name} =    Get From Dictionary    ${test}    name
        Log    Running test: ${test_name}

        ${steps} =    Get From Dictionary    ${test}    steps
        FOR    ${step}    IN    @{steps}
            Log    Running step: ${step}
            Run Keyword    BuiltIn.Log    This is Test 1
            Run Keyword    BuiltIn.Should Be Equal    4    4
            Run Keyword    BuiltIn.Log    This is Test 2
            Run Keyword    BuiltIn.Should Be Equal    9    9
        END
    END
