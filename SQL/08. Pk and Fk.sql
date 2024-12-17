use v ;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,   
    `Name` VARCHAR(100),
    Age INT,
    Major VARCHAR(50)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,   
    CourseID VARCHAR(50),
    StudentID INT,                 
    FOREIGN KEY (StudentID) 
    REFERENCES Students(StudentID)   
);


INSERT INTO Students (StudentID, `Name`, Age, Major)
VALUES (1, 'Alice', 20, 'Computer Sci'),
       (2, 'Bob', 21, 'Mathematics'),
       (3, 'Charlie', 22, 'Physics'),
       (4, 'Alice', 20, 'Computer Sci'),
       (5, 'Bob', 21, 'Mathematics'),
       (6, 'Charlie', 22, 'Physics');
       
       
       
INSERT INTO Enrollments (EnrollmentID, CourseID, StudentID)
VALUES (101, 'CS101', 1),    -- Alice enrolls in CS101
       (102, 'MATH101', 2),  -- Bob enrolls in MATH101
       (103, 'PHYS101', 3);  -- Charlie enrolls in PHYS101
       

INSERT INTO Enrollments (EnrollmentID, CourseID, StudentID)
VALUES (104, 'CHEM101', 99);   


delete from students  
where StudentID = 2;


------------------------------------------------------------------



-- Create Students table with a Primary Key
CREATE TABLE Students1 (
    StudentID INT PRIMARY KEY,  -- Primary Key for Students
    `Name` VARCHAR(100),
    Age INT,
    Major VARCHAR(50)
);

-- Create Enrollments table with a Foreign Key
CREATE TABLE Enrollments1 (
    EnrollmentID INT PRIMARY KEY,  -- Primary Key for Enrollments
    CourseID VARCHAR(50),
    StudentID INT,                 -- Foreign Key to Students table
    FOREIGN KEY (StudentID) 
        REFERENCES Students1(StudentID) 
        ON DELETE CASCADE   -- If a student is deleted, their enrollments will also be deleted
        ON UPDATE CASCADE   -- If a student's ID is updated, it will be updated in the Enrollments table
);


-- Insert students into Students table
INSERT INTO Students1 (StudentID, Name, Age, Major)
VALUES (1, 'Alice', 20, 'Computer Science'),
       (2, 'Bob', 21, 'Mathematics'),
       (3, 'Charlie', 22, 'Physics');

-- Insert enrollments into Enrollments table
INSERT INTO Enrollments1 (EnrollmentID, CourseID, StudentID)
VALUES (101, 'CS101', 1),    -- Alice enrolls in CS101
       (102, 'MATH101', 2),  -- Bob enrolls in MATH101
       (103, 'PHYS101', 3);  -- Charlie enrolls in PHYS101

select * from students1 ;

select * from enrollments1 ;

-- Delete a student (StudentID = 1) from the Students table
DELETE FROM Students1	
WHERE StudentID = 1;


-- Update a student's StudentID from 2 to 5
UPDATE Students1
SET StudentID = 5
WHERE StudentID = 2;


       
       


