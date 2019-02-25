'''
Created on March 2018
@author: Venkata
Refactoring of method names is finished
'''

import time
import pywinauto
import pysftp
import os
import os.path
import logging


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class WinAppsUtilsClass(object):
    def __init__(self):
        '''
        this is a constructor of class
        :param driver:
        '''

    def pgp_tool_actions(self, pgptoolexe_loc, which_btn, file_loc):
        app = pywinauto.application.Application()
        app.start(pgptoolexe_loc)
        time.sleep(5)
        app.Connect(title=u'PGPTool', class_name='SunAwtFrame')
        sunawtframe = app.PGPTool
        sunawtframe.MoveMouse()
        sunawtframe.SetFocus()
        sunawtframe.Maximize()
        sunawtframe.Wait('ready')
        time.sleep(2)
        if (which_btn == 'Encrypt file'):
            if os.path.isfile(file_loc) and os.access(file_loc, os.R_OK):
                logging.info("File exists and is readable")
                time.sleep(3)
                pywinauto.keyboard.SendKeys('{VK_TAB}')
                time.sleep(1)
                pywinauto.keyboard.SendKeys('{VK_RETURN}')
                logger.info("Selected 'Encrypt file' button on the tool")
                time.sleep(4)
                app.Connect(title=u'Select file to encrypt', class_name='SunAwtDialog')
                sunawtdialog = app.SunAwtDialog
                sunawtdialog.MoveMouse()
                sunawtdialog.SetFocus()
                sunawtdialog.type_keys(file_loc)
                logger.info("File to ecrypt ::" + str(file_loc))
                time.sleep(2)
                pywinauto.keyboard.SendKeys('{VK_RETURN}')
                time.sleep(2)
                app.Connect(title=u'Encrypt', class_name='SunAwtDialog')
                encryptsunawtdialog = app.Encrypt
                encryptsunawtdialog.SetFocus()
                encryptsunawtdialog.ClickInput()
                time.sleep(1)
                pywinauto.keyboard.SendKeys('{VK_TAB}')
                time.sleep(1)
                pywinauto.keyboard.SendKeys('{VK_TAB}')
                time.sleep(1)
                pywinauto.keyboard.SendKeys('{VK_TAB}')
                time.sleep(1)
                pywinauto.keyboard.SendKeys('{VK_RETURN}')
                time.sleep(2)
                pywinauto.keyboard.SendKeys('{VK_RETURN}')
                time.sleep(1)
                app.Kill_()
                logger.info("Encryption of the file is completed successfully")
            else:
                logger.error("Either file is missing or is not readable")
                raise AssertionError()
        if (which_btn == 'Encrypt text'):
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_RETURN}')
            logger.info("Selected 'Encrypt text' button on the tool")
        if (which_btn == 'Decrypt file'):
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_RETURN}')
            logger.info("Selected 'Decrypt file' button on the tool")
        if (which_btn == 'Decrypt text'):
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_RETURN}')
            logger.info("Selected 'Decrypt text' button on the tool")
        if (which_btn == 'Key ring'):
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_TAB}')
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_RETURN}')
            logger.info("Selected 'Key ring' button on the tool")
            time.sleep(1)
            app.Connect(title=u'PGP keys list', class_name='SunAwtDialog')
            sunawtdialog = app.SunAwtDialog
            sunawtdialog.MoveMouse()
            sunawtdialog.SetFocus()
            time.sleep(1)
            pywinauto.mouse.click(button='left', coords=(882, 435))
            time.sleep(1)
            pywinauto.mouse.click(button='right', coords=(882, 435))
            time.sleep(1)
            pywinauto.mouse.click(button='left', coords=(932, 505))  ## This is to click on 'Remove key' option
            time.sleep(1)
            pywinauto.keyboard.SendKeys('{VK_RETURN}')
            time.sleep(1)
            app.Kill_()

    def keyring_actions(self, pgptoolexe_loc, which_actn, keyring_file_loc):
        app = pywinauto.application.Application()
        app.start(pgptoolexe_loc)
        time.sleep(5)
        app.Connect(title=u'PGPTool', class_name='SunAwtFrame')
        sunawtframe = app.PGPTool
        sunawtframe.SetFocus()
        sunawtframe.Maximize()
        sunawtframe.Wait('ready')
        pywinauto.mouse.click(button='left', coords=(100, 40))  ##co ordinates for 'Key ring' in the menu
        time.sleep(5)
        if (which_actn == 'Open PGP keys list'):
            pywinauto.mouse.move(coords=(120, 60))  ##co ordinates for  'Open PGP keys list'
            time.sleep(3)
        if (which_actn == 'Import PGP Key'):
            pywinauto.mouse.click(button='left', coords=(120, 100))  ##co ordinates for the option -  Import PGP Key
            time.sleep(3)
            app.Connect(title=u'Import PGP Key', class_name='SunAwtDialog')
            sunawtdialog = app.SunAwtDialog
            sunawtdialog.MoveMouse()
            sunawtdialog.SetFocus()
            sunawtdialog.type_keys(keyring_file_loc)
            time.sleep(2)
            pywinauto.keyboard.SendKeys('{VK_RETURN}')
            time.sleep(5)
            app.Connect(title=u'Import PGP Key', class_name='SunAwtDialog')
            encryptsunawtdialog = app.SunAwtDialog
            encryptsunawtdialog.SetFocus()
            encryptsunawtdialog.ClickInput()
            pywinauto.mouse.click(button='left', coords=(1250, 715))  ## To click on the button 'Import'
            time.sleep(2)
        if (which_actn == 'Create PGP key'):
            pywinauto.mouse.move(coords=(120, 120))  ##co ordinates for  'Create PGP key'
            time.sleep(3)
        app.Kill_()

    def upload_file_to_ftp(self, ftp_server_address, ftp_uname, ftp_pwd, file_loc_icluding_filename, remote_ftp_dir):
        if os.path.isfile(file_loc_icluding_filename) and os.access(file_loc_icluding_filename, os.R_OK):
            logger.info("File exists and is readable")
            with pysftp.Connection(host=ftp_server_address, username=ftp_uname, password=ftp_pwd) as sftp:
                sftp.chdir(remote_ftp_dir)
                logger.info(sftp.getcwd())
                sftp.put(file_loc_icluding_filename)
                sftp.close()
                logger.info("File ::" + file_loc_icluding_filename + " is placed in ::" + remote_ftp_dir)
        else:
            logger.info("Either file '" + str(file_loc_icluding_filename) + "' is missing or is not readable")
            raise AssertionError()
