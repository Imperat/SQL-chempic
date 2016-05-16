CREATE TABLE [Players] (
	id int NOT NULL,
	First_Name varchar NOT NULL,
	Last_Name varchar NOT NULL,
	Birth_Day date NOT NULL,
	Position int NOT NULL,
	salary money NOT NULL,
  CONSTRAINT [PK_PLAYERS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Positions] (
	id int NOT NULL,
	name varchar NOT NULL,
  CONSTRAINT [PK_POSITIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Teams] (
	id int NOT NULL,
	name varchar NOT NULL,
	city int NOT NULL,
	making date NOT NULL,
	budget money NOT NULL,
  CONSTRAINT [PK_TEAMS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [League] (
	id int NOT NULL,
	name varchar NOT NULL,
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
	league_id int NOT NULL,
	stadion int NOT NULL,
	date datetime NOT NULL
)
/* Patch1 */
ALTER TABLE Matches
  ADD ID int NOT NULL;
ALTER TABLE Matches
ADD CONSTRAINT PK_T_ID PRIMARY KEY CLUSTERED (ID);

GO
CREATE TABLE [Stadions] (
	id int NOT NULL,
	name varchar NOT NULL,
	city int NOT NULL,
  CONSTRAINT [PK_STADIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Cityes] (
	id int NOT NULL,
	name varchar NOT NULL,
  CONSTRAINT [PK_CITYES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Goal] (
	id int NOT NULL,
	author int NOT NULL,
	match int NOT NULL,
	is_penalty binary NOT NULL DEFAULT '0',
	time time NOT NULL DEFAULT '0',
  CONSTRAINT [PK_GOAL] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Players] WITH CHECK ADD CONSTRAINT [Players_fk0] FOREIGN KEY ([Position]) REFERENCES [Positions]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Players] CHECK CONSTRAINT [Players_fk0]
GO


ALTER TABLE [Teams] WITH CHECK ADD CONSTRAINT [Teams_fk0] FOREIGN KEY ([city]) REFERENCES [Cityes]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Teams] CHECK CONSTRAINT [Teams_fk0]
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
ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [Matches_fk3] FOREIGN KEY ([stadion]) REFERENCES [Stadions]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Matches] CHECK CONSTRAINT [Matches_fk3]
GO

ALTER TABLE [Stadions] WITH CHECK ADD CONSTRAINT [Stadions_fk0] FOREIGN KEY ([city]) REFERENCES [Cityes]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Stadions] CHECK CONSTRAINT [Stadions_fk0]
GO


ALTER TABLE [Goal] WITH CHECK ADD CONSTRAINT [Goal_fk0] FOREIGN KEY ([author]) REFERENCES [Players]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Goal] CHECK CONSTRAINT [Goal_fk0]
GO
ALTER TABLE [Goal] WITH CHECK ADD CONSTRAINT [Goal_fk1] FOREIGN KEY ([match]) REFERENCES [Teams]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Goal] CHECK CONSTRAINT [Goal_fk1]
GO
