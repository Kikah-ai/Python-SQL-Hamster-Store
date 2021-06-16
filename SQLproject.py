import mysql.connector
import pandas as pd
from mysql.connector import Error  #seperate import so access to function is easily made

#establishing connection to server
def enable_connection(name_host, name_user, password_user): #arguments function takes
    connection = None 
    #possible errors
    try: 
        connection = mysql.connector.connect(
            host = name_host,
            user = name_user,
            password = password_user
        )
        print("Successful connection to MYSQL Database.")
    except Error as unsuccessful:
        print(f"Unsuccessful:'{unsuccessful}'")
        
    retun connection
    #function returning to SQL Server
