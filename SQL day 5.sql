use world;

-- Distinct() - It returns only unique values, It is a normal keyword of also a function.
-- Syntax : Distinct(column_name) => for single column
-- Syntax : Distinct column_name,column_name => for multiple columns

Select distinct(continent) from country;
Select distinct continent , region from country;

-- Aggregate Function (Multi line functions) - To apply some calculation over set of rows.

-- 1. Count() - It is used to count the number of total rows in a column,It will not count null values.

Select count(indepyear) from country;
Select count(*) from country;  -- '*' is used to count all rows either null or not
Select count(population) from country; 

-- 2. Sum() - It is used to sum the values of a column.

Select sum(population) from country;

-- 3. Avg() - It is used to find out the average of a column.

Select Avg(population) from country;

-- 4. Max() - It is used to find out the maximum value from a column.

Select Max(population) from country;

-- 5. Min() - It is used to find out the minimum value from a column.

Select Min(population) from country;

Select count(continent) , count(distinct continent) from country;

-- Get those countries who got independent and their continent is Aisa.
select count(indepyear) from country where continent = 'Asia';
select count(indepyear), count(*) from country where continent = 'Asia';

-- Q. Get the total number of countries and the total region along with the average life expenctancy and the total population
-- for the country is who has got the independence after 1947 and before 1998.

select count(name),count(region), avg(lifeexpectancy) , sum(population) 
from country where indepyear > 1947 and indepyear < 1998;

-- Q. Get the total number of countries and the unique regions along with the total population
-- and highest life expectancy rate with the total capitals for the countries starting with the letter 
-- 'A' and letter 'D' .

Select count(name),count(distinct region), sum(population),max(lifeexpectancy),sum(capital)
from country where name like 'A%' or name like 'D%';


-- Group By() - It is used to group similar values.

Select continent,count(name) from country group by continent;
Select region , count(name) from country group by region;

-- Q. Find out the total countries and and the total population for each independent year

Select indepyear,count(name) , sum(population) from country group by indepyear;

Select continent, region, count(name) from country group by continent,region;

Select continent,count(name) from country where indepyear>1950 group by continent; -- where clause comes before gorup by clause

-- In where clause we ccan only filter the data which is present in our table only.


-- Having CLAUSE = We can use having to filter aggregate data , it can only be used when we are using the group by clause.

Select continent,count(name) from country group by continent having count(name)>30;  -- having  clause comes after group by


-- Difference between Where and Having: 

-- Where filters data which is available in the table 
-- Where comes before group by

-- Having filters the data which is calculated in our query which is aggregate data
-- Having comes after group by


-- Q. Find out the total population in each continent
Select continent,sum(population) from country group by continent;

-- Q. Get those continent where total poulation is greater than 100
Select continent,sum(population) from country group by continent having sum(population)>100;

-- Q. Find out how many countries got independent every year
Select indepyear,count(name) from country group by indepyear;

-- Q Find out how many countries got independent every year after 1930
Select indepyear, count(name) from country where indepyear>1930 group by indepyear;

-- Q. Get those indepyear where the number of countries who get independence is more than 2.
Select indepyear, count(name) from country group by indepyear having count(name)>2;

-- Q. You need to get government form and total number of countries for each goverment form where the total
-- number of countries should be greater than 20
Select governmentform,count(name) from country group by governmentform having count(name)>20;

-- Q. You need to get government form and total number of countries for each goverment form where the
-- country should have capital greater than 30
Select governmentform,count(name) from country where capital>30 group by governmentform;

-- Q. Get the number of countries and the regions with the total population
-- where the lifeexpectancy should be greater than 38 
-- and the total population in each conitnent should be greater than 3 Lakh.
Select continent,count(name),count(region),sum(population) from country 
where lifeexpectancy > 38 group by continent having sum(population)>300000;


 