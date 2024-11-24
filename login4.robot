# conda deactivate
# .env\Scripts\activate OR in Linux: source .venv/bin/activate
# deactivate


*** Settings ***
Library    SeleniumLibrary
Library    Collections
# Library    RPA.Browser
Library    OperatingSystem
Library    my-webdriver-chrome.py

suite teardown    none
test teardown    none


*** Variables ***
${login url}    https://abr.business.gov.au/json/AbnDetails.aspx?abn=74172177893&callback=callback&guid=myguid
${request headers accept value}    text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
&{request headers}    Accept=${request headers accept value}

${app url}    https://www.google.com

${browser}    Chrome
#${user-data-path}    C:/Users/PC/AppData/Local/Google/Chrome/User Data
${chrome exe}    C:/Program Files/Google/Chrome/Application/chrome.exe


*** Test Cases ***
Valid Login
    ${user data path}=    my-webdriver-chrome.cwd
    log to console    ${user data path}

    open browser profiled    ${login url}


*** Keywords ***
open browser profiled
    [arguments]    ${url}

    # log to console    C:/Program Files/Google/Chrome/Application/chrome.exe
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    # ${options.binary_location}    set variable    ${chrome exe}
    ${options}=    my-webdriver-chrome.create webdriver options chrome
    # Call Method    ${options}    add_argument    --user-data-dir\=./user-data
    # log to console    ${options}
    Create WebDriver    ${browser}    options=${options}

    Go To    ${url}

    # # Open Browser    ${url}
