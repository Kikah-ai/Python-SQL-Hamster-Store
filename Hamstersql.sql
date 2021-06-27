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
    hamster_type VARCHAR(50),
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

#populate data. If want partial values Insert ___ (___,___,___) and then add
INSERT petstore VALUES
	(1,"Hamster Store", "FakeAddress", "Steven Lipsky")
;
INSERT seller VALUES
	(01, "Christine","Lopez","EnglishSpanish", "Female", "2019-01-12", "23", "0000000000"),
    (02, "Joshua", "Cho", "EnglishKorean", "Male", "2021-04-03", "25", "1111111111"),
    (03, "Flor", "Lipsky", "English", "Female", "2016-09-24", "47", "2222222222"),
    (04, "Abraham", "Navarrete", "German", "Male", "2010-12-11", "57", "3333333333")
;
INSERT customer VALUES
	(001, "Amelia", "Levy","01010101010",1) ,
    (002, "Jesse", "Smith", "0202020202020",1) ,
    (003, "Angelica", "Johnson", "03030303030", 1) ,
    (004, "Hermes","Davis", "04040404040", 1) ,
    (005, "Adrian", "Williams","05050505050", 1) ,
    (006, "Eve", "Miller", "060606060606", 1) 
;
INSERT hamster VALUES
	(0001, "Genus Allocricetulus", "One Year", "Mongolian Hamster", "Male", "3","Golden Brown", 01, 1),
    (0002, "Genus Allocricetulus", "One Month", "Kazakh Hamster", "Female", "1","White", 02, 1),
    (0003, "Genus Cansumys", "Two Months", "Gansu Hamster", "Male", "1", 03, 1),
    (0004, "Genus Cricetulus", "Three Months", "Tibetan Dwarf", "Female", "1","Orange", 04, 1),
    (0005, "Genus Cricetulus", "Four Months", "Chinese Hamster", "Male", "2", "Black", 01, 1),
    (0006, "Genus Cricetus", "Five Months", "European Hamster", "Female", "6", "Reddish Brown", 02, 1),
    (0007, "Genus Mesocricetus", "Six Months", "Syrian Hamster", "Male", "1", "Blonde",  03, 1),
    (0008, "Genus Phodopus", "Seven Months", "Roborovski Hamster", "Female", "3", "Golden Brown", 02, 1),
    (0009, "Genus Phodupus", "Eight Months", "Djungarian Hamster", "Male", "1", "White", 03, 1),
    (0010, "Genus Tscherskia", "Nine Months", "Korean Hamster", "Female", "1", "Black", 04, 1)
;
