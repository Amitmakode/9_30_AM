create database uni_join ;

use uni_join  ;

create table uni1(id int, `name` varchar(20), class varchar(10)) ;

insert into uni1 values(1, "rony", "DS"),
(2, "vijay", "DA"),
(3, "vijay", "DA"),
(2, "vijay", "DA"),
(1, "vijay", "DA"),
(4, "vijay", "DA"),
(5, "vijay", "DA") ;



create table uni2 (id int, `name` varchar(20), class varchar(10)) ;

insert into uni2 values(1, "rony", "DS"),
(2, "vijay", "DA"),
(3, "vijay", "DA"),
(2, "vijay", "DA"),
(1, "vijay", "DA"),
(4, "vijay", "DA"),
(5, "vijay", "DA") ;



select * from uni1 ;

select * from uni2 ;


select * from uni1
union 
select * from uni2 ;


select * from uni1
union all
select * from uni2 ;


select id, `name` from uni1
union 
select id, `name` from uni2 ;

select id, `name` from uni2
union all
select `name`, id from uni1 ;


select id, `name` from uni2
union all
select id, `name`, class from uni1 ;



select id, `name`, class from uni2
union all
select id, `name` from uni1 ;



CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    GradeLevel INT,
    GPA DECIMAL(3, 2),
    ParentGuardianName VARCHAR(100),
    ParentGuardianPhone VARCHAR(20),
    EmergencyContactName VARCHAR(100),
    EmergencyContactPhone VARCHAR(20),
    MedicalConditions TEXT,
    Allergies TEXT,
    Notes TEXT
);


CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    SubjectTaught VARCHAR(100),
    YearsOfExperience INT,
    EducationLevel VARCHAR(50),
    OfficeLocation VARCHAR(100),
    OfficeHours VARCHAR(100),
    ClassesCurrentlyTeaching TEXT,
    ProfessionalDevelopmentCompleted TEXT,
    SpecialCertifications TEXT,
    Notes TEXT
);




 INSERT INTO Students 
(FirstName, LastName, DateOfBirth, Gender, Address, City, 
State, ZipCode, PhoneNumber, Email, GradeLevel, GPA, 
ParentGuardianName, ParentGuardianPhone, EmergencyContactName, 
EmergencyContactPhone, MedicalConditions, Allergies, Notes)
VALUES ('John', 'Doe', '2005-08-15', 'Male', '123 Main St', 'Anytown', 'CA', '12345', '555-1234', 'john.doe@example.com', 10, 3.5, 'Jane Doe', '555-5678', 'Jack Doe', '555-9876', 'None', 'Peanuts', 'Likes science classes.'),
('Emily', 'Smith', '2004-07-20', 'Female', '456 Oak Ave', 'Othertown', 'NY', '54321', '555-4321', 'emily.smith@example.com', 11, 3.8, 'Michael Smith', '555-9876', 'Sarah Smith', '555-6543', 'None', 'None', 'Prefers reading over math.'),
('David', 'Brown', '2006-01-10', 'Male', '789 Pine Blvd', 'Smalltown', 'TX', '67890', '555-8765', 'david.brown@example.com', 9, 3.2, 'Lisa Brown', '555-2345', 'Chris Brown', '555-7654', 'Asthma', 'None', 'Enjoys playing soccer.'),
('Sophia', 'Johnson', '2005-09-30', 'Female', '890 Elm St', 'Sometown', 'FL', '98765', '555-2345', 'sophia.johnson@example.com', 10, 3.6, 'Mark Johnson', '555-8765', 'Anna Johnson', '555-5432', 'None', 'Dairy', 'Plays the violin.'),
('Ethan', 'Williams', '2005-02-18', 'Male', '567 Maple Ave', 'Largetown', 'WA', '23456', '555-6789', 'ethan.williams@example.com', 11, 3.9, 'Jessica Williams', '555-3456', 'Ryan Williams', '555-7890', 'None', 'Shellfish', 'Enjoys astronomy.'),
('Olivia', 'Brown', '2006-04-25', 'Female', '345 Cedar Ln', 'Othertown', 'TX', '54321', '555-9876', 'olivia.brown@example.com', 9, 3.3, 'Andrew Brown', '555-2345', 'Grace Brown', '555-8765', 'None', 'Peanuts', 'Loves playing piano.'),
('Liam', 'Garcia', '2005-11-12', 'Male', '678 Pine St', 'Smalltown', 'CA', '87654', '555-7654', 'liam.garcia@example.com', 10, 3.7, 'Maria Garcia', '555-5432', 'Carlos Garcia', '555-6789', 'None', 'None', 'Plays soccer on weekends.'),
('Emma', 'Martinez', '2006-07-08', 'Female', '234 Oak Blvd', 'Bigtown', 'FL', '34567', '555-8765', 'emma.martinez@example.com', 9, 3.1, 'Jose Martinez', '555-7890', 'Sophia Martinez', '555-2345', 'None', 'None', 'Enjoys painting.'),
('Noah', 'Lopez', '2005-03-20', 'Male', '456 Elm Ave', 'Sometown', 'NY', '45678', '555-9876', 'noah.lopez@example.com', 11, 3.8, 'Carlos Lopez', '555-8765', 'Isabella Lopez', '555-4321', 'None', 'None', 'Likes playing basketball.'),
('Ava', 'Rodriguez', '2005-06-14', 'Female', '789 Maple Blvd', 'Largetown', 'CA', '56789', '555-2345', 'ava.rodriguez@example.com', 10, 3.5, 'Juan Rodriguez', '555-5432', 'Mia Rodriguez', '555-8765', 'None', 'None', 'Enjoys swimming.'),
('William', 'Gonzalez', '2006-09-05', 'Male', '678 Cedar St', 'Othertown', 'TX', '67890', '555-3456', 'william.gonzalez@example.com', 9, 3.2, 'Pedro Gonzalez', '555-9876', 'Luisa Gonzalez', '555-2345', 'None', 'Shellfish', 'Plays piano in school band.'),
('Isabella', 'Perez', '2005-12-30', 'Female', '890 Pine Ln', 'Smalltown', 'FL', '76543', '555-6789', 'isabella.perez@example.com', 10, 3.6, 'Antonio Perez', '555-8765', 'Sofia Perez', '555-5432', 'None', 'Dairy', 'Enjoys reading mystery books.'),
('James', 'Torres', '2006-02-28', 'Male', '123 Elm Blvd', 'Bigtown', 'NY', '98765', '555-4567', 'james.torres@example.com', 9, 3.0, 'Gabriel Torres', '555-2345', 'Maria Torres', '555-8765', 'None', 'Peanuts', 'Enjoys playing video games.'),
('Benjamin', 'Gomez', '2005-05-10', 'Male', '234 Cedar Ave', 'Sometown', 'CA', '23456', '555-7890', 'benjamin.gomez@example.com', 10, 3.4, 'Raul Gomez', '555-5678', 'Carolina Gomez', '555-9876', 'None', 'None', 'Likes playing baseball.'),
('Sophie', 'Hernandez', '2006-08-20', 'Female', '345 Oak St', 'Othertown', 'TX', '87654', '555-6789', 'sophie.hernandez@example.com', 9, 3.2, 'Diego Hernandez', '555-4321', 'Valeria Hernandez', '555-9876', 'None', 'None', 'Enjoys ballet.');
 

INSERT INTO Teachers (FirstName, LastName, DateOfBirth, Gender, Address, City, State, ZipCode, PhoneNumber, Email, SubjectTaught, YearsOfExperience, EducationLevel, OfficeLocation, OfficeHours, ClassesCurrentlyTeaching, ProfessionalDevelopmentCompleted, SpecialCertifications, Notes)
VALUES ('Michael', 'Clark', '1978-06-12', 'Male', '123 Elm St', 'Anytown', 'CA', '12345', '555-1234', 'michael.clark@example.com', 'Mathematics', 12, 'Bachelor\'s Degree', 'Room 101', 'MWF 9am-12pm', 'Algebra 1, Geometry', 'Completed advanced courses in educational technology', 'Certified in Advanced Mathematics Teaching', 'Enjoys coaching the math club.'),

 ('Jennifer', 'Smith', '1985-03-25', 'Female', '456 Oak Ave', 'Othertown', 'NY', '54321', '555-4321', 'jennifer.smith@example.com', 'English', 10, 'Master\'s Degree', 'Room 102', 'TTh 10am-1pm', 'English Literature, Writing Composition', 'Attended workshops on differentiated instruction', 'Certified in Teaching English as a Second Language', 'Passionate about Shakespeare.'),

 ('David', 'Brown', '1982-09-15', 'Male', '789 Pine Blvd', 'Smalltown', 'TX', '67890', '555-8765', 'david.brown@example.com', 'Science', 15, 'Master\'s Degree', 'Room 103', 'MWF 8am-11am', 'Biology, Chemistry', 'Attended national conferences on STEM education', 'Certified in Biology Education', 'Enjoys conducting science experiments.'),

 ('Emily', 'Garcia', '1980-12-20', 'Female', '890 Maple St', 'Bigtown', 'FL', '98765', '555-2345', 'emily.garcia@example.com', 'History', 14, 'Master\'s Degree', 'Room 104', 'MWF 10am-1pm', 'World History, US History', 'Participated in local historical society events', 'Certified in Social Studies Education', 'Passionate about ancient civilizations.'),
 ('Jessica', 'Martinez', '1975-07-08', 'Female', '234 Cedar Ln', 'Largetown', 'WA', '23456', '555-6789', 'jessica.martinez@example.com', 'Art', 11, 'Bachelor\'s Degree', 'Art Studio', 'TTh 9am-12pm', 'Drawing, Painting', 'Completed art workshops in watercolor techniques', 'Certified in Art Education', 'Enjoys showcasing student artwork.'),
 ('Daniel', 'Rodriguez', '1983-04-30', 'Male', '567 Pine Blvd', 'Smalltown', 'CA', '87654', '555-5678', 'daniel.rodriguez@example.com', 'Physical Education', 13, 'Bachelor\'s Degree', 'Gymnasium', 'MWF 1pm-4pm', 'Physical Education, Health', 'Organized school-wide fitness challenges', 'Certified in Physical Education', 'Enjoys coaching soccer.'),
 ('Sarah', 'Lopez', '1981-11-10', 'Female', '678 Oak Ave', 'Othertown', 'NY', '76543', '555-8765', 'sarah.lopez@example.com', 'Music', 12, 'Master\'s Degree', 'Music Room', 'TTh 11am-2pm', 'Choir, Band', 'Directed school musical productions', 'Certified in Music Education', 'Enjoys playing the piano.'),
 ('Andrew', 'Torres', '1979-05-25', 'Male', '789 Cedar St', 'Bigtown', 'FL', '34567', '555-3456', 'andrew.torres@example.com', 'Computer Science', 9, 'Bachelor\'s Degree', 'Computer Lab', 'MWF 2pm-5pm', 'Computer Programming, Web Development', 'Developed coding club for students', 'Certified in Computer Science Education', 'Enjoys coding competitions.'),
 ('Sophia', 'Sanchez', '1984-08-15', 'Female', '890 Elm Blvd', 'Smalltown', 'TX', '45678', '555-7890', 'sophia.sanchez@example.com', 'Foreign Language', 10, 'Master\'s Degree', 'Room 105', 'TTh 2pm-5pm', 'Spanish, French', 'Studied abroad for language immersion', 'Certified in Foreign Language Education', 'Enjoys cultural exchanges.'),
 ('Matthew', 'Gomez', '1982-12-30', 'Male', '123 Maple Ave', 'Largetown', 'WA', '56789', '555-4567', 'matthew.gomez@example.com', 'Physics', 11, 'Master\'s Degree', 'Room 106', 'MWF 11am-2pm', 'Physics, Astronomy', 'Published articles in scientific journals', 'Certified in Physics Education', 'Enjoys stargazing with students.');



CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Department VARCHAR(100),
    Position VARCHAR(100),
    HireDate DATE,
    SupervisorName VARCHAR(100),
    SupervisorPhone VARCHAR(20),
    OfficeLocation VARCHAR(100),
    WorkSchedule VARCHAR(100),
    EmergencyContactName VARCHAR(100),
    EmergencyContactPhone VARCHAR(20),
    Notes TEXT
);



INSERT INTO Staff (FirstName, LastName, DateOfBirth, Gender, Address, City, State, ZipCode, PhoneNumber, Email, Department, Position, HireDate, SupervisorName, SupervisorPhone, OfficeLocation, WorkSchedule, EmergencyContactName, EmergencyContactPhone, Notes)
VALUES ('Emily', 'Johnson', '1988-04-10', 'Female', '123 Elm St', 'Anytown', 'CA', '12345', '555-1234', 'emily.johnson@example.com', 'Administration', 'Administrative Assistant', '2010-05-15', 'Michael Brown', '555-2345', 'Admin Office', 'Monday-Friday 8am-5pm', 'David Johnson', '555-5432', 'Handles office logistics.'),
('Daniel', 'Williams', '1985-07-20', 'Male', '456 Oak Ave', 'Othertown', 'NY', '54321', '555-4321', 'daniel.williams@example.com', 'Facilities', 'Facility Manager', '2008-08-10', 'Sarah Miller', '555-9876', 'Maintenance Building', 'Monday-Saturday 7am-4pm', 'Sarah Williams', '555-8765', 'Oversees building maintenance.'),
('Jessica', 'Martinez', '1990-06-15', 'Female', '789 Pine Blvd', 'Smalltown', 'TX', '67890', '555-8765', 'jessica.martinez@example.com', 'Human Resources', 'HR Coordinator', '2012-09-20', 'Andrew Brown', '555-2345', 'HR Office', 'Monday-Friday 9am-6pm', 'Maria Martinez', '555-5432', 'Manages employee benefits.'),
('Matthew', 'Garcia', '1983-10-25', 'Male', '890 Maple St', 'Bigtown', 'FL', '98765', '555-2345', 'matthew.garcia@example.com', 'IT', 'IT Specialist', '2007-12-05', 'David White', '555-8765', 'IT Department', 'Monday-Friday 8am-5pm', 'Sophia Garcia', '555-7890', 'Provides tech support.'),
('Sophia', 'Rodriguez', '1987-02-18', 'Female', '234 Cedar Ln', 'Largetown', 'WA', '23456', '555-6789', 'sophia.rodriguez@example.com', 'Finance', 'Financial Analyst', '2009-03-10', 'Emma Davis', '555-5432', 'Finance Office', 'Monday-Friday 9am-6pm', 'Juan Rodriguez', '555-4567', 'Prepares financial reports.'),
('Andrew', 'Sanchez', '1989-08-30', 'Male', '567 Pine Blvd', 'Smalltown', 'CA', '87654', '555-5678', 'andrew.sanchez@example.com', 'Cafeteria', 'Cafeteria Manager', '2011-04-15', 'Jessica Green', '555-9876', 'Cafeteria Building', 'Monday-Friday 6am-3pm', 'Luisa Sanchez', '555-2345', 'Oversees meal services.'),
('Olivia', 'Lopez', '1991-11-15', 'Female', '678 Oak Ave', 'Othertown', 'NY', '76543', '555-8765', 'olivia.lopez@example.com', 'Admissions', 'Admissions Officer', '2013-06-20', 'Sophia Brown', '555-2345', 'Admissions Office', 'Monday-Friday 9am-6pm', 'Carlos Lopez', '555-7890', 'Processes student applications.'),
('Isabella', 'Gomez', '1986-05-20', 'Female', '789 Cedar St', 'Bigtown', 'FL', '34567', '555-3456', 'isabella.gomez@example.com', 'Library', 'Librarian', '2010-08-15', 'Daniel Martinez', '555-6789', 'Library Building', 'Tuesday-Saturday 10am-7pm', 'Raul Gomez', '555-9876', 'Manages book acquisitions.'),
('James', 'Torres', '1990-03-12', 'Male', '890 Elm Blvd', 'Smalltown', 'TX', '45678', '555-7890', 'james.torres@example.com', 'Security', 'Security Officer', '2012-10-20', 'Benjamin Green', '555-5432', 'Security Office', 'Monday-Sunday 24/7', 'Maria Torres', '555-2345', 'Ensures campus safety.'),
('Benjamin', 'Diaz', '1987-09-05', 'Male', '123 Maple Ave', 'Largetown', 'WA', '56789', '555-4567', 'benjamin.diaz@example.com', 'Maintenance', 'Maintenance Technician', '2008-11-15', 'Matthew Brown', '555-8765', 'Maintenance Building', 'Monday-Friday 8am-5pm', 'Carolina Diaz', '555-9876', 'Handles building repairs.');







select * from students ;

select * from teachers ;

select * from staff ;


select * from students 
union
select * from teachers ;


-- Example 1: UNION

-- The UNION operation will combine the results from Students, Teachers, and Staff tables, removing any duplicate rows.




SELECT FirstName, LastName, 'Student' AS Type FROM Students
UNION
SELECT FirstName, LastName, 'Teacher' AS Type FROM Teachers
UNION
SELECT FirstName, LastName, 'Staff' AS Type FROM Staff;


-- In this example, UNION will merge the results of Students, Teachers, and Staff tables while ensuring duplicates are removed based on the entire row.

-- Example 2: UNION ALL

-- The UNION ALL operation will combine the results from Students, Teachers, and Staff tables, including all rows, even if there are duplicates.


SELECT FirstName, LastName, 'Student' AS Type FROM Students
UNION ALL
SELECT FirstName, LastName, 'Teacher' AS Type FROM Teachers
UNION ALL
SELECT FirstName, LastName, 'Staff' AS Type FROM Staff;


-- Example 1: Union of Contact Information

-- Suppose you need to create a unified contact list from Students, Teachers, and Staff tables, including names, email addresses, and phone numbers. Here's how you might use UNION ALL to achieve this:


SELECT FirstName, LastName, Email, PhoneNumber, 'Student' AS `Type` FROM Students
UNION ALL
SELECT FirstName, LastName, Email, PhoneNumber, 'Teacher' AS `Type` FROM Teachers
UNION ALL
SELECT FirstName, LastName, Email, PhoneNumber, 'Staff' AS `Type` FROM Staff;



-- In this scenario:

-- Example 2: Union of Educational Background

-- Suppose you need to generate a report on the educational background of all individuals associated with your educational institution. Here's how UNION can be used to create a distinct list:


SELECT FirstName, LastName, 'Student' AS `role`, GradeLevel, GPA FROM Students
UNION
SELECT FirstName, LastName, 'Teacher' AS `Role`, SubjectTaught, YearsOfExperience FROM Teachers
UNION
SELECT FirstName, LastName, 'Staff' AS `Role`, Department, Position FROM Staff;



-- Complex Example: Generating a Comprehensive Report
-- Suppose you need to generate a comprehensive report that includes information about individuals associated with an educational institution. This report will include details such as contact information, roles, departments, and specific attributes relevant to each group (students, teachers, and staff).


-- Comprehensive report combining Students, Teachers, and Staff information



SELECT 
FirstName, LastName, DateOfBirth, Gender, Address, City, State, ZipCode, PhoneNumber, Email,
    'Student' AS `Role`,
    GradeLevel AS RoleDetail,
    GPA AS AdditionalAttribute,
    NULL AS YearsOfExperience,
    NULL AS SubjectOrDepartment,
    ParentGuardianName AS ExtraInfo1,
    ParentGuardianPhone AS ExtraInfo2,
    EmergencyContactName AS ExtraInfo3,
    EmergencyContactPhone AS ExtraInfo4,
    Notes
FROM Students

UNION ALL

SELECT 
    FirstName,
    LastName,
    DateOfBirth,
    Gender,
    Address,
    City,
    State,
    ZipCode,
    PhoneNumber,
    Email,
    'Teacher' AS Role,
    NULL AS RoleDetail,
    NULL AS AdditionalAttribute,
    YearsOfExperience,
    SubjectTaught,
    NULL AS ExtraInfo1,
    NULL AS ExtraInfo2,
    NULL AS ExtraInfo3,
    NULL AS ExtraInfo4,
    Notes
FROM Teachers

UNION ALL

SELECT 
    FirstName,
    LastName,
    DateOfBirth,
    Gender,
    Address,
    City,
    State,
    ZipCode,
    PhoneNumber,
    Email,
    'Staff' AS Role,
    NULL AS RoleDetail,
    NULL AS AdditionalAttribute,
    NULL AS YearsOfExperience,
    Department AS SubjectOrDepartment,
    NULL AS ExtraInfo1,
    NULL AS ExtraInfo2,
    NULL AS ExtraInfo3,
    NULL AS ExtraInfo4,
    Notes
FROM Staff;



-- Explanation:
-- In this example:

-- Each SELECT statement retrieves specific columns from the Students, Teachers, and Staff tables.
-- The UNION ALL operator combines the results of these SELECT statements into a single result set, preserving all rows (including duplicates).
-- The Role column distinguishes whether the record belongs to a student, teacher, or staff member.
-- Depending on the role (Student, Teacher, or Staff), relevant columns are populated with specific attributes:
-- For students: GradeLevel, GPA, ParentGuardianName, ParentGuardianPhone, EmergencyContactName, EmergencyContactPhone.
-- For teachers: YearsOfExperience, SubjectTaught.
-- For staff: Department (which can be treated as either a subject or department depending on the staff role).




-- Comprehensive report with clauses combining Students, Teachers, and Staff information
SELECT 
    FirstName,
    LastName,
    DateOfBirth,
    Gender,
    Address,
    City,
    State,
    ZipCode,
    PhoneNumber,
    Email,
    'Student' AS Role,
    GradeLevel AS RoleDetail,
    GPA AS AdditionalAttribute,
    ParentGuardianName AS ExtraInfo1,
    ParentGuardianPhone AS ExtraInfo2,
    EmergencyContactName AS ExtraInfo3,
    EmergencyContactPhone AS ExtraInfo4,
    Notes
FROM Students
WHERE GradeLevel >= 10  -- Example WHERE clause for students

UNION ALL

SELECT 
    FirstName,
    LastName,
    DateOfBirth,
    Gender,
    Address,
    City,
    State,
    ZipCode,
    PhoneNumber,
    Email,
    'Teacher' AS Role,
    NULL AS RoleDetail,
    NULL AS AdditionalAttribute,
    NULL AS ExtraInfo1,
    NULL AS ExtraInfo2,
    NULL AS ExtraInfo3,
    NULL AS ExtraInfo4,
    Notes
FROM Teachers
WHERE YearsOfExperience >= 10  -- Example WHERE clause for teachers
ORDER BY FirstName  -- Example ORDER BY clause for teachers

UNION ALL

SELECT 
    FirstName,
    LastName,
    DateOfBirth,
    Gender,
    Address,
    City,
    State,
    ZipCode,
    PhoneNumber,
    Email,
    'Staff' AS Role,
    NULL AS RoleDetail,
    NULL AS AdditionalAttribute,
    NULL AS ExtraInfo1,
    NULL AS ExtraInfo2,
    NULL AS ExtraInfo3,
    NULL AS ExtraInfo4,
    Notes
FROM Staff
WHERE Department = 'IT'  -- Example WHERE clause for staff
LIMIT 10  -- Example LIMIT clause for staff


