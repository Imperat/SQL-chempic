CREATE TRIGGER non_future ON Players
FOR INSERT
 AS
  DECLARE @boring date

SELECT @boring=Birth_Day
FROM INSERTED

IF @boring > GETDATE()
  BEGIN
	PRINT 'Player probably willn"t bore!'
	ROLLBACK TRANSACTION
  END


CREATE TRIGGER match_in_league ON Matches
FOR INSERT
  AS
    DECLARE @date_match date
    DECLARE @league_id int
    DECLARE @start_league_date date
    DECLARE @end_league_date date

  SELECT @date_match=date
         @league_id=league_id
  FROM INSERTED

  SELECT @start_league_date = start_date
  FROM League WHERE id=@league_id
  SELECT @end_league_date = end_date
  FROM League WHERE id=@league_id

  IF @date_match NOT BETWEEN @start_league_date AND
                             @end_league_date
    BEGIN
      PRINT 'There is no time for this chempionship!'
    END

  
  