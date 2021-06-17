CREATE DATABASE Hamsterstore; 
USE Hamsterstore;

#null, no acceptance of records of attributes set to null
#numbers are character constraints
CREATE TABLE seller (
	seller_id INT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    language_speak VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    employment_dat DATE,
    age INT,
    phone VARCHAR(25)
    );