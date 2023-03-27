--1. Create User-define Scalar function to calculate percentage of all students after creating the following table.
CREATE TABLE STUDENT(
studentid int,
studentname varchar(30),
semester varchar(30),
securedmarks int,
totalmarks int
)

select * from STUDENT

INSERT INTO STUDENT VALUES(1,'John','Sem 1',450,500)
INSERT INTO STUDENT VALUES(2,'Jake','Sem 2',460,500)
INSERT INTO STUDENT VALUES(3,'James','Sem 3',470,500)
INSERT INTO STUDENT VALUES(4,'ARUN','Sem 1',450,500)
INSERT INTO STUDENT VALUES(5,'SRIKANTH','Sem 2',450,500)
INSERT INTO STUDENT VALUES(6,'ARJUN','Sem 3',450,500)
INSERT INTO STUDENT VALUES(7,'PRAKASH','Sem 1',450,500)
INSERT INTO STUDENT VALUES(8,'DARSHAN','Sem 2',450,500)
INSERT INTO STUDENT VALUES(9,'HEMANT','Sem 3',450,500)
INSERT INTO STUDENT VALUES(10,'HARSHA','Sem 1',450,500)

alter FUNCTION Q1(@securemarks DECIMAL,@totalmarks DECIMAL)
RETURNS DECIMAL
AS BEGIN
RETURN (@securemarks / @totalmarks) * 100
END

select dbo.Q1(securedmarks,totalmarks) AS RESULT FROM STUDENT

ALTER TABLE STUDENT ALTER COLUMN totalmarks DECIMAL

--2. Create user-defined function to generate a table that contains result of Sem 3 students.

ALTER FUNCTION FN_TWO(@sem varchar(30))
RETURNS TABLE
AS RETURN(SELECT semester from STUDENT where semester=@sem)

select * FROM FN_TWO('Sem 3')


--3. Write SQL stored procedure to retrieve all students details. (No parameters)

CREATE PROCEDURE SP_1
AS BEGIN SELECT * FROM STUDENT END;

EXEC SP_1

--4. Write SQL store procedure to display Sem 1 students details. (One parameter)

ALTER PROCEDURE SP_2(@SEM VARCHAR(50))
AS BEGIN
SELECT * FROM STUDENT WHERE semester=@SEM
END

EXEC SP_2 @SEM='Sem 3'

--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)

ALTER PROCEDURE SP_SUM(@TOTALS VARCHAR(20) OUTPUT)
AS BEGIN
SELECT @TOTALS=COUNT(studentid) FROM STUDENT
END;

DECLARE @TOTALS VARCHAR(20);
EXEC SP_SUM @TOTALS OUTPUT
PRINT @TOTALS

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
CREATE TABLE STUDENTBACKUP(
studentid int,
studentname varchar(30),
semester varchar(30),
securedmarks int,
totalmarks int
)

MERGE STUDENTBACKUP T USING STUDENT S
ON (S.studentid = T.studentid)
when matched then update set
T.studentid=S.studentid,
T.studentname=S.studentname,
T.semester=S.semester,
T.securedmarks=S.securedmarks,
T.totalmarks=S.totalmarks
when not matched by target AND S.semester='Sem 1'
THEN INSERT VALUES(S.studentid,S.studentname,S.semester,S.securedmarks,S.totalmarks)
WHEN NOT MATCHED BY SOURCE THEN DELETE;

SELECT* FROM STUDENT
SELECT * FROM STUDENTBACKUP

DELETE FROM STUDENT WHERE studentid=1
INSERT INTO STUDENT VALUES(11,'insert','sem 1',470,500)
