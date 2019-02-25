'''

Created on September 2018
@author: Venkata

'''

import logging
from ActionsAll.jira_actions import JiraActionsClass

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)



class JiraBOClass(object):

    def __init__(self):
        '''
        This is constructor of this class
        '''

    def testcasestatus_update(self, testcase_name, test_status, testexecution_key):
        jira_actions = JiraActionsClass()
        rideresults= {}
        if "DCMTT" in testexecution_key:
            testcase_key = testcase_name.split("_")[0]
            if "DCMTT" in testcase_key:
                rideresults[testcase_key] = test_status
            else:
                logger.info("The test case ;" + testcase_name + "; name doesn't have Jira key")
            testrunids = jira_actions.get_testrunids(testexecution_key)
            jira_actions.set_testcasestatus(rideresults, testrunids, testexecution_key)
        else:
            logger.info("Results for " + testcase_name + " are not updated in JIRA as no Execution key is given")