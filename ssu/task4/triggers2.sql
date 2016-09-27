CREATE TRIGGER player_in_team_updater ON [Players in Teams]
FOR UPDATE
  AS
    DECLARE @start date
	DECLARE @end date

	SELECT @start=start_date,
	       @end=end_date
    FROM inserted

	IF @start>@end
	  BEGIN
	    PRINT 'ERROR! Start date is more than end date!'
		ROLLBACK TRANSACTION
	  END

CREATE TRIGGER player_in_team_inserter ON [Players in Teams]
FOR INSERT
  AS
    DECLARE @start date
	DECLARE @end date

	SELECT @start=start_date,
	       @end=end_date
    FROM inserted

	IF @start>@end
	  BEGIN
	    PRINT 'ERROR! Start date is more than end date!'
		ROLLBACK TRANSACTION
	  END

