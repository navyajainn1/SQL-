-- view = A view in SQL is a virtual table 
-- views do not store the data physicially but will access the data from the existing table
-- It will make your complex query easy
-- It will help in security
-- views are simple and complex

use regex;

create table newactor as 
Select actor_id, first_name from sakila.actor where actor_id between 1 and 3;

Select * from newactor;

create view actor_v as 
select *, substr(first_name,2) from newactor;

Select * from actor_v;

Select * from newactor;
insert into newactor values(4,'riya');
select * from newactor;

Select * from actor_v;

-- simple view => any dml change will be visible on original table.
-- where view is created.
create view actor_v2 as         -- created view here for the query
select * from newactor where actor_id in (1,2);

select * from newactor;
insert into newactor values (5,'sakshi');   -- 4 row table

select * from actor_v2;

-- on any aggregate function or complex quey DMl does not work.

-- insert in view.
insert into actor_v2 values (6,'neha');
select * from actor_v2;
select * from newactor;

-- complex view =>
create table newpayment as
select payment_id, amount from sakila.payment where payment_id between 1 and 7;

select * from newpayment;

create view payment_v as
select count(*) from newpayment;

select * from payment_v;

