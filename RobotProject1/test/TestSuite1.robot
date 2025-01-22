*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    message=I am inside Test Suite Setup (will be executed before a Test Suite)
Suite Teardown    Log    message=I am inside Test Suite Teardown (will be executed after a Test Suite)
Test Setup    Log    message=I am inside Test Setup (will be executed before a Test Case)
Test Teardown    Log    message=I am inside Test Teardown (will be executed after a Test Case)

Task Tags    Sanity

*** Test Cases ***
MyFirstTest
    [Tags]          Smoke
    Log             message=I am inside 1st test

MySecondTest
    Log             message=I am inside 2nd test
    Set Tags        Regression1

MyThirdTest
    Log             message=I am inside 3rd test
    Set Tags        Regression2
    Remove Tags     Regression2

FirstSeleniumTest
    Open Browser    url=https://yahoo.com    browser=chrome
    Click Button    locator=name=agree
    Set Browser Implicit Wait    value=5
    Input Text      locator=id=ybar-sbq    text=Automation step by step
    Press Keys      None    ESC
    Set Browser Implicit Wait    value=5
    Click Button    locator=id=ybar-search
    Sleep           time_=5
    Close Browser
    Log             message=Test completed

SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser       url=${URL}    browser=ff
    Set Browser Implicit Wait    value=5
    LoginKW
    Click Element      locator=class=oxd-userdropdown-name
    Click Element      locator=link=Logout
    Close Browser
    Log                message=Test completed
    Log                message=This test was executed by %{username} on %{os}

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text         locator=name=username    text=${CREDENTIALS}[0]
    Input Password     locator=name=password    password=${LOGINDATA}[password]
    Click Button       locator=class=orangehrm-login-button