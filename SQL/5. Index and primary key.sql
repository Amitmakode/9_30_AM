use class10 ;

-- index -----------------------------

show tables ;

show index from student ;
describe student ;
describe check_cont ;
describe default_cont ;

create table if not exists course (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id)
) ;

show index from course ;


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

create table if not exists course2 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name)
) ;

show index from course2 ;


create table if not exists course4 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_desc,course_name,course_tag)
) ;


insert into course4 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
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

select * from course4 ;

show index from course4


select * from course4 where course_desc = " " and course_tag = " " and course_name = " "

EXPLAIN ANALYZE select * from course4 where  course_id = 106 or course_name = 'fsds'  



-- key -----------------------------------------------


-- Primary Key:
-- Uniqueness: Every value in the primary key column(s) must be unique.
-- Not Null: Primary key columns cannot contain NULL values.
-- Unchanging: Primary key values should ideally remain constant over time. 
-- Changing primary key values can lead to data integrity issues and complications in maintaining referential integrity.
-- Indexing: Primary keys are often indexed for faster data retrieval and to enforce uniqueness.

--  Foreign Key:
-- Referential Integrity: Foreign keys establish relationships between tables by referencing 
-- the primary key (or a unique key) of another table. It ensures that every value in the foreign key column(s) exists as a primary key value in the referenced table.
-- Cascading Actions: Foreign keys may have cascading actions associated with them, such as 
-- ON DELETE CASCADE or ON UPDATE CASCADE, which dictate what should happen to dependent rows in child tables 
-- when referenced rows in parent tables are deleted or updated.
-- Data Type Compatibility: The data type of a foreign key column should match the data type of the referenced 
-- primary key column.


-- Composite Key:
-- Uniqueness: The combination of columns in a composite key must be unique.
-- Minimality: A composite key should include the minimum number of columns necessary to ensure uniqueness. 
-- Including unnecessary columns can lead to redundancy and decreased performance.
-- Order: The order of columns in a composite key is significant. 
-- Different orders may result in different keys and affect query performance.
-- Indexing: Composite keys are often indexed for efficient data retrieval and to enforce uniqueness.


-- SN	Primary Key	                                                     Unique Key
-- 1.	It is a single or combination of the field, which is used to identify each record in a table uniquely.	
        #It also determines each row of the table uniquely in the   absence of a primary key.
-- 2.	It does not allow to store a NULL value into the primary key column.	
#It can accept only one NULL value into the unique key column.
-- 3.	A table can have only one primary key.	
#A table can have more than one unique key.
-- 4.	It creates a clustered index.	
#It creates a non-clustered index.


create table neuron(
course_id int ,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert into neuron values(01 , 'FSDA','active',100) ;
insert into neuron (course_name, course_status, number_of_enro) 
values( 'FSDA','active',100) ;

alter table neuron modify course_id int auto_increment ;

select * from neuron ;


create table studets_neuron(
student_id int ,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references neuron(course_id)) ;

insert into studets_neuron values(101 , 'fsda','test@gmail.com','active',1) ;

insert into studets_neuron values(102 , 'fsds','test1@gmail.com','actived',1) ;

insert into studets_neuron (student_id, course_name, student_mail, student_status)
values(101 , 'fsda','test@gmail.com','active') ;

select * from studets_neuron ;


create table payment(
course_name varchar(60),
course_id2 int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id2) references neuron(course_id)) ;

insert into payment values ('fsda',01,'not-active','7th aug') ;
insert into payment values ('fsda',01,'not-active','7th aug') ;
insert into payment values ('fsda',null ,'not-active','7th aug') ;

select * from payment ;


