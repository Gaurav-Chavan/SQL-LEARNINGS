/* Alter table Queries*/

use world;
select * from country;

ALTER TABLE COUNTRY
ADD column Age_since_independence int;

/* Update Rows*/
SET SQL_SAFE_UPDATES = 0;
update country
set Age_since_independence = 2024- IndepYear;

ALTER TABLE COUNTRY
DROP column Age_since_independence;