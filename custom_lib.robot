*** Settings ***
Library    custom_lib

*** Test Cases ***
Calculate Square Test
    ${result}    Calculate Square    ${5}
    Should Be Equal As Integers    ${result}    25


