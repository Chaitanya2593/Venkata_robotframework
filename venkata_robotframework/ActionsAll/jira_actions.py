'''
Created on September 2018
Last Modified on 15th November 2018
@author: Venkata
Modified by :: Venkata
'''

import logging
from Utilities.common_utilities import CommonUtilsClass
from Utilities.jira_utilites import JiraUtilies

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class JiraActionsClass(object):

    def __init__(self):
        '''
        this is a constructor of class
        '''


    def get_testrunids(self, testexecution_id):
        comm_util = CommonUtilsClass()
        jira_util = JiraUtilies()
        jiraapi_output = jira_util.restapi_get_testids(testexecution_id)
        return comm_util.read_jira_jsonfile(jiraapi_output)

    def set_testcasestatus(self, rideresults, testrun_id, testexecution_key):
        jira_util = JiraUtilies()
        for key, value in rideresults.items():
            payload = '{ "status":"' + value + '"}'
            if key in testrun_id.keys():
                status_code = jira_util.restapi_put_status(testrun_id[key], payload)
                if status_code == 200:
                    logger.info("test case '" + str(key) + "' for Test Run ID:: '" + str(testrun_id[key]) + "' status is updated with " + str(value) )
                else:
                    logger.info("Unable to update the status of test case '" + str(key) + "' with Test Run ID:: '" + str(testrun_id[key]))
            else:
                logger.info("Unable to update the status in XRAY for test case '" + str(key) + "' is not present in Test Execution '" + str(testexecution_key))