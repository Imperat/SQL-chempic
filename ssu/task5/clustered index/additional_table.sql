CREATE TABLE [UnnessesaryFan] (
	id int NOT NULL,
	first_Name varchar(255) NOT NULL,
	Last_Name varchar(255) NOT NULL,
	city int NOT NULL,
	Birth_Day date NOT NULL
)


ALTER TABLE [UnnessesaryFan] WITH CHECK ADD CONSTRAINT [Cityes_fk0] FOREIGN KEY ([city]) REFERENCES [Cityes]([id])
ON UPDATE NO ACTION
GO
ALTER TABLE [UnnessesaryFan] CHECK CONSTRAINT [Cityes_fk0]
GO


INSERT INTO UnnessesaryFan VALUES (1, 'Michael' ,'Lelyakin', 1, '1995.04.22');