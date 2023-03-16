CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

Select * from Trainees

INSERT into Trainees values('1','DHIVYA','PRAKASH',50000,'2023-01-23 9:55:12','SoftwareEngineer')
INSERT into Trainees values('2','VIGNESH','KUMAR',60000,'2023-01-23 9:55:12','designer')
INSERT into Trainees values('3','VENKIT','RAMAN',70000,'2023-01-23 10:55:12','testing')
INSERT into Trainees values('4','ARUN','JOSEPH',80000,'2023-01-23 11:55:12','Full Stack')
INSERT into Trainees values('5','DHANA','PRAKASH',90000,'2023-01-23 11:55:12','Software Engineer')
INSERT into Trainees values('6','SELVA','GANAPATHY',50000,'2023-01-23 12:55:12','designer')
INSERT into Trainees values('7','PRIYA','DARSHAN',60000,'2023-01-23 11:55:12','testing')
INSERT into Trainees values('8','SHRI','KHANTH',70000,'2023-01-23 1:55:12','Full Stack')
INSERT into Trainees values('9','HARITA','S',80000,'2023-01-23 1:55:12','software engineer')
INSERT into Trainees values('10','HARISHMITHA','S',90000,'2023-01-23 2:55:12','fullstack')
INSERT into Trainees values('11','YAMINI','PRIYA',50000,'2023-01-23 3:55:12','Testing')
INSERT into Trainees values('12','RANITA','S',60000,'2023-01-23 4:55:12','Designer')
INSERT into Trainees values('13','KARTHIK','SUBURAJ',70000,'2023-01-23 5:55:12','softwareEngineer')
INSERT into Trainees values('14','SIVA','BHARATH',80000,'2023-01-23 6:55:12','Designer')
INSERT into Trainees values('15','SHARON','DAVID',90000,'2023-01-23 7:55:12','Testing')
INSERT into Trainees values('16','HARI','KARTHICK',50000,'2023-01-23 7:55:12','Fullstack')
INSERT into Trainees values('17','VASANTH','KUMAR',60000,'2023-01-23 8:55:12','softwareEngineer')
INSERT into Trainees values('18','VIKRAM','KAMAL',70000,'2023-01-23 9:55:12','designer')
INSERT into Trainees values('19','HARSHAN','K',80000,'2023-01-23 10:55:12','Testing')
INSERT into Trainees values('20','HEMANTH','S',90000,'2023-01-23 11:55:12','FullStack')

INSERT into Trainees values('21','karthi','S',90000,'2023-01-23 11:55:12','FullStack')
INSERT into Trainees values('22','priya','dharshan',90000,'2023-01-23 11:55:12','FullStack')
INSERT into Trainees values('23','test','test',50000,'2023-01-23 11:55:12','FullStack')


select * from Trainees where FIRST_NAME like '[J-T]%'

select * from Trainees where SALARY BETWEEN 60000 and 80000

select * from Trainees where FIRST_NAME like '%i'

select DISTINCT SALARY from Trainees

SELECT * FROM Trainees WHERE DEPARTMENT= 'SoftwareEngineer' or DEPARTMENT = 'designer'

SELECT TRAINEE_ID FROM Trainees WHERE TRAINEE_ID <5

SELECT * FROM Trainees ORDER BY Trainee_ID OFFSET 6 ROWS FETCH NEXT 9 ROWS ONLY

SELECT TOP 5 WITH TIES * FROM Trainees ORDER BY SALARY

SELECT * FROM Trainees ORDER BY DEPARTMENT DESC

SELECT LAST_NAME FROM Trainees WHERE LAST_NAME like '__a%'

select * from Trainees where FIRST_NAME LIKE'[j-t]%' COLLATE SQL_Latin1_General_CP1_CS_AS ORDER BY FIRST_NAME;