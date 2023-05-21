import subprocess
import sys
username=sys.argv[1]
loc='/home/'+username+'/.config/updateMGR/decrypter_handler_opener1.sh'
# subprocess.call(['/bin/bash', '/home/nitin/.config/updateMGR/decrypter_handler_opener1.sh'])
subprocess.call(['/bin/bash', loc])
