Select actor_id,first_name from sakila.actor where actor_id between 1 and 4
union
Select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

Select actor_id,first_name from sakila.actor where actor_id between 1 and 4
union all
Select actor_id,first_name from sakila.actor where actor_id between 3 and 5;

with recursive cte as 
(Select 10 as num
union
Select num+1 from cte
where num<15)
Select * from cte;

use navyadb;
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);


INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie

Select * from employees;

with recursive xyz as 
(Select employeeid,name,name as hierarchy from employees where managerid is null
union all
Select e.employeeid,e.name,concat(e.name,"=>",xyz.hierarchy) hierarchy_path from employees as e
join xyz where e.managerid = xyz.employeeid and e.employeeid < 7)
Select * from xyz;

with recursive cte as
(Select employeeid,name,1 as level from employees where managerid is null
union all
Select e.employeeid,e.name,cte.level+1 from employees as e 
join cte where e.managerid = cte.employeeid and e.employeeid < 6)
select * from cte;
