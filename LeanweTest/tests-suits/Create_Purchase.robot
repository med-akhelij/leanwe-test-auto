*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../ressources/helpers.resource
Suite Setup       Open Browser And Login
# Suite Teardown    Close Browser


*** Variables ***


*** Test Cases ***
CREATE A NEW PURCHASE
    LOG IN AS SUPPORT
    SELECT PURCHASE ITEM FROM SIDEBAR
    ${purchase_name}=   FILL OUT THE PURCHASE CREATION FORM
    Set Global Variable    ${GLOBAL_PURCHASE_NAME}    ${purchase_name}

SEARCH FOR THE CREATED PURCHASE
    ${purchase_name}=    Get Variable Value    ${GLOBAL_PURCHASE_NAME}
    SEARCH FOR A PURCHASE                      ${purchase_name}
    Sleep    2s

VERIFY THE FILTERS IN PURCHASE PAGE
    ${purchase_name}=    Get Variable Value    ${GLOBAL_PURCHASE_NAME}
    APPLY FILTERS IN PURCHASE PAGE             ${purchase_name}
    Sleep    2S