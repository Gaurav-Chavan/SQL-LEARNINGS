use world;

drop table if exists tb_customer_data cascade;
drop table if exists tb_product_info cascade;
drop table if exists tb_order_details cascade;
drop view if exists order_summary;

create table if not exists tb_customer_data
(
    cust_id         varchar(10) primary key,
    cust_name       varchar(50) not null,
    phone           bigint,
    email           varchar(50),
    address         varchar(250)
);

create table if not exists tb_product_info
(
    prod_id         varchar(10) primary key,
    prod_name       varchar(50) not null,
    brand           varchar(50) not null,
    price           int
);

create table if not exists tb_order_details
(
    ord_id          bigint primary key,
    prod_id         varchar(10) references tb_product_info(prod_id),
    quantity        int,
    cust_id         varchar(10) references tb_customer_data(cust_id),
    disc_percent    int,
    date            date
);

insert into tb_customer_data values
('C1', 'Mohan Kumar', 9900807090, 'mohan@demo.com', 'Bangalore'),
('C2', 'James Xavier', 8800905544, 'james@demo.com', 'Mumbai'),
('C3', 'Priyanka Verma', 9900223333, 'priyanka@demo.com', 'Chennai'),
('C4', 'Eshal Maryam', 9900822111, 'eshal@demo.com', 'Delhi');

insert into tb_product_info values
('P1', 'Samsung S22', 'Samsung', 800),
('P2', 'Google Pixel 6 Pro', 'Google', 900),
('P3', 'Sony Bravia TV', 'Sony', 600),
('P4', 'Dell XPS 17', 'Dell', 2000),
('P5', 'iPhone 13', 'Apple', 800),
('P6', 'Macbook Pro 16', 'Apple', 5000);

insert into tb_order_details values
(1, 'P1', 2, 'C1', 10, '2020-01-01'),
(2, 'P2', 1, 'C2', 0, '2020-01-01'),
(3, 'P2', 3, 'C3', 20, '2020-02-01'),
(4, 'P3', 1, 'C1', 0, '2020-02-01'),
(5, 'P3', 1, 'C1', 0, '2020-03-01'),
(6, 'P3', 4, 'C1', 25, '2020-04-01'),
(7, 'P3', 1, 'C1', 0, '2020-05-01'),
(8, 'P5', 1, 'C2', 0, '2020-02-01'),
(9, 'P5', 1, 'C3', 0, '2020-03-01'),
(10, 'P6', 1, 'C2', 0, '2020-05-01'),
(11, 'P6', 1, 'C3', 0, '2020-06-01'),
(12, 'P6', 5, 'C1', 30, '2020-07-01');


select * from tb_customer_data;
select * from tb_product_info;
select * from tb_order_details;

-- Fetch the order summary (to be given to client/vendor)
create view order_summary
as
select o.ord_id, o.date, c.cust_name, p.prod_name
from tb_customer_data c
join tb_order_details o on o.cust_id = c.cust_id
join tb_product_info p on p.prod_id = o.prod_id
order by o.ord_id,c.cust_name;

select * from order_summary;

-- Using CREATE or REPLACE
create or replace view order_summary
as
select o.ord_id, o.date, c.cust_name, p.prod_name
from tb_customer_data c
join tb_order_details o on o.cust_id = c.cust_id
join tb_product_info p on p.prod_id = o.prod_id
order by o.ord_id,c.cust_name;

/*
-- Rules for using CREATE OR REPLACE is:
-- 1. The column list along with its name and data type should be same as used when creation of the view.
-- 2. New columns can be added only to end of the column list
-- 3. JOINS, table list, Order by clause can be changed.


-- If you want to change the structure of a view then use ALTER VIEW command:
alter view order_summary rename to customer_order_summary;
alter view customer_order_summary rename to order_summary;
alter view order_summary rename column ord_id to order_id;

*/

-- Drop a view using:
drop view order_summary;


-- Changing underlying table structure does not automatically change view structure.
/*
-- Updatable Views:
Only view created over simple SQL Queries.

SQL Query should satisfy following rules:
 - Should contain just one table or view.
 - Should not contains distinct clause, or group by clause
 - SHould not contains window functions and WITH clause.
 
 */
 
 -- Check Option in Views
 select * from tb_product_info;
 create or replace view Apple_data as select * from tb_product_info where brand = 'Apple' with check option;
 select * from Apple_data;
 
 
 insert into Apple_data values ('P12','Samsung Buds','Samsung',500);
 