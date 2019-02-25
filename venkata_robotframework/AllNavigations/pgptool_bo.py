'''

Created on March 2018
@author: Venkata

'''

from Utilities.winapplns_utilities import WinAppsUtilsClass


class WinBusinessObjectsClass(object):
    def __init__(self):
        '''
        This is constructor of this class
        '''

    def win_remove_existing_keyring_of_pgp(self, pgptoolexe_loc, which_btn, file_loc):
        winobj = WinAppsUtilsClass()
        winobj.pgp_tool_actions(pgptoolexe_loc, which_btn, file_loc)

    def win_add_encryption_key(self, pgptoolexe_loc, which_btn, file_loc):
        winobj = WinAppsUtilsClass()
        winobj.keyring_actions(pgptoolexe_loc, which_btn, file_loc)

    def win_pgp_encryption_of_file(self, pgptoolexe_loc, which_btn, file_loc):
        winobj = WinAppsUtilsClass()
        winobj.pgp_tool_actions(pgptoolexe_loc, which_btn, file_loc)

    def win_upload_file_to_sftp(self, sftp_server_address, ftp_uname, ftp_pwd, file_loc_icluding_filename, remote_ftp_dir):
        winobj = WinAppsUtilsClass()
        winobj.upload_file_to_ftp(sftp_server_address, ftp_uname, ftp_pwd, file_loc_icluding_filename, remote_ftp_dir)
