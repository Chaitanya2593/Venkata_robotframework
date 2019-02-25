'''

Created on March 2018
@author: Venkata
Refactoring of method names is finished
'''

from selenium.webdriver.common.keys import Keys
from ActionsAll.common_actions import CommonActionsClass
from pageObjectsAll.gmailloginpage_po import GmailLoginPageObjectsClass
from Utilities.common_utilities import CommonUtilsClass
from commonVariables import master_key
import time
import re

import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class GmailLoginPageActionClass():

    def __init__(self, driver):
        '''
        this is a constructor of class
        :param driver:
        '''
        self.driver = driver

    def login_automation_gmail_account(self, user_name, gmail_pwrd, xpected_uname):
        gmail_po = GmailLoginPageObjectsClass(self.driver)
        ca = CommonActionsClass(self.driver)
        common_utils = CommonUtilsClass()
        email_textbox_elmnt = gmail_po.email_text_box_loc()
        ca.enter_text_in_text_box(email_textbox_elmnt, user_name)
        logger.info("gmail Username:: " + user_name)
        time.sleep(3)
        next_btn_elmnt = gmail_po.next_button_loc()
        ca.click_on_webelement(next_btn_elmnt)
        time.sleep(3)
        pwrd_tbox_loc_elmnt = gmail_po.p_word_text_box_loc()
        pwrd_tbox_loc_elmnt.send_keys(Keys.TAB)
        time.sleep(3)
        gmail_password = common_utils.AES256_decrypt(master_key, gmail_pwrd)
        pwrd_tbox_loc_elmnt.send_keys(gmail_password)
        logger.info("Given gmail passcode")
        time.sleep(3)
        next_btn_elmnt = gmail_po.next_button_loc()
        ca.click_on_webelement(next_btn_elmnt)
        time.sleep(5)
        acct_elmnt = gmail_po.account_details_element()
        time.sleep(3)
        acct_elmnt.click()
        time.sleep(3)
        usr_name_elmnt = gmail_po.gmail_username_element()
        actul_usrname = usr_name_elmnt.text
        if actul_usrname == xpected_uname:
            logger.info("Logged in to the " + xpected_uname + " Gmail Account")
            return self.driver
        else:
            logger.error("Logged in to " + actul_usrname + " instead of " + xpected_uname + " mail Account")
            raise AssertionError()

    def get_ver_code_from_gmail(self, drvr, xpected_sender_name):
        gmail_po = GmailLoginPageObjectsClass(drvr)
        acct_elmnt = gmail_po.account_details_element()
        ca1 = CommonActionsClass(self.driver)
        element_search_gmail_button = gmail_po.search_text_loc()
        ca1.enter_text_in_text_box(element_search_gmail_button, xpected_sender_name)
        logger.info("Given " + xpected_sender_name + " in the gmail search box")
        element_search_gmail_button = gmail_po.search_gmail_button_loc()
        ca1.click_on_webelement(element_search_gmail_button)
        time.sleep(6)
        first_mes_from_name_elmnt = gmail_po.first_message_from_name_loc(xpected_sender_name)
        first_mes_from_name_elmnt.click()
        logger.info("Selected the email with verification code")
        time.sleep(3)
        message_elmnt = gmail_po.message_loc()
        mesge_elmnt_text = message_elmnt.text
        mesge_elmnt_text = re.split('\s+', mesge_elmnt_text)
        ver_code_from_gmail = mesge_elmnt_text[mesge_elmnt_text.index("Code:")+1]
        logger.info("Verification code::" + ver_code_from_gmail)
        acct_elmnt.click()
        time.sleep(3)
        signout_elmnt = gmail_po.gmail_sign_out_element()
        signout_elmnt.click()
        time.sleep(3)
        logger.info("Logged out from the Gmail")
        return ver_code_from_gmail

    def gmail_sign_out(self, drvr):
        gmail_po = GmailLoginPageObjectsClass(drvr)
        acct_elmnt = gmail_po.account_details_element()
        acct_elmnt.click()
        time.sleep(3)
        signout_elmnt = gmail_po.gmail_sign_out_element()
        signout_elmnt.click()
        time.sleep(3)
        logger.info("Logged out of the test gmail account")

    def open_mail_attachment(self, drvr):
        gmail_po = GmailLoginPageObjectsClass(drvr)
        commonutil = CommonUtilsClass()
        ca1 = CommonActionsClass(self.driver)
        timestamp = commonutil.last_user_created()
        time.sleep(5)
        mail_attachment_element = gmail_po.mail_attachment_loc(timestamp)
        ca1.hover_over_an_element_and_click(mail_attachment_element)
        logger.info("Hovered and clicked on the mail attachment with name containing " + timestamp)
        time.sleep(2)
        return self.driver

    def open_gmail_content(self, drvr, string_to_search):
        gmail_po = GmailLoginPageObjectsClass(drvr)
        ca1 = CommonActionsClass(self.driver)
        element_search_gmail_button = gmail_po.search_text_loc()
        ca1.enter_text_in_text_box(element_search_gmail_button, string_to_search)
        logger.info("Given " + string_to_search + " in the gmail search box")
        element_search_gmail_button = gmail_po.search_gmail_button_loc()
        ca1.click_on_webelement(element_search_gmail_button)
        time.sleep(6)
        element_select_data_import_mail = gmail_po.select_data_import_mail_loc(string_to_search)
        ca1.click_on_webelement(element_select_data_import_mail)
        logger.info("Selected the first mail after the search")
        return self.driver

    def copy_attachment_content_to_textfile(self, drvr, target_filepath):
        gmail_po = GmailLoginPageObjectsClass(drvr)
        ca1 = CommonActionsClass(self.driver)
        commonutil = CommonUtilsClass()
        time_stamp = commonutil.last_user_created()
        attachment_message_element = gmail_po.mail_attachment_message_loc(time_stamp)
        attachment_message_data = attachment_message_element.text
        commonutil.write_data_into_file(target_filepath, attachment_message_data)
        mail_attachment_message_close_element = gmail_po.mail_attachment_message_close_loc()
        ca1.hover_over_an_element_and_click(mail_attachment_message_close_element)
        logger.info("Copied and pasted the error message in " + target_filepath + " file")
        return self.driver
