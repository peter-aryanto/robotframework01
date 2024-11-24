# conda deactivate
# .env\Scripts\activate OR in Linux: source .venv/bin/activate
# deactivate

*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    webdriver-manager.py

*** Variables ***
${login-url}    https://secure.powershop.com.au
# ${browser}    chrome
${browser}    Firefox
${gecko-driver}    C:/Users/PC/.cache/selenium/geckodriver/win64/0.35.0/geckodriver.exe
# ${gecko-driver}    C:\Users\PC\.cache\selenium\geckodriver\win64\0.35.0\geckodriver.exe
${gecko-driver-log}    ./gecko-log.txt


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Sleep    3s
    # Type In Username    oraora
    # Type In Password    paspas
    # Sleep    3s
    # Click Login Button
    # Welcome Page Should Be Open
    # [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    # Open Browser    ${login-url}    ${browser}
    # Title Should Be    Login Page

    # C:\Program Files\Mozilla Firefox\firefox.exe" --marionette
    ${service-args}=    Create List    --connect-existing    --marionette-port=2828    --marionette-host=127.0.0.1
    # log to console    here
    # ${driver-path}=    webdriver-manager.Get Driver Path With Browser    Firefox
    # ${gecko-driver}=    ${driver-path}
    # ${gecko-driver}=    webdriver-manager.Get Driver Path With Browser    Firefox
    # log to console    ${gecko-driver}
    log to console    here
    # Create Webdriver    ${browser}    executable_path=${gecko-driver}    service_args=${service-args}    service_log_path=${gecko-driver-log}
    # Create Webdriver    ${browser}    service=${gecko-driver} ${service-args}   # options=${service-args}    # service_log_path=${gecko-driver-log}
    Create Webdriver    ${browser}    service=C:/Users/PC/.cache/selenium/firefox/win64/132.0.2/private_browsing.exe ${service-args}   # options=${service-args}    # service_log_path=${gecko-driver-log}
    log to console    here
    Go To    ${login-url}

    # ${ff default caps}    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
    # Set To Dictionary    ${ff default caps}    marionette=True
    # Open Browser    https://www.stackoverflow.com    ff

# Type In Username
#     [Arguments]    ${input-text}
#     Input Text    id=email    ${input-text}

# Type In Password
#     [Arguments]    ${input-text}
#     Input Password    id=password    ${input-text}

# Click Login Button
# Welcome Page Should Be Open
# Close Browser
