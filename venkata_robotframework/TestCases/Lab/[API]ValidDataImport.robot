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
Variables         ../../AllFolders_location.py
Variables         ../../commonVariables.py
Library           ../../TestsAll/Allkeywords/commonkeywords.py
Library           ../../TestsAll/Allkeywords/webApplicationkeywords.py
Library           ../../TestsAll/Allkeywords/winapplnkeywords.py
Library           ../../TestsAll/Allkeywords/apicallkeywords.py

*** Variables ***
${env_from_CMD_line}    PCE
${testexecution_key}    DCMTT-1374

*** Test Cases ***
CreateCSVFilesValidDataForAllTablesAPI
    [Documentation]    Pre Requiste to the below scenrios
    Env_variableS
    The Master excel file should be created with Valid Data    10    CONSUMER|OPTIN|CHILD|EXTERNALIDENTITY|CONSUMERINTEREST|PET|ASSET|CONSUMERTAG|CONSUMERSCORE|CONSUMERRELATIONSHIP
    Convert the Excel sheets to CSVs    ${cmtTableDataFolder}    ${cmtEncryptedFilesFolder}

DCMTT-5568_[API][Consumer]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-568_[API][Consumer]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer] - Valid : import information using API
    ...    Jira ID:: DCMTT-568
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Consumer
    [Teardown]    Xray_StatusUpate

DCMTT-572_[API][Child]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-572_[API][Child]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Child] - Valid : import information using API
    ...    Jira ID:: DCMTT-572
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Child

DCMTT-683_[API][ExternalIdentity]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-683_[API][ExternalIdentity]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][External Identity] - Valid : import information using API
    ...    Jira ID:: DCMTT-683
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    External Identity

DCMTT-737_[API][ConsumerInterest]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-737_[API][ConsumerInterest]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Interest] - Valid : import information using API
    ...    Jira ID:: DCMTT-737
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Consumer Interest

DCMTT-573_[API][OptIn]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-573_[API][OptIn]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Opt In] - Valid : import information using API
    ...    Jira ID:: DCMTT-573
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Opt In

DCMTT-766_[API][ConsumerTag]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-766_[API][ConsumerTag]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Tag] - Valid : import information using API
    ...    Jira ID:: DCMTT-766
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Consumer Tag

DCMTT-756_[API][Asset]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-756_[API][Asset]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Asset] - Valid : import information using API
    ...    Jira ID:: DCMTT-756
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Asset

DCMTT-765_[API][Pet]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-765_[API][Pet]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Pet] - Valid : import information using API
    ...    Jira ID:: DCMTT-765
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Pet

DCMTT-762_[API][ConsmerScore]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-762_[API][ConsmerScore]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Score] - Valid : import information using API
    ...    Jira ID:: DCMTT-762
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
    Perform API call Valid data    Consumer Score

DCMTT-759_[API][ConsmerRelationship]ValidImportInformationAPI
    [Documentation]    Test Case :: DCMTT-759_[API][ConsmerRelationship]ValidImportInformationAPI
    ...
    ...    Test Case Name in Jira ::[API][Consumer Relationship] - Valid : import information using API
    ...    Jira ID:: DCMTT-759
    ...    Pre Requsities:: CreateCSVFilesValidDataForAllTablesAPI
    Env_variableS
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
    ${drvr3}=    Run Automation Job    ${drvr2}    ${dev_automation}    Activity    360    COMPLETED
    ${drvr4}=    Get table Records    ${drvr3}    Contact Builder    Data Extensions    Data Extensions    Profile Data
    ${drvr5}=    Check records in SFMC    ${drvr4}    Asset    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr6}=    Check records in SFMC    ${drvr5}    Consumer    ID
    ${drvr7}=    Check records in SFMC    ${drvr6}    Child    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr8}=    Check records in SFMC    ${drvr7}    Consumer Interest    CONSUMER_ID
    ${drvr9}=    Check records in SFMC    ${drvr8}    Consumer Tag    CONSUMER_ID
    ${drvr10}=    Check records in SFMC    ${drvr9}    Pet    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr11}=    Check records in SFMC    ${drvr10}    Consumer Score    CONSUMER_ID
    ${drvr12}=    Check records in SFMC    ${drvr11}    Consumer Relationship    PRIMARY_CONSUMER_ID
    ${drvr13}=    Check records in SFMC    ${drvr12}    External Identity    APPLICATION_INTERNAL_IDENTIFIER
    ${drvr14}=    Check records in SFMC    ${drvr13}    Opt in    CONSUMER_ID
    Log out of Nestle Sales Force    ${drvr14}    ${SFMC_user}
    [Teardown]    Xray_StatusUpate

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

Xray_StatusUpate
    Update The Jira Xray Status    DCMTT-5568_[API][Consumer]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-572_[API][Child]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-683_[API][ExternalIdentity]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-737_[API][ConsumerInterest]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-573_[API][OptIn]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-766_[API][ConsumerTag]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-756_[API][Asset]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-765_[API][Pet]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-762_[API][ConsmerScore]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
    Comment    Update The Jira Xray Status    DCMTT-759_[API][ConsmerRelationship]ValidImportInformationAPI    ${TEST_STATUS}    ${testexecution_key}
