*** Keywords ***
Say Hi
    [Arguments]    ${name}    ${role}=QA
    Log    message=Say Hi!! ${name}   console=${True}
    Log    message=Role : ${role}   console=${True}
    RETURN    Name : ${name} , Role : ${role}

Hello ${name}
    Log    message=Hello! ${name}    console=${True}