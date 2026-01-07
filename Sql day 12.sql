use sakila;
select * from payment;

-- Q. Get all information of customers whose payment is equal to payment_id 4

Select * from payment where amount = (Select amount from payment where payment_id = 4);

-- Q. Get payment_id and amount from table where the amount is not equal to to the amount of payment_id 23

Select payment_id , amount from payment
where amount != (Select amount from payment where payment_id = 23);

-- Q. Get the payment_id , customer_id , amount, payment_date where the month of payment should be same as of payment id 6

select payment_id , customer_id , amount, payment_date from payment
where month(payment_date) = (Select month(payment_date)
from payment where payment_id = 6);
 
 -- Q. Get all the columns where the staff serving the customers should be same as of payment id 7
 
Select * from payment where staff_id = (Select staff_id from payment where payment_id = 7);
 
 -- Q. Get all the payment information where the amount is same as of the highest amount from the payment table
 
 Select * from payment where
 amount = (select max(amount) from payment);
 
 -- Get the amount and the total number of payments done for each amount only for those payment 
 -- whose amount is less than the amount of rental id 1725
 
 Select amount, count(*) from payment where
 amount > (Select amount from payment where rental_id = 1725) group by amount;