use class9 ;

-- constraint 

Not Null
default
check
primary key 
foreign key
unique
Enum
Index
Auto_increment 


create table student 
(Rollno int Auto_increment primary key,
`name` varchar(20) not null default "Unknown",
address varchar(30) not null default "Nagpur",
Marks int not null check(marks > 40),
email varchar(20) unique,
class enum("A", "B", "C", "D") default "D"
) ;

insert into student (rollno, `name`, address, marks, email, class) 
value (2, "avantika", "Pune", 55, "avntika1@gmail.com", "C") ;

insert into student (rollno, marks, email, class) 
value (3, 45, "avntika2@gmail.com", null) ;

insert into student (rollno, marks) 
value (50, 44) ;

insert into student (`name`, marks) 
value (null , 33) ;

select * from student ;

desc student ;


update student
set email = "abc@gmail.com" where rollno = 6 ;

delete from student 
where rollno = 4 ;

update student
set rollno = 5 where class is null ;

alter table student
modify column marks int ;

alter table student
modify column `name` varchar(20) ;

alter table student
modify column class varchar(20) ;



SELECT constraint_name
FROM information_schema.table_constraints
WHERE table_name = 'student' AND constraint_type = 'CHECK';


ALTER TABLE student
DROP CONSTRAINT marks_check;

ALTER TABLE student
MODIFY COLUMN marks INT constraint check_mark check(marks >= 40);

ALTER TABLE student
DROP CONSTRAINT check_mark;

ALTER TABLE student
DROP CONSTRAINT student_chk_1;