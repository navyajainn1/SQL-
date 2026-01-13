-- Data Types: 
-- 1. Numbers => int, decimal

-- Int
-- tinyint, smallint, mediumint, int, bigint
-- 1 byte, 2 byte, 3 byte, 4 byte, 8 byte
-- tinyint => 1 byte = 8 bit 2**8 => 256 range - 0-255 (-128 to 127)
use regex;
create table navya1(salary tinyint);
insert into navya1 values(127);
insert into navya1 values(128);  -- ERROR because it is exceeding the range

-- Decimal
create table navya2(salary float,price double);  -- Float occupies 4 bytes and double occupies 8 bytes
insert into navya2 values(100.67899241,100.67899241);
select * from navya2;

-- String :
-- char(n) = fixed size/length character
-- varchar(n) - variable length character
create table navya3(name varchar(20),gender char(10));
insert into navya3 values ('Tanishq','male'),('tanya','female');
select * from navya3;
insert into navya3 values ('navya           ','female          '); -- char will truncate all the whitespaces from the last 
																   -- varchar will have all the whitespaces upto the size of the column
select name,gender,length(name),length(gender) from navya3;
   


