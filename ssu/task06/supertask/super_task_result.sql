/*exec non_effective 0*/

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'non_effective')
DROP PROCEDURE non_effective
GO

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

GO

declare league_cursor cursor for select id from League;
declare @league_ids int;

open league_cursor;
fetch next from league_cursor into @league_ids;
while @@FETCH_STATUS = 0
    begin
	    exec non_effective @league_ids;
		fetch next from league_cursor into @league_ids;
	end
close league_cursor;
deallocate league_cursor;