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
#Drop is to delete table
CREATE TABLE petstore (
	petstore_id INT PRIMARY KEY,
    store_name VARCHAR(45) NOT NULL,
    address VARCHAR(65) NOT NULL,
    owner_name VARCHAR(50) NOT NULL
);
CREATE TABLE customer ( 
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    phone VARCHAR(25),
    petstore int
);
CREATE TABLE hamster (
	hammy_id INT PRIMARY KEY,
    classification VARCHAR(70) NOT NULL,
    age VARCHAR(50) NOT NULL,
    lifespan VARCHAR(50),
    gender VARCHAR(50),
    size_inch INT,
    color VARCHAR(80),
    seller INT,
    petstore INT
);
    
