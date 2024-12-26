create database Partition_ ;
use partition_ ;

create table Part1_Rang(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)(
partition p0 values less than (2019),
partition p1 values less than (2020),
partition p2 values less than (2021),
partition p3 values less than (2022),
partition p4 values less than maxvalue);


select * from Part1_Rang ;

SELECT TABLE_NAME, PARTITION_NAME, PARTITION_ORDINAL_POSITION, PARTITION_METHOD, PARTITION_EXPRESSION, TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = "Part1_Rang" ;


insert into Part1_Rang values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu', 2018) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu', 2020) ;



create table  Part_list (
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list(course_launch_year)(
partition p0 values in(2019,2020),
partition p1 values in(2022,2021),
partition p2 values in(2023,2024)
);

SELECT TABLE_NAME, PARTITION_NAME, PARTITION_ORDINAL_POSITION, PARTITION_METHOD, PARTITION_EXPRESSION, TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = "Part_list" ;

insert ignore into Part_List values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu', 2018) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu', 2020) ;



create table  part_hash(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 6;


SELECT TABLE_NAME, PARTITION_NAME, PARTITION_ORDINAL_POSITION, PARTITION_METHOD, PARTITION_EXPRESSION, TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = "Part_hash" ;


insert ignore into Part_hash values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu', 2022) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu', 2007) ;



create table part_rang_column(
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range columns(course_name, course_launch_year )(
partition p0 values less than ('aiops',2019),
partition p1 values less than ('fsds', 2021),
partition p2 values less than ('MERN', 2023)
);


SELECT TABLE_NAME, PARTITION_NAME, PARTITION_ORDINAL_POSITION, PARTITION_METHOD, PARTITION_EXPRESSION, TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = "Part_rang_column" ;


insert ignore into Part_rang_column values
('DA' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu', 2018) ;

select 'aiops' > 'fsds' ;
select "Apple" < "Banana" ;

select ("AA", 2018) < ('aiops',2019);
select ("DA", 2018) < ('fsds', 2021) ;
select ("DA", 2018) < ('MERN', 2023) ;


create table  part_key(
course_name varchar(50),
course_id int(10) primary key ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by key()
partitions 4;

SELECT TABLE_NAME, PARTITION_NAME, PARTITION_ORDINAL_POSITION, PARTITION_METHOD, PARTITION_EXPRESSION, TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = "Part_key" ;

insert into  part_key values
('machine_learning' , 105, 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ;

 desc part_key ;
 
 show index from part_key ;
 
 
 create table composit_part(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5 (
partition p0 values less than (2019) ,
partition p1 values less than (2020) ,
partition p2 values less than (2021) ,
partition p3 values less than maxvalue 
);


SELECT TABLE_NAME, PARTITION_NAME, PARTITION_ORDINAL_POSITION, PARTITION_METHOD, PARTITION_EXPRESSION, TABLE_ROWS
FROM information_schema.PARTITIONS
WHERE TABLE_NAME = "composit_part" ;

insert ignore into composit_part values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu', 2027) ;
