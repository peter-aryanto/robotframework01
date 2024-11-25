Robot Framework uses and runs existing libraries (https://www.youtube.com/watch?v=4hCegUxWKBQ).
On each library webpage there are 2 most important links: **Installation** (or project page or project on GitHub) and **Keywords**.

Example of 2 common libraries (https://robotframework.org/#resources):
- Selenium library (https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- Browser library (https://marketsquare.github.io/robotframework-browser/Browser.html)  
https://robotframework-browser.org  
https://docs.robotframework.org/docs/different_libraries/browser

Some setup scripts:
```
# conda deactivate # This is to deactivate any current environment from conda, e.g. <base>.


# The line right below may use either `python` or `python3`.
python3 -m venv .venv

# For Windows, the line right below needs to be replaced with: .venv\Scripts\activate
source .venv/bin/activate

pip install robotframework
robot --version
pip list

deactivate
```
