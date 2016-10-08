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
  
/* When we delete Match, we need delete all goals references to it */
/*insert into Goal values (1,12,1,0,'00:32:32');*/
create trigger dt_del on Matches

instead of delete

as

begin
--удалить из таблицы Goals
        delete from Goal
        where id in (select match from deleted)
        if(@@error>0)
        begin
                rollback transaction
                raiserror('Ошибка удаления из таблицы Goal',16,3)
                return
        end
--удалить из таблицы Matches

        delete from Matches

        where id in (select id from deleted)

        if(@@error>0)
        begin
                rollback transaction
                raiserror('Ошибка удаления из таблицы Matches',16,3)
                return
        end
return
end
