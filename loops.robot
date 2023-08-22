*** Settings ***
Documentation   Control structures demo.
Library         OperatingSystem

*** Variables ***
@{fruits}    Apple    Banana    Orange
${counter}   0

*** Test Cases ***
FOR Loop Example
    [Documentation]   Demonstrates a FOR loop.
    FOR    ${fruit}    IN    @{fruits}
        Log    Current fruit: ${fruit}
    END

WHILE Loop Example
    [Documentation]   Demonstrates a WHILE loop.
    ${counter}    Set Variable    0
    WHILE    ${counter} < 5
        Log    Current counter value: ${counter}
        ${counter}    Evaluate    ${counter} + 1
    END

Loop Control Example
    [Documentation]   Demonstrates loop control with BREAK and CONTINUE.
    FOR    ${fruit}    IN    @{fruits}
        Run Keyword If    '${fruit}' == 'Banana'    Continue For Loop
        Log    Current fruit: ${fruit}
        Run Keyword If    '${fruit}' == 'Orange'    Exit For Loop
    END

IF/ELSE Example
    [Documentation]   Demonstrates IF/ELSE syntax.
    ${value}    Set Variable    42
    IF    ${value} == 42
        Log    The value is 42
    ELSE
        Log    The value is not 42
    END