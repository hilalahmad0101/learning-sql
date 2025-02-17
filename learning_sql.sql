-- create table 
create database learing_db;

-- use table
use learing_db;

-- show tables
show tables;

-- create table
CREATE TABLE users(
	id INT,
    name VARCHAR(20),
    email VARCHAR(30),
    password VARCHAR(255),
	status INT(2),
    gender VARCHAR(10)
);

-- show users table data
SELECT * FROM users;
