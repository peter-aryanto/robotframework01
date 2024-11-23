# conda deactivate
# .env\Scripts\activate OR in Linux: source .venv/bin/activate
# deactivate

*** Settings ***
Library    Browser
Library    RequestsLibrary
Suite Setup    New Browser    browser=chromium    headless=False
Suite Teardown    Close Browser
Test Setup    New Context

*** Variables ***
# ${login-url}    https://identity-retail-saiverglobal.dynamic.aieos.ai/testing/testlogin
# ${app-url}    https://compareretail-retail-saiverglobal.dynamic.aieos.ai/NewSignUps/NewSignUp/0/s:Confirm_Service
${login-url}    https://secure.powershop.com.au
${app-url}    https://secure.powershop.com.au/customers/172466/balance
# &{login-headers}    Create Dictionary    Accept=*/*
${accept-header}    text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
&{login-headers}    Accept=${accept-header}


*** Test Cases ***
Valid Login
    [Setup]    Bypass Login
    # Open Browser To Landing Page
    Sleep    3s
    # Type In Username
    # Type In Password
    # Click Login Button
    # Welcome Page Should Be Open
    # [Teardown]    Close Browser

*** Keywords ***
Bypass Login
    # Log to Console    message=
    # Log to Console    */*

    # Http    ${login-url}    GET    None    headers={"x-testing-auth-bypass": "aad:peter.aryanto@cleardynamics.com"}
    # &{res}=    Http    ${login-url}    GET
    # Http    ${login-url}    method=GET
    #### ${res}=    GET    ${login-url}    headers=${login-headers}
    ${res}=    POST    ${login-url}    headers=${login-headers}
    # Log    ${res}
    Sleep    3s
    # New Page

# Open Browser To Landing Page
#     New Page    ${app-url}
#     Get Title    contains    Compare Retail - New New Sign Up

# Type In Username
#     Sleep    3s
#     [Arguments]    ${username}
#     Input Text    id=username_field    ${username}
# Type In Password
# Click Login Button
# Welcome Page Should Be Open
# Close Browser
