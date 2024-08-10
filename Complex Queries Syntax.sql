use world;
select * from country;

/* Query to demonstrate general sql flow*/

/* Countries from selected continents whose Population is greater than a million and
average  life expectancy */

select Continent,avg(LifeExpectancy) as Avg_Life_Expectancy, count(Name) as num_countries
from country
where Population > 1000000
group by Continent
having Continent NOT IN ('Oceania','Antarctica')
order by Avg_Life_Expectancy desc;

/* -----------------------------------------------------------------------------------------------------  */

/* Update Rows*/
SET SQL_SAFE_UPDATES = 0;

update country
set Code = 'BOI'
where Name ='British Indian Ocean Territory';

select * from country where Name ='British Indian Ocean Territory';


/* -----------------------------------------------------------------------------------------------------  */

/* Sub Queries  */
/* Countries from selected continents whose Life expectancy is greater than average  */

select Continent,Name,LifeExpectancy
from Country
where LifeExpectancy >
(select AVG(LifeExpectancy)
FROM COUNTRY);
