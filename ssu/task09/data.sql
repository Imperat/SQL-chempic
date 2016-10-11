use FootballMatches_DW;

insert into dimPosition (NamePosition) values ('GK');
insert into dimPosition (NamePosition) values ('FW');
insert into dimPosition (NamePosition) values ('DC');
insert into dimPosition (NamePosition) values ('MC');

select * from dimPosition;

insert into dimLeagues (NameLeague, StartDate, EndDate) values 
	('Russian Chempic', 20160109, 20160209);
insert into dimLeagues (NameLeague, StartDate, EndDate) values 
	('Russian Chempic', 20150708, 20150801);
insert into dimLeagues (NameLeague, StartDate, EndDate) values 
	('Kefal', 20160801, 20160901);

select * from dimLeagues;

insert into dimGeography(NameCountry,NameCity,NameStreet) values('Russia','Moscow','Tverskaya');
insert into dimGeography(NameCountry,NameCity,NameStreet) values('Russia','Saratov','Atkarskaya');
insert into dimGeography(NameCountry,NameCity,NameStreet) values('France','Paris','Syberic');
insert into dimGeography(NameCountry,NameCity,NameStreet) values('Germany','Berlin','Meinteil');
insert into dimGeography(NameCountry,NameCity,NameStreet) values('Brazilia','Brazilia','Kokoko');
insert into dimGeography(NameCountry,NameCity,NameStreet) values('Russia','Kazan','Moskovskaya');
insert into dimGeography(NameCountry,NameCity,NameStreet) values('China','Pekin',null);
insert into dimGeography(NameCountry,NameCity,NameStreet) values('Japan','Tokio',null);
insert into dimGeography(NameCountry,NameCity,NameStreet) values('Australia','Sydney',null);

select * from dimGeography;

insert into dimStadions(NameStadion,GeographyKey) values('Lokomotiv',2);
insert into dimStadions(NameStadion,GeographyKey) values('Stadion1',4);
insert into dimStadions(NameStadion,GeographyKey) values('Stadion2',7);

select * from dimStadions;

insert into dimTeams(TeamAlternateKey,NameTeam,Location,created,budget,flag) values (1, 'Spartak', 1, 20150701, 30.0, 1);
insert into dimTeams(TeamAlternateKey,NameTeam,Location,created,budget,flag) values (2, 'CSKA', 1, 20150701, 30.0, 1);
insert into dimTeams(TeamAlternateKey,NameTeam,Location,created,budget,flag) values (3, 'Dinamo', 1, 20150701, 30.0, 1);
insert into dimTeams(TeamAlternateKey,NameTeam,Location,created,budget,flag) values (4, 'Locomotive', 1, 20150701, 30.0, 1);
insert into dimTeams(TeamAlternateKey,NameTeam,Location,created,budget,flag) values (5, 'Sokol', 2, 20150701, 30.0, 1);

select * from dimTeams;

insert into dimPlayers values (0, 'Kisurin', 'Arsen', 19971024, 3, 45,1,1);
insert into dimPlayers values (1, 'Tselikov', 'Sevak', 19950823, 2, 15,2,1);
insert into dimPlayers values (2, 'Petrov', 'Sevak', 19980827, 3, 65,3,1);
insert into dimPlayers values (3, 'Ivanov', 'Mikhail', 19971006, 1, 65,4,1);
insert into dimPlayers values (4, 'Messi', 'Sevak', 20000813, 2, 45,5,1);
insert into dimPlayers values (5, 'Lelyakin', 'Sevak', 19961213, 4, 15,1,1);
insert into dimPlayers values (6, 'Zaytsev', 'Ivan', 19970111, 1, 228,2,1);
insert into dimPlayers values (7, 'Kulapin', 'Sevak', 19970103, 4, 14,3,1);
insert into dimPlayers values (8, 'Tselikov', 'Arsen', 19990615, 3, 45,4,1);
insert into dimPlayers values (9, 'Petrov', 'Vlad', 19980914, 4, 45,5,1);
insert into dimPlayers values (10, 'Tselikov', 'Denchik', 19960628, 4, 228,1,1);
insert into dimPlayers values (11, 'Sidorov', 'Sergey', 19960301, 4, 14,2,1);
insert into dimPlayers values (12, 'Chumachenko', 'Romchik', 19960321, 3, 15,3,1);
insert into dimPlayers values (13, 'Ivanov', 'Sergey', 19960614, 1, 226,4,1);
insert into dimPlayers values (14, 'Metelmikov', 'Sevak', 19991227, 2, 65,5,1);
insert into dimPlayers values (15, 'Chumachenko', 'Sevak', 19970812, 2, 14,1,1);
insert into dimPlayers values (16, 'Tselikov', 'Sevak', 19970425, 2, 226,2,1);
insert into dimPlayers values (17, 'Lelyakin', 'Romchik', 19960526, 3, 228,3,1);
insert into dimPlayers values (18, 'Kisurin', 'Vlad', 19961214, 3, 228,4,1);
insert into dimPlayers values (19, 'Ivanov', 'Sergey', 20001209, 2, 65,5,1);
insert into dimPlayers values (20, 'Petrov', 'Sevak', 19990114, 2, 14,1,1);
insert into dimPlayers values (21, 'Lelyakin', 'Mikhail', 19960405, 1, 14,2,1);
insert into dimPlayers values (22, 'Mironov', 'Mikhail', 20000301, 4, 14,3,1);
insert into dimPlayers values (23, 'Metelmikov', 'Sevak', 19950424,4 , 45,4,1);
insert into dimPlayers values (24, 'Zaytsev', 'Ivan', 19981002, 4, 45,5,1);
insert into dimPlayers values (25, 'Ivanov', 'Arsen', 19961008, 3, 226,1,1);
insert into dimPlayers values (26, 'Kisurin', 'Mikhail', 20000309, 3, 30,2,1);
insert into dimPlayers values (27, 'Chumachenko', 'Sevak', 20000315, 2, 14,3,1);
insert into dimPlayers values (28, 'Kulapin', 'Denchik', 19990708, 3, 15,4,1);
insert into dimPlayers values (29, 'Kisurin', 'Arsen', 19981215, 2, 226,5,1);
insert into dimPlayers values (30, 'Chumachenko', 'Ivan', 19970903, 2, 30,1,1);
insert into dimPlayers values (31, 'Schvachkin', 'Arsen', 19981108, 3, 45,2,1);
insert into dimPlayers values (32, 'Mironov', 'Mikhail', 20001024, 2, 15,3,1);
insert into dimPlayers values (33, 'Chumachenko', 'Vlad', 2000-9-9, 4, 228,4,1);

select * from dimPlayers;