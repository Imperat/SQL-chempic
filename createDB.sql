CREATE TABLE [Players] (
	id int NOT NULL,
	First_Name varchar(255) NOT NULL,
	Last_Name varchar(255) NOT NULL,
	Birth_Day date NOT NULL,
	Position int NOT NULL,
  CONSTRAINT [PK_PLAYERS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Positions] (
	id int NOT NULL,
	name varchar(255) NOT NULL,
  CONSTRAINT [PK_POSITIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Teams] (
	id int NOT NULL,
	name varchar(255) NOT NULL,
	city varchar(255) NOT NULL,
  CONSTRAINT [PK_TEAMS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [League] (
	id int NOT NULL,
	name varchar(255) NOT NULL,
	start_date datetime NOT NULL,
	end_date datetime NOT NULL,
  CONSTRAINT [PK_LEAGUE] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Players in Teams] (
	player_id int NOT NULL,
	team_id int NOT NULL,
	start_date datetime NOT NULL,
	end_date datetime NOT NULL
)
GO
CREATE TABLE [Teams in leagues] (
	team_id int NOT NULL,
	league_id int NOT NULL
)
GO
CREATE TABLE [Matches] (
	home int NOT NULL,
	away int NOT NULL,
	home_goals int NOT NULL,
	away_goals int NOT NULL,
	league_id int NOT NULL
)
GO
ALTER TABLE [Players] WITH CHECK ADD CONSTRAINT [Players_fk0] FOREIGN KEY ([Position]) REFERENCES [Positions]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Players] CHECK CONSTRAINT [Players_fk0]
GO




ALTER TABLE [Players in Teams] WITH CHECK ADD CONSTRAINT [Players in Teams_fk0] FOREIGN KEY ([player_id]) REFERENCES [Players]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Players in Teams] CHECK CONSTRAINT [Players in Teams_fk0]
GO
ALTER TABLE [Players in Teams] WITH CHECK ADD CONSTRAINT [Players in Teams_fk1] FOREIGN KEY ([team_id]) REFERENCES [Teams]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Players in Teams] CHECK CONSTRAINT [Players in Teams_fk1]
GO

ALTER TABLE [Teams in leagues] WITH CHECK ADD CONSTRAINT [Teams in leagues_fk0] FOREIGN KEY ([team_id]) REFERENCES [Players]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Teams in leagues] CHECK CONSTRAINT [Teams in leagues_fk0]
GO
ALTER TABLE [Teams in leagues] WITH CHECK ADD CONSTRAINT [Teams in leagues_fk1] FOREIGN KEY ([league_id]) REFERENCES [League]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Teams in leagues] CHECK CONSTRAINT [Teams in leagues_fk1]
GO

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [Matches_fk0] FOREIGN KEY ([home]) REFERENCES [Teams]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Matches] CHECK CONSTRAINT [Matches_fk0]
GO
ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [Matches_fk1] FOREIGN KEY ([away]) REFERENCES [Teams]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Matches] CHECK CONSTRAINT [Matches_fk1]
GO
ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [Matches_fk2] FOREIGN KEY ([league_id]) REFERENCES [League]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Matches] CHECK CONSTRAINT [Matches_fk2]
GO
