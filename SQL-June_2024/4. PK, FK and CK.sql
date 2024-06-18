create database if not exists keyconst ;
use keyconst ;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    `name` VARCHAR(100),
    age INT,
    city VARCHAR(100));
    
INSERT INTO students (student_id, `name`, age, city) VALUES
(1, 'John Doe', 18, 'New York'),
(2, 'Jane Smith', 17, 'Los Angeles'),
(3, 'Michael Johnson', 19, 'Chicago'),
(4, 'Emily Davis', 18, 'Houston');

INSERT INTO students (student_id, `name`, age, city) VALUES
(1, 'John Doe', 18, 'New York') ;

INSERT INTO students (student_id, `name`, age, city) VALUES
(null, 'John Doe', 18, 'New York') ;


UPDATE students SET city = 'Boston' WHERE student_id = 1;

DELETE FROM students WHERE student_id = 3;



CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

INSERT INTO courses (course_id, course_name, instructor) VALUES
(105, 'Mathematics', 'Prof. Smith'),
(102, 'Science', 'Dr. Johnson'),
(103, 'History', 'Prof. Brown');


coursesstudentsALTER TABLE students
ADD COLUMN course_id INT,
ADD CONSTRAINT fk_course
    FOREIGN KEY (course_id)
    REFERENCES courses(course_id);
    
    
INSERT INTO students (student_id, `name`, age, city, course_id) VALUES
(6, 'John Doe', 18, 'New York', 102),
(5, 'Jane Smith', 17, 'Los Angeles', 102);    


UPDATE students SET course_id = 103 WHERE student_id = 1;

DELETE FROM courses WHERE course_id = 103; -- This will fail if students are referencing this course_id
   
DELETE FROM students WHERE course_id = 104;   
   
update students set course_id = 105 where student_id = 4 ;

DELETE FROM courses WHERE course_id = 104;  
   
select * from students ;  

select * from courses ;  


-- composit key

CREATE TABLE student_contacts (
    student_id INT,
    city VARCHAR(100),
    phone_number VARCHAR(20),
    PRIMARY KEY (student_id, city),
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);

INSERT INTO student_contacts (student_id, city, phone_number) VALUES
(7, 'Delhi_old', '555-1234'),
(2, 'Los Angeles', '555-5678'),
(3, 'Chicago', '555-9101');

-- Trying to insert duplicate composite key will fail:
INSERT INTO student_contacts (student_id, city, phone_number) VALUES (1, 'New York', '555-4321');


INSERT INTO student_contacts (student_id, city, phone_number) VALUES
(4, 'Houston', '555-1111'),
(4, 'Houston_1', '555-2222'); -- This will fail due to duplicate composite key

UPDATE student_contacts SET phone_number = '555-3333' WHERE student_id = 4 AND city = 'Houston';

DELETE FROM student_contacts WHERE student_id = 4 AND city = 'Houston';

select * from student_contacts ;

CREATE TABLE student1 (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    city VARCHAR(100)
);

INSERT INTO student1 (`name`, age, city) VALUES
('John Doe', 18, "mumbai"),
('Jane Smith', 17, 'Los Angeles'),
('Michael Johnson', 19, 'Chicago');

-- MySQL automatically assigns unique values to student_id

INSERT INTO student1 (`name`, age, city) VALUES ('Emily Davis', 18, 'Houston');

UPDATE student1 SET city = 'Boston' WHERE student_id = 1;

DELETE FROM student1 WHERE student_id = 3;

select * from student1 ;

### delete cascade

CREATE TABLE course1 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE student2 (
    student_id INT PRIMARY KEY,
    `name` VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
        ON DELETE CASCADE
);

INSERT INTO course1 (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'History');

INSERT INTO student2 (student_id, `name`, course_id) VALUES
(4, 'John Doe1', 103),
(2, 'Jane Smith', 102) ;

INSERT INTO student2 (student_id, `name`) VALUES
(5, 'John Doe1') ;

update student2 set course_id = 103 where student_id = 4 ;

-- Deleting a course will delete associated student records due to ON DELETE CASCADE
DELETE FROM course1 WHERE course_id = 102;



select * from course1 ;
select * from student2;













    
