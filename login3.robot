# conda deactivate
# .env\Scripts\activate OR in Linux: source .venv/bin/activate
# deactivate


*** Settings ***
Library    SeleniumLibrary
Library    Collections
# Library    RPA.Browser
# Library    OperatingSystem


*** Variables ***
${login-url}    https://abr.business.gov.au/json/AbnDetails.aspx?abn=74172177893&callback=callback&guid=myguid
${request headers accept value}    text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
&{request headers}    Accept=${request headers accept value}

${app-url}    https://www.google.com

#${user-data-path}    C:/Users/PC/AppData/Local/Google/Chrome/User Data


*** Test Cases ***
Valid Login
    Open Browser Profiled    ${login-url}
    # Open Browser Profiled    ${app-url}
    Sleep    3s
    # Type In Username    oraora
    # Type In Password    paspas
    # Sleep    3s
    # Click Login Button
    # Welcome Page Should Be Open
    # [Teardown]    Close Browser

*** Keywords ***
Open Browser Profiled
    [Arguments]    ${url}
    # ${user data path}=    Get Environment Variable    USER_DATA_PATH    # C:\Users\PC\AppData\Local\Google\Chrome\User Data
    # ${user-data-path}=    C:/Users/PC/AppData/Local/Google/Chrome/User Data

    # ${user-data-path}=    test 123
    log to console    ${user-data-path}
    log to console    here

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --user-data-dir\=./user-data
    Create WebDriver    Chrome    options=${options}
    # Create WebDriver    Firefox    options=${options}
    Go To    ${url}

    # Open Browser    ${url}
