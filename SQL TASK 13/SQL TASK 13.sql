CREATE DATABASE TASK13

create table users	
(
user_id INT,
username VARCHAR(16),
password VARCHAR(40),
PRIMARY KEY (user_id)
)



create table finaid_main
(
aid_id INT primary key,
name VARCHAR(50),
category VARCHAR(15)
foreign key (aid_id) references user_finaid_map(aid_id)
)



create table user_finaid_map
(
user_id INT,
aid_id INT primary key,
semester VARCHAR(7),
year INT,
offered NUMERIC(18,2),
accepted NUMERIC(18,2),
foreign key (user_id) references users(user_id)
)



create table user_email
(
user_id INT references users(user_id),
email VARCHAR(50) primary key,
description VARCHAR(15)
)



create table user_hold_map
(
user_id INT references users(user_id),
hold_id INT references hold_main(hold_id)
)



create table hold_main
(
user_id INT references users(user_id),
hold_id INT primary key,
name VARCHAR(25),
description VARCHAR(15)
)



create table user_address
(
user_id INT references users(user_id),
address VARCHAR(80),
apt_num VARCHAR(15),
city VARCHAR(25),
state VARCHAR(2),
zip NUMERIC(5,0),
description VARCHAR(15)
)



create table takes
(	
user_id int references users(user_id),
class_id varchar(7) references course(class_id),
class_num int references section(class_num),
semester varchar(7),
year int,
grade varchar(2)
)



create table teaches
(
user_id int primary key,
class_id varchar(7) references course(class_id),
class_num int references section(class_num),
semester varchar(7),
year int
)



create table requisite
(
class_id varchar(7) references course(class_id),
req_id int,
type varchar(4)
)



create table user_salary
(
user_id int references users(user_id),
salary numeric(18,2)
)

create table user_balance
(
user_id int references users(user_id),
balance numeric(18,2)
)



create table user_number
(
user_id INT references users(user_id),
number NUMERIC(15,0),
description VARCHAR(15)
)



create table user_role
(
user_id INT references users(user_id),
role_id INT references role(role_id)
)



create table role
(
role_id INT primary key,
role_name VARCHAR(3),
role_full_name VARCHAR(15)
)



create table course
(
class_id varchar(7) primary key,
name varchar(25),
dept_name varchar(25) references department(dept_name),
credits numeric(5),
description varchar(8000)
)



create table department
(
dept_name varchar(25) primary key,
bulding varchar(20),
budget numeric(18,2)
)



create table time_slot
(
time_slot_id int primary key,
days varchar(8),
start_time date,
end_time timestamp
)



create table section
(
class_id varchar(7) references course(class_id),
class_num int primary key,
semester varchar(7),
year int,
room_no varchar(6),
time_slot_id int references time_slot(time_slot_id)
)
