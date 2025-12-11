use world;

-- WHERE clause
select * from country;
select * from country where Continent = 'Asia';
select * from country where indepyear = 1991;
select name,continent from country where indepyear = 1991;


-- In operator - when we want some specific set of values 
select * from country where continent in ('Africa','Asia');
select * from country where indepyear in (1960,1991);

-- Not in operator: 
select * from country where indepyear not in (1960,1991);


-- Between operator - when we want values within a range we can use between operator
select * from country where indepyear between 1960 and 1991;  -- in between operator range value is inclusive

-- Not between operator:
select * from country where indepyear not between 1960 and 1991;


-- Q1. Get the country name and the continent where the region is not South europe.
select name,continent from country where region != 'South Europe';

-- Q2. Get the country name continent, population along with 10% increment in the population.
select name,continent,population,population+(population*10)/100 from country;

-- Q3. Get all the columns where the life expentancy is either 75.1 or 77.8 or 63.7.
select * from country where LifeExpectancy in (75.1,77.8,63.7);

-- Q4. Get the country name population, region where the population should not be from 5000 to 300000.
select name,population,region from country where population not between 5000 and 300000;


-- Like Operator - This is used to match a pattern, for exampe if we want name starting with letter 'A' only, then we can use like operator
-- pattern - name => letter start, letter include, letter end 
-- % => special character / wild card character for ex:('N%' or 'Na%' or 'Ta%' or 'T%')
-- % => zero or more character
-- _ (underscore) =>  It represents only one character 

Select * from country where name like 'A%';  
Select * from country where name like 'An%';  
Select * from country where name like '%a';
Select * from country where name like '%r%';  
Select * from country where name like 'i%'; 

-- when we want a specific length of value we can use underscore
select * from country where name like 'ir__';
select * from country where name like '____';
select * from country where name like '_u__';

-- Combination of % and _ 
select * from country where name like '_u%';
select * from country where name like '_u_%'; 

-- Not like :
select * from country where name not like 'a%';

-- Q1. Get the country name and the continent where the continent start with the letter 'N'. 
Select name,continent from country where continent like 'n%';

-- Q2. Get the name and continent where the second last character is 'P' .
Select name,continent from country where continent like '%p_';

-- Q3. Get the country and the continent where the continent have minimum four characters.
Select name,continent from country where continent like '____';

-- Q4. Get the name and continent where the second letter is 'A' and the last second letter is also A'' from region column.
Select name,continent from country where region like '_a%a_';

-- Q5. Get the name and continent where the third character is 'C' and last three character is 'Sia' from region column
Select name,continent from country where region like '__c%sia';

-- Q6. Get the name and region where the continet is north america or south america.
Select name,region from country where continent in ('South America','North America');