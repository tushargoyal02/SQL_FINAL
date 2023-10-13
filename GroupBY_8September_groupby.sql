# drop delete, truncate

# alias name - nickname
-- expression => acha name ( readability)
use sakila;
select first_name, 
concat("MR ",first_name) as FullName from actor
order by fullname;




/*
Aliases are nicknames. They give you a shorthand way of expressing a column, table, or function name, allowing you to:
Write shorter queries.
Express your queries more clearly.
Use one table in two or more ways in a single query.
Access data more easily from programs.
Use special types of nested queries,
*/

-- where ( join where/ using / on clause)
-- can't user with where or on clause
-- There are restrictions on where you can use column aliases. You can’t use them in a WHERE clause, or in the USING and ON clauses
SELECT first_name AS name FROM actor WHERE name = 'ZERO CAGE';

-- Alias names have a few restrictions. They can be at most 255 characters in length and can contain any character. 

use sakila;

-- group by
select first_name, length(first_name)
from actor;

-- mulitple row => ouput 
-- similar => operation
-- group  => group operation

-- group by operation
show tables;
select * from film;

use world;
show tables;
select * from country;

desc country;
create table t1(id int, city varchar(20) );
insert into t1 values(1,"hey");
insert into t1 values(2,"hey2");
insert into t1 values(null,"hey");

select count(*) from t1;
select disti(id) from t1;

select sum(id) from t1;
select count(distinct id) from t1;

show tables;

desc city;
select * from city;

select countrycode,count(id) from city 
group by countrycode;


SELECT * FROM CITY;
-- TOTAL POPULATION WITH NAME() WITH THE COUNT
-- "cOUNTRY afg HAS TOTAL COUNT OF () 
-- AND SUM IS (POPULATION SUM,)
select countrycode,count(id),
	sum(population) AS TOTALPOPULATION
	from city 
	group by countrycode
    having sum(population)>500 and count(id)>1
    ORDER BY TOTALPOPULATION;
    
select countrycode, sum(population) from city
where population > 200000
group by countrycode;

select * from country;
select countrycode, sum(population) from city
group by countrycode;

select * from country;
desc country;

select continent,region,count(code) from country
group by continent,region order by region,continent;

-- single column group by
select continent from country where continent="Europe"
group by continent;
select distinct countrycode from city 
countrycode;

select * from city;
desc actor;
select last_name,first_name
from actor group by last_name,first_name
order by last_name;

-- Note also that while every column in the SELECT must be used either in GROUP BY or in an aggregate function, you can GROUP BY columns that are not part of the SELECT

# how many movies a user has worked
SELECT first_name, last_name, COUNT(film_id) AS num_films FROM
actor INNER JOIN film_actor USING (actor_id)
GROUP BY first_name, last_name
ORDER BY num_films DESC LIMIT 5;

-- COUNT() does the counting. One exception is NULL: while it’s perfectly acceptable and legal to specify COUNT(NULL), the result will always be zero, as COUNT() discards NULL values. Of course, you can use a column alias 
-- for the COUNT() column.

select count(actor_id) from actor;

-- COUNT(*) will do a count of rows returned, regardless of whether the column in those rows is NULL or not. 
 SELECT COUNT(*) FROM customer;

--  COUNT(<column>), only non-NULL values will be counted.
SELECT COUNT(email) FROM customer;

--  expression in the HAVING clause uses an aggregate function such as COUNT(), SUM(), MIN(), or MAX()








