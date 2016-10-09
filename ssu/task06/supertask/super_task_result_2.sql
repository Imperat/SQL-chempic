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
	   case 
           when Goal.author is Null 
               then 0 
               else count(*) 
       end as goals,
	   case
	       when Goal.author is Null
		       then 0
		       else count(*) / salary
	   end as effective
 from 
    Players left outer join Goal on Players.id = Goal.author
	        left outer join Matches on Matches.ID = Goal.match
			left outer join League on League.id = Matches.league_id
 where
    Matches.league_id = @league_id and
    DATEDIFF(MONTH, Matches.date, League.end_date) <= 31 or
    Goal.author is Null

group by Players.id,
       First_Name,
	   Last_Name,
	   salary,
	   Goal.author
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