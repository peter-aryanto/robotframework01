# conda deactivate
# .env\Scripts\activate OR in Linux: source .venv/bin/activate
# deactivate

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${login-url}    https://secure.powershop.com.au
${browser}    chrome
# ${browser}    firefox


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Sleep    3s
    Type In Username    oraora
    Type In Password    paspas
    Sleep    3s
    Click Login Button
    Welcome Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${login-url}    ${browser}
    # Title Should Be    Login Page

Type In Username
    [Arguments]    ${input-text}
    Input Text    id=email    ${input-text}

Type In Password
    [Arguments]    ${input-text}
    Input Password    id=password    ${input-text}

Click Login Button
Welcome Page Should Be Open
Close Browser
