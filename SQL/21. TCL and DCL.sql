use v ;
show tables ;


CREATE TABLE t_school(ID INT, School_Name VARCHAR(40), 
Number_Of_Students INT, Number_Of_Teachers INT, Number_Of_Classrooms INT, EmailID VARCHAR(40));

select * from t_school ;

INSERT INTO t_school(ID, School_Name, Number_Of_Students, Number_Of_Teachers,
 Number_Of_Classrooms, EmailID) 
 VALUES(1, "Boys Town Public School", 1000, 80, 12, "btps15@gmail.com"), 
 (2, "Guru Govind Singh Public School", 800, 35, 15, "ggps25@gmail.com"), 
 (3, "Delhi Public School", 1200, 30, 10, "dps101@gmail.com"), 
 (4, "Ashoka Universal School", 1110, 40, 40, "aus17@gmail.com"), 
 (5, "Calibers English Medium School", 9000, 31, 50, "cems@gmail.com");
 
START TRANSACTION ;  

savepoint v1 ;

savepoint v2 ;

savepoint v3 ;

rollback ;

commit ;

ROLLBACK TO v2 ; 

update t_school
set id = 4 where id = 1 ;


------------------------------------------------

create user "amitt"@"localhost" identified by "amit11" ;


grant select on v.t_school to "amitt"@"localhost" ;

grant all on V.* to "amitt"@"localhost" ;

select * from projects ;

update projects
set projectid = 4 where projectid = 1 ;

delete from projects
where employeeid = 1 ;



grant select on v.t_school to "amitt"@"localhost" ;
 
revoke select on v.t_school from "amitt"@"localhost" ;
 
select * from t_school ;

update t_school 
set id = 4 where id = 3 ;
 
 grant all on V.* to "amitt"@"localhost" ;
 
revoke all on v.* from "amitt"@"localhost" ;

