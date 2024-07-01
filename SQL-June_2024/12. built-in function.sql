create database func ;

use func ;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);


INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-01-01', 250.00),
(2, 102, '2024-01-02', 180.00),
(3, 103, '2024-01-03', 350.00),
(4, 101, '2024-01-04', 420.00),
(5, 104, '2024-01-05', 300.00),
(6, 102, '2024-01-06', 210.00),
(7, 101, '2024-01-07', 280.00),
(8, 103, '2024-01-08', 390.00),
(9, 105, '2024-01-09', 270.00),
(10, 101, '2024-01-10', 320.00),
(11, 104, '2024-01-11', 400.00),
(12, 102, '2024-01-12', 240.00),
(13, 103, '2024-01-13', 360.00),
(14, 105, '2024-01-14', 310.00),
(15, 101, '2024-01-15', 380.00),
(16, 102, '2024-01-16', 220.00),
(17, 104, '2024-01-17', 420.00),
(18, 103, '2024-01-18', 340.00),
(19, 105, '2024-01-19', 290.00),
(20, 101, '2024-01-20', 350.00),
(21, 102, '2024-01-21', 260.00),
(22, 104, '2024-01-22', 390.00),
(23, 103, '2024-01-23', 310.00),
(24, 105, '2024-01-24', 380.00),
(25, 101, '2024-01-25', 300.00),
(26, 102, '2024-01-26', 230.00),
(27, 104, '2024-01-27', 360.00),
(28, 103, '2024-01-28', 330.00),
(29, 105, '2024-01-29', 320.00),
(30, 101, '2024-01-30', 370.00),
(31, 102, '2024-01-31', 270.00),
(32, 104, '2024-02-01', 410.00),
(33, 103, '2024-02-02', 320.00),
(34, 105, '2024-02-03', 300.00),
(35, 101, '2024-02-04', 390.00),
(36, 102, '2024-02-05', 280.00),
(37, 104, '2024-02-06', 420.00),
(38, 103, '2024-02-07', 350.00),
(39, 105, '2024-02-08', 330.00),
(40, 101, '2024-02-09', 400.00),
(41, 102, '2024-02-10', 290.00),
(42, 104, '2024-02-11', 440.00),
(43, 103, '2024-02-12', 360.00),
(44, 105, '2024-02-13', 340.00),
(45, 101, '2024-02-14', 410.00),
(46, 102, '2024-02-15', 300.00),
(47, 104, '2024-02-16', 430.00),
(48, 103, '2024-02-17', 370.00),
(49, 105, '2024-02-18', 350.00),
(50, 101, '2024-02-19', 420.00);


select * from orders ;



# 1. COUNT()

 -- Count the number of orders placed by each customer.


SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders
GROUP BY customer_id;



 -- Count the number of distinct products in each category.
 
SELECT category_id, COUNT(DISTINCT order_id) AS num_products
FROM orders
GROUP BY category_id;


alter table orders 
add column category_id int ;


update orders 
set category_id= 10013 where  customer_id = 113 ;

set sql_safe_updates = 0 ;


### 2. SUM()

-- Calculate the total revenue generated from all orders.
 

SELECT SUM(total_amount) AS total_revenue
FROM orders;


-- Calculate the total quantity of products sold for each order.
 
SELECT order_id, SUM(total_amount) AS total_quantity_sold
FROM orders
GROUP BY order_id;


### 3. AVG()

-- Calculate the average order amount per customer.
 

SELECT customer_id, AVG(total_amount) AS avg_order_amount
FROM orders
GROUP BY customer_id;



-- Calculate the average price of products in each category.
 

SELECT category_id, AVG(price) AS avg_price
FROM products
GROUP BY category_id ;


### 4. MIN()

-- Find the earliest order date in the dataset.


SELECT MIN(order_date) AS earliest_order_date
FROM orders ;

 -- Find the minimum stock quantity among all products.


SELECT MIN(total_amount) AS min_stock_quantity
FROM orders  ;


### 5. MAX()

-- Find the highest unit price among all products.


SELECT MAX(price) AS max_unit_price
FROM products;

-- Find the latest order date in the dataset.

SELECT MAX(order_date) AS latest_order_date
FROM orders ;




### 6. SUM() ... OVER (PARTITION BY ...)



-- Calculate cumulative total revenue per customer.

SELECT customer_id, order_id, total_amount,
       SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_id) AS cumulative_total
FROM orders ;



-- Calculate running total quantity sold per product.


SELECT product_id, order_id, quantity,
       SUM(quantity) OVER (PARTITION BY product_id ORDER BY order_id) AS running_total_quantity
FROM order_details ;



### 7. AVG() ... OVER (PARTITION BY ...)

 -- Calculate average order amount per customer over time.


SELECT customer_id, order_date, total_amount,
       AVG(total_amount) OVER (PARTITION BY customer_id 
       ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS avg_order_amount
FROM orders;



-- Calculate moving average of product prices within categories.


SELECT product_id, category_id, price,
       AVG(price) OVER (PARTITION BY category_id ORDER BY product_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
       AS moving_avg_price
FROM class10.products;




### 8. ROW_NUMBER()

-- Assign row numbers to orders within each customer.


SELECT order_id, customer_id, order_date,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
FROM orders ;


-- Rank products within each category by their prices.


SELECT product_id, category_id, product_name, price,
       ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY price DESC) AS price_rank
FROM class10.products ;


select * from class10.products ;



### 9. RANK()

-- Rank customers by their total spending.

SELECT customer_id, total_spent,
       RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) AS customer_spending;



-- Rank orders by total amount within each customer.

SELECT order_id, customer_id, total_amount,
       RANK() OVER (PARTITION BY customer_id ORDER BY total_amount DESC) AS amount_rank
FROM orders ;


### 10. DENSE_RANK()

--  Dense rank products by their prices within each category.


SELECT product_id, category_id, product_name, price,
       DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS price_dense_rank
FROM products ;



-- Dense rank customers by their total spending.
 

SELECT customer_id, total_spent,
       DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spending_dense_rank
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) AS customer_spending;















