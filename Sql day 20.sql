CREATE DATABASE IF NOT EXISTS window_fn_practice;
USE window_fn_practice;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
salary INT NOT NULL,
hire_date DATE NOT NULL
);
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
emp_id INT NOT NULL,
sale_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, full_name, department, city, salary, hire_date) VALUES
(101, 'Asha Nair',   'Sales',      'Mumbai',    65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales',      'Pune',      72000, '2021-07-05'),
(103, 'Neha Singh',  'Sales',      'Delhi',     68000, '2023-01-15'),
(104, 'Kabir Rao',   'Engineering','Bengaluru', 120000,'2020-09-20'),
(105, 'Isha Verma',  'Engineering','Hyderabad', 110000,'2021-11-12'),
(106, 'Vikram Das',  'Engineering','Bengaluru', 125000,'2019-03-08'),
(107, 'Pooja Shah',  'HR',         'Mumbai',    60000, '2020-02-01'),
(108, 'Arjun Iyer',  'HR',         'Chennai',   58000, '2022-06-18');

INSERT INTO sales (sale_id, emp_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 12000.00),
(2, 101, '2026-01-05',  8000.00),
(3, 102, '2026-01-03', 15000.00),
(4, 102, '2026-01-09',  5000.00),
(5, 103, '2026-01-04',  7000.00),
(6, 103, '2026-01-10', 11000.00),
(7, 101, '2026-02-02', 14000.00),
(8, 102, '2026-02-03',  9000.00),
(9, 103, '2026-02-05', 13000.00),
(10,101, '2026-02-08',  6000.00),
(11,102, '2026-02-10', 16000.00),
(12,103, '2026-02-12',  4000.00);

Select * from employees;

Select *, sum(salary) over(),
sum(salary) over(partition by department) ,
sum(salary) over(partition by department,city)from employees;

-- Over(order by) : it gives result in ascending order according to the column
-- Running sum/ cummulative sum 
Select *,
sum(salary) over(order by salary) from employees;

Select *,
sum(salary) over(order by emp_id) from employees;

Select *,
sum(salary) over(order by full_name) from employees;

Select *,
sum(salary) over(order by city) from employees;

Select *,
sum(salary) over(order by month(hire_date)) from employees;

-- need to get the running sum of salary of each department

Select *,
sum(salary) over(partition by department order by salary) from employees;

-- row_number() => To define a unique value

Select *,
row_number() over(partition by department) from employees;

Select *,
row_number() over(partition by department order by hire_date) from employees;

-- rank() => It will give you the ranking for the values if there are same values and the ranking will be shared
-- rank() => It will give you the ranking for the values if there are same values and the ranking will be shared
-- and the next consecutive ranking will be skipped

Select *,
rank() over(order by city) from employees;

-- dense_rank() => It will work as rank() function but the ranking here will not be skipped.

-- Q. You have to give the highest ranking in each department
Select *,
rank() over(order by city),
dense_rank()over(order by city) from employees;

Select *,
dense_rank() over(partition  by department order by salary) from employees;

-- Q. In windows function what is the difference between rank(),dense_rank() & row_number
