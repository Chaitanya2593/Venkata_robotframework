'''

Created on March 2018
Author:: Venkata

class name should be same as the file name
'''
from robot.api.deco import keyword
from AllNavigations.gmail_bo import GmailLoginPageActionClass


class projectnamekeywords():
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def __init__(self):
        '''
        this is a class constructor
        '''

    @keyword('Login to gmail account')
    def api_call_to_validate_format_errors(self, table_to_test):
        projecct_apibo = GmailLoginPageActionClass()
        projecct_apibo.login_automation_gmail_account()
