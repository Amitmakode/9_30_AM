use class10 ;

create table neuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert into neuron values(03 , 'FSDS','active',110) ;

select * from neuron ;


create table student_neuron(
student_id int ,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references neuron(course_id)) ;

insert into student_neuron values(101 , 'fsda','test@gmail.com','active', null) ;

select * from student_neuron ;


create table payment(
course_name varchar(60),
course_id int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references neuron(course_id)) ;

insert into payment values ('fsda',3,'not-active','7th aug') ;

select * from payment ;


create table class(
course_id int ,
class_name varchar(60),
class_topic varchar(60),
class_duration int ,
contact int,
primary key (contact),
foreign key(course_id) references neuron(course_id )) ;


alter table neuron drop primary key ;

alter table class drop primary key ;

create table test(
id int not null , 
`name` varchar(60),
email_id varchar(60),
mobile_no varchar(9),
address varchar(50)) ;

alter table test add primary key(id) ;

alter table test drop primary key ;

alter table test add constraint test_prim primary key (id , email_id) ;


create table parent(
id int ,
`name` varchar(30),
primary key(id)) ;

insert into parent values(1, "ajay"), (2, "amol"), (3, "dj") ;

select * from parent ;


create table child (
Child_id int ,
parent_id int ,
foreign key (parent_id) references parent(id)) ;


insert into child values(1,1) ;

insert into child values(2,null) ; 

delete from parent where id =1 ;

delete from child where child_id =1 ;

select * from child ;

set sql_safe_updates = 0 ;

drop table child ;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on delete cascade ) ;

insert into child values(1,1),(1,2),(3,2),(2,3) ;

delete from parent where id =1 ;

update parent set id = 3 where id = 2 ;

update parent set id = 1 where id = 2 ;

drop table child ;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on update cascade ) ;

insert into child values(1,2),(3,2),(2,3) ;

update parent set id = 1 where id = 3 ;


CREATE TABLE customer (  
  ID INT NOT NULL AUTO_INCREMENT,  
  `Name` varchar(50) NOT NULL,  
  City varchar(50) NOT NULL,  
  PRIMARY KEY (ID)  
);  



CREATE TABLE contact (  
  ID INT,  
  Customer_Id INT,  
  Customer_Info varchar(50) NOT NULL,  
  `Type` varchar(50) NOT NULL,  
  INDEX par_ind (Customer_Id),  
  CONSTRAINT fk_customer FOREIGN KEY (Customer_Id)  
  REFERENCES customer(ID)  
  ON DELETE CASCADE  
  ON UPDATE CASCADE  
); 

insert into customer values(1, "abc", "xyz"), (2, "abc", "xyz"),(3, "abc", "xyz") ;


insert into contact values(1, 2, "invailid", "unknown"), (1, 1, "invailid", "unknown"),(1, 3, "invailid", "unknown") ;


select * from customer ;
select * from contact ;

delete from customer where id = 1 ;

update customer set id = 1 where id = 3 ;


show index from contact ;

describe contact ;

describe customer ;





CREATE TABLE customer1 (  
  ID INT NOT NULL AUTO_INCREMENT,  
  `Name` varchar(50) NOT NULL,  
  City varchar(50) NOT NULL,  
  PRIMARY KEY (ID)  
); 



CREATE TABLE Contact1 (  
  ID INT,  
  Person_Id INT,  
  Info varchar(50) NOT NULL,  
  `Type` varchar(50) NOT NULL,  
  INDEX par_ind (Person_Id),  
  CONSTRAINT fk_person FOREIGN KEY (Person_Id)  
  REFERENCES customer1(ID)  
  ON DELETE SET NULL  
  ON UPDATE SET NULL  
); 

insert into customer1 values(1, "abc", "xyz"), (2, "abc", "xyz"),(3, "abc", "xyz") ;

insert into contact1 values(1, 1, "invailid", "unknown"), (1, 2, "invailid", "unknown"),(1, 3, "invailid", "unknown") ;

select * from customer1 ;
select * from contact1 ;

delete from customer1 where id = 1 ;
update customer1 set id= 1 where id = 3 ;

ALTER TABLE Contact ADD INDEX par_ind ( Person_Id );  

ALTER TABLE Contact ADD CONSTRAINT fk_person  
FOREIGN KEY ( Person_Id ) REFERENCES Person ( ID ) ON DELETE CASCADE ON UPDATE RESTRICT;  

SET foreign_key_checks = 0; 



CREATE TABLE Product (  
    Prod_ID int,   
    `Name` varchar(45),   
    Manufacturer varchar(45),  
    PRIMARY KEY(`Name`, Manufacturer)  
);


DESCRIBE Product;  


INSERT INTO Product (Prod_ID, `Name`, Manufacturer)  
VALUES (101, 'Soap', 'Hamam'),  
(102, 'Shampoo', 'Teresme'),  
(103, 'Oil', 'Daber Almond'); 


INSERT INTO Product (Prod_ID, `Name`, Manufacturer)  
VALUES (104, 'Soap', 'Hamamm');  
  
INSERT INTO Product (Prod_ID, Name, Manufacturer)  
VALUES (101, 'Soap', 'LUX'); 



CREATE TABLE Student(  
  stud_id int NOT NULL,  
  stud_code varchar(15),  
  stud_name varchar(35),  
  `subject` varchar(25	),     
  marks int  
);  


ALTER TABLE Student add primary key(stud_id, `subject`); 

