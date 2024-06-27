use class10 ;


-- 5. Example: Find Customers Who Have Ordered Products from Multiple Categories

SELECT o.customer_id, COUNT(DISTINCT p.category_id) AS num_categories_ordered
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY o.customer_id
HAVING COUNT(DISTINCT p.category_id) > 1 ;


-- 6. Example: Calculate Total Revenue and Average Order Size per Product Category

SELECT p.category_id, 
       SUM(od.quantity * od.unit_price) AS total_revenue,
       AVG(od.quantity * od.unit_price) AS avg_order_size
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.category_id
ORDER BY total_revenue DESC;


-- 7. Example: Identify Customers Who Have Made Orders on Consecutive Days

SELECT o1.customer_id, o1.order_date AS start_date, o2.order_date AS end_date
FROM orders o1
JOIN orders o2 ON o1.customer_id = o2.customer_id
WHERE DATEDIFF(o2.order_date, o1.order_date) = 1
ORDER BY o1.customer_id, o1.order_date ;

-- 8. Example: Calculate Moving Average of Order Amounts for Each Customer

SELECT customer_id, order_date, total_amount,
AVG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) 
AS moving_avg
FROM orders
ORDER BY customer_id, order_date;


-- 9. Example: Rank Customers by Their Total Spending and Show Top 5 Customers


SELECT customer_id, total_spent,
RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM ( SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id ) 
AS customer_spending ;
-- WHERE spending_rank <= 5;