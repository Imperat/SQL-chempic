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
