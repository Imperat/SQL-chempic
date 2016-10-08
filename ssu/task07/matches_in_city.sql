create proc MatchesInCity @City as varchar(20)
  as
    select Matches.home, Matches.away, Matches.home_goals, Matches.away_goals,
	Matches.league_id, Matches.stadion, Matches.date, Matches.ID, Matches.isActive from
	Matches inner join Stadions on Matches.stadion = Stadions.id inner join Cityes on
	Cityes.id = Stadions.city where Cityes.name = @City
  go
