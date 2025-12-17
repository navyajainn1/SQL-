use sakila;

show tables;

select * from payment;

select count(*) from payment where amount = 2.99;

select * from payment;

select amount,count(*) from payment group by amount;

select customer_id, sum(amount) from payment group by customer_id;

-- Q. Get the customer and total amount but the amount spend should be greater than 3.
select customer_id, sum(amount) from payment where amount>3 group by customer_id;

-- Q. You need to find the total transaction done by each customer in the month of may
select customer_id,count(amount) from payment 
where month(payment_date) = 5 group by customer_id;

-- Q. You need to find out the maximum amount of transaction, the average transaction amount and the total transaction amount 
-- done through each staff.
Select staff_id,max(amount),avg(amount),sum(amount) from payment group by staff_id;

-- Q. Find out the maximum,average,total amount done by each staff but for the even number of customer
Select staff_id,max(amount),avg(amount),sum(amount) from payment where (customer_id%2=0) group by staff_id;

-- Q. Find out the amount and the total transaction done for each amount only for the payments done through staff_id = 1 
-- and the total transaction should be greater than 30.
select amount,count(amount) from payment where staff_id = 1 group by amount having count(amount)>30;

-- Q. Find out the number of customer served along with the average amount and the total amount spend
-- in each month for staff 1 or 2. 

select month(payment_date),count(customer_id), avg(amount), sum(amount) from payment 
where staff_id = 1 or staff_id = 2 group by month(payment_date);

-- Q. Find out the number of customer served along with the average amount and the total amount spend
-- for each year and each month.

  Select year(payment_date),month(payment_date),count(customer_id),avg(amount),sum(amount) from payment 
  group by year(payment_date),month(payment_date);
  
  
