*** Settings ***
Library     SeleniumLibrary
Library     ../pythonLibs/min_list.py
Library    String
Library    Collections

*** Variables ***
${IXIGO_URL}    https://www.ixigo.com/
${BROWSER}      Chrome

*** Keywords ***
Open Ixigo Website
    Create Webdriver    ${BROWSER}
    Go To    ${IXIGO_URL}
    Maximize Browser Window
    Set Selenium Implicit Wait    10 seconds

SelectOrigin
    [Arguments]    ${origin}
    Input Text    css:input.c-input.u-v-align-middle    ${origin}
    Wait Until Element Is Visible    css:.autocompleter-results
    Click Element    xpath://div[contains(text(), 'PNQ - ${origin}, India')]

SelectDestination
    [Arguments]    ${destination}
    Execute JavaScript    document.querySelector('input[placeholder="Enter city or airport"]').value = '${destination}'
    Wait Until Element Is Visible    css:.autocompleter-results
    Click Element    xpath://div[contains(text(), 'BLR - ${destination}, India')]

SelectTravelersAndClass
    Click Element    id=passenger-list
    Click Element    css:div[class='passanger-class-input u-pos-rel'] div:nth-child(1) div:nth-child(2) span:nth-child(4)
    Click Element    css=div[class='u-box-result'] div:nth-child(2) div:nth-child(2) span:nth-child(3)
    Click Element    css=div[class='banner'] div:nth-child(3) div:nth-child(2) span:nth-child(2)

VerifyJourneyDeatils
    Click Element       css:div[class='search u-ib u-v-align-bottom'] div:nth-child(1)
    Wait Until Element Is Visible    css:div[class='result-col outr'] div[class='c-flight-listing-split-row selected hide-detail'] img   timeout=20s
    Page Should Contain Element    xpath://input[@value='PNQ - Pune']
    Page Should Contain Element    xpath://input[@value='BLR - Bengaluru']
    Page Should Contain Element    xpath://input[@value='7 Passengers, Economy']

CloseBrowserSession
    Close Browser

