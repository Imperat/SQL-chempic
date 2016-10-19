use [master];

--создание ХД 
create database [FootballMatches_DW]
containment = none
on primary
( name = N'FootballMatches_DW', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FootballMatches_DW.mdf',
  size = 51200KB, maxsize = unlimited, filegrowth = 10240KB )
  log on
( name = N'FootballMatches_DW_log', filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FootballMatches_DW_log.ldf',
  size = 10240KB, maxsize = 2048GB, filegrowth = 10% )

go
alter database [FootballMatches_DW] set compatibility_level = 110
go
alter database [FootballMatches_DW] set auto_shrink off
go
alter database [FootballMatches_DW] set recovery simple with no_wait
go

--файловые группы
go
alter database [FootballMatches_DW] add filegroup [Fast-Growing]
go 
alter database [FootballMatches_DW] add file ( name = N'FM_Fast-Growing',
filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FM_Fast-Growing.ndf',
size = 358400KB, filegrowth = 51200KB ) to filegroup [Fast-Growing]


go
alter database [FootballMatches_DW] add filegroup [Freq-Requested]
go 
alter database [FootballMatches_DW] add file ( name = N'FM_Freq-Requested',
filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FM_Freq-Requested.ndf',
size = 204800KB, filegrowth = 10240KB ) to filegroup [Freq-Requested]


go
alter database [FootballMatches_DW] add filegroup [Indexes]
go 
alter database [FootballMatches_DW] add file ( name = N'FM_Indexes',
filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FM_Indexes.ndf',
size = 30720KB, filegrowth = 5120KB ) to filegroup [Indexes] 


go
alter database [FootballMatches_DW] add filegroup [MyDefault]
go 
alter database [FootballMatches_DW] add file ( name = N'FM_MyDefault',
filename = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FM_MyDefault.ndf',
size = 204800KB, filegrowth = 10240KB ) to filegroup [MyDefault] 

--таблицы измерений
use FootballMatches_DW;
create table dimDate
(KeyDate BIGINT NOT NULL,
 [Date] DATE NOT NULL,
 [Year] INT NOT NULL,
 [Quarter] INT NOT NULL,
 [Month] INT NOT NULL,
 [Week] INT NOT NULL,
 [Day] INT NOT NULL,
 [MonthName] NVARCHAR(20) NOT NULL,
 [DayName] NVARCHAR(20) NOT NULL,
 CONSTRAINT pkdw4 PRIMARY KEY(KeyDate))
 ON [Freq-Requested]; 

create table dimPosition
(KeyPosition int not null identity(1,1),
 NamePosition nvarchar(30) not null,
 constraint pkdw1 primary key (KeyPosition)
 ) on [MyDefault]

 
  create table dimLeagues
  (KeyLeague int not null identity(1,1),
   NameLeague nvarchar(30) not null,
   StartDate bigint not null,
   EndDate bigint not null,
   constraint pkdw3 primary key (KeyLeague)
   ) on [MyDefault]


 create table dimGeography
 (KeyGeography int not null identity(1,1),
 NameCountry nvarchar(30) not null,
 NameCity nvarchar(30) not null,
 NameStreet nvarchar(30),
 constraint pkdw5 primary key(KeyGeography)
 ) on [Freq-Requested]

 create table dimStadions
 (KeyStadion int not null identity(1,1),
  NameStadion nvarchar(30) not null,
  GeographyKey int not null,
  constraint pkdw6 primary key(KeyStadion)
  )
  on [MyDefault]

  create table dimTeams
  (KeyTeam int not null identity(1,1),
  TeamAlternateKey int not null,
  NameTeam nvarchar(30) not null,
  Location int not null,
  created bigint,
  budget money,
  flag bit not null,
  constraint pkdw7 primary key(KeyTeam)
  ) on [Fast-Growing]

  create table dimPlayers
 (KeyPlayer int not null identity(1,1),
  PlayerAlternateKey int not null,
  FirstName nvarchar(30) not null,
  LastName nvarchar(30) not null,
  BirthDate bigint,
  PositionKey int not null,
  Salary money,
  TeamKey int,
  flag bit not null,
  constraint pkdw2 primary key (KeyPlayer)
  ) on [Fast-Growing]

--create table dimMatches
--(KeyMatch int not null identity(1,1),
-- HomeTeamKey int not null,
-- AwayTeamKey int not null,
-- LeagueKey int not null,
-- StadionKey int not null,
-- DateMatch date,
-- constraint pkdw8 primary key (KeyMatch)
-- ) on [Freq-Requested]

 --секционирование
/* CREATE PARTITION FUNCTION PartFunFactGoals_Date(BIGINT)
AS RANGE RIGHT FOR VALUES (20150601,20160301,20161001);

CREATE PARTITION SCHEME PartSchFactGoals_Date 
AS PARTITION PartFunFactGoals_Date TO
([Fast-Growing],
 [Fast-Growing],
 [Freq-Requested],
 [Freq-Requested]);


CREATE PARTITION FUNCTION PartFunArchievalFactGoals_Date(BIGINT)
AS RANGE RIGHT FOR VALUES (20150601);

CREATE PARTITION SCHEME PartSchArchievalFactGoals_Date 
AS PARTITION PartFunArchievalFactGoals_Date TO
([Fast-Growing],
 [Fast-Growing]);
*/
GO

--таблица фактов
create table FactGoalsMatches
(KeyMatch int not null,
 KeyGoalInMatch int not null,
 authorGoal int not null,
 LeagueKey int not null,
 StadionKey int,
 HomeTeamKey int not null,
 AwayTeamKey int not null,
 DateKey bigint not null,
 isPenalty bit,
 timeGoal time not null,
 constraint pkdw8 primary key(KeyMatch, KeyGoalInMatch, DateKey);

 
 /*--таблица для метода скользящего окна
 create table ArchivalFactGoalsMatches
(KeyMatch int not null,
 KeyGoalInMatch int not null,
 authorGoal int not null,
 LeagueKey int not null,
 StadionKey int,
 HomeTeamKey int not null,
 AwayTeamKey int not null,
 DateKey bigint not null,
 isPenalty bit,
 timeGoal time not null,
 constraint pkdw9 primary key(KeyMatch, KeyGoalInMatch, DateKey)
 WITH (ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF))
 ON PartSchArchievalFactGoals_Date(DateKey);*/ 


--тут можно запросить таблицы секционирования
/*SELECT partition_number, rows FROM sys.partitions
 WHERE OBJECT_ID = (SELECT OBJECT_ID FROM sys.tables WHERE name = 'FactGoalsMatches');

 SELECT partition_number, rows FROM sys.partitions
 WHERE OBJECT_ID = (SELECT OBJECT_ID FROM sys.tables WHERE name = 'ArchivalFactGoalsMatches');*/

 --метод скользящего окна
 /*GO

 CREATE PROCEDURE Pr_SlidingWindow
 AS
 DECLARE @DayForPartFactGoalsMatches VARCHAR(8)
 DECLARE @DayForPartArchival VARCHAR(8)
 SET @DayForPartFactGoalsMatches = CAST((SELECT TOP 1 [value] FROM
            sys.partition_range_values
			WHERE function_id = (SELECT function_id
			       FROM sys.partition_functions
				   WHERE name = 'PartFunFactGoals_Date')
            ORDER BY boundary_id DESC) AS varchar(8))
 SET @DayForPartArchival = CAST((SELECT TOP 1 [value] FROM
            sys.partition_range_values
			WHERE function_id = (SELECT function_id
			       FROM sys.partition_functions
				   WHERE name = 'PartFunFactGoals_Date')
            ORDER BY boundary_id ASC) AS varchar(8))
DECLARE @Date_DT date
SET @Date_DT = DATEADD(YEAR,1,CAST(@DayForPartFactGoalsMatches AS DATE))

DECLARE @DateArchival_DT date
SET @DateArchival_DT = DATEADD(YEAR,1,CAST(@DayForPartArchival AS DATE))

ALTER PARTITION SCHEME PartSchFactGoals_Date
NEXT USED [Freq-Requested];

ALTER PARTITION SCHEME PartFunArchievalFactGoals_Date
NEXT USED [Fast-Growing];

ALTER PARTITION FUNCTION  PartFunFactGoals_Date()
SPLIT RANGE (CAST(CONVERT(VARCHAR(8),@DateArchival_DT,112) AS BIGINT));

ALTER PARTITION FUNCTION  PartFunArchievalFactGoals_Date()
SPLIT RANGE (CAST(CONVERT(VARCHAR(8),@Date_DT,112) AS BIGINT));

ALTER TABLE FactGoalsMatches
SWITCH PARTITION 2
TO ArchivalFactGoalsMatches PARTITION 2;

ALTER PARTITION FUNCTION  PartFunFactGoals_Date()
Merge RANGE (CAST(@DayForPartArchival AS BIGINT));

ALTER PARTITION FUNCTION  PartFunArchievalFactGoals_Date()
merge RANGE (CAST(@DayForPartArchival AS BIGINT));
*/
--добавление внешних ключей
alter table dimLeagues
add constraint fk1 foreign key(StartDate) references dimDate(KeyDate),
constraint fk2 foreign key (EndDate) references dimDate(KeyDate);

alter table dimStadions
add constraint fk3 foreign key(GeographyKey) references dimGeography(KeyGeography);

alter table dimTeams
add constraint fk4 foreign key(Location) references dimGeography(KeyGeography),
constraint fk5 foreign key(created) references dimDate(KeyDate);

alter table dimPlayers
add constraint fk6 foreign key(BirthDate) references dimDate(KeyDate),
constraint fk7 foreign key(PositionKey) references dimPosition(KeyPosition),
constraint fk8 foreign key(TeamKey) references dimTeams(KeyTeam);

alter table FactGoalsMatches
add constraint fk9 foreign key(authorGoal) references dimPlayers(KeyPlayer),
constraint fk10 foreign key(LeagueKey) references dimLeagues(KeyLeague),
constraint fk11 foreign key(StadionKey) references dimStadions(KeyStadion),
constraint fk12 foreign key(HomeTeamKey) references dimTeams(KeyTeam),
constraint fk13 foreign key(AwayTeamKey) references dimTeams(KeyTeam),
constraint fk14 foreign key(DateKey) references dimDate(KeyDate);


--заполнение таблицы дат
SET LANGUAGE Russian;

DECLARE @start date = '1970-01-01';
DECLARE @end date = '2020-01-01';
DECLARE @inc date;
SET @inc = @start;

WHILE @inc<=@end
   BEGIN
   INSERT INTO [FootballMatches_DW].[dbo].[dimDate] VALUES
   (cast (convert (varchar(8),@inc,112) as BIGINT),
    convert (date,@inc,104),
	year(@inc),
	datepart(qq,@inc),
	month(@inc),
	datepart(wk,@inc),
	day(@inc),
	datename(mm,@inc),
	datename(dw,@inc))
	SET @inc = dateadd(day,1,@inc)
    END

/*select * from dimDate;*/

--индексы
create nonclustered index plAltKey
on dimPlayers([PlayerAlternateKey]) with (DROP_EXISTING = ON) on Indexes;

create nonclustered index forDate
on dimDate([KeyDate]) with (DROP_EXISTING = ON) on Indexes;

create nonclustered index forStad
on dimStadions([NameStadion]) with (DROP_EXISTING = ON) on Indexes;

create nonclustered index forBudg
on dimTeams([budget]) with (DROP_EXISTING = ON) on Indexes;