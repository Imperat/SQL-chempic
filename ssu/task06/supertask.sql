select name,[Teams in leagues].team_id, [Players in Teams].player_id, Players.salary from League inner join [Teams in leagues]
 on League.id = [Teams in leagues].league_id inner join [Players in Teams]
 on [Players in Teams].team_id = [Teams in leagues].team_id inner join [Players]
 on [Players].id = [Players in Teams].player_id;