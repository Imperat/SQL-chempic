select * from [Players in Teams] inner join [Players] on [Players in Teams].player_id = Players.id where team_id = 1;
/*  Всех игроков данной команды  */
