-- 1. List all customers who live in Texas (use JOINs)
select first_name, last_name
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (
    select customer_id
    from payment
    group by customer_id
    having SUM(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
select first_name, last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

-- 5. Which staff member had the most transactions?
select first_name, last_name, COUNT(p.staff_id)
from staff s
inner join payment p
on s.staff_id = p.staff_id
group by first_name, last_name
having COUNT(p.staff_id) > 7300
order by COUNT(p.staff_id) desc;

-- 6. How many movies of each rating are there?
select rating, COUNT(rating)
from film
group by rating
order by COUNT(rating) desc;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount in (
	select amount
	from payment
	where amount > 6.99
	group by amount
);

-- 8. How many free rentals did our stored give away? 
select * from payment
where amount = 0;











