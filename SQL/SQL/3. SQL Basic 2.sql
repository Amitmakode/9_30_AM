show databases ;

create database if not exists class10 ;

use class10 ;

show tables ;

create table if not exists test (id int , `name` varchar(20)); 

insert into test values (1, 'amit') ;

select * from test ;

describe test ;

insert into test values (2, 'arijit'),
(3, "vijay"),
(4, "rohit") ;

insert into test values (null, 'arijit') ;

insert into test values ('arijit') ;

insert into test (`name`) values ('arijit') ; 

alter table test
add email varchar (30) ;

alter table test
add education varchar(20) after `name` ;

alter table test 
add join_date varchar(20) first ;

alter table test
modify join_date date ;

alter table test
drop join_date ;

alter table test
add join_date date after `name`, 
add fees decimal(10,2) ;

alter table test
rename column join_date to DOJ ;

rename table test to student ;

insert into student (education) values ("graduate") ;

update student
set education = "PG" ;


update student
set education = "master" where `name` = "arijit" ;

update student
set education = "Ph D" where `name` in ("arijit" , "vijay" ) ;


DELETE FROM student WHERE `name` = 'arijit';

DELETE FROM student WHERE id = null is false;

DELETE FROM student WHERE id is null ;

set sql_safe_updates = 0 ;

truncate student ;


select * from student ;

insert into student (id, `name`) values (2, 'arijit'),
(3, "vijay"),
(4, "rohit") ;