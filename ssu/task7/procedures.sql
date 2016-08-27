create proc draw_count as
  select count(*) from Matches where home_goals = 0 and away_goals = 0

:
