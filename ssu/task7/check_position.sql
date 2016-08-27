CREATE PROCEDURE checkmatch @position_name varchar(2)
AS 
	If @position_name in (select Positions.name from Positions)
		return 1
	return 0
GO
