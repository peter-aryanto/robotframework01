# conda deactivate
# .venv\Scripts\activate OR in Linux: source .venv/bin/activate
# deactivate


# In this file, which is using Selenium Library, browser is managed to be kept open using ${detached} variable.
# If using Broser Library, similar outcome may be achievable using such setting with `auto_closing_level=manual`` as below (https://forum.robotframework.org/t/how-to-keep-the-browser-open-during-development/6447).
# *** Settings ***
# Library    Browser    auto_closing_level=manual


*** Settings ***
Library    SeleniumLibrary
Library    Collections
# Library    RPA.Browser
Library    OperatingSystem

Library    my-webdriver-chrome.py

# secrets.resource should contain ${broker portal password}
resource    secrets.resource

# suite teardown    none
# test teardown    none


*** Variables ***
${login url}    https://abr.business.gov.au/json/AbnDetails.aspx?abn=74172177893&callback=callback&guid=myguid
${request headers accept value}    text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
&{request headers}    Accept=${request headers accept value}

# ${app url}    https://secure.powershop.com.au/customers/17bdff/balance
${app url}    https://brokerportal.bluenrg.cd8.cloud/Quotations

${browser}    Chrome
#${user-data-path}    C:/Users/PC/AppData/Local/Google/Chrome/User Data
${chrome exe}    C:/Program Files/Google/Chrome/Application/chrome.exe


*** Test Cases ***
Valid Login
    ${user data path}=    my-webdriver-chrome.cwd
    # log to console    ${user data path}

    # open browser profiled    ${app url}    none
    # input text    id=Username    peter.aryanto+1@cleardynamics.com
    # input password    id=Password    ${broker portal password}
    # click element    xpath=/html/body/div[2]/div[2]/main/div/form/fieldset[2]/button
    # sleep    2s

    #### open browser profiled    ${login url}
    open browser profiled    ${app url}


*** Keywords ***
open browser profiled
    [arguments]    ${url}    ${detached}=True
    #### ${detached}=    convert to boolean    ${detached}

    # log to console    C:/Program Files/Google/Chrome/Application/chrome.exe
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    # ${options.binary_location}    set variable    ${chrome exe}
    ${options}=    my-webdriver-chrome.create webdriver options chrome    ${detached}
    # Call Method    ${options}    add_argument    --user-data-dir\=./user-data
    # log to console    ${options}
    Create WebDriver    ${browser}    options=${options}

    go to    ${url}

    # # Open Browser    ${url}
