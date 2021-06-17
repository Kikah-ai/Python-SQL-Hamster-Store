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
#foreign key and relationship according to ER diagram
#could be created at create step but would require specific order
ALTER TABLE customer
#create relationship between the tables
ADD FOREIGN KEY(petstore)
REFERENCES petstore(petstore_id)
#constraint, when table is destroyed attribute will be null but record will stay
#cascade is deleting everything- all participants linked and foreign key destroyed
ON DELETE SET NULL;

ALTER TABLE hamster
ADD FOREIGN KEY(seller)
REFERENCES seller(seller_id) #many to many relationship attempt
ON DELETE SET NULL;

ALTER TABLE hamster
ADD FOREIGN KEY(petstore)
REFERENCES petstore(petstore_id)
ON DELETE SET NULL;
    
#adding composite keys for buying, providng, selling
CREATE TABLE customerbuy (
	customer_id INT,
    hammy_id INT,
	PRIMARY KEY(customer_id,hammy_id)
);

CREATE TABLE petstoreprovide (
	petstore_id INT,
    hammy_id INT,
    PRIMARY KEY(petstore_id, hammy_id)
);

CREATE TABLE sellhammy(
	seller_id INT,
    hammy_id INT,
    PRIMARY KEY(seller_id, hammy_id)
);
