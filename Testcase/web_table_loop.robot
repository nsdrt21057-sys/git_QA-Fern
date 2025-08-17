*** Settings ***
Library         Browser

*** Variables ***
${USER1}=    Create List    John    Doe    john.doe@example.com    32    50000    QA
${USER2}=    Create List    Jane    Smith  jane.smith@example.com  28    60000    Dev
${USER3}=    Create List    Bob     Lee    bob.lee@example.com     45    70000    HR

@{USERS}=    Create List    ${USER1}    ${USER2}    ${USER3}

*** Test Cases ***
Advanced Web Table Interaction
    [Documentation]    Test case for interacting with a web table on demoqa.com
    New Browser        headless=false    slowMo=1s
    New Context
    New Page           https://demoqa.com/webtables    wait_until=load
    Scroll To Element    //div[@class="rt-table"]

    # 1. เช็คว่าข้อมูลต้องมี 3 แถว
    ${rows}=    Get Element Count    //div[@class='rt-tr -odd' or @class='rt-tr -even']
    Should Be Equal    ${rows}    ${3}

    # 2. เช็ค email ทุกแถว
    FOR    ${index}    IN RANGE    ${rows}
        ${email}=      Get Text    xpath=(//div[@class="rt-tbody"]/div[@class="rt-tr-group"])[${index+1}]/div[@class="rt-tr -odd" or @class="rt-tr -even"]/div[4]
        Log            Checking Email: ${email}
        Should Contain    ${email}    @example.com
    END


    # ✅ 3. วนเพิ่มข้อมูลใหม่จาก list USERS
    # เพิ่มข้อมูลใหม่จาก USERS
    :FOR    ${user_data}    IN    @{USERS}
    \    Click        id=addNewRecordButton
    \    Fill Text    id=firstName    ${user_data[0]}
    \    Fill Text    id=lastName     ${user_data[1]}
    \    Fill Text    id=userEmail    ${user_data[2]}
    \    Fill Text    id=age          ${user_data[3]}
    \    Fill Text    id=salary       ${user_data[4]}
    \    Fill Text    id=department   ${user_data[5]}
    \    Click        id=submit

    # 4. เช็คจำนวนแถวใหม่ (ต้องเท่ากับ 3 + จำนวนที่เพิ่ม)
    ${final_rows}=      Get Element Count    //div[@class="rt-tbody"]/div[@class="rt-tr-group"]
    ${expected}=        Evaluate             ${rows} + len(${USERS})
    Should Be Equal     ${final_rows}        ${expected}

    # 5. วนเช็ค Age ถ้าเจอ 45 ให้ลบแถวนั้นออก
    FOR    ${index}    IN RANGE    ${final_rows}
        ${age}=      Get Text    xpath=(//div[@class="rt-tbody"]/div[@class="rt-tr-group"])[${index+1}]/div[@class="rt-tr -odd" or @class="rt-tr -even"]/div[3]
        Log          Found age: ${age}
        IF    '${age}' == '45'
            Click    xpath=(//div[@class="rt-tbody"]/div[@class="rt-tr-group"])[${index+1}]//span[contains(@id,"delete-record")]
            BREAK
        END
    END

    # 6. ตรวจสอบจำนวนแถวลดลง 1 หลังลบ
    ${after_delete}=    Get Element Count    //div[@class="rt-tbody"]/div[@class="rt-tr-group"]
    Should Be Equal     ${after_delete}      ${expected - 1}

    Close Browser