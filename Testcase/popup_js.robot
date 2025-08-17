*** Settings ***
Library    Browser
 
*** Keywords ***
Open Browser For Test
    New Browser    chromium    headless=False    slowMo=0.2s
    New Context    viewport={'width': 1600, 'height': 1000}
    New Page       https://the-internet.herokuapp.com/javascript_alerts
 
*** Test Cases ***
Popup JS
    Open Browser For Test
    Handle Future Dialogs    accept
    Click    selector=//button[normalize-space()='Click for JS Prompt']
    Take Screenshot    filename=popup1
    Take Screenshot    filename=popup2     mask=//button[text()='Click for JS Alert']