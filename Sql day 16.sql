-- Foreign key - It helps to establish a relationship between tables.
use regex;

drop table customer;
create table customer(cid int primary key, cname varchar(20));
insert into customer values(10,'navya'),(11,'tanishq');


drop table orderss;
create table orderss (oid int primary key, city varchar(20),cid int,
foreign key (cid) references customer(cid));
insert into orderss  values(1007,'jaipur',10),(1008,'goa',11),(1009,'J.K.',10);

Select * from customer;
Select * from orderss;


