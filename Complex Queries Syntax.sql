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


/* -----------------------------------------------------------------------------------------------------  */
/* Countries from selected continents whose Independece Year is even number and not null*/

select Continent,Name,IndepYear
from Country
where IndepYear IN (
select IndepYear 
from Country
where 
IndepYear % 2 = 0 and IndepYear is not null and IndepYear >= 1900)
ORDER BY IndepYear desc;

/* -----------------------------------------------------------------------------------------------------  */
/* Country with minimum LifeExpectancy from Countries of 
selected continents whose Independece Year is even number and not null*/

select A.Continent,A.Name,A.LifeExpectancy
FROM (select Continent,Name,IndepYear,LifeExpectancy 
from  country
where IndepYear % 2 = 0 and IndepYear is not null and IndepYear >= 1900) AS A
ORDER BY A.LifeExpectancy ASC LIMIT 1;


SELECT Continent,Name, (Select ROUND(AVG(LifeExpectancy)) from country where IndepYear % 3= 0 and IndepYear is not null and IndepYear >= 1900) as Avg_LifeExpectancy
from country
where Continent IN ('Asia','Africa');

