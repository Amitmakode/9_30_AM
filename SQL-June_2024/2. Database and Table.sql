create database class10 ; 
use class10 ; 
show databases ;
use world; 
drop database class10;
create database if not exists class10 ;
use class10;
create table if not exists class (sr int, `name` varchar(30), address varchar(40), dob date, course varchar(20), contact bigint); 
select * from class ; 
insert into class values(1, "arijit", "nagpur", "1994-10-12", "BA", 8980000007 ) ;
insert into class values(2, "alashree", "nagpur2", "1997-03-20", "DA", 9980000007 ),
(3, "vijay", "amravati", "1990-09-06", "DA", 8980000076 ),
(4, "aniket", "tirora", "2001-02-23", "BA", 8980045457 ); 

insert into class values(5, "avantika", "nagpur_old", "2002-10-09", "DS", 9977005566) ;

insert into class values(6, "pranjali", "nagpur-1", "2001-08-21", "BA", null) ;

insert into class(sr, `name`, address, dob, course) 
values(6, "pranjali", "nagpur-1", "2001-08-21", "BA") ;

select * from class where address = "amravati" ;

select count(*) from class ;

select max(`name`) from class ;
select min(`name`) from class ;

select * from class order by dob ;

select * from class order by dob desc ;








