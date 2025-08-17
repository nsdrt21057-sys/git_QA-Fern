*** Settings ***
Library    Browser

*** Test Cases ***
Advanced Web Table Interaction
    New Browser    headless=false    slowMo=1s
    New Context
    New Page    https://demoqa.com/webtables    wait_until=load
    Scroll To Element    //div[@class="rt-table"]

    # 1. เช็คว่าข้อมูลต้องมี 3 แถว
    ${rows}=    Get Element Count    //div[@class='rt-tr -odd' or @class='rt-tr -even']
    Should Be Equal    ${rows}    ${3}

    # 2. วนลูปเช็ค Email ทุกแถว ว่าต้องลงท้ายด้วย @example.com
    FOR    ${index}    IN RANGE    ${rows}
        ${email}=    Get Text    xpath=(//div[@class='rt-tr -odd' or @class='rt-tr -even'])[${index}+1]/div[@class='rt-td'][4]
        Log    Checking Email: ${email}
        Should Contain    ${email}    @example.com
    END

     # ✅ 3. เพิ่มข้อมูลใหม่
    Click        id=addNewRecordButton
    Fill Text    id=firstName    John
    Fill Text    id=lastName     Doe
    Fill Text    id=userEmail    john.doe@example.com
    Fill Text    id=age          32
    Fill Text    id=salary       50000
    Fill Text    id=department   QA
    Click        id=submit

    # 4. เช็คว่าข้อมูลต้องมี 4 แถว
    ${rows}     Get Element Count    //div[@class='rt-tr -odd' or @class='rt-tr -even']
    Should Be Equal    ${rows}    ${4}

    # 5. วนเช็ค Age ถ้าเจอ ถ้าเจออายุ เท่ากับ 45 ให้ลบแถวนั้นออก
    FOR    ${index}    IN RANGE    ${rows}
        ${age}=    Get Text    xpath=(//div[@class='rt-tr -odd' or @class='rt-tr -even'])[${index}+1]/div[@class='rt-td'][3]
        Log    Show age: ${age}
        IF    ${age} == ${45}
            Click    //span[@id="delete-record-${index+1}"]
            BREAK
        END
    END    