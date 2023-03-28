--1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.
CREATE PROCEDURE SP_COND (@NAME VARCHAR(30))
AS
BEGIN
IF((SELECT studentname FROM STUDENT WHERE @NAME=studentname)=@NAME)
BEGIN
PRINT'STUDENT FOUND '+@NAME
END
ELSE
BEGIN
PRINT'NOT FOUND ' +@NAME
END
END
SELECT * FROM STUDENT
EXEC SP_COND 'JakeS'

--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
ALTER PROCEDURE SP_REMARK AS
BEGIN
SELECT studentname,
CASE
WHEN securedmarks>470 THEN 'ABOVE FOUR SEVENTY'
WHEN securedmarks<460 THEN 'ABOVE 460 BELOW 470'
ELSE 'BELOW 460'
END AS 'REMARKS' FROM STUDENT END

EXEC SP_REMARK

--3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--Table variables--
declare @Q3 TABLE(
studentid int,
studentname varchar(30),
semester varchar(30),
securedmarks int,
totalmarks int
)


INSERT INTO @Q3 VALUES(1,'John','Sem 1',450,500)
SELECT * FROM @Q3

--temporary table--
CREATE TABLE #TEMP1(
studentid int,
studentname varchar(30),
semester varchar(30),
securedmarks int,
totalmarks int
)

INSERT INTO #TEMP1 SELECT * FROM STUDENT

SELECT* FROM #TEMP1

--temporary stored procedures--
CREATE PROCEDURE #SP_LOCAL AS
BEGIN
SELECT * FROM STUDENT
END

CREATE PROCEDURE ##SP_GLOBAL(@SEM VARCHAR(30)) AS
BEGIN
SELECT * FROM STUDENT WHERE @SEM=semester
END

EXEC ##SP_GLOBAL 'Sem 3'