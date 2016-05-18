/* Всех игроков данной команды */
select * from [Players in Teams] inner join [Players] on [Players in Teams].player_id = Players.id where team_id = 1;
/* Количество игроков по позициям  */
select name, COUNT(*) from Players join Positions on Players.Position = Positions.id group by name;
/* Количество игроков по позициям с наложением условий */
select name, COUNT(*) from Players join Positions on Players.Position = Positions.id group by name having COUNT(*) < 17;
/* Список игроков, отсортированный по возрастам игроков, с указанием возраста */
select id, First_Name, Last_Name, Position, salary, (SELECT DATEDIFF(YEAR, Birth_Day, GETDATE())) AS Age
  from Players order by Birth_Day;
/* Тех, кто родился между двумя заданными датами */  
select * from Players where Players.Birth_Day between '01.01.1995' and '05.05.1996';
/* Игроков и команды в конкретный момент времени */
select start_date, end_date, First_Name, Last_Name, Teams.name from [Players in Teams] join Players on Players.id = player_id
join Teams on Teams.id = team_id where start_date < '1995.11.05' and '1995.11.05' < end_date;
/* Лучшие бомбардиры */
select author, count( * ) as goals from goal group by author order by goals desc;
/* Турнирная таблица чемпионата */
/* -- Команда -- В - Н - П - З - Б - О */

/* Сколько матчей всего выиграно каждой командой */

/*Список матчей Спартака в которых он выиграл в удобночитаемом формате */
select Teams.name, Teams2.name, home_goals as G1, away_goals as G2 from Matches inner join Teams on home = Teams.id 
	inner join Teams as Teams2 on away = Teams2.id where Teams.name = 'Spartak' and home_goals > away_goals
													 or Teams2.name = 'Spartak' and away_goals > home_goals;
/*Список команд по количеству домашних побед */
select Teams.name, COUNT(*) as winners from Matches inner join Teams on home = Teams.id 
	inner join Teams as Teams2 on away = Teams2.id where home_goals > away_goals group by Teams.name order by winners desc;
