-- CTE - Common table expression for your sql query
-- It stores data on temporary basis
-- It will help to break complex query into readable format

Select * from sakila.actor;

with tanya_cte as
(Select * from sakila.actor where actor_id between 5 and 90)

Select count(*) from tanya_cte;

Select * from sakila.payment;

with cte as 
(Select *, month(payment_date) from sakila.payment)
Select month(payment_date),count(*) from cte group by month(payment_date);


with cte as
(Select *,dense_rank() over(order by amount desc) as rankings from sakila.payment)
Select * from cte where rankings = 2;

with cte as 
(Select *, dense_rank() over(partition by customer_id order by amount desc) 
as rankings from sakila.payment)
select * from cte where rankings = 2;

create database test90;
use test90;

CREATE TABLE employee (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50),
    department VARCHAR(30),
    salary     INT,
    manager_id INT
);

INSERT INTO employee (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Alice',   'HR',      50000, NULL),
(2, 'Bob',     'HR',      45000, 1),
(3, 'Charlie', 'HR',      55000, 1),

(4, 'David',   'IT',      70000, NULL),
(5, 'Eva',     'IT',      65000, 4),
(6, 'Frank',   'IT',      72000, 4),
(7, 'Grace',   'IT',      68000, 4),

(8, 'Henry',   'Sales',   60000, NULL),
(9, 'Irene',   'Sales',   58000, 8),
(10,'Jack',    'Sales',   62000, 8);


select * from employee;

select emp_name,emp_id from employee 
where salary > (Select avg(salary) from employee as e where 
employee.department = e.department);

with cte as 
(Select department as dept,avg(salary) as deptsalary from employee group by department)
Select e.emp_id,e.emp_name,e.department,e.salary, cte.dept,cte.deptsalary
from employee as e join cte where e.department = cte.dept 
and e.salary > cte.deptsalary;

