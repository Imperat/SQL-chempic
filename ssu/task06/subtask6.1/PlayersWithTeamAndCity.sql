
create view PlayersWithTeamAndCity as
select Players.First_Name, Players.Last_Name, Players.Birth_Day, Positions.name as Position, Players.salary,
Teams.name as Team, Cityes.name as City from 
players inner join [Players in Teams] on Players.id = [Players in Teams].player_id
        inner join [Teams] on [Players in Teams].team_id = Teams.id
		inner join [Cityes] on Teams.city = Cityes.id
		inner join [Positions] on Positions.id = Players.Position;
