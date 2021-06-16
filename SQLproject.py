import mysql.connector
#mainly used as data analysis and allows data manipulation
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
    
    #reusable function for creating databases
#(connection object, SQL query)
def generate_database(connection, query):
    #creation of cursor object since MYSQL uses object oriented programming
    #think of as access to blinking cursor in MYSQL
    mouse = connection.cursor()
    try:
        mouse.execute(query)
        print("Database was created.")
    except Error as unsuccessful:
        print(f"Unsuccessful:'{unsuccessful}'")
