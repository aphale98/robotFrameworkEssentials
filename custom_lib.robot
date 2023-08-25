*** Settings ***
Library    ./pythonLibs/custom_lib.py

*** Test Cases ***
Calculate Square Test
    ${result}    Calculate Square    ${5}
    Should Be Equal As Integers    ${result}    25


