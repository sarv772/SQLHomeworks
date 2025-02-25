select name, (select min(salary) from employees) as 'Min_salary'
from employees
where salary<=(select min(salary) from employees);
select 
		product_name
from 
		products
where price > (select avg(price) from products);
select 
		[name]
from employees
	where department_id = (select id from departments
							where department_name = 'Sales');
select [name] 
from customers
where customer_id not in (select distinct customer_id from orders);
select category_id,
	   id,
	   product_name
from products p
where price = (select max(price) as 'Max_price' from products
			   where category_id = p.category_id);
select name,
	   salary
from employees
where salary >= (select avg(salary) from employees);
select [name],
	   avg(salary) as 'Above_avg'
from employees
where salary > (select avg(salary) from employees)
group by name;
select g.student_id, 
	   g.course_id, 
	   g.grade,
	   s.name
from grades g
				join (select course_id, MAX(grade) AS Max_grade
					  from grades
					  group by course_id) as Calc_max_grade
					  on g.course_id = Calc_max_grade.course_id AND g.grade = Calc_max_grade.Max_grade
				join students s on g.student_id = s.student_id;
select * 
from (select price,
			 rank() over (partition by category_id order by price desc) as Rank
	  from products) as Rank3
where Rank = 3;
select *
from employees e
where salary > (select avg(salary) from employees) and salary < (select max(salary) from employees where department_id = e.department_id);
