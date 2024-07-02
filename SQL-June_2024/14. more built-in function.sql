use class10 ;

-- 1. String Functions
-- CONCAT(): Concatenates two or more strings together.


SELECT CONCAT(emp_name, ' ', emp_department) AS full_name FROM employees;



-- SUBSTRING(): Extracts a substring from a string based on start position and length.

SELECT SUBSTRING(product_name, 1, 5) AS short_name FROM products;


-- UPPER() / LOWER(): Converts a string to upper or lower case.

SELECT UPPER(emp_name) AS last_name_upper FROM employees ; 

SELECT lower(emp_name) AS last_name_upper FROM employees ; 


-- 2. Date and Time Functions
-- NOW(): Returns the current date and time.


SELECT NOW() AS current_datetime;


-- DATE_FORMAT(): Formats a date or time value based on a specified format.

SELECT DATE_FORMAT(order_date, '%Y-%m-%d') AS formatted_date FROM sales;


-- DATE_ADD() / DATE_SUB(): Adds or subtracts a specified time interval to/from a date.


SELECT DATE_ADD(order_date_real, INTERVAL 7 DAY) AS future_date FROM sales;

SELECT DATE_sub(order_date_real, INTERVAL 7 DAY) AS future_date FROM sales;


-- 3. Conditional Functions
-- CASE: Evaluates a list of conditions and returns one of multiple possible result expressions.


SELECT
    order_id, total_amount,
    CASE
        WHEN total_amount > 200 THEN 'High Value'
        ELSE 'Low Value'
    END AS order_value_category
FROM orders;



-- 4. Mathematical Functions
-- ROUND(): Rounds a numeric value to a specified precision.

SELECT ROUND(discount, 1) AS rounded_price FROM sales;


-- ABS(): Returns the absolute (positive) value of a numeric expression.

SELECT ABS(shipping_cost) AS abs_quantity FROM sales ;


-- 5. Aggregate Functions (Summarized)
-- GROUP_CONCAT(): Concatenates values from multiple rows into a single string.


SELECT
    product_id,
    GROUP_CONCAT(product_name SEPARATOR ' - ') AS ordered_products
FROM sales
GROUP BY product_id;


-- 6. Miscellaneous Functions
-- COALESCE(): Returns the first non-null value in a list of expressions.


SELECT COALESCE(sales, discount) AS final_price FROM sales;


-- IFNULL() / ISNULL(): Returns a specified value if the expression is NULL.

SELECT IFnull(profit, discount) AS final_price FROM sales;



-- RAND(): Generates a random number.

SELECT RAND( ) AS random_number ; 


select * from orders ;

select * from sales ;


create view new_view as select state, country, market, region from sales ;

create view new_view1 as select state, country, market, region from sales where market = "EU" ;

select * from new_view1 ;









