create view draw as select * from Matches where home_goals = 0 and away_goals = 0 with check option;
