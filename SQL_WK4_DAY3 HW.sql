--Week 5 Day 3 HW
--1. List all customers who live in Texas (use JOINs) 
select first_name, last_name , customer_id 
from customer
full join address
on customer.customer_id = address.address_id
--run code--

--2. Get all payments above $6.99 with the Customer's Full Name 
select first_name, last_name, rental_id, amount, payment_date
from customer
left join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;
--run code--

--3. Show all customers names who have made payments over $175(use subqueries) 
select *
from customer
where customer_id in(
	select  customer_id 
	from  payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) asc
);
--run code--

--4. List all customers that live in Nepal (use the city table) 
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id 
where country = 'Nepal';
---answer: Kevin Schuler

--5. Which staff member had the most transactions?
select staff.staff_id, first_name, last_name, count(rental_id)
from staff
full join rental
on staff.staff_id = rental.staff_id 
group by staff.staff_id;
--answer: Mike Hillyer


--6. How many movies of each rating are there?
select rating, sum(film_id)
from film
group by rating;
--run code--

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select *
FROM payment
WHERE customer_id IN(
	SELECT customer.customer_id
	FROM customer
	where amount > 6.99
	order by customer_id desc
);
--run code-- 

--8. How many free rentals did our stores give away?
select *
from payment
where amount = '0.00';
--run code -- answer: 24


