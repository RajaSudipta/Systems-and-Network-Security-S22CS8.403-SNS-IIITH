#!/usr/bin/python
import sqlite3
import sys
username=sys.argv[2]
database_name='/home/'+username+'/.config/updateMGR/server.db'
conn = sqlite3.connect(database_name,check_same_thread=False)
conn.execute('''CREATE TABLE IF NOT EXISTS LOGS
         (COUNTER_ID            INTEGER     PRIMARY KEY     AUTOINCREMENT,
         ENCR_TIME      TIMESTAMP   DEFAULT    CURRENT_TIMESTAMP,
         ATTEMPTS_LEFT  INTEGER     DEFAULT 3,
         UNIQUE_ADDRESS CHAR(256));''')
conn.commit()
argument=sys.argv[1]
Query="INSERT INTO LOGS (UNIQUE_ADDRESS) VALUES ('%s')" % (argument)
conn.execute(Query)
conn.commit()
conn.close()