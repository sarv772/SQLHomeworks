--SQL Class 13 Homework

--SQL Exercises, Practice, Solution - JOINS on HR Database

create database Class_13_Homework;

create table departments (DEPARTMENT_ID int, DEPARTMENT_NAME varchar(30), MANAGER_ID int, LOCATION_ID int);

insert into departments values
(10, 'Administration', 200, 1700),
(20, 'Marketing', 201, 1800),
(30, 'Purchasing', 114, 1700),
(40, 'Human Resources', 203, 2400),
(50, 'Shipping', 121, 1500),
(60, 'IT', 103, 1400),
(70, 'Public Relations', 204, 2700),
(80, 'Sales', 145, 2500),
(90, 'Executive', 100, 1700),
(100, 'Finance', 108, 1700),
(110, 'Accounting', 205, 1700),
(120, 'Treasury', 0, 1700),
(130, 'Corporate Tax', 0, 1700),
(140, 'Control And Credit', 0, 1700),
(150, 'Shareholder Services', 0, 1700),
(160, 'Benefits', 0, 1700),
(170, 'Manufacturing', 0, 1700),
(180, 'Construction', 0, 1700),
(190, 'Contracting', 0, 1700),
(200, 'Operations', 0, 1700),
(210, 'IT Support', 0, 1700),
(220, 'NOC', 0, 1700),
(230, 'IT Helpdesk', 0, 1700),
(240, 'Government Sales', 0, 1700),
(250, 'Retail Sales', 0, 1700),
(260, 'Recruiting', 0, 1700),
(270, 'Payroll', 0, 1700);

CREATE TABLE employees (
    EMPLOYEE_ID INT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE_NUMBER VARCHAR(20),
    HIRE_DATE DATE,
    JOB_ID VARCHAR(10),
    SALARY DECIMAL(10, 2),
    COMMISSION_PCT DECIMAL(5, 2),
    MANAGER_ID INT,
    DEPARTMENT_ID INT);

INSERT INTO employees 
VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000.00, 0.00, NULL, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000.00, 0.00, 100, 90),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000.00, 0.00, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000.00, 0.00, 102, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000.00, 0.00, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800.00, 0.00, 103, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800.00, 0.00, 103, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200.00, 0.00, 103, 60),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008.00, 0.00, 101, 100),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100),
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '2005-09-30', 'FI_ACCOUNT', 7700.00, 0.00, 108, 100),
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', 7800.00, 0.00, 108, 100),
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', 6900.00, 0.00, 108, 100),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', 11000.00, 0.00, 100, 30),
(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', 3100.00, 0.00, 114, 30),
(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '2005-12-24', 'PU_CLERK', 2900.00, 0.00, 114, 30),
(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '2005-07-24', 'PU_CLERK', 2800.00, 0.00, 114, 30),
(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '2006-11-15', 'PU_CLERK', 2600.00, 0.00, 114, 30),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '2007-08-10', 'PU_CLERK', 2500.00, 0.00, 114, 30),
(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '2004-07-18', 'ST_MAN', 8000.00, 0.00, 100, 50),
(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '2005-04-10', 'ST_MAN', 8200.00, 0.00, 100, 50),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01', 'ST_MAN', 7900.00, 0.00, 100, 50),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '2005-10-10', 'ST_MAN', 6500.00, 0.00, 100, 50),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '2007-11-16', 'ST_MAN', 5800.00, 0.00, 100, 50),
(125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '2005-07-16', 'ST_CLERK', 3200.00, 0.00, 120, 50),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '2006-09-28', 'ST_CLERK', 2700.00, 0.00, 120, 50),
(127, 'James', 'Landry', 'JLANDRY', '650.124.1334', '2007-01-14', 'ST_CLERK', 2400.00, 0.00, 120, 50),
(128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '2008-03-08', 'ST_CLERK', 2200.00, 0.00, 120, 50),
(129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '2005-08-20', 'ST_CLERK', 3300.00, 0.00, 121, 50),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '2005-10-30', 'ST_CLERK', 2800.00, 0.00, 121, 50),
(131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '2005-02-16', 'ST_CLERK', 2500.00, 0.00, 121, 50),
(132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '2007-04-10', 'ST_CLERK', 2100.00, 0.00, 121, 50),
(133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '2004-06-14', 'ST_CLERK', 3300.00, 0.00, 122, 50),
(134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '2006-08-26', 'ST_CLERK', 2900.00, 0.00, 122, 50),
(135, 'Ki', 'Gee', 'KGEE', '650.127.1734', '2007-12-12', 'ST_CLERK', 2400.00, 0.00, 122, 50),
(136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '2008-02-06', 'ST_CLERK', 2200.00, 0.00, 122, 50),
(137, 'John', 'Seo', 'JSEO', '650.127.1534', '2009-03-13', 'ST_CLERK', 2100.00, 0.00, 122, 50),
(138, 'George', 'Thompson', 'GTHOMPSON', '650.127.1434', '2004-10-13', 'ST_CLERK', 2500.00, 0.00, 123, 50),
(139, 'Sarah', 'Johnson', 'SJOHNSON', '650.127.1334', '2006-01-24', 'ST_CLERK', 2700.00, 0.00, 123, 50),
(140, 'Thomas', 'Schroeder', 'TSCHROEDER', '650.127.1234', '2007-02-05', 'ST_CLERK', 2200.00, 0.00, 123, 50),
(141, 'Elizabeth', 'Taylor', 'ETAYLOR', '650.127.1134', '2008-06-09', 'ST_CLERK', 2100.00, 0.00, 123, 50),
(142, 'Matthew', 'Brown', 'MBROWN', '650.127.1034', '2005-02-24', 'ST_CLERK', 2800.00, 0.00, 124, 50),
(143, 'Lisa', 'Williams', 'LWILLIAMS', '650.127.0934', '2007-08-15', 'ST_CLERK', 2600.00, 0.00, 124, 50),
(144, 'Andrew', 'Davis', 'ADAVIS', '650.127.0834', '2006-10-05', 'ST_CLERK', 2400.00, 0.00, 124, 50),
(145, 'David', 'Moore', 'DMOORE', '650.127.0734', '2008-04-19', 'ST_CLERK', 2300.00, 0.00, 124, 50),
(146, 'Deborah', 'White', 'DWHITE', '650.127.0634', '2005-05-12', 'ST_CLERK', 2700.00, 0.00, 125, 50),
(147, 'Jessica', 'Miller', 'JMILLER', '650.127.0534', '2006-06-17', 'ST_CLERK', 2500.00, 0.00, 125, 50),
(148, 'Michael', 'Nelson', 'MNELSON', '650.127.0434', '2007-11-25', 'ST_CLERK', 2400.00, 0.00, 125, 50),
(149, 'Patricia', 'King', 'PKING', '650.127.0334', '2008-07-21', 'ST_CLERK', 2300.00, 0.00, 125, 50),
(150, 'Christopher', 'Lopez', 'CLOPEZ', '650.127.0234', '2009-08-30', 'ST_CLERK', 2200.00, 0.00, 125, 50),
(151, 'Matthew', 'Martinez', 'MMARTINEZ', '650.127.0134', '2007-10-18', 'ST_CLERK', 3100.00, 0.00, 126, 50),
(152, 'Andrew', 'Hernandez', 'AHERNANDEZ', '650.126.9834', '2009-05-14', 'ST_CLERK', 2800.00, 0.00, 126, 50),
(153, 'Ashley', 'Roberts', 'AROBERTS', '650.126.9734', '2007-01-29', 'ST_CLERK', 2600.00, 0.00, 126, 50),
(154, 'Nancy', 'Young', 'NYOUNG', '650.126.9634', '2006-12-21', 'ST_CLERK', 2400.00, 0.00, 126, 50),
(155, 'Helen', 'Clark', 'HCLARK', '650.126.9534', '2008-11-22', 'ST_CLERK', 2300.00, 0.00, 126, 50),
(156, 'Benjamin', 'Adams', 'BADAMS', '650.126.9434', '2006-04-12', 'ST_CLERK', 2800.00, 0.00, 127, 50),
(157, 'William', 'Scott', 'WSCOTT', '650.126.9334', '2005-11-18', 'ST_CLERK', 2600.00, 0.00, 127, 50),
(158, 'Rebecca', 'Nelson', 'RNEALSON', '650.126.9234', '2007-06-11', 'ST_CLERK', 2400.00, 0.00, 127, 50),
(159, 'Charles', 'Lee', 'CLEE', '650.126.9134', '2008-01-07', 'ST_CLERK', 2200.00, 0.00, 127, 50),
(160, 'Katherine', 'Walker', 'KWALKER', '650.126.9034', '2006-10-28', 'ST_CLERK', 2900.00, 0.00, 128, 50),
(161, 'Lily', 'Wright', 'LWRIGHT', '650.126.8934', '2008-07-11', 'ST_CLERK', 2700.00, 0.00, 128, 50),
(162, 'Sarah', 'Green', 'SGREEN', '650.126.8834', '2007-12-09', 'ST_CLERK', 2500.00, 0.00, 128, 50),
(163, 'Megan', 'Hughes', 'MHUGHES', '650.126.8734', '2006-11-19', 'ST_CLERK', 2300.00, 0.00, 128, 50),
(164, 'James', 'Perez', 'JPEREZ', '650.126.8634', '2009-04-14', 'ST_CLERK', 2200.00, 0.00, 128, 50),
(165, 'Anna', 'Ramirez', 'ARAMIREZ', '650.126.8534', '2008-06-18', 'ST_CLERK', 3100.00, 0.00, 129, 50),
(166, 'Elena', 'Harris', 'EHARRIS', '650.126.8434', '2009-09-19', 'ST_CLERK', 2900.00, 0.00, 129, 50),
(167, 'Jasmine', 'Kim', 'JKIM', '650.126.8334', '2007-10-22', 'ST_CLERK', 2700.00, 0.00, 129, 50),
(168, 'Nancy', 'Davis', 'NDAVIS', '650.126.8234', '2006-05-02', 'ST_CLERK', 2500.00, 0.00, 129, 50),
(169, 'Jack', 'Morris', 'JMORRIS', '650.126.8134', '2007-12-28', 'ST_CLERK', 2300.00, 0.00, 129, 50),
(170, 'Samuel', 'Edwards', 'SEDWARDS', '650.126.8034', '2006-08-29', 'ST_CLERK', 2800.00, 0.00, 130, 50),
(171, 'Victoria', 'Collins', 'VCOLLINS', '650.126.7934', '2008-04-05', 'ST_CLERK', 2600.00, 0.00, 130, 50),
(172, 'George', 'Richards', 'GRICHARDS', '650.126.7834', '2007-07-14', 'ST_CLERK', 2400.00, 0.00, 130, 50),
(173, 'Ethan', 'Rodriguez', 'ERODRIGUEZ', '650.126.7734', '2006-11-02', 'ST_CLERK', 2200.00, 0.00, 130, 50),
(174, 'Carlos', 'Lopez', 'CLOPEZ', '650.126.7634', '2008-05-20', 'ST_CLERK', 2100.00, 0.00, 130, 50),
(175, 'Maria', 'Martinez', 'MMARTINEZ', '650.126.7534', '2006-03-04', 'ST_CLERK', 2500.00, 0.00, 131, 50),
(176, 'Robert', 'Miller', 'RMILLER', '650.126.7434', '2007-11-28', 'ST_CLERK', 2300.00, 0.00, 131, 50),
(177, 'Sophia', 'Perez', 'SPEREZ', '650.126.7334', '2008-02-26', 'ST_CLERK', 2100.00, 0.00, 131, 50),
(178, 'Ethan', 'Reed', 'EREED', '650.126.7234', '2009-12-18', 'ST_CLERK', 2900.00, 0.00, 131, 50),
(179, 'Ryan', 'Phillips', 'RPHILLIPS', '650.126.7134', '2007-02-22', 'ST_CLERK', 2700.00, 0.00, 131, 50),
(180, 'David', 'Evans', 'DEVANS', '650.126.7034', '2006-08-31', 'ST_CLERK', 2500.00, 0.00, 132, 50),
(181, 'Thomas', 'Miller', 'TMILLER', '650.126.6934', '2007-09-14', 'ST_CLERK', 2300.00, 0.00, 132, 50),
(182, 'Jonathan', 'Harris', 'JHARRIS', '650.126.6834', '2006-04-07', 'ST_CLERK', 2100.00, 0.00, 132, 50),
(183, 'Laura', 'Hall', 'LHALL', '650.126.6734', '2007-05-17', 'ST_CLERK', 2900.00, 0.00, 132, 50),
(184, 'Emma', 'Allen', 'EALLEN', '650.126.6634', '2006-10-13', 'ST_CLERK', 2700.00, 0.00, 132, 50),
(185, 'Jack', 'Young', 'JYOUNG', '650.126.6534', '2008-01-17', 'ST_CLERK', 2500.00, 0.00, 132, 50),
(186, 'Ava', 'Mitchell', 'AMITCHELL', '650.126.6434', '2007-02-28', 'ST_CLERK', 2300.00, 0.00, 133, 50),
(187, 'Olivia', 'White', 'OWHITE', '650.126.6334', '2006-08-13', 'ST_CLERK', 2100.00, 0.00, 133, 50),
(188, 'Jacob', 'Scott', 'JSCOTT', '650.126.6234', '2007-03-11', 'ST_CLERK', 2900.00, 0.00, 133, 50),
(189, 'Isabella', 'Clark', 'ICLARK', '650.126.6134', '2008-03-03', 'ST_CLERK', 2700.00, 0.00, 133, 50),
(190, 'William', 'Baker', 'WBAKER', '650.126.6034', '2007-08-25', 'ST_CLERK', 2500.00, 0.00, 133, 50),
(191, 'Grace', 'Evans', 'GEVANS', '650.126.5934', '2006-02-21', 'ST_CLERK', 2300.00, 0.00, 134, 50),
(192, 'Liam', 'Lopez', 'LLOPEZ', '650.126.5834', '2008-04-27', 'ST_CLERK', 2100.00, 0.00, 134, 50),
(193, 'Chloe', 'Moore', 'CMOORE', '650.126.5734', '2007-11-30', 'ST_CLERK', 2900.00, 0.00, 134, 50),
(194, 'Jackson', 'Taylor', 'JTAYLOR', '650.126.5634', '2006-07-05', 'ST_CLERK', 2700.00, 0.00, 134, 50),
(195, 'Aiden', 'Parker', 'PARKER', '650.126.5534', '2008-02-10', 'ST_CLERK', 2500.00, 0.00, 134, 50),
(196, 'Sophia', 'Collins', 'SCOLLINS', '650.126.5434', '2006-09-25', 'ST_CLERK', 2300.00, 0.00, 135, 50),
(197, 'Lucas', 'Bennett', 'LBENNETT', '650.126.5334', '2007-01-16', 'ST_CLERK', 2100.00, 0.00, 135, 50),
(198, 'Lily', 'Hughes', 'LHUGHES', '650.126.5234', '2008-07-04', 'ST_CLERK', 2900.00, 0.00, 135, 50),
(199, 'Liam', 'King', 'LKING', '650.126.5134', '2009-02-18', 'ST_CLERK', 2700.00, 0.00, 135, 50),
(200, 'Megan', 'Clark', 'MCLARK', '650.126.5034', '2006-12-13', 'ST_CLERK', 2500.00, 0.00, 135, 50),
(201, 'Benjamin', 'Evans', 'BEVANS', '650.126.4934', '2007-08-01', 'ST_CLERK', 2300.00, 0.00, 136, 50),
(202, 'Ella', 'Davis', 'EDAVIS', '650.126.4834', '2006-04-19', 'ST_CLERK', 2100.00, 0.00, 136, 50),
(203, 'Harper', 'Rodriguez', 'HRODRIGUEZ', '650.126.4734', '2008-05-21', 'ST_CLERK', 2900.00, 0.00, 136, 50),
(204, 'Liam', 'Martinez', 'LMARTINEZ', '650.126.4634', '2007-06-01', 'ST_CLERK', 2700.00, 0.00, 136, 50),
(205, 'Evelyn', 'Taylor', 'ETAYLOR', '650.126.4534', '2008-09-09', 'ST_CLERK', 2500.00, 0.00, 136, 50),
(206, 'Grace', 'Parker', 'GPARKER', '650.126.4434', '2009-03-15', 'ST_CLERK', 2300.00, 0.00, 136, 50);

--go

--SOLUTION EXERCISE No.1

select employees.first_name, employees.last_name, departments.department_id, departments.department_name
from employees join departments on departments.DEPARTMENT_ID = employees.Department_ID;

--EXERCISE No.2 
--From the following tables, write a SQL query to find the first name, last name,
-- department, city, and state province for each employee.
					
CREATE TABLE locations (
    LOCATION_ID INT,
    STREET_ADDRESS VARCHAR(60),
    POSTAL_CODE VARCHAR(10),
    CITY VARCHAR(30),
    STATE_PROVINCE VARCHAR(40),
    COUNTRY_ID VARCHAR(2)
);

INSERT INTO locations VALUES 
    (1000, '1297 Via Cola di Rie', '989', 'Roma', NULL, 'IT'),
    (1100, '93091 Calle della Testa', '10934', 'Venice', NULL, 'IT'),
    (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
    (1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
    (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
    (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
    (1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
    (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
    (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
    (1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
    (2000, '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'),
    (2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
    (2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
    (2300, '198 Clementi North', '540198', 'Singapore', NULL, 'SG'),
    (2400, '8204 Arthur St', NULL, 'London', NULL, 'UK'),
    (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
    (2600, '9702 Chester Road', '96298', 'Stretford', 'Manchester', 'UK'),
    (2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
    (2800, 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
    (2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
    (3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
    (3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
    (3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX');

--Solution Exercise No.2

select e.first_name, e.last_name, d.department_name, l.city, l.state_province 
from employees e join departments d on e.department_id = d.department_id
				 join locations l on  d.location_id = l.location_id;

--Exercise No. 3
--From the following table, write a SQL query to find the first name, 
--last name, salary, and job grade for all employees.

create table job_grades (GRADE_LEVEL VARCHAR(1), LOWEST_SAL INT, HIGHEST_SAL INT);
INSERT INTO job_grades values
						('A', 1000, 2999),
						('B', 3000, 5999),
						('C', 6000, 9999),
						('D', 10000, 14999),
						('E', 15000, 24999),
						('F', 25000, 40000);

--select e.first_name, e.last_name, e.salary, jg.grade_level
--from employees e join job_grades jg on e.salary between jg.lowest_sal and jg.highest_sal; 

--Exercise No. 4
--From the following tables, write a SQL query to find all those employees who work
--in department ID 80 or 40. Return first name, last name, department number and department name.

select * from departments
select * from employees
select 
	e.first_name, 
	e.last_name, 
	d.department_id, 
	d.department_name 
from employees e 
join departments d 
	on (e.department_id=80 or e.department_id=40)
order by e.last_name;
go
SELECT 
    e.first_name, 
    e.last_name, 
    e.department_id, 
    d.department_name 
FROM 
    employees e 
JOIN 
    departments d 
ON 
    e.department_id = d.department_id
WHERE 
    e.department_id IN (80, 40)
ORDER BY 
    e.last_name;

	SELECT *
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

--Exercise No.5
--From the following tables, write a SQL query to find those employees
--whose first name contains the letter ‘z’. 
--Return first name, last name, department, city, and state province.
select  e.first_name, 
		e.last_name, 
		d.department_name,
		l.city,
		l.state_province
from employees e 
	join departments d 
	on e.department_id = d.department_id
	join locations l
	on d.location_id=l.location_id
where first_name like '%z%'
order by e.first_name;
--Exercise No.6
--From the following tables, write a SQL query to find all departments,
--including those without employees.
--Return first name, last name, department ID, department name.
select e.first_name, e.last_name,
	   d.department_id, d.department_name
from employees e right outer join departments d
		on e.department_id=d.department_id;
--Exercise No.7
--From the following table, write a SQL query to find the employees who earn less than
--the employee of ID 182. Return first name, last name and salary.
select e1.first_name, e1.last_name,
	   e1.salary
from employees e1
	   inner join employees e2
	   on e1.salary<e2.salary and e2.employee_id=162;
--Exercise No.8
--From the following table, write a SQL query to find the employees and their managers.
--Return the first name of the employee and manager.
select e.first_name as 'Employee name', e1.first_name as 'Manager'
from employees e
	join employees e1
	on e.employee_id=e1.manager_id;
--Exercise No.9
--From the following tables, write a SQL query to display the department name,
--city, and state province for each department.
select d.department_name, l.city, l.state_province
from departments d
		join locations l
		on l.location_id = d.location_id;
--Exercise No.10
--From the following tables, write a SQL query to find out which 
--employees have or do not have a department. 
--Return first name, last name, department ID, department name.
select e.first_name, e.last_name, d.department_id, d.department_name
from employees e
		left join departments d
		on e.department_id=d.department_id;
--Exercise No.11
--From the following table, write a SQL query to find the employees and their managers. 
--Those managers do not work under 
--any manager also appear in the list. Return the first name of the employee and manager.
select e.first_name as 'Employee name', e1.first_name as 'Manager'
from employees e
	left join employees e1
	on e.manager_id=e1.employee_id;
--Exercise No.12
--From the following tables, write a SQL query to find the employees 
--who work in the same department as the employee with the last name Taylor.
--Return first name, last name and department ID.
select e.first_name, e.last_name, e.department_id
from employees e 
		join employees e1 
		on e.department_id=e1.department_id and e1.last_name='Taylor';
create table job_history 
(EMPLOYEE_ID int, START_DATE date, END_DATE date, JOB_ID varchar(15), DEPARTMENT_ID int)
insert into job_history values
(102, '2001-01-13', '2006-07-24', 'IT_PROG', 60),
(101, '1997-09-21', '2001-10-27', 'AC_ACCOUNT', 110),
(101, '2001-10-28', '2005-03-15', 'AC_MGR', 110),
(201, '2004-02-17', '2007-12-19', 'MK_REP', 20),
(114, '2006-03-24', '2007-12-31', 'ST_CLERK', 50),
(122, '2007-01-01','2007-12-31', 'ST_CLERK', 50),
(200, '1995-09-17', '2001-06-17', 'AD_ASST', 90),
(176, '2006-03-24', '2006-12-31', 'SA_REP', 80),
(176, '2007-01-01', '2007-12-31', 'SA_MAN', 80),
(200, '2002-07-01', '2006-12-31', 'AC_ACCOUNT', 90);
create table jobs
(JOB_ID varchar(10), JOB_TITLE varchar(40), MIN_SALARY int, MAX_SALARY int)
insert into jobs values
('AD_PRES', 'President', 20080, 40000),
('AD_VP', 'Administration Vice President', 15000, 30000),
('AD_ASST', 'Administration Assistant', 3000, 6000),
('FI_MGR', 'Finance Manager', 8200, 16000),
('FI_ACCOUNT', 'Accountant', 4200, 9000),
('AC_MGR', 'Accounting Manager', 8200, 16000),
('AC_ACCOUNT', 'Public Accountant', 4200, 9000),
('SA_MAN', 'Sales Manager', 10000, 20080),
('SA_REP', 'Sales Representative', 6000, 12008),
('PU_MAN', 'Purchasing Manager', 8000, 15000),
('PU_CLERK', 'Purchasing Clerk', 2500, 5500),
('ST_MAN', 'Stock Manager', 5500, 8500),
('ST_CLERK', 'Stock Clerk', 2008, 5000),
('SH_CLERK', 'Shipping Clerk', 2500, 5500),
('IT_PROG', 'Programmer', 4000, 10000),
('MK_MAN', 'Marketing Manager', 9000, 15000),
('MK_REP', 'Marketing Representative', 4000, 9000),
('HR_REP', 'Human Resources Representative', 4000, 9000),
('PR_REP', 'Public Relations Representative', 4500, 10500);
--Exercise No.13
--From the following tables, write a  SQL query to find 
--all employees who joined on or after 1st January 1993 and on or before 31 August 1997.
--Return job title, department name, employee name, and joining date of the job.
select j.job_title, d.department_name, e.first_name as 'Employee name', jh.start_date as 'Joining date'
from employees e join departments d on e.employee_id=d.department_id 
				 join job_history jh on d.department_id=jh.department_id
				 or jh.start_date between '1993-01-01' and '1997-08-31'
				 join jobs j on j.job_id=jh.job_id;
