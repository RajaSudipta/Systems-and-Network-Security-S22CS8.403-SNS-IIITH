#!/usr/bin/env python3
import subprocess
import sys
username=sys.argv[1]
loc='/home/'+username+'/.config/updateMGR/root_shell/root_shell2.sh'
subprocess.call(['/bin/bash', loc])
