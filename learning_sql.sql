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

-- insert data in users table
INSERT INTO users (id,name,email,password,status,gender) 
values (1,"Hilal Ahmad","hilal.ahmad@gmail.com","123",1,"Male");
 
 
-- insert multiple record
INSERT INTO users (id,name,email,password,status,gender) 
values (2,"Jani Ahmad","jani.ahmad@gmail.com","123",0,"Male"),
 (3,"Ali Ahmad","ali.ahmad@gmail.com","123",1,"Female"),
 (4,"Kamran durani","kamran.durani@gmail.com","123",1,"Male"),
 (5,"Hanif akram","hanif.akram@gmail.com","123",0,"Female"),
 (6,"Asad khan","asad.khan@gmail.com","123",1,"Female");
 
 
-- constraints 
create table customers(
	id int not null unique,
    name varchar(255) not null,
    email varchar(255) not null unique,
    phone varchar(255) not null unique,
    age int not null check(age >= 10)
);


-- insert to in customer
insert into customers(id,name,email,phone,age) 
values (2,'New one','new.email.data@gmail.com','+93787484743',10);

-- select customers
select * from users;

-- select particluer column
select id,name,email from customers;

-- select particluer column with alias
select id as ID,name as NAME,email as EMAIL from customers limit 1 offset 1;

select substring(name,1,5) from users limit 1 offset 4;

select @@version,@@alter_algorithm,@@aria_block_size from users limit 1 offset 4;

select email,name from users limit 1 offset 2;

select CONCAT(name ,' ', email) as complete_name from users;

select REPLACE(name,'A','h') from users;

select * from users order by name,gender desc;


select * from users where name in ('ali','asad');

select substr(name,1,1) from users;

select name from users where substr(name,1) = 'K';

select department_name , location from departments where substr(location,1,1) = 'S';

select department_name, location from departments where location like 'S%';

select distinct(name) from users;

select char_length(name) from users;

select e.id,eu.unique_id from Employees as e 
LEFT JOIN EmployeeUNI as eu ON eu.unique_id = e.id;

-- solve leetcode problem
create table transactions(
	transaction_id int(11) not null,
    visit_id int(11) not null,
    amount int(11) not null
);

insert into transactions(transaction_id,visit_id,amount)
values 
(2,5,310),
(3,5,300),
(9,5,200),
(12,1,910),
(13,2,970);

select * from transactions;

create table visits( 
    visit_id int(11) not null,
    customer_id int(11) not null
);

insert into visits(visit_id,customer_id)
values 
(1,23),
(2,9),
(4,30),
(5,54),
(6,96),
(7,54),
(8,54);

select * from transactions;
drop table visits;
select * from visits;

select t.visit_id,v.visit_id from visits as t
JOIN transactions as v on v.visit_id=t.visit_id where v.visit_id not in (t.visit_id);

select customer_id,count(customer_id) as count_no_trans
from visits where visit_id not in 
(select visit_id from transactions) group 
by customer_id order by count_no_trans  asc;


