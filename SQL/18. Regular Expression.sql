use bulk_load ;

CREATE TABLE employees1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO employees1 (first_name, last_name, email) VALUES
('John', 'Doe', 'jo.hn12.doe@exam.co.in'),
('Jane', 'Smith', 'jane.smith@example.co.in'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@exam.net'),
('John', 'Doe', 'john.23doe@example.gov.in'),
('Jane', 'Smith', 'jane.smith@example.org'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.net'),
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.org'),
('Alice', 'Johnson', 'alice.johnson@example.in'),
('Bob', 'Brown', 'bob.brown@example.net');


select * from employees1 ;

-- Find all employees whose email addresses end with .com:

select * from employees1 where email regexp ".com$" ;


-- 1. Find all employees whose email addresses contain "example":

select * from employees1 where email regexp "example" ;

-- 3. Find all employees whose email addresses have exactly 15 characters:

select * from employees1 where email regexp "^.{20}$" ;


-- 4. Find all employees whose email addresses start with "jane":

SELECT * FROM employees1
WHERE email REGEXP '^jane';


-- 1. Find Employees with Emails Containing Numbers

SELECT * FROM employees1 WHERE email REGEXP '[0-9]';

SELECT * FROM employees
WHERE email REGEXP '[0-9]';

-- 2. Find Employees with Emails Starting with a Vowel

SELECT * FROM employees1
WHERE email REGEXP '^[AEIOUaeiou]';


-- 3. Find Employees with Emails Ending in .org or .net

SELECT * FROM employees1
WHERE email REGEXP 'org$|net$';


SELECT * FROM employees1
WHERE email REGEXP '\\.(org|net)$';

-- \\. matches the dot

-- 4. Find Employees with Emails Having a Domain of Exactly 4 Characters

SELECT * FROM employees1
WHERE email like "%@____.%";

SELECT * FROM employees1
WHERE first_name like "%e";

SELECT * FROM employees1
WHERE last_name like "%s%";

SELECT * FROM employees1
WHERE last_name like "%hns%";

SELECT * FROM employees1
WHERE email REGEXP '@[a-zA-Z0-9]{4}\\.[a-zA-Z]{2,}$';


-- 5. Find Employees with Emails Where the Username Starts with 'a' or 'b'

SELECT * FROM employees1
WHERE email REGEXP '^[ab]';


SELECT * FROM employees1
WHERE email REGEXP '^a|^b';

-- 6. Find Employees with Emails Where the Username is 6 to 12 Characters Long

SELECT * FROM employees1
WHERE email REGEXP '^[a-zA-Z0-9]{4}\\.';


SELECT * FROM employees1
WHERE email REGEXP '^.{4}\\.';


SELECT REGEXP_INSTR('a b c d e f a', 'a', 1, 2, 0) AS a_index_2; 


-- 7. Find Employees with Emails Having More Than One Dot in the Domain

SELECT * FROM employees1
WHERE email REGEXP '@[a-zA-Z0-9]*\\.[a-zA-Z]*\\.[a-zA-Z]*';

SELECT * FROM employees1
WHERE email REGEXP '@[^.]*\\.[^.]*\\.[^.]*';

-- 4. Find Employees Whose Email Contains a Digit


SELECT * FROM employees
WHERE email LIKE '%[0-9]%';


-- 7. Find Employees Whose Email Contains Two Dots in the Domain

SELECT * FROM employees1
WHERE email LIKE '%.%.%@%.%.%';



