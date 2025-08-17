*** Settings ***
Library    Browser
 
*** Keywords ***
Open Web Form
    New Browser    chromium    headless=${False}     slowMo=1s
    New Context    viewport={"width": 1280, "height": 768}
    New Page       url=https://www.selenium.dev/selenium/web/web-form.html

Verify Form submitted
    Wait For Elements State    text=Form submitted    visible    timeout=5s
    Take Screenshot    Form submitted
 
Senario Web Form
    Fill Text    id=my-text-id    txt=Hello Robot !!!! 
    Fill Text    input[name='my-password']    txt=123456
    Fill Text    textarea[name='my-textarea']    txt=Hello Robot !!!! 
    Get Property     input[name="my-disabled"]    disabled
    Get Property     input[name="my-readonly"]    readOnly
    Select Options By    select[name='my-select']    text    Three
    Type Text            input[name="my-datalist"]       New York     delay=0.2s
    Upload File By Selector    selector=input[name="my-file"]    path=${CURDIR}/../Testcase/data.txt
    Uncheck Checkbox    id=my-check-1
    Check Checkbox      id=my-check-2
    Click    id=my-radio-2
    Fill Text    input[name="my-colors"]    txt=#00ffff
    Type Text    input[name="my-date"]      16/08/2025     delay=0.2s
    Click        //h1[text()="Web form"]  
 
    # Range Slider
    ${box}=    Get Bounding Box    input[name="my-range"]
    Log    ${box}
    #ความกว้างทั้งหมด = width = 356 , จุดกึ่งกลางอยู่ที่ x = 178 (356 ÷ 2)
    ${offset}=    Evaluate    int(${box['width']} / 2)
    Drag And Drop Relative To    input[name="my-range"]    -${offset}    0    steps=20
 
    Take Screenshot     fullPage=${True}
 
    Click     button[type="submit"]