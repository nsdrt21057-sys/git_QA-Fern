*** Settings ***
Library           Browser
Suite Setup       Open Browser For Test
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://ui.vision/demo/webtest/frames/
${VIEWPORT}       {'width': 1600, 'height': 1000}

*** Keywords ***
Open Browser For Test
    New Browser    chromium    headless=False    slowMo=0.2s
    New Context    viewport=${VIEWPORT}
    New Page       ${URL}

Fill Frame Input
    [Arguments]    ${frame_src}    ${input_name}    ${text}
    ${locator}=    Set Variable    frame[src='${frame_src}'] >>> //input[@name='${input_name}']
    Wait For Elements State    ${locator}    visible    5s
    Fill Text    ${locator}    ${text}

*** Test Cases ***
TC1 IFrame - Fill All Frames
    Fill Frame Input    frame_1.html    mytext1    txt=frame_1
    Fill Frame Input    frame_2.html    mytext2    txt=frame_2
    Fill Frame Input    frame_3.html    mytext3    txt=frame_3
    Fill Frame Input    frame_4.html    mytext4    txt=frame_4
    Fill Frame Input    frame_5.html    mytext5    txt=frame_5

    Sleep    3s
