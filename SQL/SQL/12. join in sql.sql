use class10 ;

create table if not exists course_join (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)) ;


create table if not exists student_join(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int ) ;



insert into course_join values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
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


insert into student_join values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103) ;


select * from course_join ;
select * from student_join ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course_join c
inner join student_join s 
on c.course_id = s.student_course_id ;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course_join c
left join student_join s on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course_join c
left join student_join s on c.course_id = s.student_course_id where s.student_id is null;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course_join c
right join student_join s on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course_join c
right join student_join s on c.course_id = s.student_course_id where c.course_id is null ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course_join c
cross join student_join s on c.course_id = s.student_course_id where c.course_id is null ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course_join c
cross  join student_join s ;

create table sql_join (order_id int , customer_id int, orderdate date) ;

insert into order_join values(10308,	2,	"1996-09-18"),
(10309,	37,	"1996-09-19"),
(10310,	77,	"1996-09-20"),
(10311,	57,	"1996-09-20"),
(10312,	33,	"1996-09-20") ;

rename table sql_join to order_join ;

create table customer_join (CustomerID int, CustomerName varchar(30), ContactName varchar(30), Country varchar(30)) ;

insert into customer_join values (1,	"Alfreds Futterkiste",	"Maria Anders",	"Germany"),
(2,	"Ana Trujillo  helados",	"Ana Trujillo",	"Mexico"),
(3,	"Antonio Moreno Taquería",	"Antonio Moreno",	"Mexico"),
 (4,	"Trujillo Emparedados",	"Trujillo",	"spain");
 
 
SELECT Orders.Order_ID, Customers.CustomerName, Orders.OrderDate
FROM Order_join orders
INNER JOIN Customer_join customers ON Orders.Customer_ID = Customers.CustomerID ;

SELECT Orders.Order_ID, Customers.CustomerName, Orders.OrderDate
FROM Order_join orders
left JOIN Customer_join customers ON Orders.Customer_ID = Customers.CustomerID ;

SELECT Orders.Order_ID, Customers.CustomerName, Orders.OrderDate
FROM Order_join orders
right JOIN Customer_join customers ON Orders.Customer_ID = Customers.CustomerID ;

SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;


SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM (
(Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

alter table order_join 
add shipperid int ;

insert into order_join (shipperid) values ( 201), (202), (203), (204), (205) ;

select * from order_join ;
select * from customer_join ;
select * from shipper ;


truncate table order_join ;

insert into order_join values(10308,	2,	"1996-09-18", 201),
(10309,	37,	"1996-09-19", 202),
(10310,	77,	"1996-09-20", 203),
(10311,	57,	"1996-09-20", 204),
(10312,	33,	"1996-09-20", 205) ;

create table shipper (shipper_id int) ;

insert into shipper values (201), (203), (205) ;


SELECT Order_join.Order_ID, Customer_join.CustomerName
FROM 
Order_join
INNER JOIN Customer_join ON Order_join.Customer_ID = Customer_join.CustomerID ;

SELECT Order_join.Order_ID, Customer_join.CustomerName, Shipper.Shipper_id
FROM (
(Order_join
INNER JOIN Customer_join ON Order_join.Customer_ID = Customer_join.CustomerID)
INNER JOIN Shipper ON Order_join.ShipperID = Shipper.Shipper_ID);


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

SELECT Customer_join.CustomerName, Order_join.Order_ID
FROM Customer_join
LEFT JOIN Order_join ON Customer_join.CustomerID = Order_join.Customer_ID
ORDER BY Customer_join.CustomerName desc limit 10;



SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


SELECT column_name(s)
FROM table1
FULL JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;


SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;


