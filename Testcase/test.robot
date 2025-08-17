*** Settings ***
Library     Browser
Library     Collections
Variables    ${CURDIR}/../Configs/var.yaml
Resource     ${CURDIR}/../Resource/common_keywords.resource
Resource    ${CURDIR}/../Variables/common_var.robot


*** Test Cases ***
Simple IF
    [Documentation]    Owner: Kachain.a
    [Tags]    if1
    ${random_number}    Evaluate    random.randint(0, 10)
    # อ่านเพิ่มเติมการสุ่มตัวเลขในภาษา Python: http://marcuscode.com/lang/python/random-numbers-in-python
    IF    ${random_number} > 5
        Log    Number ${random_number} more than 5     console=yes
    END  
    #คำถาม ถ้า ${random_number} มีค่าน้อยกว่า 5 จะเป็นอย่างไรครับ
    IF    ${random_number} < 5     Log    Number ${random_number} less than 5     console=yes

Simple IF ELSE
    [Documentation]    Owner: Kachain.a
    [Tags]    if2
    ${random_number}    Evaluate    random.randint(0, 10)
    IF    ${random_number} > 5
        Log    ${random_number} is odd!     console=yes
    ELSE
        Log    Number is ${random_number}     console=yes
    END
    #คำถาม ถ้า ${random_number} มีค่าเท่ากับ 5 จะเข้า IF หรือ ELSE

Simple IF ELSE IF ELSE
    [Documentation]    Owner: Kachain.a
    [Tags]    if3
    ${random_letters}    Evaluate    random.choice(['A', 'B', 'C', 'D', 'E'])
    IF     '${random_letters}' == 'A'
        Log    I am 'A'     console=yes
    ELSE IF  '${random_letters}' == 'C'
        Log    I am 'C'     console=yes
    ELSE
        Log    I am '${random_letters}' is not 'A' or 'C'     console=yes
    END
    #คำถาม ถ้า ${random_letters} มีค่าเท่ากับ B จะเข้าไปทำงานบรรทัดไหน IF หรือ ELSE

Nested IF Example
    [Tags]    if4
    ${attendance}=    Set Variable    85
    ${score}=         Set Variable    45
    IF    ${attendance} >= 80
        IF    ${score} >= 50
            Log    ผ่านทั้งสองเงื่อนไข
        ELSE
            Log    ขาดคะแนน ไม่ผ่านเกณฑ์
        END
    ELSE
        Log    ขาดเรียน ไม่เข้าเกณฑ์
    END
    #ต้องผ่านทั้งคะแนน และ การเข้าเรียน
    #เงื่อนไขแรก: ตรวจสอบการมาเรียน
    #ถ้าเข้าเกณฑ์ → เช็คต่อว่า คะแนนผ่านไหม
    #ถ้าไม่เข้าเกณฑ์ตั้งแต่แรก → ตัดสิทธิ์ทันที



TC_Say Hi
    [Tags]    say1
    Say Hi    name=Fern 
    ${value}    Say Hi  name=Fern   role=QA
    Log    message=${value}    console=${True}
    Hello Sudarat , Fern 


TC_1
    [Tags]    tc1
    Log    message=Say Hi!!     console=${True}
    Log    message=${user}    console=${True}

TC_2
    [Tags]    tc2
    Log    message=${user}    console=${True}
    Log    message=${animal}[1]    console=${True}
    Log    message=${profile.nickname}      console==${True}
    Log    message=${profile}[firstname]      console==${True}

TC_3 Variables of keyword
    [Tags]    tc3
    ${value}    Set Variable     Detail 
    ${car}    Create List    NISSAN    TOYOTA    HONDA
    ${user}     Create Dictionary       nickname=Fern    phone=095-5569653
    Log    message=${value}    console=${True}    
    Log    message=${car}    console=${True}
    Log    message=${user}    console=${True} 
    append to list    ${car}    Kawa
    Log    message="Car" >>>>>>${SPACE*3}${car}    console=${True}
    log    message="TEST_NAME" >>>>>>${SPACE*3}${TEST_NAME}    console=${True}


TC_4 YAML
    [Tags]    tc4
    log    message="string_value" >>>>>>${SPACE*3}${string_value}    console=${True}
    log    message="list_value" >>>>>>${SPACE*3}${list_value}[2]    console=${True}
    log    message="dict_value" >>>>>>${SPACE*3}${dict_value.name}    console=${True}

Test Documentation
    [Tags]    Doc
    [Documentation]    
    ...    = คำอธิบาย =
    ...    *วัตถุประสงค์*: ทดสอบการจัดรูปแบบ _documentation_
    ...
    ...    = Inline Styles =
    ...    *ตัวหนา* , _ตัวเอียง_ , _*ข้อความหนา+เอียง*_ , ${\n}โค้ด inline ``โค้ดแบบ inline``
    ...    ${\n}                        
    ...    ลิงก์: https://robotframework.org
    ...                
    ...    = รายการแบบ Bullet =
    ...    - เปิดเว็บไซต์
    ...    - กรอกชื่อผู้ใช้
    ...    - คลิกปุ่มล็อกอิน  
    ...                    
    ...    = ตาราง (Table) =
    ...    | Username | Role     |
    ...    | admin    | Manager  |
    ...    | guest    | Viewer   |          
    ...    
    ...    = block =
    ...    | inside block
    ...    |    some   additional whitespace
    ...    |        some detail inside block
    Log    "Topic: Documents"

