create database DDL ;

use ddl ;

create table student (ID int, `name` varchar(20)) ;  

create table if not exists student (ID int, `name` varchar(20)) ;  

insert into student values (1, "Shubham1"), (2, "Shubham"), (3, "Shubham"), (4, "Shubham");

alter table student
add column roll_no int first ;

update student
set roll_no = 101 where id = 1 ;

update student
set roll_no = 102, id = 5 where `name` = "shubham1" ;

alter table student
add column address varchar(30) ;

update student
set address = "nagpur" ;

alter table student
add column dob char(20) after id ;

update student
set dob = "2000-12-10" ;


alter table student 
modify column dob date ;

alter table student 
rename column `name` to full_name ;

delete from student
where id = 2 and 3 ;

delete from student
where id in (1, 4) ;

delete from student
where address = "nagpur" ;

update student
set address = null ;

alter table student
drop column roll_no ;

rename table student to `STD` ;

truncate table std ;

insert into std (id, full_name) values 
(1, "Shubham1"), (2, "Shubham"), (3, "Shubham"), (4, "Shubham");

ALTER TABLE std 
MODIFY COLUMN full_name VARCHAR(255) COMMENT 'std name';

select * from std ;

SHOW FULL COLUMNS FROM std;



desc std ;


Here are some practice questions based on DDL (Data Definition Language) and DML (Data Manipulation Language) commands in MySQL:

### DDL (Data Definition Language) Commands:

1. **Create a Table:**
   Write the SQL command to create a table named `employees` with the following columns:
   - `id` (INT, primary key, auto-increment)
   - `first_name` (VARCHAR(50))
   - `last_name` (VARCHAR(50))
   - `email` (VARCHAR(100), unique)
   - `hire_date` (DATE)
   - `salary` (DECIMAL(10, 2))

2. **Alter a Table:**
   - Write an SQL command to add a new column `phone_number` (VARCHAR(15)) to the `employees` table.
   - Write an SQL command to modify the `salary` column to have a precision of `DECIMAL(12, 2)` instead of `DECIMAL(10, 2)`.

3. **Drop a Table:**
   Write an SQL command to drop the `employees` table if it exists.

4. **Create an Index:**
   Write an SQL command to create an index named `idx_email` on the `email` column of the `employees` table.

5. **Rename a Table:**
   Write an SQL command to rename the `employees` table to `staff`.

### DML (Data Manipulation Language) Commands:

6. **Insert Data:**
   Write an SQL command to insert a new record into the `employees` table with the following values:
   - `first_name`: 'John'
   - `last_name`: 'Doe'
   - `email`: 'john.doe@example.com'
   - `hire_date`: '2024-12-09'
   - `salary`: 50000.00

7. **Update Data:**
   Write an SQL command to update the `salary` of the employee with `id = 1` to `60000.00`.

8. **Delete Data:**
   Write an SQL command to delete the record of the employee with `id = 5` from the `employees` table.

9. **Select Data:**
   Write an SQL command to select all records from the `employees` table, sorting them by `hire_date` in descending order.

10. **Select Specific Columns:**
   Write an SQL command to select only the `first_name`, `last_name`, and `salary` columns from the `employees` table where `salary` is greater than `45000.00`.

---

### Bonus (Mix of DDL and DML):

11. **Create a Table with Foreign Key:**
    Write an SQL command to create two tables:
    - `departments` with columns `id` (INT, primary key), `department_name` (VARCHAR(100)).
    - `employees` with columns `id` (INT, primary key, auto-increment), `first_name` (VARCHAR(50)), `last_name` (VARCHAR(50)), `department_id` (INT, foreign key referencing `departments(id)`).

---

These questions cover a variety of tasks, including creating, modifying, and deleting tables, as well as manipulating data. You can try writing and running these queries in MySQL to improve your understanding of DDL and DML commands.
