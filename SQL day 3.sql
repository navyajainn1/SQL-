use world;

-- Basic Functions

-- String Function:
-- 1. Case conversion - It changes the case of string in upper case or lower case.
Select name,upper(name),lower(name) from country;

-- 2. Concat() - To add two columns into one we can use this - concat(column1,column2)
Select name,code,concat(name,code) from country;

-- To seperate the two values we can insert some character or wide space
Select name,code,concat(name,'-',code) from country;

-- We can also add manually by writing anything after column names
Select name,code,concat(name,'-',code,' ','navya') from country; 

-- 3. Concat_ws() -It is same as concat but it takes separater before colmns - concat_ws(separater,column1,column2)
Select name,code,concat_ws('$',name,code) from country;

select name,code,concat(name,' ',code) from country
 where concat(name,' ',code) = 'Afghanistan AFG';
 
 -- Q. Get columns name,continent,region where in the region the continent name should be present
 Select name,continent,region from country where region like concat('%',continent);
 
 -- Q. Get name of those country where country name should be same as region name
 Select name,region from country where name like region;
 
 -- 4. left() - It is used to extract a string from left side - left(column_name,no. of characters)
 -- 5. right() - It is used to extract a string from right side - right(column_name,no. of characters)
 
  Select name,left(name,2) from country;
  Select name,right(name,2) from country;
 
 -- Q. Get name,continent,population where the first chacracter of continent should be same as of country
 Select name,continent,population from country where left(continent,1) = left(name,1);
 
 -- 6. Substr() - We can specify from which column and from which position we want our to string to get print
 -- Syntax - substr(column_name, position, no.of characters)
 
Select name,substr(name,1) from country;
Select name,substr(name,2), substr(name,2,4) from country;  
Select name,substr(name,-2) from country;    -- We can also give negative position, here -2 means second last character
Select name,substr(name,-4,2) from country;

--  Q. Get the name of those countries where the countries first character is same as the continent first character
Select name,continent from country where substr(name,1,1) = substr(continent,1,1);

-- Q. Get the country name and population where the starting three character of the country is 'Alg'
Select name,population from country where substr(name,1,3) = 'Alg';

-- 7. instr() - It returns the position of a character inside a string. 
-- Syntax - instr(column_name, character)

select name,instr(name,'e') from country;

-- 8. Char_length() - It returns the number of characters in a string.
-- syntax - char_length(string)

select name,char_length(name) from country;

-- 9. Trim() - It by default trims the extra white space from the very rightmost and leftmost only
-- we can manually trim some charcters from right and left side only it will not trim anything from middle.
-- Syntax - trim(string) or trim(both'character'from string)
-- It has two types:
-- Rtrim() - It trims white space from right side
-- Ltrim() - It trims white space from left side

Select '        navya        ';
select char_length('        navya        ');
select trim('        navya        '),char_length(trim('        navya        '));

select trim(both'z'from'     navyazzzzzzzzzzzzzzzz');
select name,trim(both 'A' from name) from country;
select name,trim(both 'a' from trim(both 'A' from name)) from country;

-- Lpad() and Rpad() - when we want to define a column with fixed size

Select name,population ,lpad(population,9,'#') from country;
Select name,population ,lpad(population,9,0) from country;
