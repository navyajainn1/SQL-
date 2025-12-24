CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

Select * from customers;
Select * from orders;


-- INNER join - It returns only those values which are common between tables
-- by default we can write join 
-- but if we write 'inner join' then in condition we write 'on' instead of wheretr

Select c.customer_id,c.customer_name,o.order_id, o.amount
from orders as o
INNER JOIN
customers as c
on o.customer_id = c.customer_id;

-- OUTER join - It returns all the values even if the values are common or not
-- 1. LEFT OUTER join - It returns all the values from left table and only matching values from the another table

Select c.customer_id,c.customer_name,o.order_id, o.amount
from customers as c
LEFT JOIN
orders as o
on o.customer_id = c.customer_id;

-- 2. RIGHT OUTER join - It returns all the values from right table and only matching values from the another table

Select c.customer_id,c.customer_name,o.order_id, o.amount , o.customer_id
from customers as c
RIGHT JOIN
orders as o
on o.customer_id = c.customer_id;

-- NATURAL join - We do not define any condition here, it takes condition itself, It returns matching values from both tables

Select c.customer_id,c.customer_name,o.order_id, o.amount , o.customer_id
from customers as c
NATURAL JOIN
orders as o;

-- Cross Join / Cartesian Join - When there is no common column between two tables,it connect values from one table to 
-- every single value from another table.

Select c.customer_id , sum(o.amount) from orders as o
join customers as c 
where c.customer_id = o.customer_id
group by c.customer_id;

use sakila;
show tables;
select * from actor;
select * from film_actor;
-- You need to find actor id, actor name , total numbers of movies the actor has worked
 
 Select a.actor_id , a.first_name , count(fa.film_id) from actor as a 
 join film_actor as fa
 where a.actor_id = fa.actor_id
 group by a.actor_id , a.first_name;
 
 
 





