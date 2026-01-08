use sakila;

-- Multi Line Query - In this Query we can not use comparision operator directly because the subquery is returing multiple values

Select * from payment where 
amount in (Select amount from payment where payment_id = 3 or payment_id = 2);

-- We can use the comparision operator with any operater we can write comparision operator before any keyword

Select * from payment where 
amount =any (Select amount from payment where payment_id = 3 or payment_id = 2);

Select * from payment where 
amount >any (Select amount from payment where payment_id = 3 or payment_id = 2);

Select * from payment where 
amount >=any (Select amount from payment where payment_id = 3 or payment_id = 2);

Select * from payment where 
amount <any (Select amount from payment where payment_id = 3 or payment_id = 2);

-- We have all keyword it combines all the value of subquery and let us apply comparirison operator

Select * from payment where 
amount >all (Select amount from payment where payment_id = 3 or payment_id = 2);

Select * from payment where 
amount <all (Select amount from payment where payment_id = 3 or payment_id = 2);

-- Q. Get all the payment information where the month of payment should be same as the mnth of payment of 2 or 3

Select * from payment where month(payment_date) in
 (Select month(payment_date) from payment where payment_id = 2 or payment_id = 3);


-- Q. Get all the payment info whose amt is larger than among all the amount of payment id 2 to 8

select * from payment where amount >all (Select amount from payment where payment_id between 2 and 8);
