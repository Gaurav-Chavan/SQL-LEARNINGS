
/*
-- JOINS Practice:

Formula for outer joins:
Left join = inner join + fetch any additional records from left table which is not present in right table.
Right join = inner join + fetches any records from right table which is not present in left table.

Full join = inner join
                + fetch additional records from left table which is not present in right table
                + fetch additional records from right table which is not present in left table.


*/

-- >> Scenario 1:

use world;

create table table_1
(id int);

create table table_2
(id int);

insert into table_1 values (1),(1),(1),(2),(3),(3),(3);
insert into table_2 values (1),(1),(2),(2),(4),(null);

SELECT * FROM table_1;
SELECT * FROM table_2;


-- >> INNER Join
SELECT *
FROM table_1    t1
JOIN table_2    t2 on t1.id = t2.id;


-- >> LEFT Join
SELECT *
FROM table_1        t1
LEFT JOIN table_2   t2 on t1.id = t2.id;


-- >> RIGHT Join
SELECT *
FROM table_1        t1
RIGHT JOIN table_2  t2 on t1.id = t2.id;


-- >> FULL Join
SELECT *
FROM table_1        t1
FULL JOIN table_2   t2 on t1.id = t2.id;


-- >> NATURAL Join
SELECT *
FROM table_1            t1
NATURAL JOIN table_2    t2;


-- >> CROSS Join
SELECT *
FROM table_1        t1
CROSS JOIN table_2  t2;





-- >> Scenario 2:

create table table_3
(id int);

create table table_4
(id int);

insert into table_3 values (1),(1),(1),(1),(1),(null),(null);
insert into table_4 values (1),(1),(1),(2),(null);

SELECT * FROM table_3;
SELECT * FROM table_4;


-- >> INNER Join
SELECT *
FROM table_3    t3
JOIN table_4    t4 on t3.id = t4.id;


-- >> LEFT Join
SELECT *
FROM table_3        t3
LEFT JOIN table_4   t4 on t3.id = t4.id;


-- >> RIGHT Join
SELECT *
FROM table_3        t3
RIGHT JOIN table_4  t4 on t3.id = t4.id;


-- >> FULL Join
SELECT *
FROM table_3        t3
FULL JOIN table_4   t4 on t3.id = t4.id;


-- >> NATURAL Join
SELECT *
FROM table_3            t3
NATURAL JOIN table_4    t4;


-- >> CROSS Join
SELECT *
FROM table_3        t3
CROSS JOIN table_4  t4;
