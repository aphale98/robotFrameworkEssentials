*** Settings ***
Resource    resources/page_objects.robot
Resource    resources/calculate_date.robot

*** Test Cases ***
SearchFlights
    Open Ixigo Website
    SelectOrigin    Pune
    SelectDestination    Bengaluru
    ${depart_date}=    SelectDepartureDate
    SelectReturnDate    ${depart_date}
    SelectTravelersAndClass
    VerifyJourneyDeatils
    CloseBrowserSession
