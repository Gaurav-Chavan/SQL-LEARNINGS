-- RECURSIVE SQL QUERIES in PostgreSQL, Oracle, MSSQL & MySQL
/* Recursive Query Structure/Syntax
WITH [RECURSIVE] CTE_name AS
	(
     SELECT query (Non Recursive query or the Base query)
	    UNION [ALL]
	 SELECT query (Recursive query using CTE_name [with a termination condition])
	)
SELECT * FROM CTE_name;
*/

/* Difference in Recursive Query syntax for PostgreSQL, Oracle, MySQL, MSSQL.
- Syntax for PostgreSQL and MySQL is the same.
- In MSSQL, RECURSIVE keyword is not required and we should use UNION ALL instead of UNION.
- In Oracle, RECURSIVE keyword is not required and we should use UNION ALL instead of UNION. Additionally, we need to provide column alias in WITH clause itself
*/
use world;
DROP TABLE IF EXISTS world.emp_details;

CREATE TABLE world.emp_details
    (
        id           int PRIMARY KEY,
        name         varchar(100),
        manager_id   int,
        salary       int,
        designation  varchar(100)

    );

INSERT INTO world.emp_details VALUES (1,  'Shripadh', NULL, 10000, 'CEO');
INSERT INTO world.emp_details VALUES (2,  'Satya', 5, 1400, 'Software Engineer');
INSERT INTO world.emp_details VALUES (3,  'Jia', 5, 500, 'Data Analyst');
INSERT INTO world.emp_details VALUES (4,  'David', 5, 1800, 'Data Scientist');
INSERT INTO world.emp_details VALUES (5,  'Michael', 7, 3000, 'Manager');
INSERT INTO world.emp_details VALUES (6,  'Arvind', 7, 2400, 'Architect');
INSERT INTO world.emp_details VALUES (7,  'Asha', 1, 4200, 'CTO');
INSERT INTO world.emp_details VALUES (8,  'Maryam', 1, 3500, 'Manager');
INSERT INTO world.emp_details VALUES (9,  'Reshma', 8, 2000, 'Business Analyst');
INSERT INTO world.emp_details VALUES (10, 'Akshay', 8, 2500, 'Java Developer');
commit;


/* Q1: Display number from 1 to 20 without using any in built functions. */
with recursive num as
	(select 1 as n
    union all
    select n+1 as n
    from num where n < 20
    )
select * from num;

/* ************************************************************************** */




/* Q2: Find the hierarchy of employees under a given manager */
select * from emp_details;

with recursive managers as
	(select id as emp_id, name as emp_name, manager_id
	 , designation as emp_role, 1 as level
	 from emp_details e where id=7
	 union
	 select e.id as emp_id, e.name as emp_name, e.manager_id
	 , e.designation as emp_role, level+1 as level
	 from emp_details e
	 join managers m on m.emp_id = e.manager_id)
select * from managers;

/* ************************************************************************** */

/* Q3: Find the hierarchy of managers for a given employee */

with recursive managers as
	(select id as emp_id, name as emp_name, manager_id
	 , designation as emp_role, 1 as level
	 from emp_details e where id=7
	 union
	 select e.id as emp_id, e.name as emp_name, e.manager_id
	 , e.designation as emp_role, level+1 as level
	 from emp_details e
	 join managers m on m.manager_id = e.id)
select *
from managers;