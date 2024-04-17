USE CLASS10 ;

-- VIEW 

SELECT * FROM BANK ;

create view FIRST_VIEW as select AGE, housing, balance, education, marital from bank;

SELECT * FROM FIRST_VIEW  ;


delimiter &&
create procedure p3 (IN A varchar(20))
begin
select * from FIRST_VIEW where job = A ;
End &&

call p3("admin.") ;

delimiter &&
create procedure p4 ()
begin
select * from FIRST_VIEW ;
End &&

call p4() ;



-- bulk data load

create table if not exists dress (
`Dress_ID`  varchar (30),	
`Style` varchar (30),
`Price` varchar (30),
`Rating` varchar (30),	
`Size` varchar (30),
`Season` varchar (30),	
`NeckLine` varchar (30),	
`SleeveLength`	varchar (30),
`waiseline`	 varchar (30),
`FabricType` varchar (30),	
`Decoration`	varchar (30),
`Pattern Type`	varchar (30),
`Recommendation`  varchar (30));


alter table dress
add material varchar(40) after waiseline ;


LOAD DATA INFILE  
'F:/dress.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;


select * from dress ;

show tables ;
select * from dress ;
select * from bank ; 


create table if not exists course_join (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)) ;


insert into course_join values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(103 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(104 , 'c' , 'c language' , 'c') ;


create table if not exists student_join(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int ) ;

insert into student_join values(null , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(303 , "sudhanshu", 3543453,'yes', 103),
(304 , "sudhanshu", 3543453,'yes', 104),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 106),
(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(303 , "sudhanshu", 3543453,'yes', 103) ;

select * from course_join ;

select * from student_join ;

select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id 
from course_join c
inner join student_join s 
on c.course_id = s.student_course_id ;

select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name
from course_join c
inner join student_join s 
on c.course_id = s.student_course_id 
where s.student_id is null ;

select c.course_id , c.course_name , c.course_desc , s.student_id,s.student_name ,s.student_course_id 
from course_join c
left join student_join s 
on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc , s.student_id,s.student_name ,s.student_course_id 
from course_join c
left join student_join s 
on c.course_id = s.student_course_id 
where s.student_id is null;

select c.course_id , c.course_name , c.course_desc , s.student_id,s.student_name ,s.student_course_id 
from course_join c
left join student_join s 
on c.course_id = s.student_course_id 
where s.student_id is null 
ORDER BY c.course_id;

select b.age, b. marital, b.education, d.dress_id, d.style 
from bank b
left join dress d
on b.age = d.dress_id ;


select b.age, b. marital, b.education, d.dress_id, d.style 
from bank b
inner join dress d
on b.age = d.dress_id ;




select b.age, b. marital, b.education, d.dress_id, d.style 
from bank b
right join dress d
on b.age = d.dress_id ;

select b.age, b. marital, b.education, d.dress_id, d.style 
from bank b
cross join dress d
on b.age = d.dress_id ;

select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id 
from course_join c
cross join student_join s 
on c.course_id = s.student_course_id ;

























