use sakila;

-- dql select statement

select database();

show tables;

show columns from actor_info;
desc actor;

select * from actor;

select * from sakila.actor;

SELECT name FROM sakila.language;

/* The WHERE clause is a powerful tool that allows you to filter which rows are returned from a SELECT statement. 
*/
select * from language where language_id <> 3;
select * from language where name='English';

select * from language where name > 'i';

SELECT city FROM city WHERE country_id != 15;

/* Not equals to*/
SELECT language_id, name FROM sakila.language
WHERE language_id <> 2;

select * from actor;
# not case sensitive and uses character set
SELECT first_name FROM actor WHERE first_name > 'Bette';

select * from film;
select * from film where title like 'DINOSAUR%';

-- prefix
SELECT title FROM film WHERE title LIKE '%family%';
SELECT * FROM film;
SELECT * FROM film;

SELECT * FROM film where title like 'A_E%';


-- actor with NAT
SELECT actors,title FROM film_list WHERE actors LIKE 'NAT_%'; 

-- exact matches with like too
SELECT category, rating,title 
FROM film_list WHERE category LIKE 'Sci-Fi'
AND rating LIKE 'PG';

# use paranthesis here for the order setting
SELECT title FROM film_list WHERE (category like 'Sci-Fi'
OR category LIKE 'Family') AND rating LIKE 'PG';


SELECT (2+2)*3;

#-- differenet output bcz of paranthesis 
SELECT 2+2*3;

SELECT * FROM sakila.city WHERE city_id = 3
OR city_id = 4 AND country_id = 60;

SELECT * FROM sakila.city WHERE country_id = 60
AND city_id = 3 OR city_id = 4;


#not operator with other or condition
SELECT fid,title FROM film_list WHERE FID < 7 AND NOT (FID = 4 OR FID = 6);

#sorting with order by ( asc and desc)

#sorting based on address and grouped by district

SELECT address, district FROM address
ORDER BY district, address; 

