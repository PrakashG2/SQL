--1. Show the working of PIVOT and UNPIVOT by creating a table students(sid,sname,department,yearofcompletion) with 20 records.

CREATE TABLE students(
sid int,
sname varchar(30),
departmrnt varchar(20),
yearOfCompletion date,
)


INSERT into students values('1','DHIVYA PRAKASH','BCA','2023-01-23')

INSERT into students values('2','VIGNESH KUMAR','BCA','2020-01-23')
INSERT into students values('3','VENKIT RAMAN','BCA','2021-01-23')
INSERT into students values('4','ARUN JOSEPH','BCA','2022-01-23')
INSERT into students values('5','DHANA PRAKASH','BBA','2019-01-23')
INSERT into students values('6','SELVA GANAPATHY','BBA','2020-01-23')
INSERT into students values('7','PRIYA DARSHAN','BBA','2020-01-23')
INSERT into students values('8','SHRI KHANTH','BBA','2020-01-23')
INSERT into students values('9','HARITA S','BSC','2021-01-23')
INSERT into students values('10','HARISHMITHA S','BSC','2021-01-23')
INSERT into students values('11','YAMINI PRIYA','BSC','2021-01-23 3:55:1')
INSERT into students values('12','RANITA S','BSC','2021-01-23')
INSERT into students values('13','KARTHIK SUBURAJ','BSC','2022-01-23')
INSERT into students values('14','SIVA BHARATH','BSC','2022-01-23')
INSERT into students values('15','SHARON DAVID','BCOM','2022-01-23')
INSERT into students values('16','HARI KARTHICK','BCOM','2022-01-23')
INSERT into students values('17','VASANTH KUMAR','BCOM','2023-01-23')
INSERT into students values('18','VIKRAM KAMAL','BCOM','2023-01-23')
INSERT into students values('19','HARSHAN K','BCOM','2020-01-23')
INSERT into students values('20','HEMANTH S','BCOM','2023-01-23')

SELECT * FROM students


--PIVOT--

SELECT yearOfCompletion,BCA,BBA,BCOM,BSC FROM
(SELECT departmrnt,sid,yearOfCompletion FROM STUDENTS) AS TBL1
PIVOT
(COUNT(sid) FOR departmrnt IN (BCA,BBA,BCOM,BSC)) AS TBL2;

--UNPIVOT--

SELECT departmrnt,yearOfCompletion,sid
FROM(SELECT yearOfCompletion, COALESCE(BCA,0) AS BCA ,
COALESCE(BSC,0) AS BSC, COALESCE(BCOM,0) AS BCOM,
COALESCE(BBA,0) AS BBA FROM students
PIVOT 
(SUM (sid) 
FOR departmrnt IN(BCA,BSC,BCOM,BBA)) AS PIVOTTABLE)
P UNPIVOT(sid 
FOR departmrnt IN (BCA,BSC,BCOM,BBA))AS UNPIVOTTABLE





--2. Create a database for Library Management. Analyse the required columns, perform a normalization and link the tables using primary and foreign key (using on update set default)

create database Library
DROP DATABASE Library
USE LIBRARY

create table RACK
(
	rackno int primary key,
	Category varchar(20)
)

create table Books
(
	bookno int primary key ,
	bookname varchar(30) not null,
	author varchar(30) not null,
	rackno int default 0 references RACK(rackno) on update set default,
	
)


insert into RACK values
(1,'category1'),
(2,'category2'),
(3,'category3'),
(4,'category4'),
(5,'category5')



insert into books values
(1,'Book Name 5','author5',2),
(2,'Book Name 1','author1',2),
(3,'Book Name 2','author2',1),
(4,'Book Name 3','author3',5),
(5,'Book Name 4','author4',3)

select * from Books

update RACK set rackno=4 where rackno=5;

select * from RACK

