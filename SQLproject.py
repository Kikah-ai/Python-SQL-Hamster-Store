import mysql.connector
import pandas as pd
from mysql.connector import Error  #seperate import so access to function is easily made

#w = rootpassword as string
#referenced from freeCodeCamp
#establishing connection to server
def enable_connection(name_host, name_user, password_user): #arguments function takes
    #shuts down other existing connections so there's no multiple connections
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
        
    return connection
    #function returning to SQL Server
    #connection = enable_connection("localhost", "root", pw) establishes that the server is connected
