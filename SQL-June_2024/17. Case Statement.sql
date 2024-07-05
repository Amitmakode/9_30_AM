use practice ;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
);


INSERT INTO employees (employee_id, employee_name, salary, department)
VALUES
    (1, 'John Doe', 50000, 'HR'),
    (2, 'Jane Smith', 60000, 'IT'),
    (3, 'Michael Johnson', 55000, 'Finance'),
    (4, 'Emily Davis', 52000, 'IT'),
    (5, 'Chris Lee', 58000, 'HR');
    
    
select * from employees ;    

SELECT employee_name, salary,
    CASE
        WHEN salary < 55000 THEN 'Low'
        WHEN salary >= 55000 AND salary < 60000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM
    employees;
    
    
SELECT employee_name, department,
    CASE department
        WHEN 'HR' THEN 'Human Resources'
        WHEN 'IT' THEN 'Information Technology'
        WHEN 'Finance' THEN 'Finance Department'
        ELSE 'Other'
    END AS department_category
FROM
    employees;  
    
    
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Salary Not Specified'
        WHEN salary < 50000 THEN 'Low Salary'
        WHEN salary >= 50000 AND salary < 60000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_status
FROM
    employees;
    
------------------------------------------------------



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_amount NUMERIC(10, 2),
    customer_id INT
);



INSERT INTO orders (order_id, order_date, order_amount, customer_id)
VALUES
    (1, '2023-01-05', 150.75, 101),
    (2, '2023-02-10', 300.50, 102),
    (3, '2023-03-15', 75.25, 103),
    (4, '2023-04-20', 500.00, 104),
    (5, '2023-05-25', 250.00, 105),
    (6, '2023-06-30', 400.75, 101),
    (7, '2023-07-05', 100.00, 102),
    (8, '2023-08-10', 800.25, 103);
    
    
SELECT * ,
    CASE
        WHEN order_amount < 100 THEN 'Low Value'
        WHEN order_amount >= 100 AND order_amount < 500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS order_category
FROM
    orders;    
    
    
SELECT * ,
    CASE
        WHEN order_amount < 100 THEN 'Low Value'
        WHEN order_amount  between 100  AND 500 THEN 'Medium Value'
        ELSE 'High Value'
    END AS order_category
FROM
    orders;     
    
    
SELECT
    order_id,
    order_date,
    CASE
        WHEN MONTH(order_date) <= 3 THEN 'Q1'
        WHEN MONTH(order_date) > 3 AND MONTH(order_date) <= 6 THEN 'Q2'
        WHEN MONTH(order_date) > 6 AND MONTH(order_date) <= 9 THEN 'Q3'
        ELSE 'Q4'
    END AS quarter
FROM
    orders ;  
    
    
select week("2024-07-07") ;

select weekday("2024-07-07")  ;    

select weekofyear("2024-07-07") ;


SELECT
    order_id,
    order_date,
    CASE
        WHEN MONTH(order_date) <= 3 THEN 'Q1'
        WHEN MONTH(order_date) between  3 AND 6 THEN 'Q2'
        WHEN MONTH(order_date) > 6 AND MONTH(order_date) <= 9 THEN 'Q3'
        ELSE 'Q4'
    END AS quarter
FROM
    orders ;    
    
    
SELECT
    customer_id,
    COUNT(order_id) AS num_orders,
    CASE
        WHEN COUNT(order_id) = 1 THEN 'Single Order'
        WHEN COUNT(order_id) > 1 AND COUNT(order_id) <= 3 THEN 'Few Orders'
        ELSE 'Many Orders'
    END AS order_frequency
FROM
    orders
GROUP BY
    customer_id;   
    
------------------------------------------------------------------    
    
    
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price NUMERIC(10, 2)
);
    
    
INSERT INTO products (product_id, product_name, unit_price)
VALUES
    (1, 'T-shirt', 15.99),
    (2, 'Jeans', 49.99),
    (3, 'Shoes', 79.99),
    (4, 'Watch', 299.99),
    (5, 'Backpack', 39.99);   
    
    
select * from    products ; 


SELECT
    product_name,
    unit_price,
    CASE
        WHEN unit_price < 20 THEN 'Low Cost'
        WHEN unit_price >= 20 AND unit_price < 50 THEN 'Moderate Cost'
        WHEN unit_price >= 50 AND unit_price < 100 THEN 'Higher Cost'
        ELSE 'Expensive'
    END AS price_category
FROM
    products;
    
----------------------------------

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT
);



INSERT INTO patients (patient_id, patient_name, age)
VALUES
    (1, 'John Doe', 25),
    (2, 'Jane Smith', 45),
    (3, 'Michael Johnson', 60),
    (4, 'Emily Davis', 30),
    (5, 'Chris Lee', 50);
    
    
    
    
select * from patients ;    


    
SELECT
    patient_name,
    age,
    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age >= 18 AND age < 40 THEN 'Young Adult'
        WHEN age >= 40 AND age < 60 THEN 'Middle-aged Adult'
        ELSE 'Senior'
    END AS age_group
FROM
    patients;
    
    
------------------------------------------


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    transaction_amount NUMERIC(10, 2),
    transaction_type VARCHAR(50)
);


INSERT INTO transactions (transaction_id, transaction_date, transaction_amount, transaction_type)
VALUES
    (1, '2023-01-15', 100.00, 'Deposit'),
    (2, '2023-02-20', -50.00, 'Withdrawal'),
    (3, '2023-03-25', 2000.00, 'Transfer'),
    (4, '2023-04-30', -150.00, 'Withdrawal'),
    (5, '2023-05-05', 500.00, 'Deposit');
    
    
SELECT
    transaction_id,
    transaction_date,
    transaction_amount,
    CASE
        WHEN transaction_amount > 0 THEN 'Income'
        WHEN transaction_amount < 0 THEN 'Expense'
        ELSE 'Unknown'
    END AS transaction_category
FROM
    transactions;    
    
    
    
------------------------------------------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);



INSERT INTO customers (customer_id, customer_name, email)
VALUES
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'jane.smith@example.com'),
    (3, 'Michael Johnson', 'michael.johnson@example.com'),
    (4, 'Emily Davis', 'emily.davis@example.com'),
    (5, 'Chris Lee', 'chris.lee@example.com');
    
    
    
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_spent,
    CASE
        WHEN SUM(o.order_amount) >= 1000 THEN 'High-Value Customer'
        WHEN SUM(o.order_amount) >= 500 AND SUM(o.order_amount) < 1000 THEN 'Medium-Value Customer'
        WHEN SUM(o.order_amount) < 500 THEN 'Low-Value Customer'
        ELSE 'Inactive Customer'
    END AS customer_segment
FROM
    customers c
LEFT JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name
ORDER BY
    total_spent DESC;    
    
    
--------------------------------------------

-- Scenario 1: Categorizing Shipping Modes
-- Let's categorize the shipping modes into different priority levels based on their average shipping costs:

SELECT
    ship_mode,
    AVG(shipping_cost) AS avg_shipping_cost,
    CASE
        WHEN AVG(shipping_cost) > 50 THEN 'High Cost'
        WHEN AVG(shipping_cost) > 20 THEN 'Medium Cost'
        ELSE 'Low Cost'
    END AS shipping_cost_category
FROM
    sales
GROUP BY
    ship_mode;   
    
    
-- Scenario 2: Categorizing Customers by Segment and Profitability
-- Let's categorize customers by their segments and profitability:  

SELECT
    segment,
    AVG(profit) AS avg_profit,
    CASE
        WHEN AVG(profit) >= 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS profitability_category
FROM
    sales
GROUP BY
    segment;    
    
    
    
-- Scenario 3: Calculating Profit Margin Categories for Products
-- Let's categorize products based on their profit margins:    


SELECT
    product_name,
    order_date_real,
    sales,
    profit,
    CASE
        WHEN profit/sales >= 0.2 THEN 'High Margin'
        WHEN profit/sales >= 0.1 THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS profit_margin_category
FROM
    sales
WHERE
    year(order_date_real) = 2020;    
    
    
select * from sales ; 


SELECT
    product_name,
    sales,
    profit,
    CASE
        WHEN profit/sales >= 0.2 THEN 'High Margin'
        WHEN profit/sales >= 0.1 THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS profit_margin_category
FROM
    sales
WHERE
    month(order_date_real) = '4'
LIMIT 0, 10;



-- Scenario: Analyzing Product Performance by Categories
 
-- Calculate total sales and average discount for each product category.
-- Categorize products within each category based on their average sales amount.


SELECT
    category,
    COUNT(*) AS num_products,
    SUM(sales) AS total_sales,
    AVG(discount) AS avg_discount,
    avg(sales) as avg_sales,
    CASE
        WHEN AVG(sales) >= 500 THEN 'High Sales'
        WHEN AVG(sales) >= 200 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_performance_category
FROM
    sales
GROUP BY
    category
ORDER BY
    total_sales DESC;  
    
    
    
----------------------------------------------------



select * from dress ;   


select * ,
case 
    when style = 't-shirt' then sysdate()
    else "this is not your name"
end as statement 
from dress;    


SELECT
    Season,
    Price,
    COUNT(*) AS num_dresses,
    AVG(Rating) AS avg_rating,
    CASE
        WHEN Price = 'Low' THEN 'Affordable'
        WHEN Price = 'Average' THEN 'Moderate'
        WHEN Price = 'High' THEN 'Expensive'
        ELSE 'Unknown'
    END AS price_category
FROM
    dress
GROUP BY
    Season, Price
ORDER BY
    Season, num_dresses DESC;
    
    
--------------------------------------------


select *from bank ;



select *,
case
	when `month` = "may" then "this is may month only"
end as stat
from bank ;


select *,
case
	when `month` = "may" then "this is may month only"
    when `month` = "feb" then "this is feb month only"
    when `month` = 'jul' then system_user()
end as stat
from bank ;    



 ---------------------------------------------------
 
 
 CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    customer_segment VARCHAR(50) -- This column will store the segment
);

INSERT INTO customers1 (customer_id, customer_name, email)
VALUES
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'jane.smith@example.com'),
    (3, 'Michael Johnson', 'michael.johnson@example.com'),
    (4, 'Emily Davis', 'emily.davis@example.com'),
    (5, 'Chris Lee', 'chris.lee@example.com');
    
select * from customers1 ;
  
    
UPDATE customers1 c
SET customer_segment = 
    CASE
        WHEN (
            SELECT SUM(o.order_amount)
            FROM orders o
            WHERE o.customer_id = c.customer_id
        ) >= 100 THEN 'High-Value Customer'
        WHEN (
            SELECT SUM(o.order_amount)
            FROM orders o
            WHERE o.customer_id = c.customer_id
        ) >= 50 AND (
            SELECT SUM(o.order_amount)
            FROM orders o
            WHERE o.customer_id = c.customer_id
        ) < 100 THEN 'Medium-Value Customer'
        WHEN (
            SELECT SUM(o.order_amount)
            FROM orders o
            WHERE o.customer_id = c.customer_id
        ) < 50 THEN 'Low-Value Customer'
        ELSE 'Inactive Customer'
    END;    
    
    
set sql_safe_updates =0 ;    



select * from customers1 ;  


DELETE FROM customers1
WHERE customer_id IN (
    SELECT c.customer_id
    FROM customers c
    LEFT JOIN (
        SELECT customer_id,
               CASE
                   WHEN SUM(order_amount) >= 1000 THEN 'High-Value Customer'
                   WHEN SUM(order_amount) >= 500 AND SUM(order_amount) < 1000 THEN 'Medium-Value Customer'
                   WHEN SUM(order_amount) < 500 THEN 'Low-Value Customer'
                   ELSE 'Inactive Customer'
               END AS customer_segment
        FROM orders
        GROUP BY customer_id
    ) segments ON c.customer_id = segments.customer_id
    WHERE segments.customer_segment = 'Inactive Customer'
);



select * from bank ;


select age from bank where age = 55, 40, 33 ;


select age from bank where age in (12, 24, 36, 48) ;


select country from sales where country in ("INDIA", "FRance", "IRAN", "AUSTRALIA") ;


--------------------------------------------------------------


1. Conditional Value Selection
-- You can use CASE to select different values based on conditions:


SELECT
    order_id,
    order_date,
    order_amount,
    CASE
        WHEN order_amount >= 1000 THEN 'High'
        WHEN order_amount >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS order_category
FROM
    orders;
    
    
2. Data Transformation
-- CASE can be used to transform data based on specific conditions:


SELECT
    product_name,
    unit_price,
    CASE
        WHEN unit_price >= 100 THEN unit_price * 0.9  -- Apply 10% discount
        ELSE unit_price
    END AS discounted_price
FROM
    products;    
    
    
3. Filtering Data
-- You can use CASE within WHERE clauses to filter data based on conditions:


SELECT
    employee_id,
    employee_name,
    salary,
    CASE
        WHEN salary >= 50000 THEN 'High Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM
    employees
WHERE
    CASE
        WHEN department = 'Sales' AND salary >= 60000 THEN 1
        WHEN department = 'Marketing' AND salary >= 55000 THEN 1
        ELSE 0
    END = 1;    
    
    
    
4. Aggregation
-- CASE statements can also be used with aggregate functions like SUM, COUNT, AVG, etc., to perform conditional aggregation:
  
  
SELECT
    department,
    COUNT(employee_id) AS num_employees,
    SUM(CASE WHEN salary >= 60000 THEN 1 ELSE 0 END) AS high_salary_count
FROM
    employees
GROUP BY
    department;    
    
    
    
5. Ordering Results
-- CASE can be used in ORDER BY clauses to customize sorting based on conditions: 


SELECT
    product_name,
    unit_price
FROM
    products
ORDER BY
    CASE
        WHEN unit_price >= 100 THEN 1
        ELSE 2
    END, unit_price DESC;    
    
    
6. Updating Data
-- As previously mentioned, you can use CASE in UPDATE statements to conditionally update values based on criteria:   
 
 
UPDATE
    employees
SET
    salary_bonus = 
        CASE
            WHEN performance_rating = 'Excellent' THEN salary * 0.2  -- 20% bonus
            WHEN performance_rating = 'Good' THEN salary * 0.1       -- 10% bonus
            ELSE salary
        END;    
    
7. Delete Operations
-- While CASE itself is not used directly in DELETE statements, you can use CASE in subqueries or WHERE clauses to filter rows for deletion based on conditions: 


DELETE FROM
    customers
WHERE
    CASE
        WHEN `status` = 'Inactive' AND last_order_date < '2023-01-01' THEN 1
        ELSE 0
    END = 1;    
    
    


