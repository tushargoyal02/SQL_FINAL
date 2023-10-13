-- windows function

use sakila;

create table employees(id int primary key auto_increment,
depat varchar(20), salary int);

insert into employees(depat, salary) values("hr",200),
("hr",300),("hr",100),
("marketing",70),("marketing",50),
("marketing",200),("marketing",400),
("dsa",150),("dsa",120),
("dsa",40),("dsa",90),("dsa",500);

select avg(salary) from employees;

alter table employees rename column depat to dept;
select dept, avg(salary) from employees group by dept;

-- windows : aggregate
-- aggregate for every row

select id, dept,salary,
avg(salary) over(partition by dept) as avgsalary
from employees;

select id, dept,salary,
sum(salary) over(order by salary) as rollingSum,
sum(salary) over(partition by dept) as PartitionSum
from employees;

select dept,sum(salary)
from employees group by dept;

select id, dept,salary,
sum(salary) over(partition by dept) as PartitionSum,
avg(salary) over(partition by dept order by salary) as rollinSumDept
from employees;



-- window function 
-- perform aggregat on groups of rows but produce	result for each row

-- help to see aggregate value along side the data

-- empno, department, salary

-- select avg() over() from table
-- over() will create an empty window mean all the record



SELECT 
    id, 
    dept, 
    salary, 
    AVG(salary) OVER(PARTITION BY dept) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

SELECT 
    id, 
    dept, 
    salary, 
    min(salary) OVER(PARTITION BY dept order by salary desc) AS dept_min,
    min(salary) OVER() AS company_min
FROM employees;




-- order by sum

SELECT 
    id, 
    dept, 
    salary, 
    SUM(salary) OVER(PARTITION BY dept ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY dept) AS total_dept_salary
FROM employees;

insert into employees(dept,salary) values("marketing",200);

select id, dept,salary,
rank() over(partition by dept order by salary),
dense_rank() over(partition by dept order by salary) as ranking
from employees;



-- 
/*

rank() over( order by salary desc)
rank() over(partition by col order by salary desc)
*/