CREATE TABLE Traineess (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);



INSERT INTO Traineess
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

--1.Write an SQL query to get the count of employees in each department.
SELECT DEPARTMENT,COUNT(DEPARTMENT) as 'TOTAL EMPLOYEES'FROM Traineess GROUP BY DEPARTMENT;

--2. Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
SELECT DATEADD(DAY, 5, '2018-03-20') AS INDUCTION_PROGRAM_DAY;

--3.Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
SELECT TRAINEE_ID,JOINING_DATE,CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
'July','August','September','October','November','December') AS MONTH FROM Traineess;

--4.Write an SQL query to perform the total and subtotal of salary in each department.
select coalesce (DEPARTMENT, 'All Departments') AS Department,
  sum(SALARY) as 'Salary' from Traineess group by cube (DEPARTMENT)

--5. Write an SQL query to retrieve first 3 records randomly.
SELECT TOP 3 * FROM Traineess ORDER BY NEWID()

--6. Show the working of composite key with any example.
create table Orders
( cust_id int,
order_id int,
prod_code varchar(5),
prod_name varchar(7)
primary key(cust_id,prod_code)
)

insert into Orders values(001,121,'p12','p'),(003,123,'p10','Q'),(005,125,'p3','R');
insert into Orders values(007,126,'p3','S')

select * from Orders

select * from Orders where prod_code='p3';

select * from Orders where prod_code='p3' and cust_id=5;

--7. Show the working of IIF and CASE for the above table.
SELECT SALARY,IIF(SALARY>100000,'YES','NO') AS RESULT FROM Traineess

SELECT DEPARTMENT,CASE DEPARTMENT
WHEN 'Admin' THEN 'CG-VAK ADMIN'
WHEN 'HR' THEN 'CG-VAK HR'
WHEN 'Account' THEN 'CG-VAK ACCOUNT'
END AS POSITION FROM Traineess

--8. Show the working of Sequence.
create sequence CUSTID
as decimal start with 1 increment by 1


CREATE TABLE PRODUCTS (
CUST_ID INT PRIMARY KEY,
PRODUCT_ID INT,
PRODUCT_NAME VARCHAR(30)
)

INSERT INTO PRODUCTS VALUES(next value for dbo.CUSTID,1,'ABC'),
(next value for dbo.CUSTID,2,'DEF'),
(next value for dbo.CUSTID,3,'GHI');

SELECT * FROM PRODUCTS

--9. Show the working of creation of Synonym for a table in DB1 from DB2.
create synonym SYN_PRODUCTS for dbo.PRODUCTS

select * from SYN_PRODUCTS

--10.Show the working of IDENTITY_INSERT.
CREATE TABLE PRODUCTS2 (
CUST_ID INT PRIMARY KEY IDENTITY(1,1),
PRODUCT_ID INT,
PRODUCT_NAME VARCHAR(30)
)

INSERT INTO PRODUCTS2(PRODUCT_ID,PRODUCT_NAME) VALUES(1,'ABC'),
(2,'DEF'),
(3,'GHI');

SELECT * FROM PRODUCTS2

set identity_insert PRODUCTS2 ON
INSERT INTO PRODUCTS2(CUST_ID,PRODUCT_ID,PRODUCT_NAME) VALUES(100,2,'DEF')

set identity_insert PRODUCTS2 OFF
INSERT INTO PRODUCTS2(PRODUCT_ID,PRODUCT_NAME) VALUES(3,'GHI')



