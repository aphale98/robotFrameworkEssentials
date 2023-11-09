*** Settings ***
Documentation   Example of variables
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${GREET}    Hello
${NAME}         Robot Framework
${VERSION}      2.0
${ROBOT}        ${NAME} ${VERSION}
${EXAMPLE}      This value is joined
...             together with a space.

${MULTILINE}    SEPARATOR=\n
...             First line.
...             Second line.

@{NAMES}        Matti       Teppo
@{NAMES2}       @{NAMES}    Seppo

@{NOTHING}
@{MANY}         one         two      three      four
...             five        six      seven
&{USER 1}       name=Matti    address=xxx         phone=123
&{USER 2}       name=Teppo    address=yyy         phone=456

&{MANYDICT}         first=1       second=${2}         ${3}=third

*** Test Cases ***
Constants
    Log    Hello
    Log    Hello, world!!

Variables
    Log    ${GREET}
    Log    ${GREET}, ${NAME}!!

Concatinate and singleline, multiline
    Log     ${ROBOT}
    Log     ${EXAMPLE}
    Log     ${MULTILINE}

List Variable
    Log    ${NAMES}
    Log    ${NAMES2}
    Log    ${NOTHING}
    Log    ${MANY}
Dictionary
    Log     ${USER 1}
    Log     ${USER 2}
    Log     ${MANYDICT}

List Example
    ${list} =    Create List    first    second    third
    Length Should Be    ${list}    3
    Log Many    @{list}

Item assignment to list
   ${list} =          Create List      one    two    three    four
   ${list}[0] =       Set Variable     first
   ${list}[${1}] =    Set Variable     second
   ${list}[2:3] =     Evaluate         ['third']
   ${list}[-1] =      Set Variable     last
   Log Many           @{list}

Item assignment to dictionary
   ${dictionary} =                Create Dictionary    first_name=unknown
   ${dictionary}[first_name] =    Set Variable         John
   ${dictionary}[last_name] =     Set Variable         Doe
   Log                            ${dictionary}

Dictionary Example
    &{dict} =    Create Dictionary    first=1    second=${2}    ${3}=third
    Length Should Be    ${dict}    3
    Log    ${dict.first}

Should Be Equal Example
    Should Be Equal    ${0b1011}    ${11}
    Should Be Equal    ${0o10}      ${8}

String
    ${string} =    Set Variable    abc
    Log    ${string.upper()}
    Log    ${string * 2}

Number
    ${number} =    Set Variable    ${-2}
    Log    ${number * 10}         # Logs -20
    Log    ${number.__abs__()}    # Logs 2