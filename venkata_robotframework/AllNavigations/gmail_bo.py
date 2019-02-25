'''

Created on March 2018
@author: Venkata
Refactoring of method names is finished
'''

import logging
import time

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
from ActionsAll.gmailloginpage_actions import GmailLoginPageActionClass
from ActionsAll.webcommonactions import WebCommonActions
from Utilities.common_utilities import CommonUtilsClass
from commonVariables import *


class GmailBOClass(object):

    def __init__(self):
        '''
        This is constructor of this class
        '''

    def verification_code_from_gmail(self, drvr, xpected_sender_name):
        gmllp = GmailLoginPageActionClass(drvr)
        ver_code = gmllp.get_ver_code_from_gmail(drvr, xpected_sender_name)
        drvr.quit()
        return ver_code

    def log_into_gmail(self, gmail_uname, gmail_pwrd, xpected_uname):
        webcommomn = WebCommonActions()
        driver = webcommomn.launch_googlechrome(gmail_url)
        time.sleep(3)
        gmllp = GmailLoginPageActionClass(driver)
        drvr = gmllp.login_automation_gmail_account(gmail_uname, gmail_pwrd, xpected_uname)
        return drvr

    def get_verification_code_from_gmail(self, gmail_uname, gmail_pwrd, acct_username, sf_sender_name):
        drvr1 = self.log_into_gmail(gmail_uname, gmail_pwrd, acct_username)
        ver_code = self.verification_code_from_gmail(drvr1, sf_sender_name)
        return ver_code

    def save_attachment_content(self, target_filepath):
        commonutil = CommonUtilsClass()
        drvr = self.log_into_gmail(gmail_uname, gmail_pwrd, acct_username)
        gmllp = GmailLoginPageActionClass(drvr)
        date_time_stamp = commonutil.get_Value_In_IOparmetres("last_run_instance_time")
        string_to_search = commonutil.date_format_convert(date_time_stamp, 1, "360")
        drvr2 = gmllp.open_gmail_content(drvr, string_to_search)
        drvr3 = gmllp.open_mail_attachment(drvr2)
        drvr4 = gmllp.copy_attachment_content_to_textfile(drvr3, target_filepath)
        gmllp.gmail_sign_out(drvr4)
