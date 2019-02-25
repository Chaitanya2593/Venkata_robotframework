'''
Created on March 2018

@author: Venkata

'''
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.keys import Keys


class CommonActionsClass(object):

    def __init__(self, driver):
        '''
        this is a constructor of class
        :param driver:
        '''
        self.driver = driver

    '''
    This function is to wait for the element . the waiting time can be changed according to the requirement. 
    This is n Explicit wait using Fluent wait
    '''

    def element_with_fluent_wait(self, locator, timeoutinseconds):

        try:
            wait = WebDriverWait(self.driver, timeoutinseconds)
            element_present = EC.presence_of_element_located((By.XPATH, locator))
            elementdisplayed = wait.until(element_present)
            return elementdisplayed
        except TimeoutException:
            return False

    '''
    this function is to select an option of the dropdown based on the visible text of the option
    '''

    def select_from_dropdown(self, web_element, dropdown_option_visibletext):
        sel = Select(web_element)
        sel.select_by_visible_text(dropdown_option_visibletext)

    '''
    this function is to select an option of the dropdown based on the index of the option
    '''

    def select_by_index_from_dropdown(self, web_element, whichindex):
        sel = Select(web_element)
        sel.select_by_index(whichindex)

    '''
    this function is to click on webelement. It takes the webelement as a parameter
    '''

    def click_on_webelement(self, web_element):
        web_element.click()

    '''
    this function is to enter text into the text box.It takes the webelement and text to be entered as  parameters 
    '''

    def enter_text_in_text_box(self, web_element, text):
        web_element.click()
        time.sleep(1)
        web_element.clear()
        time.sleep(1)
        web_element.send_keys(text)

    def tiny_scroll(self, driver):
        driver.execute_script("window.scrollTo(0, 100)")

    def scroll_whole_page(self, driver):
        driver.execute_script(
            "window.scrollTo(0,Math.max(document.documentElement.scrollHeight,document.body.scrollHeight,document.documentElement.clientHeight))")

    def wait_until_element_displayed(self, driver, tme_out, loc_string):
        time_out = tme_out
        exp_elmnt = driver.find_element_by_xpath(loc_string)
        is_exp_elmnt_displyd = exp_elmnt.displayed()
        count = 0
        while not (is_exp_elmnt_displyd and (count < time_out)):
            is_exp_elmnt_displyd = driver.find_element_by_xpath(loc_string).isDisplayed()
            time.sleep(1)
            count += 1

    def click_and_catch_stale_ref_exception(self, driver):
        result = False
        attempts = 0
        while attempts < 2:
            try:
                next_btn_elmnt = driver.find_element_by_css("#passwordNext > content > span")
                self.driver.execute_script("arguments[0].click();", next_btn_elmnt)
                self.driver.implicitly_wait(3000)
                result = True
                break
            except EC as e:
                raise e
        attempts += 1
        return result

    def check_if_elmwnt_exists_on_page(self, loc_strng):
        try:
            self.driver.find_element_by_xpath(loc_strng)
        except NoSuchElementException:
            return False
        return True


    def hover_over_an_element(self, target_element):
        hover = ActionChains(self.driver).move_to_element(target_element)
        hover.perform()

    def hover_over_an_element_and_click(self, target_element):
        hover = ActionChains(self.driver).move_to_element(target_element).click()
        hover.perform()

    def hover_over_and_select_from_dropdown(self, parent_elmnt, menu_option_element):
        hover = ActionChains(self.driver).move_to_element(parent_elmnt)
        hover.perform()
        # self.driver.implicitly_wait(3000)  # Please don't use the this wait when running from ride
        time.sleep(3)
        ActionChains(self.driver).move_to_element(menu_option_element).perform()
        time.sleep(6)
        ActionChains(self.driver).move_to_element(menu_option_element).click().perform()
        time.sleep(6)

    def click_on_blank(self):
        self.driver.find_element_by_xpath("//html").click()

    def click_after_elment_visible(self, elmnt):
        time.sleep(1)
        js = "arguments[0].style.height='auto'; arguments[0].style.visibility='visible';"
        self.driver.execute_script(js, elmnt)
        time.sleep(1)
        self.driver.execute_script("arguments[0].click();", elmnt)

    def click_on_element_in_iframe(self, iframe_loc_attr_name, iframe_loc_attr_val, elemnt):
        loc_strng = "//iframe[@" + iframe_loc_attr_name + "=" + "'" + iframe_loc_attr_val + "'" + "]"
        self.driver.switch_to.default_content()
        self.driver.switch_to_frame(self.driver.find_element_by_xpath(loc_strng))
        self.click_on_webelement(elemnt)

    def perform_keyboard_actions(self, keyboard_stoke):
        if keyboard_stoke == "ESC":
            ActionChains(self.driver).send_keys(Keys.ESCAPE).perform()
        elif keyboard_stoke == "TAB":
            ActionChains(self.driver).send_keys(Keys.TAB).perform()
        elif keyboard_stoke == "ENTER":
            ActionChains(self.driver).send_keys(Keys.ENTER).perform()
