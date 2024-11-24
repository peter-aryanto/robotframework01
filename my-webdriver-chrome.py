from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import os


def create_webdriver_options_chrome(detached=None):
    o = webdriver.ChromeOptions()
    # o.add_argument("--no-sandbox") # ERROR:direct_composition_support.cc(1034)] QueryInterface to IDCompositionDevice4 failed: No such interface supported (0x80004002)
    o.add_argument("disable-extensions")
    # o.add_argument("--start-maximized")

    cwd = os.getcwd()
    o.add_argument("--user-data-dir=" + os.path.join(cwd, 'user-data'))
    # o.add_argument("--user-data-dir=C:/Users/PC/AppData/Local/Google/Chrome/User Data 2") # This WORKS!!!
    o.add_argument("--disable-dev-shm-usage")
    o.add_argument('--disable-infobars')
    o.add_argument("--remote-debugging-port=9222")

    # o.binary_location = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    o.binary_location = "C:/Program Files/Google/Chrome/Application/chrome.exe" # The above also works!

    # if detached is True:
    if detached is not None:
        o.add_experimental_option("detach", True)

    return o


def cwd():
    # return os.getcwd()
    return os.path.join(os.getcwd(), 'user-data')
