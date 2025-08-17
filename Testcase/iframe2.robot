
*** Settings *** 
Library     Browser
Suite Setup     Open Browser For Test 

*** Keywords *** 
Open Browser For Test 
    New Browser     chromium     headless=False     slowMo=0.2s 
    New Context     viewport={'width': 1600, 'height': 1000}
    New Page     https://ui.vision/demo/webtest/frames/

*** Test Cases *** 
TC1 IFrame 
    Fill Text    frame[src='frame_1.html'] >>> //input[@name='mytext1']     txt=frame_1 
    Fill Text    frame[src='frame_2.html'] >>> //input[@name='mytext2']     txt=frame_2 
    Fill Text    frame[src='frame_3.html'] >>> //input[@name='mytext3']     txt=frame_3 
    Fill Text    frame[src='frame_4.html'] >>> //input[@name='mytext4']     txt=frame_4
    Fill Text    frame[src='frame_5.html'] >>> //input[@name='mytext5']     txt=frame_5
    Sleep    2s
