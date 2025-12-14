use world;

-- NUMERIC FUNCTIONS:

-- 1. Round() - It is used to round of decimal digits

select lifeexpectancy , round(lifeexpectancy) from country;
select 30.68, round(30.63,2);
select 30.68, round(30.647,2);
select 30.68, round(30.641,2);
select round(463.0052,-2);
select round(3653.68,-3);

-- 2. Truncate()- It is used to extract values. 

select round(3653.68,1), truncate(3653.68,1);

-- 3. Mod() - It gives us the remainder of the value

select mod(10,3);

-- 4. pow() - It is used to obtain power of a number

select pow(2,4);

-- 5. Ceil()

select ceil(4.0000001);

-- 6. Floor()

select floor(4.9999999999);

-- DATE FUNCTIONS:

-- 1. Now() - It will give you current date and time

select now();

select current_timestamp();
select current_date();
select current_time();

-- 2. Adddate() - We can add or subtract date,month,year.

select now() , adddate(now(),2);  -- To add days
select now() , adddate(now(),-2); -- To subtract days
select now() , adddate(now(),interval 2 month); -- To add month
select now() , adddate(now(),interval -2 month); -- To subtract month
select now() , adddate(now(),interval -2 year); -- To subtract year
select now() , adddate(now(),interval 2 year); -- To add year
select now() , adddate(now(),interval 2 hour); --  to add hours

-- 3. year() - To extarct year

select now() , year(now()) ;

-- 4. extract() - It is used to extract month,day,year etc.

select now() , extract(year from now());
select now() , extract(month from now());
select now() , extract(day from now());
select now() , extract(week from now());
select now() , extract(hour from now());

-- 5. date_format - extract but with a string(message)
select now(), date_format(now(),'Month is %M');
select now(), date_format(now(),'Year is %Y');
