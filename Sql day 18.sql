-- DDL (Data Definition Language): To deal with the structure of table
-- create table tablename;
-- drop, truncate, alter

create table navya4(col int);

use sakila;
-- create table using select (CTAS) 
create table actor_copy as 
select first_name , last_name from sakila.actor;

select * from actor_copy;

drop table actor_copy; -- drop => It delets the structure and data of table

create table actor_cp as 
select first_name as f_name, last_name as l_name from sakila.actor
where actor_id between 10 and 14;

Select * from actor_cp;

-- To add a column
Alter table actor_cp add column (salary int);
Select * from actor_cp;

-- To add a constraint on a column
Alter table actor_cp add constraint new_key  primary key(f_name);
desc actor_cp;

-- To drop a column
Alter table actor_cp drop column l_name;

-- To change column name
Alter table actor_cp rename column salary to new_salary;
Select * from actor_cp;

-- DML statements:
-- Deal with data
-- insert, update, delete

-- To update data
update actor_cp set new_salary = 900;
Select * from actor_cp;

update actor_cp set new_salary = 1000 where f_name = 'UMA';
Select * from actor_cp;