use V ;

show tables ;

use world ;

create table if not exists course (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50));


create table if not exists student(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int );


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


select * from course ;

select * from student ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s ;


-- Create the Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);

-- Insert sample data into the Employees table
INSERT INTO Employees (emp_id, emp_name, manager_id) VALUES
(1, 'John', NULL),
(2, 'Alice', 1),
(3, 'Bob', 1),
(4, 'Charlie', 2),
(5, 'Eve', 2),
(6, 'John1', NULL),
(7, 'Alice1', 1),
(8, 'Bob1', 1),
(9, 'Charlie1', 2),
(10, 'Eve1', 2);

select * from employees ;


-- Perform a self-join to get employee names and their managers

SELECT e1.emp_name AS employee_name, e2.emp_name AS manager_name
FROM Employees e1
left JOIN Employees e2
ON e1.manager_id = e2.emp_id;

CREATE TABLE SalesReps (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(50),
    manager_id INT,
    sales_region VARCHAR(50),
    total_sales DECIMAL(10, 2),
    FOREIGN KEY (manager_id) REFERENCES SalesReps(rep_id)
);

INSERT INTO SalesReps (rep_id, rep_name, manager_id, sales_region, total_sales) VALUES
(1, 'John Doe', NULL, 'North', 150000.00),
(2, 'Alice Smith', 1, 'North', 120000.00),
(3, 'Bob Johnson', 1, 'South', 130000.00),
(4, 'Charlie Brown', 2, 'North', 90000.00),
(5, 'Eve Davis', 2, 'South', 95000.00),
(6, 'Frank White', 3, 'South', 110000.00),
(7, 'John Doe1', NULL, 'North', 150000.00),
(8, 'Alice Smith2', 1, 'North', 120000.00),
(9, 'Bob Johnson1', 1, 'South', 130000.00),
(10, 'Charlie Brown2', 2, 'North', 90000.00),
(11, 'Eve Davis2', 2, 'South', 95000.00),
(12, 'Frank White1', 3, 'South', 110000.00);


-- Let’s say we want to find each sales representative and their manager’s 
-- total sales in a given region. This will be a useful query for managers to 
-- see the performance of their teams.

SELECT e1.rep_name AS sales_rep_name, 
       e2.rep_name AS manager_name, 
       e1.sales_region, 
       e1.total_sales AS rep_sales, 
       e2.total_sales AS manager_sales
FROM SalesReps e1
LEFT JOIN SalesReps e2 ON e1.manager_id = e2.rep_id
ORDER BY e1.sales_region, e1.rep_name;


SELECT e1.rep_name AS sales_rep_name, e1.sales_region, 
       e1.total_sales AS rep_sales, e1.rep_id,  e2.rep_name AS manager_name,
        e2.total_sales AS manager_sales, e2.manager_id
FROM SalesReps e1 left join salesreps e2 
on e1.rep_id = e2.manager_id ;


select c1.`code` as country, c2.countrycode as city, c3.countrycode as countrylanguage, 
c3.`language` as lang, c1.lifeexpectancy , c2.population, c2.`name` 
from country c1 
join city c2 on c1.`code` = c2.countrycode 
join countrylanguage c3 on c1.`code` = c3.countrycode ;

select c1.`code` as country, c2.countrycode as city, c3.countrycode as countrylanguage, 
c3.`language` as lang, c1.lifeexpectancy , c2.population, c2.`name` 
from country c1 
join city c2 on c1.`code` = c2.countrycode 
join countrylanguage c3 on c2.countrycode = c3.countrycode ;

---------------------------------------------

CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Employees1 (EmployeeID, Name, Email) VALUES
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com');


INSERT INTO Employees1 (EmployeeID, Name, Email) VALUES
(4, 'David Wilson', 'david@example.com'),
(5, 'Eva Green', 'eva@example.com'),
(6, 'Bob Johnson', 'bob.johnson@example.com'); 

CREATE TABLE Contractors (
    ContractorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Contractors (ContractorID, Name, Email) VALUES
(1, 'David Wilson', 'david@example.com'),
(2, 'Eva Green', 'eva@example.com'),
(3, 'Bob Johnson', 'bob.johnson@example.com'); 


INSERT INTO Contractors (ContractorID, Name, Email) VALUES
(4, 'Alice Smith', 'alice@example.com'),
(5, 'Bob Johnson', 'bob@example.com'),
(6, 'Charlie Brown', 'charlie@example.com');

select * from employees1 ;

select * from contractors ;

select employeeid, name from employees1 
union
select name, ContractorID from contractors ;
  
select name, email from employees1 
union
select name, email from contractors ;  
  
  
select name, email from employees1 
union 
select name, email from contractors
union 
select rep_name, sales_region from SalesReps  ;    

