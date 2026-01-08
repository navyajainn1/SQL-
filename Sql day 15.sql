-- Constraints are rules applied to table columns to control what type of data can be stored in a database.

use regex;

Create table test1(sno int);

describe test1;

insert into test1 values(10);

Select * from test1;

insert into test1(sno) values(11);
insert into test1(sno) values(20),(null),(30),(40),(50);

-- Type of constraints: 

-- 1. Not Null - Ensures a column cannot have NULL values

create table test2(sno int not null,salary int);
insert into test2(sno,salary) values(101,10000);
select * from test2;
insert into test2(sno,salary) values(102,null);
insert into test2(sno,salary) values(null,20000); -- we have set not null constraint hence error
insert into test2(sno) values (1000);
insert into test2(salary) values(500000); -- It will give error because we have given the of column with not null constraint

-- 2. Default - Assigns a default value if no value is provided

create table test3(sno int not null default 100,salary int);
insert into test3(salary) values(10000);
insert into test3(sno) values (101);
select * from test3;

-- 3. UNIQUE - Ensures all values in a column are different.

create table test4 (sno int not null,
					salary int unique default 100);
                    
insert into test4(sno,salary) values (1000,20000);
insert into test4(sno,salary) values (1001,20000); -- ERROR Duplicate values
insert into test4(sno) values (1002); -- Will take default value 
insert into test4(sno) values (1003); -- ERROR because default value has already been inserted and 
					                  -- because of unique constraint it cannot be inserted again
insert into test4(sno,salary) values (1004,null);
insert into test4(sno,salary) values (1005,null); -- UNIQUE can contain any number of null values
Select * from test4;

-- 4. CHECK - Ensures values satisfy a condition

create table test5(sno int,salary int,
check (sno between 1 and 100),
check (salary in (10000,20000)));

insert into test5(sno,salary) values(50,12000); -- ERROR because salary does not match check constraint condition
insert into test5(sno,salary) values(50,10000);
insert into test5(sno,salary) values(101,10000); -- ERROR because sno does match check constarint condition
insert into test5(sno,salary) values(100,20000);
Select * from test5;

drop table test5;

create table test5(sno int,salary int,
constraint regex_test5_sno_chk check (sno between 1 and 100), -- We can also name our constarint for better understanding
constraint regex_test5_salary_chk check (salary in (10000,20000)));


-- 5. PRIMARY KEY - Combines NOT NULL + UNIQUE
				-- Uniquely identifies each row in a table

create table employees(empid int primary key,emp_name varchar(20),email varchar(50) unique,
age int default 22,
gaurdian varchar(20),
constraint regex_employee_gaurdian_chk check (gaurdian = reverse(gaurdian)));
desc employees;

insert into employees(empid,emp_name,email,age,gaurdian) values(101,'Navya','navyajain@gmail.com',20,'MaaM');
Select * from employees;