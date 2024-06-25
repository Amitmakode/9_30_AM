create database indexx ;

use indexx ;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_department VARCHAR(100),
    emp_salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, emp_department, emp_salary) VALUES
(1, 'John Doe', 'Sales', 55000.00),
(2, 'Jane Smith', 'Marketing', 60000.00),
(3, 'Michael Johnson', 'IT', 65000.00),
(4, 'Emily Davis', 'HR', 50000.00),
(5, 'David Brown', 'Finance', 70000.00),
(6, 'Jessica Wilson', 'Sales', 58000.00),
(7, 'Daniel Martinez', 'IT', 62000.00),
(8, 'Sarah Taylor', 'Marketing', 59000.00),
(9, 'Kevin Anderson', 'Finance', 68000.00),
(10, 'Rachel Garcia', 'HR', 51000.00);

select * from employees ;

CREATE INDEX idx_emp_name ON employees(emp_name);

show index from employees ;

SELECT * FROM employees WHERE emp_name = 'John Doe';

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);


INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-06-24', 150.75),
(2, 102, '2024-06-23', 230.50),
(3, 103, '2024-06-22', 75.25),
(4, 104, '2024-06-21', 420.00),
(5, 105, '2024-06-20', 320.75),
(6, 106, '2024-06-19', 150.00),
(7, 107, '2024-06-18', 200.50),
(8, 108, '2024-06-17', 180.25),
(9, 109, '2024-06-16', 90.80),
(10, 110, '2024-06-15', 500.00);


CREATE INDEX idx_customer_order_date ON orders(customer_id, order_date);


SELECT * FROM orders WHERE customer_id = 103 AND order_date = '2024-06-23';


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100),
    registration_date DATE
);


INSERT INTO users (user_id, username, email, registration_date) VALUES
(1, 'john_doe', 'john.doe@example.com', '2023-01-15'),
(2, 'jane_smith', 'jane.smith@example.com', '2023-02-20'),
(3, 'michael_johnson', 'michael.johnson@example.com', '2023-03-10'),
(4, 'emily_davis', 'emily.davis@example.com', '2023-04-05'),
(5, 'david_brown', 'david.brown@example.com', '2023-05-12'),
(6, 'jessica_wilson', 'jessica.wilson@example.com', '2023-06-18'),
(7, 'daniel_martinez', 'daniel.martinez@example.com', '2023-07-22'),
(8, 'sarah_taylor', 'sarah.taylor@example.com', '2023-08-09'),
(9, 'kevin_anderson', 'kevin.anderson@example.com', '2023-09-14'),
(10, 'rachel_garcia', 'rachel.garcia@example.com', '2023-10-30');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    stock_quantity INT
);


INSERT INTO products (product_id, product_name, category_id, price, stock_quantity) VALUES
(1, 'Laptop', 1, 1200.00, 50),
(2, 'Smartphone', 1, 800.00, 100),
(3, 'Tablet', 1, 500.00, 75),
(4, 'Headphones', 2, 150.00, 200),
(5, 'Keyboard', 2, 80.00, 150),
(6, 'Mouse', 2, 30.00, 300),
(7, 'Printer', 3, 250.00, 50),
(8, 'Scanner', 3, 200.00, 30),
(9, 'External Hard Drive', 3, 120.00, 100),
(10, 'Monitor', 4, 300.00, 80);



CREATE TABLE order1 (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    `status` VARCHAR(20)
);



INSERT INTO order1 (order_id, user_id, order_date, total_amount, status) VALUES
(1, 101, '2024-06-24', 150.75, 'Pending'),
(2, 102, '2024-06-23', 230.50, 'Completed'),
(3, 103, '2024-06-22', 75.25, 'Pending'),
(4, 104, '2024-06-21', 420.00, 'Shipped'),
(5, 105, '2024-06-20', 320.75, 'Completed'),
(6, 106, '2024-06-19', 150.00, 'Pending'),
(7, 107, '2024-06-18', 200.50, 'Shipped'),
(8, 108, '2024-06-17', 180.25, 'Completed'),
(9, 109, '2024-06-16', 90.80, 'Pending'),
(10, 110, '2024-06-15', 500.00, 'Completed');



CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2)
);


INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 2, 600.00),
(2, 1, 2, 1, 800.00),
(3, 2, 3, 3, 150.00),
(4, 3, 4, 1, 150.00),
(5, 3, 5, 2, 80.00),
(6, 4, 6, 1, 30.00),
(7, 5, 7, 1, 250.00),
(8, 6, 8, 2, 200.00),
(9, 7, 9, 1, 120.00),
(10, 7, 10, 1, 300.00);


CREATE INDEX idx_orders_user_id ON order1 (user_id);


CREATE INDEX idx_products_category_id ON products(category_id);


CREATE INDEX idx_orders_order_date ON order1(order_date);


CREATE INDEX idx_order_details_order_product ON order_details(order_id, product_id);


---------------------------------------------------------------------------------------

show index from order1 ;

create table if not exists course (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id)
) ;

show index from course ;


create table if not exists course2 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id, course_name)
) ;


show index from course2 ;

create table if not exists course4 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_desc,course_name,course_tag)
) ;

show index from course4 ;

insert into course4 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
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


EXPLAIN ANALYZE select * from course4 where  course_id = 106 or course_name = 'fsds' ;

explain select * from course4 where  course_id = 106 ;

explain select * from course4 where  course_name = 'fsds' ;


analyze table course4 ;

describe course4 ;



In SQL, indexing refers to the ability to create indexes on tables to speed up query performance. 
There are several types of indexes available, and the choice of index depends on the database management system (DBMS) 
being used (e.g., MySQL, PostgreSQL, SQL Server, etc.). Here are some common types of indexes:

1. Single-Column Index: This index is created on a single column of a table.

2. Composite Index: Also known as a multi-column index, this index is created on multiple columns of a table.

3. Unique Index: Ensures that the indexed columns do not contain duplicate values.

4. Clustered Index: Defines the order in which data is physically stored in a table. 
There can only be one clustered index per table because it dictates the physical order of the rows.

5. Non-Clustered Index: A separate structure from the actual data rows, storing a sorted list of references to the table's rows. 
Multiple non-clustered indexes can be created on a single table.

6. Full-Text Index: Designed for efficient full-text searches on large text data.

7. Spatial Index: Optimized for queries that perform operations on spatial data types.

The number of indexes you can create on a table depends on the DBMS and its specific limitations, which can vary widely:

MySQL: Up to 64 indexes per table (including primary key and unique indexes).
PostgreSQL: No hard limit, but practical performance considerations apply.
SQL Server: Up to 999 non-clustered indexes and 1 clustered index per table.
Oracle: Up to 32 columns in a composite index, and no hard limit on the number of indexes.
These limits are often generous and designed to accommodate complex querying needs while maintaining performance.
However, excessive indexing can also degrade performance due to increased maintenance overhead and storage requirements. 
Therefore, it's essential to create indexes based on the specific queries and workload patterns of your application to achieve optimal performance.


show tables from class10 ;

create index first_index on class10.class(rollnum) ;

CREATE INDEX idx_orders_user_id ON order1 (user_id);


show index from class10.class ;

describe class10.class ;

