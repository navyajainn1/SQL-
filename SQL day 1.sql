-- My SQL

-- To see all the databases available
show databases;

-- To create a database (to orgnanize data)
-- syntax --> create database database_name;
create database tata;

-- To utilize the database for which data will be stored
use tata;

-- To see all the tables in a database
show tables;

-- To create a table
-- syntax --> create table table_name;
create table nexon(price int,color char(20)); 

show tables;

use world;

show tables;

-- To see the column names of my country table
describe country;

-- To print
select * from country;

-- To see specific columns
select name, population, region from country;

-- If we want to do some changes in columns
select name,population,region, population-500 from country;

-- to filter data we use WHERE clause
select * from country where continent = 'Asia';

select * from country where indepyear = 1984;

