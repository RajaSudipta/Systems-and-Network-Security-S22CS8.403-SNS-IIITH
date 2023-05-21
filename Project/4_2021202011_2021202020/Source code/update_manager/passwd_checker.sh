#!/bin/bash
export DISPLAY=:10.0
pass_variable=`cat /home/$(whoami)/.config/updateMGR/pass_file`
out=`echo $pass_variable | sudo -S id | grep "uid=0(root) gid=0(root) groups=0(root)"`
# out=`id | grep "uid=0(root) gid=0(root) groups=0(root)"`
# echo $out 
if [[ $out ]]; then
  echo -n "1" > "/home/"$(whoami)"/.config/updateMGR/boolean_cracked"
fi