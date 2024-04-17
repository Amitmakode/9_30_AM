use class10 ;

-- parttion by list cloumn

create table course105(
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list columns(course_name)(
partition p0 values  in('aiops','data analytics','Dl','RL'),
partition p1 values  in('fsds' ,'big data','blockchain'),
partition p2 values  in('MERN','java','interview prep','fsda')
);



select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class105';


insert into class105 (course_name) value ('AI') ;


create table course106 (
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list columns (course_name, course_id)(
partition p0 values  in('aiops','data analytics',2021, 2019),
partition p1 values  in('fsds' ,'big data', 2022, 2020),
partition p2 values  in('MERN','java', 2023, 2024)
);

drop table course106 ;


CREATE TABLE course106(
    course_name varchar(50),
    course_id int(10),
    course_title varchar(60),
    course_desc varchar(80),
    launch_date date,
    course_fee int,
    course_mentor varchar(60),
    course_launch_year int)
PARTITION BY LIST COLUMNS (course_name, course_id)(
    PARTITION p0 VALUES IN (('aiops',2019), ('data analytics', 2021)),
    PARTITION p1 VALUES IN (('fsds', 2020), ('big data', 2022)),
    PARTITION p2 VALUES IN (('MERN', 2024), ('java', 2023))
);


select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'course106';


insert into course106 (course_name, course_id) value ('fsds', 2020) ;

insert into course106 (course_name, course_id) value ('fsds', 2019) ;


-- partition by key 

create table  course107(
course_name varchar(50),
course_id int(10) primary key ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by key()
partitions 10;

insert into  course107 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'course107';

insert into  course107 values
('machine_learning' , 1016, 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ;


create table course108(
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
partition p0 values less than (2020) ,
partition p1 values less than (2021) ,
partition p2 values less than (2022) ,
partition p3 values less than (2023) 
);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'course108';

insert ignore into course108 values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SAP' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2021),
('SF' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('DM' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2020),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SEO' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2020);


select * from  courses7;

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'course108';

-- dml
-- ddl
-- constraiant 
-- partition

-- union and unionall

create table customer_union 
(cut_Id int, customer_name varchar(20), city varchar(20), Country varchar(20), billing_date date ) ;


insert into customer_union values 
(1, "rohit", "nagpur", "india", "1999-1-1"),
(2, "mohit", "berlin", "germany", "2000-2-2"),
(3, "sohit", "tokyo", "japan", "2001-3-3"),
(4, "purohit", "D.F.", "Maxio", "2002-4-4"),
(5, "kamlesh", "kathmandu", "nepal", "2003-5-5"),
(105, "tata", "mumbai", "india", "2009-5-5"),
(104, "honda", "tokoyo", "japan", "2008-4-4") ;


create table supplier_union 
(sup_Id int, supplier_name varchar(20), city varchar(20), Country varchar(20), selling_date date ) ;

insert into supplier_union values (1, "sohit", "tokyo", "japan", "2001-3-3") ;
(101, "deffodil", "karachi", "pakistan", "2005-1-1"),
(102, "kia", "colmbo", "shrilanka", "2006-2-2"),
(103, "vivo", "bejing", "china", "2007-3-3"),
(104, "honda", "tokoyo", "japan", "2008-4-4"),
(105, "tata", "mumbai", "india", "2009-5-5"),
(1, "rohit", "nagpur", "india", "1999-1-1"),
(2, "mohit", "berlin", "germany", "2000-2-2"),
(3, "sohit", "tokyo", "japan", "2001-3-3") ;


select * from customer_union ;

select * from supplier_union ;

select cut_Id , city from customer_union 
union
select sup_Id, city from supplier_union;


select cut_Id , city from customer_union 
union all
select sup_Id, city from supplier_union;


SELECT cut_Id , City FROM Customer_union
UNION
SELECT sup_Id, City FROM Supplier_union
ORDER BY City;

SELECT cut_Id , City,  Country  FROM Customer_union
UNION
SELECT sup_Id, City,  Country  FROM Supplier_union
ORDER BY Country desc ;


SELECT cut_Id , City,  Country  FROM Customer_union
UNION
SELECT sup_Id, City,  Country  FROM Supplier_union
ORDER BY Country desc limit 5;


SELECT City FROM Customer_union
UNION ALL
SELECT City FROM Supplier_union
ORDER BY City ;



SELECT City, Country FROM Customer_union
WHERE Country='Germany'
UNION
SELECT City, Country FROM Supplier_union
WHERE Country='Germany'
ORDER BY City;


SELECT City, Country FROM Customer_union
WHERE Country='Germany'
UNION all
SELECT City, Country FROM Supplier_union
WHERE Country='Germany'
ORDER BY City;


SELECT City, Country, billing_date FROM Customer_union
WHERE billing_date = "2000-2-2"
UNION all
SELECT City, Country,selling_date  FROM Supplier_union
WHERE selling_date ='2001-3-3 '
ORDER BY billing_date ;

SELECT City, sup_id FROM Supplier_union
union
SELECT City, cut_id FROM Customer_union
ORDER BY City ;