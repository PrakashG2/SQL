--a. Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
--1. insert records into the table using a stored procedure.
--2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.
--3. Store the error details in an errorbackup table.



create table hobbies(
HobbyID int primary key,
HobbyName varchar(20) unique 
)

create table errorbackup(
errornumber int,
errorstate int,
errorseverity int,
errormessage varchar(max),
errorline int,
time datetime
)
create procedure sp_Q1(@ID int,@name varchar(20))
as begin
set nocount on
begin try
insert into hobbies(HobbyID,HobbyName) values(@ID,@name)end try
begin catch
insert into errorbackup 
values(error_number(),error_state(),error_severity(),error_message(),error_line(),getdate())
print 'Already exist'end catch end


exec sp_Q1 1,'PRAKASH'
select * from hobbies
select * from errorbackup

--b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR to show the working of exception handling.

create procedure sp_add(@num1 int,@num2 int)
as begin
if @num1=@num2
begin
declare @total int
set @total=@num1*@num2
print 'Product is '+convert(varchar(10),@total)end
else
begin
raiserror('both the numbers should be equal',16,1)
end end

execute sp_add 5,5


--c. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.

create table friends(
ID int identity(1,1),
Name varchar(20) unique
)

create procedure sp_insert(@name varchar(20))
as
begin
if left(@name,1) in ('A','D','H','K','P','R','S','T','V','Y')
begin
insert into friends(name) values(@name) end
else 
begin print 'name start with A,D,H,K,P,R,S,T,V,Y are only allowed' end
end


exec sp_insert jhon

