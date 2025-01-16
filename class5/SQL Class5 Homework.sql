--Create database Class_5_Homework
--Link 1
--Exrcise No.1

--create table salesman (salesman_id int, [name] varchar(20), city varchar(15), comission float )
--insert into salesman values
--						(5001, 'James Hoog', 'New York', 0.15),
--						(5002, 'Nail Knite', 'Paris', 0.13),
--						(5005, 'Pit Alex','London', 0.11),
--						(5006, 'Mc Lyon', 'Paris', 0.14),
--						(5007, 'Paul Adam', 'Rome', 0.13),
--						(5003, 'Lauson Hen', 'San Jose', 0.12 )
--select * from salesman

--Exercise No.2

--Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution". 

--select 'This is SQL Exercise, Practice and Solution';

--Exercise No.3

--Write a SQL query to display three numbers in three columns.

--select 1, 2, 3;

--Exercise No.4

--Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 

--select SUM(10+15);

--Exercise No.5

--Write an SQL query to display the result of an arithmetic expression.

--select ((1+2+3+4+5+6+7-2-6)/3)*2/4;

--Exercise No.6

--Write a SQL statement to display specific columns 
--such as names and commissions for all salespeople. 

--select salesman_id, comission from salesman;

--Exercise No.7

--Write a query to display the columns in a specific order,
--such as order date, salesman ID, order number, and purchase amount for all orders. 

--create table orders (ord_no bigint, purch_amt float, ord_date date, customer_id bigint, salesman_id bigint);
--insert into orders values
--					(70001, 150.5, '2012-10-05', 3005, 5002),
--					(70009, 270.65, '2012-09-10', 3001, 5005),
--					(70002, 65.26, '2012-10-05', 3002, 5001),
--					(70004, 110.5, '2012-08-17', 3009, 5003),
--					(70007, 948.5, '2012-09-10', 3005, 5002),
--					(70005, 2400.6, '2012-07-27', 3007, 5001),
--					(70008, 5760, '2012-09-10', 3002, 5001),
--					(70010, 1983.43, '2012-10-10', 3004, 5006),
--					(70003, 2480.4, '2012-10-10', 3009, 5003),
--					(70012, 250.45, '2012-06-27', 3008, 5002),
--					(70011, 75.29, '2012-08-17', 3003, 5007),
--					(70013, 3045.6, '2012-04-25', 3002, 5001);
--select ord_date, salesman_id, ord_no, purch_amt  from orders;

--Exercise No.8

--From the following table, write a SQL query to identify the unique salespeople ID. 
--Return salesman_id. 

--select distinct salesman_id  from orders;

--Exercise No.9

--From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'.
--Return salesperson's name, city. 

--select [name], city from salesman
--where city = 'Paris';

--Exercise No.10

--create table customer (customer_id int, cust_name varchar(25), 
--					   city varchar(25), grade int, salesman_id int);
--insert into customer values 
--			(3002, 'Nick Rimando', 'New York', 100, 5001),
--			(3007, 'Brad Davis', 'New York', 200, 5001),
--			(3005, 'Graham Zusi', 'California', 200, 5002),
--			(3008, 'Julian Green', 'London', 300, 5002),
--			(3004, 'Fabian Johnson', 'Paris', 300, 5006),
--			(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
--			(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
--			(3001, 'Brad Guzan', 'London', null , 5005);

--From the following table, write a SQL query to find customers whose grade is 200.
--Return customer_id, cust_name, city, grade, salesman_id.  

--select customer_id, cust_name, city, grade, salesman_id from customer
--where grade = 200;

--Exercise No.11

--From the following table, write a SQL query to find orders that are delivered by
--a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt. 

--select salesman_id, ord_no, ord_date, purch_amt from orders
--where salesman_id=5001

--Exercise No.12

--create table nobel_win (year int, subject varchar(20), winner varchar(30), country varchar(20), category varchar(25));

--insert into nobel_win values
--						(1970,'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
--						(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
--						(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
--						(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
--						(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
--						(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
--						(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
--						(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
--						(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
--						(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
--						(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
--						(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
--						(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
--						(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
--						(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
--						(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
--						(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
--						(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist')
						
--insert into nobel_win values
--						(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
--						(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
--						(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
--						(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
--						(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
--						(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist' );

--From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970.
--Return year, subject and winner. 

--select year, subject, winner from nobel_win
--where year = 1970

--Exercise No.13

--From the following table, write a  SQL query to find the Nobel Prize winner
--in ‘Literature’ for 1971. Return winner. 

--select winner from nobel_win
--where subject = 'Literature' and year = 1971

--Link 2
--Exrcise No.1

--create table customer (customer_id int, cust_name varchar(25), city varchar(25), grade int, salesman_id int)

--insert into customer values 
--		(3002, 'Nick Rimando', 'New York', 100, 5001),
--        (3007, 'Brad Davis', 'New York', 200, 5001),
--        (3005, 'Graham Zusi', 'California', 200, 5002),
--        (3008, 'Julian Green', 'London', 300, 5002),
--        (3004, 'Fabian Johnson', 'Paris', 300, 5006),
--        (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
--        (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
--        (3001, 'Brad Guzan', 'London', null, 5005)

--From the following table, write a SQL query to locate the details of customers with grade values above 100. 
--Return customer_id, cust_name, city, grade, and salesman_id. 

--select * from customer
--where grade > 100

--Exercise No.2

--From the following table, write a SQL query to find all the customers in ‘New York’ city
--who have a grade value above 100.
--Return customer_id, cust_name, city, grade, and salesman_id.  

--select * from customer
--where city = 'New York' and grade > 100

--Exercise No.3

--From the following table, write a SQL query to find customers 
--who are from the city of New York or have a grade of over 100.
--Return customer_id, cust_name, city, grade, and salesman_id.  

--select * from customer
--where city='New York' or grade > 100

--Exercise No.4

--From the following table, write a SQL query to find customers 
--who are either from the city 'New York' or who do not have a grade greater than 100.
--Return customer_id, cust_name, city, grade, and salesman_id.

--select * from customer
--where city = 'New York' or not grade > 100

--Exercise No.5

--From the following table, write a SQL query to identify customers 
--who are not from the city of 'New York' and do not have a grade value greater than 100.
--Return customer_id, cust_name, city, grade, and salesman_id.

--1-solution
--select * from customer
--where city<>'New York' and not(grade>100)
--2-solution
--select * from customer
--where not(city='New York' or grade > 100)

--Exercise No.6

--From the following table, write a SQL query to find details of all orders excluding 
--those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 
--or purch_amt greater than 1000. Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 

--select * from orders
--where not((ord_date = '2012-09-10' and salesman_id > 5005) or purch_amt > 1000)

--Exercise No.7

--From the following table, write a SQL query to find the details of those salespeople 
--whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission. 

--select * from salesman
--where (comission > 0.10 and comission < 0.12)

--Exercise No.8

--From the following table, write a SQL query to find details of all orders 
--with a purchase amount less than 200 or exclude orders with an order 
--date greater than or equal to '2012-02-10' and a customer ID less than 3009.
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

--select * from orders
--where (purch_amt < 200 or not (ord_date >= '2012-02-10' and customer_id < 3009))

--Exercise No.9

--From the following table, write a SQL query to find all orders that meet the following conditions. 
--Exclude combinations of order date equal to '2012-08-17'
--customer ID greater than 3005 and purchase amount less than 1000.

--select * from orders
--where not((ord_date = '2012-08-17' and customer_id > 3005) and purch_amt < 1000)

--Exercise No.10

--Write a  SQL query that displays order number, purchase amount, 
--and the achieved and unachieved percentage (%)
--for those orders that exceed 50% of the target value of 6000.

--select ord_no, purch_amt,
--		(6000*purch_amt)/6000 as "achieved%",
--		(100*(6000-purch_amt)/6000) as "unachieved%"
--from orders
--where (100*purch_amt) / 6000 > 50

--Exercise No.11

--create table emp_details (EMP_IDNO int, EMP_FNAME varchar(25), EMP_LNAME varchar(25), EMP_DEPT int)

--insert into emp_details values 
--						(127323, 'Michale', 'Robbin', 57),
--						(526689, 'Carlos', 'Snares', 63),
--						(843795, 'Enric', 'Dosio', 57),
--						(328717, 'Jhon', 'Snares', 63),
--						(444527, 'Joseph', 'Dosni', 47),
--						(659831, 'Zanifer', 'Emily', 47),
--						(847674, 'Kuleswar', 'Sitaraman', 57),
--						(748681, 'Henrey', 'Gabriel', 47),
--						(555935, 'Alex', 'Manuel', 57),
--						(539569, 'George', 'Mardy', 27),
--						(733843, 'Mario', 'Saule', 63),
--						(631548, 'Alan', 'Snappy', 27),
--						(839139, 'Maria', 'Foster', 57)

--From the following table, write a SQL query to find the details of all employees 
--whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept.  

--select * from emp_details
--where emp_lname = 'Dosni' or emp_lname = 'Mardy'

--Exercise No.12

--From the following table, write a SQL query to find the employees who work at depart 47 or 63.
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  

--select * from emp_details
--where emp_dept = 47 or emp_dept = 63