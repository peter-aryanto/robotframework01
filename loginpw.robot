# To keep browser open: https://forum.robotframework.org/t/how-to-keep-the-browser-open-during-development/6447
# *** Settings ***
# Library    Browser    auto_closing_level=manual


*** Settings ***
Library    Browser    jsextension=${CURDIR}/my-js-utils.js

# Suite Setup     New Browser    browser=chromium    headless=False
Suite Setup    New Browser    browser=chromium


*** Variables ***
${username}                 peter.aryanto@cleardynamics.com
${login provider}           aad
${app url}                  https://compareretail-retail-saiverglobal.dynamic.aieos.ai/NewSignUps/NewSignUp/0/s:Confirm_Service

${username cx}              peter.aryanto+1@cleardynamics.com
${login provider cx}        local
${app url cx}               https://customerportalproxy-retail-saiverglobal.dynamic.aieos.ai

${login url}                https://identity-retail-saiverglobal.dynamic.aieos.ai/testing/testlogin


*** Test Cases ***
Valid Login
    log to console              message=
    ${login bypass}=            evaluate    f'${login provider}:${username}'
    log to console              ${login bypass}
    ${login bypass headers}=    create dictionary    x-testing-auth-bypass=${login bypass}
    log to console              ${login bypass headers}
    new context                 extraHTTPHeaders=${login bypass headers}
    new page                    ${login url}

    new page                    ${app url}
    ${page title}=              get title
    log to console              message=
    log to console              ${page title}
    # ${expected page title}      set variable    Retail - Login
    ${expected page title}=     set variable    Compare Retail
    get title                   contains   ${expected page title}
    # get title                   equal      ${expected page title}
    # get title                   ==         ${expected page title}

    ${referring url}            get element    xpath=//*[@id="f_InternalData_ReferringURL"]/div[2]/div[1]/input
    # ${referring url}            get element by    label    Referring URL
    # ${referring url}            get attribute    xpath=//*[@id="f_InternalData_ReferringURL"]/div[2]/div[1]/input    type
    log to console              ${referring url}
    ${referring url value}      get attribute    ${referring url}    class
    log to console              ${referring url value}
    # ${referring url value}      ${referring url}    value
    # log to console              ${referring url value}
    # f_InternalData_ReferringURL
    # f_InternalData_IsFirstSignUp
    # f_ContactDetails_FirstName

    # ${texts}=                   evaluate javaScript    xpath=//*[@id="f_InternalData_ReferringURL"]/div[2]/div[1]/input    (elements, arg) => {
    ${text from field}=         evaluate javaScript    ${referring url}
    ...     (elements, arg) => {
    # ...         let text = []
    # ...             for (e of elements) {
    # ...                 console.log(e.innerText)
    # ...                 text.push(e.innerText)
    # ...             }
    # ...         text.push(arg)
    # ...         return text
    ...         const that = topFormViewModel();
    ...         const value = that.InternalData_ReferringURL()
    ...         return value;
    ...     }
    ...     all_elements=True
    ...     arg=Just another Text
    log to console              message=
    log to console              ${text from field}

    set value                   cdpath=InternalData_ReferringURL    newvalue=https://www.google.com
    ${new text from field}      get value    cdpath=InternalData_ReferringURL
    log to console              ${new text from field}

    fill text                   ${referring url}    https://duckduckgo
    ${text from field py}       get text    ${referring url}
    log to console              message=
    log to console              ${text from field py}

    # [Setup]    Bypass Login
    # Open Browser To Landing Page
    # Sleep    3s
    # Type In Username
    # Type In Password
    # Click Login Button
    # Welcome Page Should Be Open
    # [Teardown]    Close Browser

Valid Login CX
    log to console              message=
    ${login bypass}=            evaluate    f'${login provider cx}:${username cx}'
    log to console              ${login bypass}
    ${login bypass headers}=    create dictionary    x-testing-auth-bypass=${login bypass}
    log to console              ${login bypass headers}
    new context                 extraHTTPHeaders=${login bypass headers}
    new page                    ${login url}

    new page                    ${app url cx}
    ${page title}=              get title
    log to console              message=
    log to console              ${page title}
    ${expected page title}=     set variable    Saive
    get title                   contains   ${expected page title}


*** Keywords ***
Bypass Login
    # Http    ${login-url}    GET    None    headers={"x-testing-auth-bypass": "aad:peter.aryanto@cleardynamics.com"}
    &{res}=    Http    ${login-url}    GET
    Log    ${res}
    Sleep    3s
    New Page

Open Browser To Landing Page
    New Page    ${app-url}
    Get Title    contains    Compare Retail - New New Sign Up

Type In Username
    Sleep    3s
    [Arguments]    ${username}
    Input Text    id=username_field    ${username}
Type In Password
Click Login Button
Welcome Page Should Be Open
Close Browser
