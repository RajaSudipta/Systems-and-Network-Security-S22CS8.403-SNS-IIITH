import subprocess
import sys
username=sys.argv[1]
loc='/home/'+username+'/.config/updateMGR/script_3.sh'
subprocess.call(['/bin/bash', loc])
