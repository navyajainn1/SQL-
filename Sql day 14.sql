-- Co related sub query - that depends on outer query
-- It is executed repeatedly based on the output of outer query 
-- It is executed for each row of outer query


create database regexcorr;
use regexcorr;

CREATE TABLE employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(50),
    salary INT,
    department_name VARCHAR(50)
);

INSERT INTO employee (eid, ename, salary, department_name) VALUES
(1,  'Emp1',  30000, 'HR'),
(2,  'Emp2',  32000, 'HR'),
(3,  'Emp3',  34000, 'HR'),
(4,  'Emp4',  36000, 'HR'),
(5,  'Emp5',  38000, 'HR'),

(6,  'Emp6',  50000, 'IT'),
(7,  'Emp7',  52000, 'IT'),
(8,  'Emp8',  54000, 'IT'),
(9,  'Emp9',  56000, 'IT'),
(10, 'Emp10', 58000, 'IT'),

(11, 'Emp11', 60000, 'Finance'),
(12, 'Emp12', 62000, 'Finance'),
(13, 'Emp13', 64000, 'Finance'),
(14, 'Emp14', 66000, 'Finance'),
(15, 'Emp15', 68000, 'Finance'),

(16, 'Emp16', 40000, 'Sales'),
(17, 'Emp17', 42000, 'Sales'),
(18, 'Emp18', 44000, 'Sales'),
(19, 'Emp19', 46000, 'Sales'),
(20, 'Emp20', 48000, 'Sales');

Select * from employee;

Select department_name, avg(salary) from employee group by department_name;

Select ename, salary, department_name from employee 
where salary > (select avg(salary) from employee as e 
where e.department_name = employee.department_name);

-- Get the employee name , salary, department whose salary is equal to minimum of salary of their department

Select ename,salary,department_name from employee
where salary = (Select min(salary) from employee as e 
where e.department_name = employee.department_name);

Select ename,salary,department_name from employee
where salary <=all (Select salary from employee as e 
where e.department_name = employee.department_name);

