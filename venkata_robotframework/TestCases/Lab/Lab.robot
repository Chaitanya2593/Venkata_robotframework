*** Settings ***
Variables         ../../AllFolders_location.py
Variables         ../../commonVariables.py
Library           ../../TestsAll/Allkeywords/commonkeywords.py


*** Variables ***
${abc}            ${EMPTY}
${BU_name}        ${EMPTY}
${env_from_CMD_line}    PCE

*** Test Cases ***
CreateCSVFilesValidDataForAllTablesAPI
    [Documentation]    Pre Requiste to the below scenrios
    Env_variableS

*** Keywords ***
SFMC Login
    Open Browser    ${sSalesForceURL}    gc
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id='username' or ancestor::*[contains(@class,'login-form-inputs') or ancestor::*[contains(@class,'element__control')]]]    15
    Input Text    xpath=//*[@id='username' or ancestor::*[contains(@class,'login-form-inputs')]]    ${sSFMCUsername}
    Input Password    xpath=//*[@id='password' or ancestor::*[contains(@class,'login-form-inputs')]]    ${sSFMCPassword}
    Comment    Click on the Login button
    Click Element    xpath=//*[@value='Log In' or @value='Login' and ancestor::*[contains(@class,'login-form-submit')]]

SelectBU
    [Arguments]    ${sBusinessUnit}
    Wait Until Element Is Visible    xpath=//*[@class='arrow visible' and ancestor::*[contains(@class,'header-menu-value')]]    120
    Click Element    xpath=//*[@class='arrow visible' and ancestor::*[contains(@class,'header-menu-value')]]
    Sleep    5
    Input Text    xpath=//*[contains(@class,'account-switcher-search') and contains(@class,'search-query form-control') and ancestor::*[contains(@class,'search form')]]    ${sBusinessUnit}
    Click Element    xpath=//*[contains(text(),'${sBusinessUnit}') and ancestor::*[contains(@class,'accounts')]]
    Sleep    10
    ${sTemp}    Get Text    xpath=//*[@class='value' and ancestor::*[contains(@class,'header-menu mc-header')]]
    Log    ${sTemp}
    Run Keyword If    '${sTemp}' == '${sBusinessUnit}'    Log    ${sBusinessUnit} + 'is selected successfully'
    Comment    Click on the Audience builder

Env_variableS
    ${EnvVar}=    Get_env_Variables    ${env_from_CMD_line}
    ${DRAGONCODE} =    Evaluate    $EnvVar.get('DRAGONCODE')
    Set Global Variable    ${DRAGONCODE}
    ${BU_ID}=    Evaluate    $EnvVar.get('BU_ID')
    Set Global Variable    ${BU_ID}
    ${BU_NAME}=    Evaluate    $EnvVar.get('BU_NAME')
    Set Global Variable    ${BU_NAME}
    ${CLIENTID}=    Evaluate    $EnvVar.get('CLIENTID')
    Set Global Variable    ${CLIENTID}
    ${CLIENTSECRET}=    Evaluate    $EnvVar.get('CLIENTSECRET')
    Set Global Variable    ${CLIENTSECRET}
