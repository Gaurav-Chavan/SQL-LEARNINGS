--- Q6 : IPL Matches --- 
use world;

drop table if exists teams;
create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders');
insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');
commit;

select * from teams;

-- Create a IPL Schedule -- One match per team
with ipl_schedule as 
(select *, row_number() over() as team_id 
from teams)
select t1.team_name,t2.team_name,t1.team_code,t2.team_code
from ipl_schedule as t1
inner join ipl_schedule as t2
on t1.team_id < t2.team_id
order by t1.team_code;


-- Create a IPL Schedule -- Home Away match per team
with ipl_schedule as 
(select *, row_number() over() as team_id 
from teams)
select t1.team_name,t2.team_name,t1.team_code,t2.team_code
from ipl_schedule as t1
inner join ipl_schedule as t2
on t1.team_id <> t2.team_id
order by t1.team_code,t2.team_code;