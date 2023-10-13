
SELECT email, name AS category_name, COUNT(rental_id) AS cnt
FROM category cat LEFT JOIN film_category USING (category_id)
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEFT JOIN customer cs USING (customer_id)
WHERE cs.email = 'WESLEY.BULL@sakilacustomer.org'
GROUP BY email, category_name
ORDER BY cnt DESC;

-- this gives different result
SELECT email, name AS category_name, COUNT(rental_id) AS cnt
FROM category cat LEFT JOIN film_category USING (category_id)
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEFT JOIN customer cs ON rental.customer_id = cs.customer_id
AND cs.email = 'WESLEY.BULL@sakilacustomer.org'
GROUP BY email, category_name
ORDER BY cnt DESC;

use sakila;
show tables;

select rental_duration from film
where film_id=1;

select film_id, rental_duration from film
where rental_duration=6;

select film_id, rental_duration from film
where rental_duration=(select rental_duration from film
where film_id=1);


select * from film;

-- finding the recent movie rented by customer
SELECT MAX(rental_date) FROM rental
JOIN customer USING (customer_id)
WHERE email = 'WESLEY.BULL@sakilacustomer.org';

-- getting the title now
SELECT title FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN customer USING (customer_id)
WHERE email = 'WESLEY.BULL@sakilacustomer.org'
 AND rental_date = '2005-08-23 15:46:33';
 
-- using nested query
 SELECT title FROM film JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
WHERE rental_date = (SELECT MAX(rental_date) FROM rental
JOIN customer USING (customer_id)
WHERE email = 'WESLEY.BULL@sakilacustomer.org');

