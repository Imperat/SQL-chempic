
/* First Example */

create clustered index cl_ind_goals on Goal(time);
drop index cl_ind_goals on Goal;


/* querues: */

select * from goal where time < '00:05:00';
select *, (select min(time) from goal where author = players.id) as minTime from players;

select * from UnnessesaryFan where DATEDIFF(YEAR, Birth_Day, GETDATE()) < 18;
select * from UnnessesaryFan where Birth_Day > '1998-01-01'
select * from UnnessesaryFan where Last_Name like 'F%';


(select * from UnnessesaryFan where DATEDIFF(YEAR, Birth_Day, GETDATE()) < 18)
   union
(select * from UnnessesaryFan where DATEDIFF(YEAR, Birth_Day, GETDATE()) > 65);


/* Second Example */

create clustered index cl_ind_Fans on UnnessesaryFan(Birth_Day);
drop index cl_ind_Fans on UnnessesaryFan;

create clustered index cl_ind_Fans on UnnessesaryFan(Last_Name);
drop index cl_ind_Fans on UnnessesaryFan;
