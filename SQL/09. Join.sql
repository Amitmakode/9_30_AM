use world ;

select * from city ;

select * from country ;

select * from countrylanguage ; 

---------------------------------------------------------------

create table if not exists course (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)) ;


create table if not exists student(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int ) ;

insert into course values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language') ;

insert into student values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103) ;


select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from course c
inner join student s 
on c.course_id = s.student_course_id ;


select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from course c
join student s 
on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from course c left join student s 
on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from course c right join student s 
on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from course c left join student s 
on c.course_id = s.student_course_id 
where s.student_id is null ;

select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from course c cross join student s ;


select c.`name` as countryname, c.population as countrypop, ci.`name` as cityname, ci.population as citypop,
 c.`code` as countrycode, ci.countrycode as citycountrycode
from country c inner join city ci on c.`code` = ci.countrycode ;

select c.`name` as countryname, c.population as countrypop, ci.`name` as cityname, ci.population as citypop, c.`code` as countrycode
from country c left join city ci on c.`code` = ci.countrycode where ci.`name` is null;

select c.`name` as countryname, c.population as countrypop, ci.`name` as cityname, ci.population as citypop, c.`code` as countrycode
from country c right join city ci on c.`code` = ci.countrycode ;



select 
c1.`name` as country1,
c2.`name` as country2,
c1.region,
c1.population as population1,
c2.population as population2
from country c1 join country c2
on c1.region = c2.region  and c1.`code` != c2.`code`
where c1.population > c2.population 
order by c1.region, c1.`name` ;

select 
c1.`name` as country1,
c2.`name` as country2,
c1.region,
c1.population as population1,
c2.population as population2
from country c1 join country c2
on c1.region = c2.region   
order by c1.region, c1.`name` ;


