-- TCL (Transaction Control language) : Set of Logical statements , used to handle the logical statements
-- We use TCL for maintaining the data consistency

use regex;
create table actor_cp as select actor_id , first_name from sakila.actor
where actor_id between 1 and 5;

Select * from actor_cp;
Insert into actor_cp values (6,'SRK');

-- These values that we are inserting are saved in the table automatically because autocommit save each insertion
-- To check if autocommit is on or not:
Select @@autocommit;

-- When will the transactions going to be started?
-- In case if you run any DML operation
-- or you write START transaction
 
-- When will the transactions going to be automatically closed?
-- If i use TCL command like COMMIT or ROLLBACK , then our transaction can be closed
-- Or in case if i run any DDL operation or DCL operation then also our transaction can be closed 

-- 1. COMMIT - It is used to permanently save the insertion in the table
-- 2. ROLLBACK - It gets you back at your previous position you were on before inserting the command, we can revert our transactions

start transaction;  -- Whatever work will start will always be in pending state, until we write commit or rollback
insert into actor_cp value(7,'Sallu bhai');
Select * from actor_cp;
commit; -- It will be saved permanently because we commited the transaction to saved permanently

start transaction;
insert into actor_cp value(8,'akki');
Select * from actor_cp;
rollback; -- It will not save because we rollback the pending transaction

start transaction;
insert into actor_cp value(8,'akki');
Select * from actor_cp;
create table abc(id int);  -- This DDL command will save the upper pending transactions.

start transaction;
insert into actor_cp value(9,'kat');
insert into actor_cp values(10,'bebo');
delete from actor_cp where actor_id in (2,3,5);
Select * from actor_cp;
rollback;

Select * from actor_cp;

-- savepoint = It is a checkpoint, we can write this between transactions to make a checkpoint

start transaction;
insert into actor_cp value(9,'kat');
insert into actor_cp values(10,'bebo');
savepoint regex_actor_cp_sp1;
delete from actor_cp where actor_id in (2,3,5);
Select * from actor_cp;
rollback to regex_actor_cp_sp1;

Select * from actor_cp;

