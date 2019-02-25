*** Settings ***
Documentation     This Test Suite Executes the Scenarios related to the API calls
...
...               Tables Tested::All 10 Data extensions
...               Tags::
...               nonsfmc :: Scenrios which doesn't require Salesforce application
...               sfmc :: Scenrios which does require Salesforce application
...
...
...               Description:
...
...               This API calls mainly Validate the when we are trying to send a invalid data.
Variables         ../../AllFolders_location.py
Variables         ../../commonVariables.py
Library           ../../TestsAll/Allkeywords/commonkeywords.py
Library           ../../TestsAll/Allkeywords/webApplicationkeywords.py
Library           ../../TestsAll/Allkeywords/winapplnkeywords.py
Library           ../../TestsAll/Allkeywords/apicallkeywords.py

*** Variables ***
${env_from_CMD_line}    Nes

*** Test Cases ***
CreateCSVFilesValidDataForAllTablesAPI
    [Documentation]    Pre Requiste to the below scenrios
    Env_variableS
    The Master excel file should be created with Valid Data    ${cmtTableDataFolder}    10    CONSUMER|OPTIN|CHILD|EXTERNALIDENTITY|CONSUMERINTEREST|PET|ASSET|CONSUMERTAG|CONSUMERSCORE|CONSUMERRELATIONSHIP    ${BU_name}    SFTP

[API][Consumer]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][Consumer]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Consumer]Update Existing DE record
    ...    Jira ID:: DCMTT-512
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Consumer] - Valid : import information using API
    Env_variableS
    Update existing records    Consumer
    Perform API call Valid data    Consumer

[API][Child]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][Child]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Child]Update Existing Child record
    ...    Jira ID:: DCMTT-1467
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Child] - Valid : import information using API
    Env_variableS
    Update existing records    Child
    Perform API call Valid data    Child

[API][ExternalIdentity]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][ExternalIdentity]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][External Identity]Update Existing DE record
    ...    Jira ID:: DCMTT-1510
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][External Identity] - Valid : import information using API
    Env_variableS
    Update existing records    External Identity
    Perform API call Valid data    External Identity

[API][ConsumerInterest]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][ConsumerInterest]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Consumer Interest]Update Existing DE record
    ...    Jira ID:: DCMTT-1503
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Consumer Interest] - Valid : import information using API
    Env_variableS
    Update existing records    Consumer Interest
    Perform API call Valid data    Consumer Interest

[API][OptIn]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][OptIn]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Opt In]Update Existing Opt In record
    ...    Jira ID:: DCMTT-1491
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Opt In] - Valid : import information using API
    Env_variableS
    Update existing records    Opt In
    Perform API call Valid data    Opt In

[API][ConsumerTag]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][ConsumerTag]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Consumer Tag]Update Existing DE record
    ...    Jira ID:: DCMTT-1507
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Consumer Tag] - Valid : import information using API
    Env_variableS
    Update existing records    Consumer Tag
    Perform API call Valid data    Consumer Tag

[API][Asset]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][Asset]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Asset]Update Existing DE record
    ...    Jira ID:: DCMTT-1515
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Asset] - Valid : import information using API
    Env_variableS
    Update existing records    Asset
    Perform API call Valid data    Asset

[API][Pet]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][Pet]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Pet]Update Existing DE record
    ...    Jira ID:: DCMTT-1517
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Pet] - Valid : import information using API
    Env_variableS
    Update existing records    Pet
    Perform API call Valid data    Pet

[API][ConsmerScore]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][ConsmerScore]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Consumer Score]Update Existing DE record
    ...    Jira ID:: DCMTT-1501
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Consumer Interest] - Valid : import information using API
    Env_variableS
    Update existing records    Consumer Score
    Perform API call Valid data    Consumer Score

[API][ConsmerRelationship]UpdateRecordsInfo
    [Documentation]    Test Case :: [API][ConsmerRelationship]UpdateRecordsInfo
    ...
    ...    Test Case Name in Jira ::[API][Consumer Relationship]Update Existing CR record
    ...    Jira ID:: DCMTT-1492
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    ...    Pre Requsities:: [API][Consumer Relationship] - Valid : import information using API
    Env_variableS
    Update existing records    Consumer Relationship
    Perform API call Valid data    Consumer Relationship

[API][ALLTables]ValidDataInMasterDATA
    [Documentation]    Test Case ::[SFTP][ALLTables]ValidDataInMasterDATA
    ...
    ...
    ...
    ...    Description ::
    ...
    ...    This test case validates the Salesforce when data is migrated through SFTP using the consumer csv import \ files
    ...
    ...    Steps::
    ...
    ...    1. Run the Dev Automation to place the data in Profile Tables and Valiadate the same
    Env_variableS
    ${dev_automation}    Catenate    NESA -    ${BU_ID}    - ORA
    ${drvr}=    Login to SalesForce    ${salesforce_URL}    ${SFMC_username}    ${SFMC_password}
    ${drvr1}=    Select BAU    ${drvr}    ${BU_name}
    ${drvr2}=    Select Automation Studio    ${drvr1}    Automation Studio
    ${drvr3}=    Run Automation Job    ${drvr2}    ${dev_automation}    Activity    280    COMPLETED
    ${drvr4}=    Get table Records    ${drvr3}    Contact Builder    Data Extensions    Data Extensions    Profile Data
    ${drvr5}=    Check records in SFMC    ${drvr4}    Asset    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr6}=    Check records in SFMC    ${drvr5}    Consumer    ID
    ${drvr7}=    Check records in SFMC    ${drvr6}    Child    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr8}=    Check records in SFMC    ${drvr7}    Consumer Interest    CONSUMER_ID
    ${drvr9}=    Check records in SFMC    ${drvr8}    Consumer Tag    CONSUMER_ID
    ${drvr10}=    Check records in SFMC    ${drvr9}    Pet    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr11}=    Check records in SFMC    ${drvr10}    Consumer Score    CONSUMER_ID
    ${drvr12}=    Check records in SFMC    ${drvr11}    Consumer Relationship    PRIMARY_CONSUMER_ID
    ${drvr13}=    Check records in SFMC    ${drvr12}    External identity    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr14}=    Check records in SFMC    ${drvr13}    Opt in    CONSUMER_ID
    Log out of Nestle Sales Force    ${drvr14}    ${SFMC_user}

*** Keywords ***
Check records in SFMC
    [Arguments]    ${drvr}    ${table_name}    ${table_primary_key}
    ${drvr2}=    Select the Table in Data Extensions    ${drvr}    ${table_name}    Records
    ${drvrkey3}=    Validate Record data in SFMC    ${drvr2}    ${table_name}    ${table_primary_key}
    [Return]    ${drvrkey3}

Check for No records in SFMC
    [Arguments]    ${drvr}    ${table_name}    ${table_primary_key}
    ${drvr2}=    Select the Table in Data Extensions    ${drvr}    ${table_name}    Records
    ${drvrkey3}=    Validate No Record data in SFMC    ${drvr2}    ${table_name}    ${table_primary_key}
    [Return]    ${drvrkey3}

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
