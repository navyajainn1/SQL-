-- DCL (Data Control Language) 
use regex;
create user tanya identified by 'tanya';

Select * from mysql.user;

create database navyadb;

create table navyadb.actor as select actor_id,first_name from sakila.actor 
where actor_id between 1 and 5;

create table navyadb.actor2 as select actor_id,first_name from sakila.actor 
where actor_id between 3 and 7;

show grants for tanya;

GRANT SELECT 
on navyadb.actor
to tanya;

GRANT SELECT 
on navyadb.*
to tanya;

GRANT All privileges 
on navyadb.actor
to tanya;