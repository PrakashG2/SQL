CREATE TABLE SALESMAN (
SALESMAN_ID INT,
NAME VARCHAR(30),
CITY VARCHAR (30),
COMMISSION DECIMAL
)

CREATE TABLE CUSTOMER(
CUSTOMER_ID INT,
CUSTOMER_NAME VARCHAR(50),
CITY VARCHAR(50),
GRADE INT,
SALESMAN_ID INT
)

CREATE TABLE ORDERS(
ORD_NO INT,
PURCH_AMNT INT,
ORD_DATE DATE,
CUSTOMER_ID INT,
SALESMAN_ID INT

)

SELECT * FROM SALESMAN
SELECT * FROM CUSTOMER
SELECT * FROM ORDERS


ALTER TABLE SALESMAN ALTER COLUMN COMMISSION DECIMAL(3,2)
ALTER TABLE ORDERS ALTER COLUMN PURCH_AMNT DECIMAL(10,3)
ALTER TABLE ORDERS ALTER COLUMN ORD_NO BIGINT

ALTER TABLE ORDERS ALTER COLUMN ORD_DATE DATETIME


INSERT INTO SALESMAN VALUES (5001,'James Hoog','New York',0.15)
INSERT INTO CUSTOMER VALUES (3002,'Nick Rimando','New York',100,5001)
INSERT INTO ORDERS VALUES (70001,150.5,'2012-10-05',3005,5002)
DELETE FROM SALESMAN WHERE SALESMAN_ID=5001
DELETE FROM ORDERS WHERE ORD_NO=70001


INSERT INTO ORDERS VALUES (70009,270.65,2012-09-10,3001,5005)
INSERT INTO ORDERS VALUES (70002,65.26,2012-10-05,3002,5001)
INSERT INTO ORDERS VALUES (70004,110.5,2012-08-17,3009,5003)
INSERT INTO ORDERS VALUES (70007,948.5,2012-09-10,3005,5002)
INSERT INTO ORDERS VALUES (70005,2400.6,2012-07-27,3007,5001)
INSERT INTO ORDERS VALUES (70008,5760,2012-09-10,3002,5001)
INSERT INTO ORDERS VALUES (70010,1983.43,2012-10-10,3004,5006)
INSERT INTO ORDERS VALUES (70003,2480.4,2012-10-10,3009,5003)
INSERT INTO ORDERS VALUES (70012,250.45,2012-06-27,3008,5002)
INSERT INTO ORDERS VALUES (70011,75.29,2012-08-17,3003,5007)
INSERT INTO ORDERS VALUES (70013,3045.6,2012-04-25,3002,5001)



INSERT INTO CUSTOMER VALUES(3007,'Brad Davis','New York',200,5001),(3005,'Graham Zusi','California',200,5002),
        (3008,'Julian Green','London',300,5002),
        (3004,'Fabian Johnson','Paris',300,5006),
        (3009,'Geoff Cameron','Berlin',100,5003),
        (3003,'Jozy Altidor','Moscow',200,5007)


INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,CITY,SALESMAN_ID) VALUES(3001,'Brad Guzan','London',5005)



INSERT INTO SALESMAN VALUES
        (5002,'Nail Knite','Paris',0.13),
        (5005,'Pit Alex','London',0.11),
        (5006,'Mc Lyon','Paris',0.14),
        (5007,'Paul Adam','Rome',0.13),
        (5003,'Lauson Hen','San Jose',0.12)


--1.From the above tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city
SELECT SALESMAN.NAME,CUSTOMER.CUSTOMER_NAME,SALESMAN.CITY,CUSTOMER.CITY FROM CUSTOMER INNER JOIN SALESMAN ON CUSTOMER.CITY=SALESMAN.CITY ORDER BY SALESMAN.NAME

--2.From the above tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.
SELECT SALESMAN.NAME,SALESMAN.COMMISSION,CUSTOMER.CUSTOMER_NAME,CUSTOMER.CITY FROM SALESMAN INNER JOIN CUSTOMER ON SALESMAN.SALESMAN_ID=CUSTOMER.SALESMAN_ID WHERE SALESMAN.COMMISSION>0.12

--3.From the above tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
SELECT ORDERS.ORD_NO,ORDERS.ORD_DATE,ORDERS.PURCH_AMNT,CUSTOMER.CUSTOMER_NAME,CUSTOMER.GRADE,SALESMAN.NAME,SALESMAN.COMMISSION FROM SALESMAN
INNER JOIN CUSTOMER ON SALESMAN.SALESMAN_ID = CUSTOMER.SALESMAN_ID
INNER JOIN ORDERS ON SALESMAN.SALESMAN_ID=ORDERS.SALESMAN_ID

--4.From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT ORDERS.ORD_NO,ORDERS.PURCH_AMNT,CUSTOMER.CUSTOMER_NAME,CUSTOMER.CITY FROM ORDERS INNER JOIN CUSTOMER ON ORDERS.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID WHERE PURCH_AMNT BETWEEN 500 AND 2000

--5.From the above tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
SELECT C.CUSTOMER_NAME,C.GRADE,S.NAME,S.CITY FROM SALESMAN AS S INNER JOIN CUSTOMER AS C ON S.SALESMAN_ID = C.SALESMAN_ID ORDER BY GRADE