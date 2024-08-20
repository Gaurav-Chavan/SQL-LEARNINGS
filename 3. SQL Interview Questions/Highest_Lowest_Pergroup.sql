-- Q2: Display highest and lowest salary 
use world;

drop table if exists employee;
create table employee
(
	name 		varchar(100),
	dept 		varchar(100),
	salary 		int
);
insert into employee values('Alexander', 'Admin', 6500);
insert into employee values('Leo', 'Finance', 7000);
insert into employee values('Robin', 'IT', 2000);
insert into employee values('Ali', 'IT', 4000);
insert into employee values('Maria', 'IT', 6000);
insert into employee values('Alice', 'Admin', 5000);
insert into employee values('Sebastian', 'HR', 3000);
insert into employee values('Emma', 'Finance', 4000);
insert into employee values('John', 'HR', 4500);
insert into employee values('Kabir', 'IT', 8000);

select * from employee;

-- Solution:
select * 
, max(salary) over(partition by dept order by salary desc) as highest_sal
, min(salary) over(partition by dept order by salary desc
                  range between unbounded preceding and unbounded following) as lowest_sal
from employee;
