*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***

${Loginid}        test@kennect.io
${Password}       Qwerty@1234
${Name}           Harry
${Email}          harry@gmail.com
${MobNo}          9988776644
${Height}           150
${Weight}           58
${Gender}           Male
${Age}              25
${systolic}         100
${diastolic}        99



*** Test Cases ***

Login Page
    Login Page
Home Page
    Home Page
Cost Calculator for Blood Test
    Cost Calculator for Blood Test
Adding Patients and Creating Tests
    Adding Patients and Creating Tests

*** Keywords ***

Login Page

    Create Webdriver                     Chrome              /Users/Q9350/PycharmProjects/Chromedriver.exe
    Go To                                https://gor-pathology.web.app/
    Maximize Browser Window
    Input Text                           xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input'])[1]    ${Loginid}
    Sleep                                2s
    Input Password                       xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input'])[2]    ${Password}
    Sleep                                2s
    Wait Until Element Is Visible        xpath:(//button[@type='submit'])[1]

Home Page

    Click Button                         xpath:(//button[@type='submit'])[1]
    Wait Until Element Is Visible        xpath://div[@class='title']
    Sleep                                3s
    Execute JavaScript                   window.scrollTo(0, document.body.scrollHeight)
    Sleep                                3s
    Execute JavaScript                   window.scrollTo(0, document.body.scrollHeight)


Cost Calculator for Blood Test

    ${result}=                           Get Text        xpath://p[@class='MuiFormHelperText-root MuiFormHelperText-contained MuiFormHelperText-filled']
    Should Be Equal As Strings           ${result}       Discount for customer
#    Input Text                          xpath://input[@id='patient-test']               Beans
#    Press Keys                          xpath://input[@id='patient-test']             ARROW_DOWN               RETURN

Adding Patients and Creating Tests

    Click Element                         xpath://span[normalize-space()='Patients']
    Wait Until Element Is Visible         xpath:(//span[text()='Add Patient'])[1]           20
    Click Element                         xpath:(//span[text()='Add Patient'])[1]
    Input Text                            xpath://input[@name='name']                   ${Name}
    Input Text                            xpath://input[@name='email']                ${Email}
    Input Text                            xpath://input[@name='phone']                ${MobNo}
    Sleep                                 4s
    Click Element                         xpath:(//span[text()='General Details'])[2]
    Wait Until Element Is Visible         xpath://input[@name='height']               20
    Input Text                            xpath://input[@name='height']               ${Height}
    Input Text                            xpath://input[@name='weight']               ${Weight}
    Click Element                         xpath://div[@id='mui-component-select-gender']
    sleep                                 3s
    Input Text                            id:mui-component-select-gender               Male
    Sleep                                 3s
#    Input Text                           Input Text                          xpath://input[@id='patient-test']               Beans
#    Click Element                        xpah://li[normalize-space()='Male']
    Press Keys                            id:mui-component-select-gender               ARROW_DOWN               RETURN
    Input Text                            xpath://input[@name='age']                  ${Age}
    Input Text                            xpath://input[@name='systolic']             ${systolic}
    Input Text                            xpath://input[@name='diastolic']            ${diastolic}
    Click Button                          xpath:(//span[text()='Add Tests'])[2]
    Input Text                            xpath://input[@id='patient-test']               Beans
    Press Keys                            xpath://input[@id='patient-test']             ARROW_DOWN               RETURN\
    Press Keys                            xpath://div[@class='MuiFormControl-root']//div[@role='button']             ARROW_DOWN               RETURN
    Press Keys                            xpath://input[@id='mui-90545']             ARROW_DOWN               RETURN
#    ${result}=                           Get Text        xpath://p[text()='* Incorrect username or password']
#    Should Be Equal As Strings           ${result}       * Incorrect username or password
    Press Keys                            xpath://div[@id='mui-component-select-doctor_commission']             ARROW_DOWN               RETURN
    Sleep                                  3s
    Click Element                         xpath://span[@class='material-icons MuiIcon-root']
    Click Button                          xpath://span[@class='MuiButton-label jss105']
    Click Button                          xpath://span[@class='MuiButton-label jss416']