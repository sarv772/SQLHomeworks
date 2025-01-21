--create database Class_6_Homework

--LINK 1 Exercises 

-- Exercise No.1
--1. From the following tables, write a SQL query to find all salespeople 
--and customers located in the city of London.

--Solution:

--select salesman_id, [name], 'salesman' from salesman
--where city = 'London'
--union
--select customer_id, [cust_name], 'customer' from customer
--where city = 'London'

--Exercise No.2
--2. From the following tables, write a SQL query to find distinct salespeople and their cities.
--Return salesperson ID and city.
--Solution:

--select distinct salesman_id, city from customer
--union
--select salesman_id, city from salesman

--Exercise No.3
--3. From the following tables, write a SQL query to find all those salespeople
--and customers who are involvedin the inventory management system.
--Return salesperson ID, customer ID.
--Solution:
--1)
--select distinct salesman_id from orders
--union
--select distinct customer_id from customer;
--2)
--select distinct salesman_id, customer_id from orders
--union
--select distinct salesman_id, customer_id from customer

--Exercise No.4
--4. From the following table, write a SQL query to find the salespersons who generated the largest 
--and smallest orders on each date. Return salesperson ID, name, order no., highest on/lowest on,
--order date.

--Buni ishlay olmadim. Yechimidan tushunib olishga harakat qildim.
--create table Salesman (salesman_id int, name varchar(25), city varchar(25), comission float);
--insert into Salesman values
--		(5001, 'James Hoog', 'New York', 0.15),
--(5002, 'Nail Knite', 'Paris', 0.13),
--(5005, 'Pit Alex', 'London', 0.11),
--(5006, 'Mc Lyon', 'Paris', 0.14),
--(5007, 'Paul Adam', 'Rome', 0.13),
--(5003, 'Lauson Hen', 'San Jose', 0.12);
--create table Orders (ord_no int, purch_amt float, ord_date date, customer_id int, salesman_id int);
--insert into Orders values
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
--create table customer (customer_id int, cust_name varchar(25), 
--					 city varchar(25), grade int, salesman_id int);
--insert into customer values 
--			(3002, 'Nick Rimando', 'New York', 100, 5001),
--			(3007, 'Brad Davis', 'New York', 200, 5001),
--			(3005, 'Graham Zusi', 'California', 200, 5002),
--			(3008, 'Julian Green', 'London', 300, 5002),
--			(3004, 'Fabian Johnson', 'Paris', 300, 5006),
--			(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
--			(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
--			(3001, 'Brad Guzan', 'London', null , 5005);
--SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
--FROM salesman a, orders b
--WHERE a.salesman_id = b.salesman_id
--AND b.purch_amt = (
--SELECT MAX(purch_amt)
--FROM orders c
--WHERE c.ord_date = b.ord_date)
--UNION
--SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
--FROM salesman a, orders b
--WHERE a.salesman_id = b.salesman_id
--AND b.purch_amt = (
--SELECT MIN(purch_amt)
--FROM orders c
--WHERE c.ord_date = b.ord_date)

--Exercise No.5
--5. From the following tables, write a SQL query to find the salespeople 
--who generated the largest and smallest orders on each date. Sort the result-set on third field.
--Return salesperson ID, name, order no., highest on/lowest on, order date.

--SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
--FROM salesman a, orders b
--WHERE a.salesman_id = b.salesman_id
--AND b.purch_amt = (
--SELECT MAX(purch_amt)
--FROM orders c
--WHERE c.ord_date = b.ord_date)
--UNION
--SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
--FROM salesman a, orders b
--WHERE a.salesman_id = b.salesman_id
--AND b.purch_amt = (
--SELECT MIN(purch_amt)
--FROM orders c
--WHERE c.ord_date = b.ord_date)
--order by ord_no

--Exercise No.6
--6. From the following tables, write a SQL query to find those salespeople 
--who live in the same city where the customer lives as well as those who do not have 
--customers in their cities by indicating 'NO MATCH'. Sort the result set
--on 2nd column (i.e. name) in descending order. Return salesperson ID, name, customer name, commission.

--select salesman.salesman_id, name, cust_name, comission
--from salesman, customer
--where salesman.city=customer.city
--union
--select salesman_id, name, 'No match', comission
--from salesman
--where not city=any
--	(select city from customer)
--order by comission asc

--Exercise No.7
--7. From the following tables, write a SQL query that appends strings to the selected fields,
--indicating whether the cityof any salesperson is matched with the city of any customer.
--Return salesperson ID, name, city, MATCHED/NO MATCH.

--select a.salesman_id, name, a.city, 'Matched'
--from salesman a, customer b
--where a.city=b.city
--union
--select salesman_id, name, city, 'No match'
--from Salesman
--where not city = any
--		(select city from customer)
--order by name asc

--ExerciseNo.8
--8. From the following table, write a SQL query to create a union of two queries 
--that shows the customer id, cities, and ratings of all customers. 
--Those with a rating of 300 or greater will have the words 'High Rating', 
--while the others will have the words 'Low Rating'.

--select customer_id, city, grade, 'High Rating'
--from Customer
--where grade>=300
--union
--select customer_id, city, grade, 'Low Rating'
--from customer
--where grade<300

--Exercise No.9
--9. From the following table, write a SQL query to find those salespersons and 
--customers who have placed more than one order. Return ID, name.

--select customer_id as "Id", cust_name as "Name" from Customer a
--where 1<
--	(select count(*)
--	from Orders b
--	where a.customer_id=b.customer_id)
--union
--select salesman_id as "Id", name as "Name" from Salesman a
--where 1<
--	(select count(*)
--	from Orders b
--	where a.salesman_id=b.salesman_id)
--	order by 2

--LINK 2 Exercises
--SQL Exercises, Practice, Solution - BASIC exercises on movie Database

--Exercise No.1
--Sample databases

--create table movie 
--		(mov_id int primary key, mov_title char(50),
--		mov_year int, mov_time int, mov_lang char(50),
--		mov_dt_rel date, mov_rel_country char(5));
--create table actor
--			(act_id int primary key, act_fname char(20), 
--			act_lname char(20), act_gender char(1));
--create table director
--			(dir_id int primary key,
--			dir_fname char(20),
--			dir_lname char(20));
--create table genres
--			(gen_id int primary key, gen_title char(20));
--create table reviewer
--			(rev_id int primary key, rev_name char(30));
--create table movie_cast
--				(act_id int, mov_id int, role char(30),
--				foreign key (act_id) references actor (act_id),
--				foreign key (mov_id) references movie (mov_id));
--create table movie_direction
--				(dir_id int, mov_id int,
--				foreign key (dir_id) references director (dir_id),
--				foreign key (mov_id) references movie (mov_id));
--createtable movie_genres
--				(mov_id int, gen_id int,
--				foreign key (mov_id) references movie (mov_id),
--				foreign key (gen_id) references genres (gen_id));
--create table rating
--				(mov_id int, rev_id int, rev_stars int, num_o_ratings int,
--				foreign key (mov_id) references movie (mov_id),
--				foreign key (rev_id) references reviewer (rev_id));

--Exercise No.1

--insert into movie values
--	(901, 'Vertigo', 1958, 128, 'English', '1958-08-24', 'UK'),
--(902, 'The Innocents',1961, 100, 'English', '1962-02-19', 'SW'),
--(903, 'Lawrence of Arabia', 1962, 216, 'English', '1962-12-11', 'UK'),
--(904, 'The Deer Hunter', 1978, 183, 'English','1979-03-08', 'UK'),
--(905, 'Amadeus', 1984, 160, 'English','1985-01-07', 'UK'),
--(906, 'Blade Runner', 1982, 117, 'English', '1982-09-09', 'UK'),
--(907, 'Eyes Wide Shut', 1999, 159, 'English', null,'UK'),
--(908, 'The Usual Suspects', 1995, 106, 'English', '1995-08-25', 'UK'),
--(909, 'Chinatown', 1974, 130, 'English', '1974-08-09', 'UK'),
--(910, 'Boogie Nights', 1997, 155, 'English', '1998-02-16', 'UK'),
--(911, 'Annie Hall', 1977, 93, 'English', '1977-04-20', 'USA'),
--(912, 'Princess Mononoke', 1997, 134, 'Japanese', '2001-10-19', 'UK'),
--(913, 'The Shawshank Redemption', 1994, 142, 'English', '1995-02-17', 'UK'),
--(914, 'American Beauty', 1999, 122, 'English', null, 'UK'),
--(915, 'Titanic', 1997, 194, 'English', '1998-01-23', 'UK'),
--(916, 'Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'),
--(917, 'Deliverance', 1972, 109, 'English', '1982-10-05', 'UK'),
--(918, 'Trainspotting', 1996, 94, 'English', '1996-02-23', 'UK'),
--(919, 'The Prestige', 2006, 130, 'English', '2006-11-10', 'UK'),
--(920, 'Donnie Darko', 2001, 113, 'English', null, 'UK'),
--(921, 'Slumdog Millionaire', 2008, 120, 'English', '2009-01-09', 'UK'),
--(922, 'Aliens', 1986, 137, 'English', '1986-08-29', 'UK'),
--(923, 'Beyond the Sea', 2004, 118, 'English', '2004-11-26', 'UK'),
--(924, 'Avatar', 2009, 162, 'English', '2009-12-17', 'UK'),
--(926, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'),
--(927, 'Spirited Away', 2001, 125, 'Japanese', '2003-09-12', 'UK'),
--(928, 'Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK'),
--(925, 'Braveheart', 1995, 178,'English', '1995-09-08', 'UK');

--1. From the following table, write a SQL query to find the name and year of the movies.
--Return movie title, movie release year.

--select mov_title, mov_year from movie

--Exercise No.2
--2. From the following table, write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

--select mov_year from movie
--where mov_title = 'American Beauty'

--Exercise No.3
--3. From the following table, write aSQL query to find the movie that was released in 1999. Return movie title.

--select mov_title from movie
--where mov_year = 1999

--Exercise No.4
--4. From the following table, write a SQL query to find those movies, which were released before 1998. Return movie title.

--select mov_title from movie
--where mov_year<1998

--Exercise No.5

--insert into reviewer values
--	(9001, 'Righty Sock'),
--	(9002, 'Jack Malvern'),
--	(9003, 'Flagrant Baronessa'),
--	(9004, 'Alec Shaw'),
--	(9005, null),
--	(9006, 'Victor Woeltjen'),
--	(9007, 'Simon Wright'),
--	(9008, 'Neal Wruck'),
--	(9009, 'Paul Monks'),
--	(9010, 'Mike Salvati'),
--	(9011, null),
--	(9012, 'Wesley S. Walker'),
--	(9013, 'Sasha Goldshtein'),
--	(9014, 'Josh Cates'),
--	(9015, 'Krug Stillo'),
--	(9016, 'Scott LeBrun'),
--	(9017, 'Hannah Steele'),
--	(9018, 'Vincent Cadena'),
--	(9019, 'Brandt Sponseller'),
--	(9020, 'Richard Adams');

--5. From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.

--select reviewer.rev_name from reviewer
--UNION
--select movie.mov_title from movie;

--Exercise No.6
--insert into rating values
--	(901, 9001, 8.40, 263575),
--(902, 9002, 7.90, 20207),
--(903, 9003, 8.30, 202778),
--(906, 9005, 8.20, 484746),
--(924, 9006, 7.30, null),
--(908, 9007, 8.60, 779489),
--(909, 9008, null, 227235),
--(910, 9009, 3.00, 195961),
--(911, 9010, 8.10, 203875),
--(912, 9011, 8.40, null),
--(914, 9013, 7.00, 862618),
--(915, 9001, 7.70, 830095),
--(916, 9014, 4.00, 642132),
--(925, 9015, 7.70, 81328),
--(918, 9016, null, 580301),
--(920, 9017, 8.10, 609451),
--(921, 9018, 8.00, 667758),
--(922, 9019, 8.40, 511613),
--(923, 9020, 6.70, 13091);

--6. From the following table, write a SQL query to find all reviewers 
--who have rated seven or more stars to their rating. Return reviewer name.

--select reviewer.rev_name from reviewer, rating
--where rating.rev_id = reviewer.rev_id
--and rating.rev_stars>=7
--and reviewer.rev_name is not null;

--Exercise No.7
--7. From the following tables, write a SQL query to find the movies without any rating. Return movie title.

--select mov_title from movie
--where mov_id not in 
--(select mov_id from rating);

--Exercise NO.8
--8. From the following table, write aSQL query to find the movies with ID 905 or 907 or 917. Return movie title.
--1.
--select mov_title from movie
--where mov_id=905
--union
--select mov_title from movie
--where mov_id=907
--union
--select mov_title from movie
--where mov_id = 917
--2.
--select mov_title from movie
--where mov_id in (905, 907, 917);

--Exercise No.9
--9. From the following table, write a SQL query to find the movie titles that contain the word 'Boogie Nights'. 
--Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year.

--select mov_id, mov_title, mov_year from movie
--where mov_title = 'Boogie Nights'

--Exercise No.(10
--insert into actor values
--	(101, 'James', 'Stewart', 'M'),
--	(102, 'Deborah', 'Kerr', 'F'),
--	(103, 'Peter', 'OToole', 'M'),
--	(104, 'Robert', 'De Niro', 'M'),
--	(105, 'F. Murray', 'Abraham', 'M'),
--	(106, 'Harrison', 'Ford', 'M'),
--	(107, 'Nicole', 'Kidman', 'F'),
--	(108, 'Stephen', 'Baldwin', 'M'),
--	(109, 'Jack', 'Nicholson', 'M'),
--	(110, 'Mark', 'Wahlberg', 'M'),
--	(111, 'Woody', 'Allen', 'M'),
--	(112, 'Claire', 'Danes', 'F'),
--	(113, 'Tim', 'Robbins', 'M'),
--	(114, 'Kevin', 'Spacey', 'M'),
--	(115, 'Kate', 'Winslet', 'F'),
--	(116, 'Robin', 'Williams', 'M'),
--	(117, 'Jon', 'Voight', 'M'),
--	(118, 'Ewan', 'McGregor', 'M'),
--	(119, 'Christian', 'Bale', 'M'),
--	(120, 'Maggie', 'Gyllenhaal', 'F'),
--	(121, 'Dev', 'Patel', 'M'),
--	(122, 'Sigourney', 'Weaver', 'F'),
--	(123, 'David', 'Aston', 'M'),
--	(124, 'Ali', 'Astin', 'F');

--10. From the following table, write a SQL query to find those actors 
--with the first name 'Woody' and the last name 'Allen'. Return actor ID.

--select act_id from actor
--where act_fname = 'Woody' and act_lname = 'Allen';