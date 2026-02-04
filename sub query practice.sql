create database corredb;

use corredb;

CREATE TABLE departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    dept_id     INT,
    salary      INT,
    job_title   VARCHAR(50),
    hire_date   DATE,
    CONSTRAINT fk_dept
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Sales'),
(50, 'Marketing');


INSERT INTO employees (emp_id, emp_name, dept_id, salary, job_title, hire_date) VALUES
(101, 'Alice',   10, 40000, 'HR Executive',      '2018-03-12'),
(102, 'Bob',     20, 60000, 'Software Eng',      '2019-07-19'),
(103, 'Charlie', 20, 75000, 'Senior Dev',        '2017-01-10'),
(104, 'David',   30, 50000, 'Accountant',        '2020-11-01'),
(105, 'Eva',     30, 90000, 'Finance Manager',   '2016-06-23'),
(106, 'Frank',   40, 45000, 'Sales Rep',         '2019-02-15'),
(107, 'Grace',   40, 70000, 'Sales Manager',     '2015-09-30'),
(108, 'Hannah',  50, 48000, 'Marketing Exec',    '2021-04-18'),
(109, 'Ian',     50, 65000, 'Marketing Lead',    '2018-12-07'),
(110, 'Jack',    20, 55000, 'QA Engineer',       '2020-08-25'),
(111, 'Karen',   10, 42000, 'HR Analyst',        '2019-05-14'),
(112, 'Leo',     30, 52000, 'Auditor',            '2021-09-09'),
(113, 'Mona',    40, 48000, 'Sales Exec',        '2022-01-03'),
(114, 'Nina',    20, 80000, 'Tech Lead',         '2016-10-11'),
(115, 'Oscar',   50, 47000, 'Content Writer',    '2020-06-17'),
(116, 'Paul',    10, 39000, 'Recruiter',         '2022-07-20'),
(117, 'Queen',   30, 61000, 'Financial Analyst', '2018-02-28'),
(118, 'Rick',    40, 53000, 'Sales Analyst',     '2019-09-05'),
(119, 'Steve',   20, 67000, 'DevOps Eng',        '2017-04-14'),
(120, 'Tina',    50, 72000, 'Brand Manager',     '2016-12-01');

Select * from employees;
Select * from departments;
-- Get employees whose salary is greater than average salary

-- 1st way
Select * from employees where
salary > (Select avg(salary) from employees);

-- 2nd way
with cte as(
Select avg(salary) from employees)

Select * from employees where salary>(select * from cte);

-- Find the employee who earn the maximum salary

Select * from employees where salary = (Select max(salary) from employees);

-- Find the employee who earn second highest salary

Select * from employees where salary = (
Select max(salary) from employees 
where salary < (select max(salary) from employees));
 
-- Find employees who work in department IT or Finance

Select * from employees where
dept_id in (select dept_id from departments where dept_name = 'IT' or dept_name = 'Finance');

-- Find employees whose salary is greater than all employees in HR department

-- 1st way
Select * from employees where salary >all (Select salary from employees
where dept_id = (Select dept_id from departments where dept_name = 'HR'));

-- 2nd way
Select * from employees where salary >all
(Select salary from employees as e join departments as d
on e.dept_id = d.dept_id 
where d.dept_name = 'HR');

-- Find only the employees who earn the same salary as the employees in sales department 

with cte as 
(Select d.dept_id, salary from employees as e join departments as d
on e.dept_id = d.dept_id 
where d.dept_name = 'Sales')

Select * from employees where salary in (Select salary from cte)
and dept_id not in (Select dept_id from cte);

-- Find those employees who are earning more than the average salary of their own department

Select emp_name, emp_id, dept_id , salary from employees as e
where salary > (Select avg(salary) from employees
where e.dept_id = dept_id );
