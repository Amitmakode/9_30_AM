use uni_join ;

select * from students ;

select * from teachers ;

select * from staff ;


SELECT * 
FROM table1
INNER JOIN table2 ON table1.column = table2.column;


create table if not exists courses (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)) ;

create table if not exists student (
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int ) ;


insert into courses values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
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


select * from courses  ;

select * from student ;

SELECT * 
FROM courses
JOIN student ON courses.course_id = student.student_course_id ;


select c.course_id , c.course_name , c.course_desc , s.student_id, s.student_name , s.student_course_id 
from courses c
inner join student s on c.course_id = s.student_course_id ;


select c.course_id , c.course_name , c.course_desc ,s.student_id, s.student_name , s.student_course_id 
from courses c left join student s on c.course_id = s.student_course_id ;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c
left join student s on c.course_id = s.student_course_id where s.student_id is null;



select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c
right join student s on c.course_id = s.student_course_id ;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c
right join student s on c.course_id = s.student_course_id where c.course_id is null;


select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c
cross join student s on c.course_id = s.student_course_id where c.course_id is null ;



select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from courses c
cross join student s on c.course_id = s.student_course_id ;


-- 1. Inner Join

-- Example: Retrieve all students along with their assigned teacher(s).

SELECT s.FirstName AS StudentFirstName, s.LastName AS StudentLastName,
       t.FirstName AS TeacherFirstName, t.LastName AS TeacherLastName
FROM Students s
INNER JOIN Teachers t ON s.GradeLevel = t.YearsOfExperience;



-- 2. Left Join

-- Example: Retrieve all students and, if available, their assigned teacher(s).

SELECT s.FirstName AS StudentFirstName, s.LastName AS StudentLastName,
       t.FirstName AS TeacherFirstName, t.LastName AS TeacherLastName
FROM Students s
LEFT JOIN Teachers t ON s.GradeLevel = t.YearsOfExperience;



-- 1. Self Join Example on Students Table



SELECT 
    s1.FirstName AS Student1FirstName, s1.LastName AS Student1LastName,
    s2.FirstName AS Student2FirstName, s2.LastName AS Student2LastName,
    s1.City
FROM Students s1
JOIN Students s2 ON s1.City = s2.City AND s1.StudentID < s2.StudentID;


-- 2. Self Join Example on Teachers Table



SELECT 
    t1.FirstName AS Teacher1FirstName, t1.LastName AS Teacher1LastName,
    t2.FirstName AS Teacher2FirstName, t2.LastName AS Teacher2LastName,
    t1.EducationLevel
FROM Teachers t1
JOIN Teachers t2 ON t1.EducationLevel = t2.EducationLevel AND t1.TeacherID < t2.TeacherID;


select * from  class10.sales  ;

select s1.region, s1.country, s1.market, s2.region, s2.country, s2.market, s1.discount, s2.shipping_cost
from class10.sales s1
join class10.sales s2 on s1.country = s2.country and s1.discount > s2.shipping_cost ;  



SELECT 
    m.Emp_ID AS ManagerID,
    m.emp_Name AS ManagerFirstName,
    COUNT(e.EmployeeID) AS NumEmployeesReporting,
    SUM(e.emp_Salary) AS TotalSalaryOfReportingEmployees
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
GROUP BY m.EmployeeID, m.FirstName, m.LastName
ORDER BY m.EmployeeID;

select * from class10.employees; 


-- Scenario: Retrieve all customers and their orders, including those who have not placed any orders yet.


SELECT 
    c.CustomerID,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;



-- Scenario: Retrieve all orders and their corresponding customer information, including orders without associated customers.



SELECT 
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName
FROM Orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID;



-- Scenario: Retrieve detailed information about orders, including customer details, 
-- product details, and salesperson information.


SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    p.ProductID,
    p.ProductName,
    s.SalespersonID,
    s.FirstName AS SalespersonFirstName,
    s.LastName AS SalespersonLastName,
    os.Quantity,
    os.UnitPrice,
    os.TotalPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails os ON o.OrderID = os.OrderID
JOIN Products p ON os.ProductID = p.ProductID
JOIN Salespersons s ON o.SalespersonID = s.SalespersonID;

