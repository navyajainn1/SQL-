use world;

-- Primary key - It is a column in a table which contain unique and NOT NULL values.
-- A table can have only one primary key

-- Foreign key - It is a child column which can contain duplicate and null values.
-- It is used to establish a relationship between tables.

Select * from city;
describe city;
-- City table => (id - Primary key) (Countrycode - Foreign key)

Select * from country;
Select count(code), count(distinct code) from country;
-- Country (code - Primary key)

-- JOIN - It is used to connect two tables

Select cy.id,cy.name,cy.countrycode,cnt.name,cnt.continent from city as cy
join 
country as cnt
where cy.countrycode=cnt.code;

-- Q. Find the city name, the population, the country name along with the government form for each city

Select ct.name,ct.population,cnt.name,cnt.governmentform from city as ct 
join
country as cnt 
where ct.countrycode = cnt.code;

Select * from countrylanguage;

-- Q. Find out country name,its population and the language spoken with the percentage of each language

Select cnt.name,cnt.population,cntlang.language,cntlang.percentage from country as cnt
join
countrylanguage as cntlang
where cnt.code = cntlang.countrycode;

use sakila;
show tables;

Select * from actor;
select count(*) from actor;
select count(distinct(actor_id)) from actor;

Select * from film_actor;
Select count(*)  from film_actor;
Select count(distinct(film_id) ) from film_actor;

Select a.first_name,a.actor_id from actor as a;
Select fa.actor_id,fa.film_id from film_actor as fa;

Select a.actor_id,a.first_name,fa.film_id from actor as a join film_actor as fa
where a.actor_id = fa.actor_id;

desc film;
Select * from film;
select count(*) , count(distinct(film_id)) from film;

Select * from film_actor;
Select count(*) ,count(distinct(film_id) ) from film_actor;
desc film_actor;

Select f.film_id , fa.actor_id , f.title from film_actor as fa
join 
film as f
where f.film_id = fa.film_id;

select * from actor;
Select * from film_actor;
select * from film;

Select a.actor_id , fa.film_id, f.title from actor as a
join film_actor as fa
join film as f
where a.actor_id = fa.actor_id and fa.film_id = f.film_id;
















 


