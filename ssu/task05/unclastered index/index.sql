create index non_cl_index_fans on UnnessesaryFan(first_name);
create index non_cl_index_fans on UnnessesaryFan(first_name, Last_name);
create index non_cl_index_fans on UnnessesaryFan(first_name, Last_name) include (Birth_Day);


select first_name, Last_Name, Birth_Day from UnnessesaryFan where first_Name like 'sl%' and Last_Name like 'P%' or Last_Name like 'M%';
