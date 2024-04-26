use amit ; 

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO books (book_id, title, author, genre, price)
VALUES
    (1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 15.99),
    (2, '1984', 'George Orwell', 'Fiction', 12.49),
    (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 10.99),
    (4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 9.99),
    (5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 11.99);

select * from books ;


SELECT title, price,
CASE
WHEN price < 10 THEN 'Low Price'
WHEN price >= 10 AND price <= 20 THEN 'Medium Price'
ELSE 'High Price'
END AS price_category
 FROM
    books;
    
    
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    `name` VARCHAR(100),
    age INT
);

INSERT INTO customers (customer_id, `name`, age)
VALUES
    (1, 'John Doe', 25),
    (2, 'Jane Smith', 40),
    (3, 'Alice Johnson', 60);    
    
    
SELECT `name`,  age,
    CASE
        WHEN age BETWEEN 13 AND 19 THEN 'Teenager'
        WHEN age BETWEEN 20 AND 35 THEN 'Young Adult'
        WHEN age BETWEEN 36 AND 55 THEN 'Adult'
        ELSE 'Senior Citizen'
    END AS age_group
FROM
    customers;
    
    
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(10, 2),
    actual_spending DECIMAL(10, 2),
    completion_date DATE
);

INSERT INTO projects (project_id, project_name, budget, actual_spending, completion_date)
VALUES
    (1, 'Website Redesign', 5000.00, 4000.00, '2024-05-15'),
    (2, 'Product Launch', 10000.00, 8500.00, '2024-06-30'),
    (3, 'Marketing Campaign', 8000.00, 7500.00, '2024-07-20'),
    (4, 'Infrastructure Upgrade', 15000.00, 12000.00, '2024-08-10');
    
    
select * from projects ;    


SELECT project_name, budget, actual_spending, completion_date,
    CASE
        WHEN actual_spending >= budget THEN 'On Track'
        WHEN actual_spending < budget * 0.9 THEN 'Delayed'
        ELSE 'At Risk'
    END AS progress_status
FROM
    projects;
    
    
SELECT project_name, budget, completion_date,
    CASE
        WHEN actual_spending >= budget THEN 'On Track'
        WHEN actual_spending < budget * 0.9 THEN 'Delayed'
        ELSE 'At Risk'
    END AS progress_status
FROM
    projects;    
    

CREATE TABLE website_users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    last_login_date DATE
);

INSERT INTO website_users (user_id, username, last_login_date)
VALUES
    (101, 'john_doe', '2024-04-20'),
    (102, 'jane_smith', '2024-04-22'),
    (103, 'alice_johnson', NULL),
    (104, 'michael_brown', '2024-04-24');  
    
    
select * from website_users ;    
    
    
DELETE FROM website_users
WHERE
    CASE
        WHEN last_login_date IS NULL THEN 1 								 -- Delete users who never logged in
        WHEN last_login_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY) THEN 1   -- Delete users inactive for 30 days
        ELSE 0 -- Keep active users
    END = 1;  
    
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2)
);

INSERT INTO products (product_id, product_name, category, price, discount)
VALUES
    (1, 'Laptop', 'Electronics', 1200.00, NULL),
    (2, 'T-Shirt', 'Clothing', 25.00, NULL),
    (3, 'Book', 'Books', 15.00, NULL),
    (4, 'Headphones', 'Electronics', 100.00, NULL);  
    
select * from products ;


UPDATE products
SET
    discount = 
    CASE
        WHEN category = 'Electronics' THEN 0.1 -- 10% discount for electronics
        WHEN category = 'Clothing' THEN 0.05 -- 5% discount for clothing
        ELSE 0 -- No discount for other categories
    END
WHERE
    discount IS NULL;
    
    
CREATE TABLE customer_purchases (
    customer_id INT PRIMARY KEY,
    total_purchases DECIMAL(10, 2),
    average_purchase DECIMAL(10, 2)
);

INSERT INTO customer_purchases (customer_id, total_purchases, average_purchase)
VALUES
    (1, 1500.00, 100.00),
    (2, 500.00, 50.00),
    (3, 3000.00, 200.00),
    (4, 800.00, 80.00);    
    
select * from customer_purchases ; 
    
SELECT
    customer_id,
    total_purchases,
    average_purchase,
    CASE
        WHEN total_purchases > 2000 AND average_purchase > 150 THEN 'High Value Customer'
        WHEN total_purchases > 1000 AND average_purchase > 100 THEN 'Medium-High Value Customer'
        WHEN total_purchases > 500 AND average_purchase > 50 THEN 'Medium-Low Value Customer'
        ELSE 'Low Value Customer'
    END AS customer_segment
FROM
    customer_purchases;    
    
    
CREATE TABLE employee_performance (
    employee_id INT PRIMARY KEY,
    sales_amount DECIMAL(10, 2),
    customer_satisfaction_score INT,
    projects_completed INT
);

INSERT INTO employee_performance (employee_id, sales_amount, customer_satisfaction_score, projects_completed)
VALUES
    (1, 15000.00, 4, 8),
    (2, 8000.00, 3, 6),
    (3, 25000.00, 5, 10),
    (4, 10000.00, 2, 4);   
    
    
SELECT
    employee_id,
    sales_amount,
    customer_satisfaction_score,
    projects_completed,
    CASE
        WHEN sales_amount >= 20000 AND customer_satisfaction_score >= 4 AND projects_completed >= 8 THEN 'Outstanding Performer'
        WHEN sales_amount >= 15000 AND customer_satisfaction_score >= 3 AND projects_completed >= 6 THEN 'High Performer'
        WHEN sales_amount >= 10000 AND customer_satisfaction_score >= 2 AND projects_completed >= 4 THEN 'Satisfactory Performer'
        ELSE 'Needs Improvement'
    END AS performance_evaluation
FROM
    employee_performance;
    
    
CREATE TABLE products1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

select * from products1 ;

INSERT INTO products1 (product_id, product_name, category, price)
VALUES
    (3, 'Laptop', 'Electronics', 
        CASE 
            WHEN category = 'Electronics' THEN 1200.00
            WHEN category= 'Clothing' THEN 50.00
            ELSE 0.00
        END),
	(2, 'T-Shirt', 'Clothing', 
        CASE 
            WHEN category ='Electronics' THEN 100.00
            WHEN category= 'Clothing' THEN 25.00
            ELSE 0.00
        END),
        
    (3, 'Book', 'Books', 
        CASE 
            WHEN 'Electronics' THEN 15.00
            WHEN 'Clothing' THEN 30.00
            ELSE 0.00
        END);    
    
    
    
    
-- Trigger
-- Procedure and Views
-- constraint
-- Case
-- REGEXP
-- Windows Function 
-- Sub Queries
-- Basic Queries (Clauses, modify, definintion)
-- Join & Union 
    
    
    
    
    
    
    
