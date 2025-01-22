--Class7 Homeworks
--Link 1 
--SQL Exercises, Practice, Solution - Retrieve data from tables

--Exercise No.1
--1. Display All Salespeople
--Write a SQL statement that displays all the information about all salespeople.

--create table salesman ( salesman_id int, name varchar(30), city varchar(30), commission float)
--insert into  salesman values
        --(5001, 'James Hoog', 'New York', 0.15),
        --(5002, 'Nail Knite', 'Paris', 0.13),
        --(5005, 'Pit Alex', 'London', 0.11),
        --(5006, 'Mc Lyon', 'Paris', 0.14),
        --(5007, 'Paul Adam', 'Rome', 0.13),
        --(5003, 'Lauson Hen', 'San Jose', 0.12);

--select * from salesman;

--Exercise No.2
--2. Display a Custom String
--Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution". 

--select 'This is SQL Exercise, Practice and Solution'

--Exercise No.3
--3. Display Three Numbers
--Write a SQL query to display three numbers in three columns. 

--select (1), (2), (3);

--Exercise No.4
--4. Sum of Two Numbers
--Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 

--select 10 + 15;

--Exercise No.5
--5. Arithmetic Expression Result
--Write an SQL query to display the result of an arithmetic expression. 

--select 10+8-7*2/3

--Exercise No.6
--6. Specific Columns of Salespeople
--Write a SQL statement to display specific columns such as names and commissions for all salespeople.  

--select name, commission from salesman;

--Exercise No.7
--create table orders (ord_no int, purch_amt float, ord_date date, customer_id int, salesman_id int);
--insert into orders values
--		(70001, 150.5, '2012-10-05', 3005, 5002),
--		(70009, 270.65, '2012-09-10', 3001, 5005),
--		(70002, 65.26, '2012-10-05', 3002, 5001),
--		(70004, 110.5, '2012-08-17', 3009, 5003),
--		(70007, 948.5, '2012-09-10', 3005, 5002),
--		(70005, 2400.6, '2012-07-27', 3007, 5001),
--		(70008, 5760, '2012-09-10', 3002, 5001),
--		(70010, 1983.43, '2012-10-10', 3004, 5006),
--		(70003, 2480.4, '2012-10-10', 3009, 5003),
--		(70012, 250.45, '2012-06-27', 3008, 5002),
--		(70011, 75.29, '2012-08-17', 3003, 5007),
--		(70013, 3045.6, '2012-04-25', 3002, 5001);

--7. Custom Column Order in Orders
--Write a query to display the columns in a specific order,
--such as order date, salesman ID, order number, and purchase amount for all orders.  

--select ord_date, salesman_id, ord_no, purch_amt from orders

--Exercise No.8
--8. Unique Salespeople IDs
--From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id. 

--select distinct salesman_id from orders;

--Exercise No.9
--9. Salespeople in Paris
--From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'.
--Return salesperson's name, city. 

--select name, city from salesman
--where city = 'Paris'

--Exercise No.10
--create table customer (customer_id int, cust_name varchar(30), city varchar(30), grade int, salesman_id int);
--insert into customer values
--        (3002, 'Nick Rimando', 'New York', 100, 5001),
--        (3007, 'Brad Davis', 'New York', 200, 5001),
--        (3005, 'Graham Zusi', 'California', 200, 5002),
--        (3008, 'Julian Green', 'London', 300, 5002),
--        (3004, 'Fabian Johnson', 'Paris', 300, 5006),
--        (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
--        (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
--        (3001, 'Brad Guzan', 'London', null, 5005);
--10. Customers with Grade 200
--From the following table, write a SQL query to find customers whose grade is 200.
--Return customer_id, cust_name, city, grade, salesman_id. 

--select customer_id, cust_name, grade, salesman_id from customer
--where grade = 200

--Exercise No.11
--11. Orders by Salesperson 5001
--From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001.
--Return ord_no, ord_date, purch_amt.  

--select ord_no, ord_date, purch_amt from orders
--where salesman_id = 5001;

--Exercise No.12
--create table nobel_win (YEAR int, SUBJECT varchar(20), WINNER varchar(30), COUNTRY varchar(20), CATEGORY varchar(20));

--insert into nobel_win values
--(1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
--(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
--(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
--(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
--(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
--(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
--(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
--(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
--(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
--(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
--(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
--(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
--(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
--(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
--(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
--(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
--(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
--(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
--(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
--(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
--(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
--(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
--(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
--(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');
 
-- 12. Nobel Winner of 1970
--From the following table, write a SQL query to find the Nobel Prize winner(s)
--for the year 1970. Return year, subject and winner. 

--select year, subject, winner from nobel_win
--where year = 1970

--Exercise No.13
--13. Literature Winner 1971
--From the following table, write a  SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 

--select winner from nobel_win
--where subject = 'Literature' and year = 1971;

--Exercise No.14
--14. Locate Dennis Gabor
--From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject. 

--select year, subject from nobel_win
--where winner = 'Dennis Gabor'

--Exercise No.15
--15. Physics Winners Since 1950
--From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950.
--Return winner. 

--select winner from nobel_win
--where subject = 'Physics' and year > 1950;

--Exercise No.16
--16. Chemistry Winners (1965-1975)
--From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975.
--Begin and end values are included.
--Return year, subject, winner, and country.

--select year, subject, winner, country from nobel_win
--where subject = 'Chemistry' and year between 1965 and 1975

--select year, subject, winner, country from nobel_win
--where subject = 'Chemistry' and year >= 1965 and year <= 1975;

--Exercise No.17
--17. Prime Ministers After 1972
--Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.

--select * from nobel_win
--where year > 1972  and category = 'Prime Minister'

--select * from nobel_win
--where year > 1972 and winner in ('Menachem Begin','Yitzhak Rabin')

--Exercise No.18
--18. Winners with First Name Louis
--From the following table, write a SQL query to retrieve the details of the winners 
--whose first names match with the string ‘Louis’. 
--Return year, subject, winner, country, and category.  

--select year, subject, winner, country, category 
--from nobel_win
--		where winner like '%Louis%'

--Exercise No.19
--19. Combine Winners (Physics 1970 & Economics 1971)
--From the following table, write a SQL query that combines the winners in Physics,
--1970 and in Economics, 1971. Return year, subject, winner, country, and category. 

--select year, subject, winner, country, category from nobel_win
--		where subject in ('Physics', 'Economics') and year in (1970, 1971)

--Exercise No.20
--20. 1970 Winners Excluding Physiology & Economics
--From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding
--the subjects of Physiology and Economics. Return year, subject, winner, country, and category. 

--select * from nobel_win
--where year = 1970 and subject != 'Physiology'
--		and subject <> 'Economics'

--select * from nobel_win
--where year = 1970
--	  and subject not in ('Physiology', 'Economics');

--Exercise No.21
--21. Physiology Before 1971 & Peace After 1974
--From the following table, write a SQL query to combine the winners in 'Physiology' 
--before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 

--select * from nobel_win
--where year < 1971 and subject = 'Physiology'
--	  or year >= 1974 and subject = 'Peace';

--SELECT *
--FROM nobel_win
--WHERE (subject = 'Physiology' AND year < 1971)
--UNION
--(SELECT * FROM nobel_win WHERE (subject = 'Peace' AND year >= 1974));

--Exercise No.22
--22. Details of Johannes Georg Bednorz
--From the following table, write a SQL query to find the details
--of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.

--select * from nobel_win
--where winner = 'Johannes Georg Bednorz'

--Exercise No.23
--23. Winners Excluding Subjects Starting with P
--From the following table, write a  SQL query to find Nobel Prize winners for the subject
--that does not begin with the letter 'P'.
--Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending. 

--select * from nobel_win
--where subject not like 'P%'
--order by year desc, winner;

--Exercise No.24
--24. Ordered 1970 Nobel Prize Winners
--From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. 
--Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ 
--which will come at the end of the result set. Return year, subject, winner, country, and category.  

--select * from nobel_win
--where year = 1970 
--order by case 
--			when subject in ('Economics', 'Chemistry')
--			then 1
--			else 0
--		end asc;

--Exercise No.25
--create table item_mast (PRO_ID int, PRO_NAME varchar(30), PRO_PRICE float, PRO_COM int);
--insert into item_mast values 
--    (101, 'Mother Board', 3200.00, 15),
--    (102, 'Key Board', 450.00, 16),
--    (103, 'ZIP drive', 250.00, 14),
--    (104, 'Speaker', 550.00, 16),
--    (105, 'Monitor', 5000.00, 11),
--    (106, 'DVD drive', 900.00, 12),
--    (107, 'CD drive', 800.00, 12),
--    (108, 'Printer', 2600.00, 13),
--    (109, 'Refill cartridge', 350.00, 13),
--    (110, 'Mouse', 250.00, 12);

--25. Products in Price Range Rs.200-600
--From the following table, write a SQL query to select a range of products whose price
--is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id,
--pro_name, pro_price, and pro_com.

--select * from item_mast
--where pro_price >= 200 and pro_price <= 600;

--select * from item_mast 
--where pro_price between 200 and 600;

--Exercise No.26
--26. Average Price for Manufacturer Code 16
--From the following table, write a SQL query to calculate the average price
--for a manufacturer code of 16. Return avg.

--select avg(pro_price)
--from item_mast
--where pro_com = 16;

--Exercise No.27
--27. Display Item Name and Price
--From the following table, write a SQL query to display the pro_name 
--as 'Item Name' and pro_priceas 'Price in Rs.'  

--select pro_name as 'Item Name', pro_price as 'Price in Rs'
--from item_mast;

--Exercise No.28
--28. Items with Price >= $250
--From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. 
--Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.  

--select pro_price, pro_name from item_mast
--where pro_price >= 250.00
--order by pro_price desc, pro_name;

--Exercise No.29
--29. Average Price per Company
--From the following table, write a SQL query to calculate average price of the items for each company.
--Return average price and company code. 

--select avg(pro_price), pro_com 
--from item_mast
--group by pro_com

--Exercise No.30
--30. Cheapest Item
--From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.  

--select pro_price, pro_name from item_mast
--where pro_price = (select min(pro_price) from item_mast);

--Exercise No.31
--create table emp_details (EMP_IDNO int, EMP_FNAME varchar(30), EMP_LNAME varchar(30), EMP_DEPT int);
--insert into emp_details values
--   (127323, 'Michale', 'Robbin', 57),
--   (526689, 'Carlos', 'Snares', 63),
--   (843795, 'Enric', 'Dosio', 57),
--   (328717, 'Jhon', 'Snares', 63),
--   (444527, 'Joseph', 'Dosni', 47),
--   (659831, 'Zanifer', 'Emily', 47),
--   (847674, 'Kuleswar', 'Sitaraman', 57),
--   (748681, 'Henrey', 'Gabriel', 47),
--   (555935, 'Alex', 'Manuel', 57),
--   (539569, 'George', 'Mardy', 27),
--   (733843, 'Mario', 'Saule', 63),
--   (631548, 'Alan', 'Snappy', 27),
--   (839139, 'Maria', 'Foster', 57);

--31. Unique Employee Last Names
--From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.

--select distinct emp_lname from emp_details;

--Exercise No.32
--32. Employees with Last Name Snares
--From the following table, write a SQL query to find the details of employees whose last name is 'Snares'.
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  

--select * from emp_details
--where emp_lname like '%Snares%'

--select * from emp_details
--where emp_lname = 'Snares'

--Exercise No.33
--33. Employees in Department 57
--From the following table, write a SQL query to retrieve the details of the employees who work in the department 57.
--Return emp_idno, emp_fname, emp_lname and emp_dept..

--select * from emp_details
--where emp_dept = 57

--Continue Class7 Homework
--Link 2
--SQL Exercises, Practice, Solution - Using Boolean and Relational operators

--Exercise No.1
--1. Customers with Grade > 100
--From the following table, write a SQL query to locate the details of customers with grade values above 100.
--Return customer_id, cust_name, city, grade, and salesman_id. 

--select * from customer
--where grade > 100

--Exercise No.2
--2. New York Customers with Grade > 100
--From the following table, write a SQL query to find all the customers in ‘New York’ city 
--who have a grade value above 100. 
--Return customer_id, cust_name, city, grade, and salesman_id.  

--select * from customer 
--where city = 'New York' and grade > 100;

--Exercise No.3
--3. New York or Grade > 100
--From the following table, write a SQL query to find customers who are from 
--the city of New York or have a grade of over 100.
--Return customer_id, cust_name, city, grade, and salesman_id.  

--select * from customer
--where city = 'New York' or grade > 100

--Exercise No.4
--4. New York or Not Grade > 100
--From the following table, write a SQL query to find customers who are either from 
--the city 'New York' or who do not have a grade greater than 100.
--Return customer_id, cust_name, city, grade, and salesman_id.

--select * from customer
--where city = 'New York' or not grade > 100

--Exercise No.5
--5. Not New York and Not Grade > 100
--From the following table, write a SQL query to identify customers 
--who are not from the city of 'New York' and do not have a grade value greater than 100.
--Return customer_id, cust_name, city, grade, and salesman_id.

--select * from customer
--where  city != 'New York' and not grade > 100;

--select * from customer
--where not (city = 'New York' or grade > 100);

--Exercise No.6
--6. Exclude Specific Orders
--From the following table, write a SQL query to find details of all orders excluding 
--those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 

--select * from orders
--where not ((ord_date = '2012-09-10' and salesman_id > 5005) or purch_amt > 1000);

--Exercise No.7
--7. Salespeople with Commission Range 0.10-0.12
--From the following table, write a SQL query to find the details of those salespeople whose commissions 
--range from 0.10 to0.12. Return salesman_id, name, city, and commission. 

--select * from salesman
--where commission between 0.10 and 0.12

--Exercise No.8
--8. Orders with Amount < 200 or Exclusions
--From the following table, write a SQL query to find details of all orders with
--a purchase amount less than 200 or exclude orders with an order date greater than 
--or equal to '2012-02-10' and a customer ID less than 3009. Return ord_no, purch_amt,
--ord_date, customer_id and salesman_id.

--select * from orders
--where purch_amt < 200 or not(ord_date >= '2012-02-10' and customer_id < 3009);

--Exercise No.9
--9. Conditional Orders Exclusions
--From the following table, write a SQL query to find all orders that meet the following conditions.
--Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005
--and purchase amount less than 1000.

--select * from orders
--where not ((ord_date = '2012-08-17' or customer_id > 3005) and purch_amt < 1000);

--Exercise No.10
--10. Orders with Achieved Percentage > 50%
--Write a SQL query that displays order number, purchase amount, and the achieved and 
--unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.

--select ord_no, purch_amt, 
--(100*purch_amt) / 6000 as "Achieved%",
--(100*(6000-purch_amt) / 6000) as "Unachieved%"
--from orders
--where (100*purch_amt)/6000 > 50 ;

--Exercise No.11
--11. Employees with Last Name Dosni or Mardy
--From the following table, write a SQL query to find the details of all employees
--whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept. 

--select * from emp_details
--where emp_lname in ('Dosni', 'Mardy');

--Exercise No.12
--12. Employees in Department 47 or 63
--From the following table, write a SQL query to find the employees 
--who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.  

--select * from emp_details
--where emp_dept = 47 or emp_dept = 63;