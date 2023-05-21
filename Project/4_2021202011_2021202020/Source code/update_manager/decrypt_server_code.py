#!/usr/bin/python
import sqlite3
import sys
username=sys.argv[3]
loc='/home/'+username+'/.config/updateMGR/server.db'
conn = sqlite3.connect(loc,check_same_thread=False)
system_uid=sys.argv[1]#unique identifier for pc
user_entered_dec_key=sys.argv[2]#decryption key entered by user
cursor_obj = conn.cursor()
query="SELECT * FROM LOGS WHERE UNIQUE_ADDRESS='"+system_uid+"';"
cursor_obj.execute(query)
output = cursor_obj.fetchall()
if len(output)>0:
    # entry found
    if str(system_uid)==str(user_entered_dec_key):
        #user entered correct decryption key,remove entry from table as well.
        query="DELETE FROM LOGS WHERE UNIQUE_ADDRESS='"+system_uid+"';"
        cursor_obj.execute(query)
        conn.commit()
        cursor_obj.close()
        print("0")#Decrypt the system
    else:
        #number of attempts also (check time difference [could have been implemented])
        number_of_attmpt_left=output[0][2]
        encryption_time=output[0][1]
        id=output[0][0]
        if number_of_attmpt_left<=1:
            #remove record as encrypted files are deleted
            query="DELETE FROM LOGS WHERE UNIQUE_ADDRESS='"+system_uid+"';"
            cursor_obj.execute(query)
            conn.commit()
            cursor_obj.close()
            print("1")#Means delete all files, make sure to sha256 it
            
        else:
            #update record
            number_of_attmpt_left=(number_of_attmpt_left-1)
            query="UPDATE LOGS SET ATTEMPTS_LEFT='"+ str(number_of_attmpt_left) +"' WHERE UNIQUE_ADDRESS='"+system_uid+"';"
            cursor_obj.execute(query)
            conn.commit()
            cursor_obj.close()
            print("2")#Means show error message(wrong password) to user, make sure to sha256 it
else:
    print("3")# Error message there is no entry for the current pc
    # entry not found