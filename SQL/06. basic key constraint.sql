create database keyconst ;

use keyconst; 

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);


CREATE TABLE student_contacts (
    student_id INT,
    city VARCHAR(100),
    phone_number VARCHAR(20),
    c_id int,
    CONSTRAINT fk_student
        FOREIGN KEY (c_id)
        REFERENCES courses(course_id)
);


desc courses ;
describe student_contacts ;



INSERT INTO courses (course_id, course_name, instructor) VALUES
(101, 'Mathematics', 'Prof. Smith'),
(102, 'Science', 'Dr. Johnson'),
(103, 'History', 'Prof. Brown'),
(104, 'Chem', 'Prof. Smith'),
(105, 'Phy', 'Dr. Johnson'),
(106, 'Bio', 'Prof. Brown');

select * from courses ;


insert into student_contacts values 
(4, null, "8787755678", null) ;

select * from student_contacts ;

delete from courses 
where course_id = 104 ;

update courses
set course_id = 107 where course_id = 103 ;

delete from student_contacts
where student_id = 3 ;
