
use world;

show tables;

select * from country;

select count(continent) from country;

select distinct(continent) from country;

select continent,count(*), sum(population) from country
group by continent
having count(*) > 50;

use sakila;
show tables;
drop table abc;

desc actor;
desc actor_info;

select first_name from actor;
select first_name from actor_info;

-- union
select first_name from actor
union
select first_name from actor_info;
drop table xyz;
desc xyz;
select length(id) from xyz;

create table xyz(id datetime );
insert into xyz values(now() );
select * from xyz;

create table abc(id int);
insert into abc values( 10);
select * from abc;
-- 20 14 10
-- 10 14 10

-- abc => 10
-- xyz  => "10" => 10

create table x as
(select id from abc
union
select id from xyz);

desc x;

use sakila;
desc film;

desc inventory;

select film.film_id,title
from film;

select film_id,last_update from inventory;

-- normal here
SELECT title, count(rental_id) as totalcount FROM
film INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
group by title having totalcount>15
order by totalcount desc limit 3;


desc inventory;
select film_id, inventory_id from film;
select * from rental;

--  list of the top 5 movies that were rented more than 30 times
SELECT title, COUNT(rental_id) AS num_rented FROM
film INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
GROUP BY title
HAVING num_rented > 30
ORDER BY num_rented DESC LIMIT 5;



use sakila;
show tables;
desc actor;
-- name , actor_id, 
desc actor_info; -- info

select * from actor;
select * from film_actor;

-- method 1
select actor.actor_id,first_name,film_id 
from actor inner join film_actor using(actor_id) ;
drop table student;
create table student(sid int, sname varchar(20));
insert into student values(1,"tushar");
insert into student values(2,"tushar2");
insert into student values(5,"AMAN");
select * from student;

create table student_hobby(id int, hobby varchar(20));
insert into student_hobby values(1,"cricket");
insert into student_hobby values(2,"badminton");
insert into student_hobby values(3,"tennis");
select * from student_hobby;

select id,sname, hobby
from student natural join student_hobby;


select count(*) from student inner join student_hobby;

-- method 1 of using
select student.id, sname , hobby
from student  join student_hobby using(id);

-- method 2 with where clause
select student.id, sname , hobby
from student,student_hobby where student.id= student_hobby.id;

-- method 3 on clause
select student_hobby.id, sname , hobby
	from student join student_hobby;
    

select count(*) from student inner join student_hobby;

SELECT first_name, last_name, film_id FROM
actor INNER JOIN film_actor USING (actor_id)
LIMIT 20;

-- with where clause
 SELECT first_name, last_name, film_id
FROM actor, film_actor
WHERE actor.actor_id = film_actor.actor_id
LIMIT 20;

SELECT first_name, last_name, film_id FROM
actor INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
LIMIT 20;

SELECT actor.actor_id, first_name, last_name, film_id
	 FROM
actor INNER JOIN film_actor using (actor_id);


SELECT actor.actor_id, first_name, last_name, film_id,
title, release_year
	 FROM
actor INNER JOIN film_actor using (actor_id)
inner join film using (film_id);


select * from film;
-- if we don't apply the where clause it will go with all matchng records
-- Cartesian product.
SELECT COUNT(*) FROM actor, film_actor;


-- The UNION statement isn’t really a join operator. Rather, it allows you to combine the output of more than one 
-- SELECT statement to give a consolidated result set


-- data is not ordered in case we have nested query as ordered
(SELECT title, rental_date, return_date
 FROM film JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
WHERE film_id = 998
ORDER BY rental_date ASC)
UNION ALL
(SELECT title, rental_date, return_date
 FROM film JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
WHERE film_id = 998
ORDER BY rental_date ASC LIMIT 5);



-- left join
SELECT title, rental_date
FROM film LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id);

-- join with group by
SELECT email, name AS category_name, COUNT(cat.category_id) AS cnt
FROM customer cs INNER JOIN rental USING (customer_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film_category USING (film_id)
INNER JOIN category cat USING (category_id)
GROUP BY email, category_name
ORDER BY cnt DESC LIMIT 5;

select cust.email, category.name,count(film_category.category_id) as movieCount
	from customer as cust
	inner join rental using (customer_id)
    inner join inventory as inv using (inventory_id)
    inner join film_category using (film_id)
    inner join category using (category_id)
	group by email, name having moviecount>2;
    
select * from category;
show tables;

-- natural join
SELECT first_name, last_name, film_id
FROM actor_info NATURAL JOIN film_actor
LIMIT 20;

create table employee(eid int, ename varchar(20),email varchar(20)
 ,manager_id int);

insert into employee values(1, "tushar", "tushar@gmail.com", null);
insert into employee values(2, "gopal", "gopal@gmail.com", 1);
insert into employee values(3, "aman", "aman@gmail.com", 4);
insert into employee values(4, "yashika", "yashika@gmail.com", 2);

select * from employee;
select emp.eid, emp.ename, emp.manager_id, 
	manager.eid, manager.ename
 from employee as emp, employee as manager
 where emp.manager_id= manager.eid;
 

