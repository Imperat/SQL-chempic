insert into League (id, name, start_date, end_date) values 
	(0, 'Russian Chempic', '2007-04-25', '2008-04-26');
insert into League (id, name, start_date, end_date) values 
	(1, 'Kefal', '2010-05-01', '2011-05-01')

insert into Cityes values (0, 'Rostov');
insert into Stadions values (0, 'Lokomotive', 0);
insert into Teams values (0, 'Spartak', 0, '2000.04.22', 30.0);
insert into Teams values (1, 'Dinamo', 0, '2000.04.22', 30.0);

insert into Positions (id, name) values (1, 'GK');
insert into Positions (id, name) values (2, 'FW');
insert into Positions (id, name) values (3, 'DC');
insert into Positions (id, name) values (4, 'MC');


insert into Players values (0, 'Kisurin', 'Vacheslav', '1997-10-24', 3, 45);
insert into Players values (1, 'Tselikov', 'Alexander', '1995-8-23', 2, 15);
insert into Players values (2, 'Petrov', 'Petr', '1998-8-27', 3, 65);
insert into Players values (3, 'Ivanov', 'Ivan', '1997-10-6', 1, 65);
insert into Players values (4, 'Messi', 'Leonel', '2000-8-13', 2, 45);

insert into Matches values(0,1,7,7,0,0,'2008-04-01T15:00:00',0);
insert into Matches values(1,0,5,3,0,0,'2008-05-02T16:00:00',1);


insert into Goal values (0, 0, 0, 0, '00:05:25');
insert into Goal values (1, 0, 0, 1, '00:04:50');
insert into Goal values (2, 0, 0, 1, '00:23:38');
insert into Goal values (3, 1, 0, 0, '00:30:10');
