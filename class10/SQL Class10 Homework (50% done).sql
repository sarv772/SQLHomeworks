--select * from customers;
--select * from new_students;

--SELECT *
--FROM customers
--JOIN new_students ON customers.name=new_students.name


--Class 10 Homework 

--alter table salesman
--alter column salesman_id int not null;

--alter table salesman 
--add constraint P_KeySalesman PRIMARY KEY (salesman_id);

--alter table customer
--alter column customer_id int not null;
--ALTER TABLE customer
--ADD CONSTRAINT P_KeyCustomer Primary key (customer_id);


--alter table orders
--alter column salesman_id int not null;

--alter table orders
--add constraint F_Key_orders_salesmanID foreign key (salesman_id)
--references salesman (salesman_id);

--alter table orders
--alter column customer_id int not null

--alter table orders
--add constraint F_Key_orders_customerID foreign key (customer_id)
--references customer (customer_id);

--create table regions
--			(region_id int not null, 
--			region_name varchar(25));
--alter table regions
--	add constraint P_Keyregions primary key (region_id);

--create table countries
--		(country_id char(2) primary key,
--		country_name varchar(40),
--		region_id int foreign key (region_id)
--		references regions (region_id));

--create table locations
--		(location_id int primary key,
--		street_address varchar(25),
--		postal_code varchar(12),
--		city varchar(30),
--		state_province varchar(12),
--		country_id char(2) foreign key
--		(country_id) references countries (country_id));

--create table jobs (job_id varchar(10) primary key,
--					job_title varchar(35),
--					min_salary int, max_salary int);

--create table employees
--		(employee_id int primary key, first_name varchar(20),
--		last_name varchar(25), email varchar(25),
--		phone_number varchar(20), hire_date date, 
--		job_id varchar(10) foreign key (job_id) references jobs
--		(job_id), salary int, commission_pct int, 
--		manager_id int, department_id int);

--alter table employees
--drop constraint PK__employee__C52E0BA845AC3CA5; -- foreign keyni o'rniga primary key yaratibman keyin o'chirishga to'g'ri keldi.

--create table departments 
--			(departmen_id int primary key,
--			department_name varchar(30), 
--			manager_id int, location_id int 
--			foreign key (location_id) references 
--			locations (location_id));

--alter table employees 
--		add constraint F_key_empl_depart foreign key (department_id)
--		references departments (departmen_id);
--alter table employees 
--		add constraint F_key_empl_jobs foreign key (job_id)
--		references jobs (job_id);

--create table job_history
--		(employee_id int primary key,
--		start_date date, constraint U_Key unique(start_date),
--		end_date date, job_id varchar(10) foreign key (job_id)
--		references jobs (job_id), department_id int foreign key (department_id)
--		references departments (departmen_id));


--alter table employees
--add constraint F_keyempl_jobhist foreign key (employee_id)
--references job_history (employee_id);

--create table job_grades 
--		(grade_level varchar(2) primary key,
--		lowest_sal int, highest_sal int);

--create table actor
--			(act_id int not null primary key,
--			act_fname varchar(20), act_lname varchar(20),
--			act_gender char(1));

--create table movie_cast
--		(act_id int not null foreign key (act_id)
--		references actor (act_id), mov_id int,
--		role char(30));

--create table movie 
--			(mov_id int primary key, mov_title char(50),
--			mov_year int, mov_time int, mov_lang char(50),
--			mov_dt_rel date, mov_rel_country char(5));
--alter table movie_cast
--add constraint F_Key_movcast_movie foreign key (mov_id)
--references movie (mov_id);

--create table director
--		(dir_id int primary key,
--		dir_fname char(20),
--		dir_lname char(20));

--create table movie_direction 
--		(dir_id int foreign key (dir_id)
--		references director (dir_id),
--		mov_id int foreign key (mov_id)
--		references movie (mov_id));

--create table genres
--		(gen_id int primary key,
--		gen_title char(20));

--create table movie_genres
--			(mov_id int foreign key (mov_id)
--			references movie (mov_id),
--			gen_id int foreign key (gen_id)
--			references genres (gen_id));

--create table reviewer
--			(rev_id int primary key,
--			rev_name char(30));

--create table rating
--			(mov_id int foreign key (mov_id) 
--			references movie (mov_id),
--			rev_id int foreign key (rev_id)
--			references reviewer (rev_id),
--			rev_stars int, num_o_ratings int);

