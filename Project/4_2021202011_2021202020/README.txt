Dependencies:
The code has been checked for Ubuntu 20.04 with crontab preinstalled, the system should have gnome terminal working and should support python2 and python3.


Instructions to set up the environment (if any) and execute the code:
Steps:
1. User should be in sudoers’s list.
2. Run the (infected) script studio.sh for Attack 1 (sudo password extraction) and Attack 2 (Ransomware) and to run Attack 1,2 and Attack 3 (Root Shell) run the script update.sh in the “installation_script” folder.
[in actual system it will deployed via sharing the infected script as useful software]
3. For demonstration the timer is set for 60 seconds [the script will begin after 60 second of reboot] so make sure to work in a system which has os installed in SSD.
4. After execution the script will take its action after restart and attack(s) will be initiated (wait 1 minute after login to account, to see popup), Note: after Attack1 and before successful encryption of all the files no popup will be there.
5.Now, all the files with target extensions will be encrypted with a .*en format.
6. Once encryption is done, on the next restart, a decryption popup will be prompted.
7. A new terminal will be opened with a pop up to ask for either payment hash or decryption key. 
8. Upon giving a payment hash, the user will receive the decryption key.
9. With that decryption key he can decrypt the files in his system.
10. To launch attack 3 (root shell), ASLR has to be disabled. Using the command 
        echo “0” > /proc/sys/kernel/randomize_va_space
Note: This command needs sudo access
        Then change directory to ~/.config/updateMGR/root_shell and run root_shell.sh 


Assumptions:
System supports execution of .sh , .py files, and has read and write access to the directory.


Note: Since README.txt was allowed and not README.md , we have added a pdf file with explanation along with screenshots, please refer to it.