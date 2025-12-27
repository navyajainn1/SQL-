use regex;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),

(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),

(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),

(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),

(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),

(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),

(15, 'Sybil', 'Intern', 8, 35000);

-- SELF join - When a table is joined by itself it is called self join.

-- In terms of employee
Select emp.emp_id , emp.emp_name, emp.manager_id from employee as emp;
-- In reference of manager 
Select mngr.emp_id , mngr.emp_name from employee as mngr;

-- How to perform self join: 
Select emp.emp_id , emp.emp_name, emp.manager_id, mngr.emp_id , mngr.emp_name
from employee as emp
join
employee as mngr
where emp.manager_id = mngr.emp_id;

-- Compare employee salary to manager salary
Select emp.emp_id , emp.emp_name, emp.manager_id,emp.salary, mngr.emp_id , mngr.emp_name, mngr.salary
from employee as emp
join
employee as mngr
where emp.salary > mngr.salary;




