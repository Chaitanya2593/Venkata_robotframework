'''

Created on March 2018
@author: Venkata

'''

import time
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
from AllFolders_location import webDriversfolder
from selenium import webdriver
from Utilities.common_utilities import CommonUtilsClass


class WebCommonActions(object):

    def __init__(self):
        '''
        This is constructor of this class
        '''

    def launch_googlechrome(self, web_url):
        comm = CommonUtilsClass()
        chrome_options = comm.build_chrome_options()
        webdriver_locn = webDriversfolder + "chromedriver.exe"
        self.driver = webdriver.Chrome(executable_path=webdriver_locn, chrome_options=chrome_options)
        self.driver.get(web_url)
        time.sleep(2)
        return self.driver
