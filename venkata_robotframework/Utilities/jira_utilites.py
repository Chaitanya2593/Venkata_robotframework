'''

Created on September 2018
@author: Venkata

'''
import requests
import logging
import xml.etree.ElementTree as TreeObject
from Utilities.common_utilities import CommonUtilsClass
from commonVariables import jiraendpoint_URL
from commonVariables import jiraauth_cred
from commonVariables import master_key
from commonVariables import jira_projectkey


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class JiraUtilies(object):

    def __init__(self):
        '''
        this is a constructor of class
        '''

    def restapi_get_testids(self, testexecution_key):
        comm_util = CommonUtilsClass()
        url = jiraendpoint_URL + '/testexec/' + testexecution_key + '/test'
        auth_string = comm_util.AES256_decrypt(master_key, jiraauth_cred)
        headers = {
            'Content-Type': "application/json",
            'Authorization': "Basic " + auth_string,
            'Cache-Control': "no-cache",
        }
        response = requests.request("GET", url, headers=headers)
        return response.text


    def restapi_put_status(self, testrunid_key, payload):
        comm_util = CommonUtilsClass()
        url = jiraendpoint_URL + '/testrun/' + str(testrunid_key)
        auth_string = comm_util.AES256_decrypt(master_key, jiraauth_cred)
        headers = {
            'Content-Type': "application/json",
            'Authorization': "Basic " + auth_string,
            'Cache-Control': "no-cache",
        }
        response = requests.request("PUT", url, data=payload, headers=headers)
        return response.status_code

    def extract_testcasestatus(self, xmlpath):
        '''
        Discontinued
        :param xmlpath:
        :return:
        '''
        xmlobject = TreeObject.parse(xmlpath)
        xmlroot = xmlobject.getroot()
        testrun_status = {}
        for testnode in xmlroot.iter('test'):
            testcase_key = testnode.get('name').split("_")[0]
            if jira_projectkey in testcase_key:
                testrun_status[testcase_key] = testnode.find('status').get('status')
            else:
                logger.info("The test case ;" + testcase_key + "; name doesn't have Jira key")
        return testrun_status
