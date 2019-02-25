*** Settings ***
Documentation     This Test Suite Executes the Scenarios related to the API calls
...
...               Tables Tested::
...               1. CONSUMER
...               2. CHILD
...               3. OPTIN
...               4. CONSUMERINTEREST
...               5. EXTERNAL IDENTITY
...
...               Tags::
...               nonsfmc :: Scenrios which doesn't require Salesforce application
...               sfmc :: Scenrios which does require Salesforce application
...
...
...               Description:
...
...               This API calls mainly Validate the when we are trying to send a invalid data.
Suite Teardown    Delete existing fake files
Variables         ../../AllFolders_location.py
Variables         ../../commonVariables.py
Library           ../../TestsAll/Allkeywords/commonkeywords.py
Library           ../../TestsAll/Allkeywords/webApplicationkeywords.py
Library           ../../TestsAll/Allkeywords/winapplnkeywords.py
Library           ../../TestsAll/Allkeywords/apicallkeywords.py

*** Variables ***
${env_from_CMD_line}    PCE
${testexecution_key}    ${EMPTY}

*** Test Cases ***
DCMTT-570_[API][Consumer]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][Consumer]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-570
    [Tags]    nonsfmc    consumer
    Env_variableS
    Comment    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    CONSUMER    ${BU_name}    SFTP
    Comment    Perform API calls and validate the output for data with Data errors    Consumer
    [Teardown]    Xray_StatusUpate

DCMTT-575_[API][OptIn]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][OptIn]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Opt In] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-575
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    OPTIN    ${BU_name}    SFTP
    Perform API calls and validate the output for data with Data errors    Opt In
    [Teardown]    Xray_StatusUpate

DCMTT-684_[API][ExternalIdentity]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][ExternalIdentity]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][External Identity] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-684
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    EXTERNALIDENTITY    ${BU_name}    SFTP
    Perform API calls and validate the output for data with Data errors    External Identity
    [Teardown]    Xray_StatusUpate

DCMTT-574_[API][Child]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][Child]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Child] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-574
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    CHILD    ${BU_name}    SFTP
    Perform API Calls And Validate The Output For Data With Data Errors    Child
    [Teardown]    Xray_StatusUpate

DCMTT-739_[API][ConsumerInterest]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][ConsumerInterest]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Interest] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-739
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    CONSUMERINTEREST    ${BU_name}    SFTP
    Perform API Calls And Validate The Output For Data With Data Errors    Consumer Interest
    [Teardown]    Xray_StatusUpate

DCMTT-464_[API][ConsumerTag]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][ConsumerTag]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Tag] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-464
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    CONSUMERTAG    ${BU_name}    SFTP
    Perform API Calls And Validate The Output For Data With Data Errors    Consumer Tag
    [Teardown]    Xray_StatusUpate

DCMTT-754_[API][Asset]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][Asset]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Asset] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-754
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    ASSET    ${BU_name}    SFTP
    Perform API Calls And Validate The Output For Data With Data Errors    Asset
    [Teardown]    Xray_StatusUpate

DCMTT-764_[API][Pet]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][Pet]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Pet] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-764
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    PET    ${BU_name}    SFTP
    Perform API Calls And Validate The Output For Data With Data Errors    Pet
    [Teardown]    Xray_StatusUpate

DCMTT-760_[API][ConsumerScore]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][ConsumerScore]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Score] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-760
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    CONSUMERSCORE    ${BU_name}    SFTP
    Perform API Calls And Validate The Output For Data With Data Errors    Consumer Score
    [Teardown]    Xray_StatusUpate

DCMTT-757_[API][ConsumerRelationship]InvalidDataErrorAPI
    [Documentation]    Test Case :: [API][ConsumerRelationship]InvalidDataErrorAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Relationship] - Invalid : Data Error using API Calls
    ...    Jira ID:: DCMTT-757
    [Tags]    nonsfmc
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    1    CONSUMERRELATIONSHIP    ${BU_name}    SFTP
    Perform API Calls And Validate The Output For Data With Data Errors    Consumer Relationship
    [Teardown]    Xray_StatusUpate

*** Keywords ***
Xray_StatusUpate
    Update The Jira Xray Status    ${TEST_NAME}    ${TEST_STATUS}    ${testexecution_key}

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
