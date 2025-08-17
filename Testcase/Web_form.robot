*** Settings ***
Library    Browser
Resource    ${CURDIR}/../Resource/web_form.resource
Suite Setup      Open Web Form
Suite Teardown    Close Browser
 
*** Test Cases ***
TC1 Web Form
    Senario Web Form
    Verify Form submitted