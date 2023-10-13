
-- create database test;

-- strucuture - table  row and columns
-- row columns and data type

use test;
create table student(sid int, email char(20));

select * from student;
-- dml insert
insert into student values(2,null);

insert into student(sid) values(3);

create table student2
(sid int, email char(20) default "hey");

insert into student2(sid,email) values(4,"tushar");

select * from student2;

-- constraints => condition => invalid data can't be inserted
-- not null
create table student3
(sid int not null default 0 , 
	email char(20) default "gmail.com");
    
    
insert into student3(email) values("user@");
insert into student3(sid,email) values(null,"user@");

select * from student3;

create table student_unique
(sid int unique default 0 , 
	email char(20) default "gmail.com");

insert into student_unique(email) 
values("user@22");

select * from student_unique;

-- drop table employee;

create table employee(eid int primary key,
ename char(20));

create table employee222(eid int,
ename char(20),
primary key (eid) );

insert into employee values(1,"tushar");
insert into employee values(null,"tushar");
select * from employee;

drop table ex3;
create table ex3 (eid int unsigned );

insert into ex3 values(-42);
select * from ex3;





