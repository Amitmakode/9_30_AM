create database class9 ;
use class9 ;
show tables ;
show databases ;
create table std (SN int, `name` varchar(20)) ;
insert into std values (1, "sakshi") ;
insert into std values (2, "sakshi"),
 (5, "rohan"),
 (3, "vinay"),
 (4, "poonam");
 

alter table std
add column address char(30) ;

alter table std
add column course text after `name` ;

alter table std
add column rollno smallint first ;

alter table std
rename column sn to ID ;

alter table std
add column dob char(20) ;

alter table std
modify column dob date ;

update std 
set rollno = 101 where id = 1 ;
 
update std
set address = "Nagpur" ;

update std
set dob = "1996-10-20" where id in (4, 5) ;

update std
set dob = "1996-05-20" where dob is null ;

update std 
set address = null ;

alter table std
drop column course ;

delete from std
where id = 2 ;

update std
set dob = null where id = 3 ;

rename table std to students ;

select * from students ;

truncate table students ;

drop table students ;

drop database class9 ;

use class9 ;

desc std ;


show tables like "%ee%" ;

select * from std ;

insert into std values (3) ;

insert into std (sn) values (3) ;

insert into std values (3, null) ;

use demo ;

describe bank ;

desc products ;

REPLACE INTO std (sn, `name`) VALUES (1, 'Jane Doe');


select * from std ;