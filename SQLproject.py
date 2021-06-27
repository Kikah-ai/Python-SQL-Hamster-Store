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
#generate_database_query = "CREATE DATABASE Hamsterstore" #creates new database
#generate_database(connection, generate_database_query)

def analyze_data(connection, query):
    mouse = connection.cursor
    outcome = None
    return outcome
    try:
        mouse.execute(query)
        #only reading data from database and not making any changes. cursor.commit make changes
        outcome = cursor.fetchall()
        return outcome
    except Error as unsuccessful:
        print(f"Unsuccessful:'{unsuccessful}'")

#SQL commands
query1 = """
SELECT * 
FROM hamster;
"""
#connect with database and reads hamster table
connection = enable_connection("localhost", "root", pw, "Hamsterstore")
outcome = analyze_data(connection, query1)
#prints everything in table
for outcomes in outcome:
    print(outcome)

#making into a list
empty_list = []
#loopy loop loop
for outcomes in outcome:
    #returns list
    outcome = list(outcome)
#append adds item to the end of the list
    empty_list.append(outcome)

#pandas dataframe is created!
column_names = ["hammy_id, classification, age, hamster_type, gender, size_inch, color, seller,petstore"]
dataframe = pd.DataFrame(empty_list, column_names = column_names)
