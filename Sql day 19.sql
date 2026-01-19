-- Window functions : It is used to perform the calculation on the set of rows, with reference to the current row. 
-- There are mainly 3 parts in window :
-- 1. Over - To apply function over a window, to apply aggregate function & logic to a set of rows.

use world;
Select * from country;

Select code,name,continent,population,(Select sum(population) from country) from country;

-- In front of each continent we need the ppulation of that column only
Select code,name,continent,population,
avg(population) over() ,sum(population) over() from country;

-- 2. Partition by : It is same as group by which is used to apply the logic into group.
-- partition by means to divide
Select continent, sum(population) from country group by continent;

Select code,name,continent,population,
sum(population) over(partition by continent) from country;

Select code,name,continent,population,
sum(population) over(partition by name) from country;

-- What is the running sum or cummulative sum ?
-- use order by
Select code,name,continent,population,
sum(population) over(order by population) from country;

Select code,name,continent,population,
sum(population) over(), sum(population) over(partition by continent) from country;

Select code,name,continent,population,
sum(population) over(), sum(population) over(partition by continent) from country;

-- We can apply partition by on two columns
Select code,name,continent,region,population,
sum(population) over(partition by continent) as population_by_continent,
sum(population) over(partition by continent , region) as population_by_region from country;

