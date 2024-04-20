show databases ;

create database if not exists class_10 ;
create database class_10 ;
use class_10;
show tables ;
show table status ;
describe text1; 


create table if not exists test (
id int,
`name` varchar(20),
Education varchar (20),
marks decimal(10,2),
dob date,
contact bigint ) ;

select * from test ;

insert into test values(2, "rohit", "B.E.", 77.88, "1999-01-26","nagpur", 8989898989),
(3, "rohit", "B.E.", 77.88, "1999-01-26","nagpur",8989898989),
(4, "rohit", "B.E.", 77.88, "1999-01-26","nagpur", 8989898989),
(5, "rohit", "B.E.", 77.88, "1999-01-26","nagpur", 8989898989),
(6, "rohit", "B.E.", null,  "1999-01-26","nagpur", 8989898989) ;

insert into text1 (`name`, education, marks) values("rohit", "B.E.", 77.88) ;

insert ignore into text1 values (2, "rohit", "B.E.", 77.88, "1999-01-26" ) ;

drop table test ;

alter table test
add `address` varchar(40) first ;

alter table test
add `address` varchar(40) after dob  ;

alter table test
modify contact varchar(20) ;

alter table test
rename column id to emp_id ;

alter table test
drop `address` ;

update test
set marks = 80 where emp_id = 6 ;

update test
set marks = 80 ;

DELETE FROM test WHERE emp_id = 6;

ALTER TABLE test 
RENAME TO demo ;



truncate test ;


select * from demo ;





















create table if not exists bank(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int ,
housing varchar(30),
loan varchar(30) ,
contact varchar(30),
`day` int,
`month` varchar(30) ,
duration int ,
campaign int,
pdays int ,
previous int ,
poutcome varchar(30) ,
y varchar(30));