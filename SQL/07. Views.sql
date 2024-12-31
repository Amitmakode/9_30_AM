create database v ;

use v ;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    `Name` VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


insert into employees values
(1, "rahul", "ME", 22000),
(2, "rahul2", "ME2", 21000),
(3, "rahul3", "ME3", 20000),
(4, "rahul4", "ME4", 19000),
(5, "rahul", "ME", 22000),
(6, "rahul2", "ME2", 21000),
(7, "rahul3", "ME3", 20000),
(8, "rahul4", "ME4", 19000);

select * from employees ;

create view v1 as select EmployeeID, `name` , salary from employees ;

select * from v1 ;

insert into v1 (id, `name`, salary) values (10, "vishwash", 25000) ;

update v1
set `name` = "rohan" where id = 8 ;

delete from v1
where id = 7 ;



--------------------------------------------

-- Create the Employees table
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    `Name` VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

-- Insert sample data into Employees
INSERT INTO Employees1 (EmployeeID, `Name`, DepartmentID, Salary) VALUES
(1, 'Alice', 101, 50000),
(2, 'Bob', 102, 60000),
(3, 'Charlie', 101, 55000);

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Insert sample data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'HR'),
(102, 'IT');

-- Create the Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectName VARCHAR(100)
);

-- Insert sample data into Projects
INSERT INTO Projects (ProjectID, EmployeeID, ProjectName) VALUES
(1, 1, 'Project Alpha'),
(2, 2, 'Project Beta'),
(3, 3, 'Project Gamma');


select * from employees1 ;

select * from departments ;

select * from projects ;


CREATE VIEW EmployeeProjectDetails AS
SELECT
    e.EmployeeID,
    e.`Name` AS EmployeeName,
    d.DepartmentName,
    e.Salary,
    p.ProjectName
FROM
Employees1 e
JOIN
Departments d ON e.DepartmentID = d.DepartmentID
join
Projects p on  e.EmployeeID = p.EmployeeID;

select * from EmployeeProjectDetails ;

insert into EmployeeProjectDetails values (4, "abc", "Admin", 30000, "p1");

update EmployeeProjectDetails set EmployeeName = "rohit" where EmployeeID = 1;

delete from EmployeeProjectDetails where salary = 55000 ;


