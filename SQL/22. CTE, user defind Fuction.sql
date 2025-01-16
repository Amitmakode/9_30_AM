create database cte ;

use cte ;

-- Create a simple table
CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);

-- Insert some sample data
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID)
VALUES (1, 'John', 'Doe', 1),
       (2, 'Jane', 'Smith', 2),
       (3, 'Michael', 'Johnson', 1),
       (4, 'Emily', 'Davis', 2);

select * from employees ;

with tmp_table as 
(SELECT DepartmentID, COUNT(*) AS NumEmployees
    FROM Employees
    GROUP BY DepartmentID) 
SELECT DepartmentID, NumEmployees
FROM tmp_table;  

use win_fun ;

select * from students ;

select max(score) from student_scores group by course
having score < (select max(score) from student_scores) ;

rename table student_scores to students ;


with scorecte as (
select student_name, course, score,
dense_rank() over(partition by course order by score desc) as `rank` from students )
select * from scorecte where `rank` = 5 ;


DELIMITER $$
create function function1(A INT)
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE B int ;
	set B = A + 10 ;
	return B ;
end $$


select student_name, score, function1(score, 3) from students ;


select age, function1(age, 10) from bulk_load.bank ;

use bulk_load ;

select age, win_fun.function1(age, 10) from bank ;

select * from sales ;


Delimiter $$
create function GST(a int, b int, c int)
returns int
DETERMINISTIC
begin 
	declare d int ;
    set d = (a*b) * c ;
    return d ;
end $$
    
select sales, quantity, sales*quantity, GST(sales, quantity, 0.18) as GST from sales ;    

select sales, quantity, sales*quantity, ((sales*quantity)*0.12) as GST from sales ;  
