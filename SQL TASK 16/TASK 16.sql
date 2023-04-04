--TASK 16--

create table task16
(
id int primary key,
name varchar(20)
)

--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.

CREATE TRIGGER Q1
ON task16
FOR INSERT,UPDATE,DELETE
AS BEGIN IF DATEPART(DW,GETDATE()) IN (7,1) 
BEGIN
PRINT 'not allowed' 
ROLLBACK TRANSACTION
END END

insert into task16 values(3,'name')

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.
CREATE TRIGGER Q2
ON task16
FOR INSERT,UPDATE,DELETE
AS BEGIN IF DATEPART(HH,GETDATE()) BETWEEN 11 AND 15
BEGIN PRINT '11 to 15 not allwed' ROLLBACK TRANSACTION
END END

--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.
CREATE TRIGGER Q3 ON database FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE, RENAME
AS BEGIN PRINT 'YOU PERFORMED A DDL OPERATION' END