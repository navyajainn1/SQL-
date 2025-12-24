use sakila;

-- Order by - It used to sort data in asceding or descending order
-- By default it sorts in ascending order
-- To sort in descending order =>  order by column_name desc

Select * from payment order by amount;
Select * from payment order by amount desc;
Select * from payment order by customer_id , amount;
Select * from payment order by customer_id,amount desc;
Select * from payment order by customer_id desc,amount;

