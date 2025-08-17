*** Settings ***
Library    Browser
 
*** Test Cases ***
เก็บค่า Page ที่เปิดใหม่ แล้วสลับกลับภายหลัง
    New Browser    chromium    headless=false
    New Context
 
    # เปิดเว็บแรก
    ${page1}=    New Page    https://example.com
    Log     ✅ เปิดหน้า 1: ${page1}
 
    # เปิดเว็บสอง
    ${page2}=    New Page    https://www.google.com
    Log     ✅ เปิดหน้า 2: ${page2}
 
    # เปิดเว็บสาม
    ${page3}=    New Page    https://demoqa.com/webtables
    Log     ✅ เปิดหน้า 2: ${page3}

    # สลับกลับหน้า 1 โดยใช้ตัวแปร
    Switch Page    ${page1}
    ${url1}=    Get Url
    Log     🔁 กลับมาที่: ${url1}    console=${True}
 
    # สลับหน้า 2 อีกครั้ง
    Switch Page    ${page3}
    ${title3}=    Get Title
    Log     🌐 Title หน้า 2: ${title3}    console=${True}
 
    Sleep   3s
    Close Browser