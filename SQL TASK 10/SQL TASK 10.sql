CREATE TABLE employeess(
EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(30),
LASTNAME_NAME VARCHAR(30),
EMAIL VARCHAR(30),
PHONE_NUMBER BIGINT,
SALARY INT,
HIRE_DATE DATETIME,
JOB_ID INT
)

INSERT into employeess values('1','DHIVYA','PRAKASH','abc@abc.com',9876543210,50000,'2023-01-23 9:55:12',001)

INSERT into employeess values('2','VIGNESH','KUMAR','abc@abc.com',9876543210,60000,'2023-01-24 9:55:12',002)
INSERT into employeess values('3','VENKIT','RAMAN','abc@abc.com',9876543210,70000,'2023-01-25 10:55:12',003)
INSERT into employeess values('4','ARUN','JOSEPH','abc@abc.com',9876543210,80000,'2023-01-26 11:55:12',004)
INSERT into employeess values('5','DHANA','PRAKASH','abc@abc.com',9876543210,90000,'2023-01-27 11:55:12',005)
INSERT into employeess values('6','SELVA','GANAPATHY','abc@abc.com',9876543210,50000,'2023-01-28 12:55:12',006)
INSERT into employeess values('7','PRIYA','DARSHAN','abc@abc.com',9876543210,60000,'2023-01-29 11:55:12',007)
INSERT into employeess values('8','SHRI','KHANTH','abc@abc.com',9876543210,70000,'2023-01-30 1:55:12',008)
INSERT into employeess values('9','HARITA','S','abc@abc.com',9876543210,80000,'2023-01-31 1:55:12',009)
INSERT into employeess values('10','HARISHMITHA','S','abc@abc.com',9876543210,90000,'2023-01-32 2:55:12',010)
INSERT into employeess values('11','YAMINI','PRIYA','abc@abc.com',9876543210,50000,'2023-01-23 3:55:12',011)
INSERT into employeess values('12','RANITA','S','abc@abc.com',9876543210,60000,'2023-01-24 4:55:12',012)
INSERT into employeess values('13','KARTHIK','SUBURAJ','abc@abc.com',9876543210,70000,'2023-01-25 5:55:12',013)
INSERT into employeess values('14','SIVA','BHARATH','abc@abc.com',9876543210,80000,'2023-01-26 6:55:12',014)
INSERT into employeess values('15','SHARON','DAVID','abc@abc.com',9876543210,90000,'2023-01-27 7:55:12',015)
INSERT into employeess values('16','HARI','KARTHICK','abc@abc.com',9876543210,50000,'2023-01-28 7:55:12',016)
INSERT into employeess values('17','VASANTH','KUMAR','abc@abc.com',9876543210,60000,'2023-01-29 8:55:12',017)
INSERT into employeess values('18','VIKRAM','KAMAL','abc@abc.com',9876543210,70000,'2023-01-30 9:55:12',018)
INSERT into employeess values('19','HARSHAN','K','abc@abc.com',9876543210,80000,'2023-01-31 10:55:12',019)
INSERT into employeess values('20','HEMANTH','S','abc@abc.com',9876543210,90000,'2023-01-32 11:55:12',020)

SELECT * FROM employeess

--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

SELECT FIRST_NAME,LASTNAME_NAME,SALARY
FROM employeess WHERE SALARY>(select SALARY FROM employeess WHERE EMPLOYEE_ID=16)


--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.
SELECT FIRST_NAME,LASTNAME_NAME,JOB_ID FROM employeess WHERE HIRE_DATE=(SELECT HIRE_DATE FROM employeess WHERE EMPLOYEE_ID=11)

--3. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
SELECT EMPLOYEE_ID,FIRST_NAME,LASTNAME_NAME,SALARY FROM employeess WHERE SALARY>(SELECT AVG(SALARY) FROM employeess)

--4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.
SELECT FIRST_NAME,LASTNAME_NAME,SALARY FROM employeess WHERE FIRST_NAME=(SELECT FIRST_NAME FROM employeess WHERE FIRST_NAME='YAMINI')

--5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.

SELECT * FROM employeess WHERE SALARY BETWEEN(SELECT min(SALARY)FROM employeess)and 80000
--I USED 80000 INSTEAD OF 2500 AS I DONT HAVE ANY ENTRIES BELOW THAT RANGE--
