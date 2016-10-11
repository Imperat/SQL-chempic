/* Игроки с указанием их матчей для всех чемпионатов */
select Players.id, First_Name, Last_Name, salary, match from Players inner join Goal on Players.id = Goal.author;

/* Игроки с указанием их матчей, даты проведения матча и названия чемпионата */
select Players.id,
       First_Name,
	   Last_Name,
	   salary,
	   match,
	   Matches.date,
	   League.name
 from 
    Players inner join Goal on Players.id = Goal.author
	        inner join Matches on Matches.ID = Goal.match
			inner join League on League.id = Matches.league_id;

/* И та же штука, но с фильтром по последним матчам только */

select Players.id,
       First_Name,
	   Last_Name,
	   salary,
	   match,
	   Matches.date,
	   League.name,
	   League.end_date
 from 
    Players inner join Goal on Players.id = Goal.author
	        inner join Matches on Matches.ID = Goal.match
			inner join League on League.id = Matches.league_id
 where
    DATEDIFF(MONTH, Matches.date, League.end_date) <= 31;

/* Игроки с количеством голов, забитых в последний месяц чемпионата
   и их эффективность */
select Players.id,
       First_Name,
	   Last_Name,
	   salary,
	   count(*) as goals,
	   salary / count(*) as effective
 from 
    Players inner join Goal on Players.id = Goal.author
	        inner join Matches on Matches.ID = Goal.match
			inner join League on League.id = Matches.league_id
 where
    DATEDIFF(MONTH, Matches.date, League.end_date) <= 31

group by Players.id,
       First_Name,
	   Last_Name,
	   salary
order by effective;

/* Хранимая процедура - ТОП-5 список игроков по эффективности для каждого чемпионата */
create procedure non_effective 
    @league_id int
as
    select TOP 5 Players.id,
       First_Name,
	   Last_Name,
	   salary,
	   count(*) as goals,
	   salary / count(*) as effective
 from 
    Players inner join Goal on Players.id = Goal.author
	        inner join Matches on Matches.ID = Goal.match
			inner join League on League.id = Matches.league_id
 where
    Matches.league_id = @league_id and
    DATEDIFF(MONTH, Matches.date, League.end_date) <= 31

group by Players.id,
       First_Name,
	   Last_Name,
	   salary
order by effective;