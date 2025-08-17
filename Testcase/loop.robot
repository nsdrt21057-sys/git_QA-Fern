*** Settings ***
Library    BuiltIn

*** Variables ***
@{names}          Alice     Bob    Charlie
@{departments}    บัญชี    ไอที    บุคคล
@{fruits}        Apple    Banana    Mango

*** Test Cases ***
loop Fixed Valus
    FOR    ${Fruit}    IN    Apple    Banana    Mango
        Log    ผลไม้ : ${Fruit} 
    END

For In Enumerate
    FOR    ${i}    ${name}    IN ENUMERATE    @{name}
        Log    ลำดับ ${i+1} : ${name}    console=${True}
    END

Loop Range
    FOR    ${i}    IN RANGE    1    6
        Log    รอบที่ : ${i}     console=${True}
    END

For In Zip Basic
    FOR    ${name}    ${department}    IN ZIP    ${names}    ${departments}
        Log    ${name} อยู่แผนก  ${department}     console=${True}
    END