*** Settings ***
Library    Browser
Library    Collections
 
*** Variables ***
${URL}    https://tympanus.net/Development/PageLoadingEffects/index.html
@{effects}    Lazy Stretch    Circle    Spill    Frame it
...    Tunnel vision    Windscreen wiper    Jammed blind    Parallelogram
...    Tilted    Lateral Swipe    Wave    Origami    Curtain
 
*** Keywords ***
Open Browser For Test
    New Browser    chromium    headless=False
    New Context    viewport={'width': 1600, 'height': 1000}
    New Page       ${URL}

*** Test Cases ***
# TC1 Page loading
#     Open Browser For Test
    # Click    selector=//a[normalize-space()='Circle']
    # Click    selector=//a[normalize-space()='Show Page Loader']
    # Click    selector=//a[normalize-space()='Go back']
    # Take Screenshot
#loop กด 13 รอบ
    # ${count}     Get Element Count    selector=//nav[@class='codrops-demos']/a
    # Log    Count : ${count}    console=${True}
    # FOR    ${i}     IN RANGE     1   ${count}+${1}
    #     Click    xpath=(//nav[@class='codrops-demos']/a)[${i}]
    #     Click    selector=//a[normalize-space()='Show Page Loader']
    #     Take Screenshot    effect-{index}
    #     Click    selector=//a[text()='Go back']
    #     IF    ${i} == 3
    #         Log    หยุดการทำงานเมื่อค่า ${i} == 3    console=yes
    #         BREAK
    #     END 
    # END

TC_2 Loop IN Effects
    Open Browser For Test
    Log    Effect: ${effects}    console=yes
    FOR    ${name}    IN    @{effects}
        IF    '${name}' == 'Circle'
            CONTINUE
        END
        Log    Effect Name : ${name}    console=${True}
        Click    text=${name}
        Click    selector=//a[normalize-space()='Show Page Loader']
        Take Screenshot    effect-{index}
        Click    selector=//a[text()='Go back']
    END
