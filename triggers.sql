/* We need add goals only to Mathes with "isActive" state */

CREATE TRIGGER golic ON Goal
FOR INSERT 
AS
 DECLARE @author int
 DECLARE @match int
 DECLARE @isPenka binary
 DECLARE @time time
 DECLARE @isActive binary

 SELECT @author=author,
		@match=match,
		@isPenka=is_penalty,
		@time=time
 FROM inserted

 SELECT @isActive=isActive from Matches where id=@match

 IF @isActive=0
  BEGIN 
   PRINT 'Error. Cann"t add goal to non-active Match :( '
   ROLLBACK TRANSACTION
  END

/* Also: */

CREATE TRIGGER golic2 ON Goal
FOR UPDATE 
AS
 DECLARE @author int
 DECLARE @match int
 DECLARE @isPenka binary
 DECLARE @time time
 DECLARE @isActive binary

 SELECT @author=author,
		@match=match,
		@isPenka=is_penalty,
		@time=time
 FROM inserted

 SELECT @isActive=isActive from Matches where id=@match

 IF @isActive=0
  BEGIN 
   PRINT 'Error. Cann"t change goal to non-active Match :( '
   ROLLBACK TRANSACTION
  END
