use clauses ;

select * from products ;

INSERT INTO products (product_name, category, price, stock, supplier, release_date) VALUES
('Laptop', 'Electronics', 999.99, 25, 'TechCorp', '2023-01-15'),
('Smartphone', 'Electronics', 799.99, 50, 'PhoneInc', '2023-02-10'),
('Tablet', 'Electronics', 499.99, 30, 'GadgetWorld', '2023-03-05'),
('Headphones', 'Accessories', 199.99, 100, 'SoundMaster', '2023-01-20'),
('Charger', 'Accessories', 29.99, 200, 'PowerUp', '2023-02-15'),
('Monitor', 'Electronics', 299.99, 15, 'DisplayPro', '2023-04-01'),
('Keyboard', 'Accessories', 89.99, 75, 'KeyTech', '2023-01-25'),
('Mouse', 'Accessories', 49.99, 80, 'ClickIt', '2023-02-28'),
('Smartwatch', 'Wearables', 249.99, 40, 'WearableTech', '2023-03-20'),
('Camera', 'Electronics', 599.99, 20, 'PhotoGear', '2023-01-30'),
('Printer', 'Electronics', 159.99, 35, 'PrintMasters', '2023-03-10'),
('External Hard Drive', 'Storage', 119.99, 60, 'DataSafe', '2023-02-01'),
('USB Flash Drive', 'Storage', 19.99, 150, 'QuickStore', '2023-03-15'),
('Router', 'Networking', 89.99, 45, 'NetGear', '2023-01-10'),
('Webcam', 'Accessories', 69.99, 55, 'VisionTech', '2023-02-20'),
('Bluetooth Speaker', 'Audio', 149.99, 70, 'AudioWave', '2023-03-30'),
('Gaming Console', 'Electronics', 499.99, 10, 'GameBox', '2023-04-10'),
('Game Controller', 'Accessories', 59.99, 80, 'GameGear', '2023-01-05'),
('VR Headset', 'Wearables', 399.99, 5, 'VirtualVisions', '2023-04-15'),
('Smart TV', 'Electronics', 899.99, 8, 'VisionTech', '2023-03-25'),
('Streaming Device', 'Electronics', 49.99, 60, 'Streamline', '2023-02-18'),
('Dishwasher', 'Home Appliances', 899.99, 12, 'HomeTech', '2023-01-12'),
('Washing Machine', 'Home Appliances', 499.99, 10, 'CleanHome', '2023-01-29'),
('Refrigerator', 'Home Appliances', 999.99, 6, 'CoolTech', '2023-03-02'),
('Air Conditioner', 'Home Appliances', 599.99, 7, 'ClimateControl', '2023-02-05'),
('Microwave', 'Home Appliances', 199.99, 25, 'QuickCook', '2023-03-12'),
('Electric Kettle', 'Kitchen', 39.99, 80, 'KitchenAid', '2023-01-22'),
('Blender', 'Kitchen', 79.99, 50, 'BlendMaster', '2023-02-02'),
('Coffee Maker', 'Kitchen', 129.99, 45, 'BrewTime', '2023-01-18'),
('Toaster', 'Kitchen', 49.99, 100, 'ToastPerfect', '2023-03-04'),
('Vacuum Cleaner', 'Home Appliances', 249.99, 20, 'CleanSweep', '2023-01-08'),
('Rice Cooker', 'Kitchen', 59.99, 30, 'CookEase', '2023-02-22'),
('Dish Rack', 'Kitchen', 19.99, 150, 'SpaceSaver', '2023-04-03'),
('Table Lamp', 'Furniture', 39.99, 90, 'LightHouse', '2023-01-15'),
('Office Chair', 'Furniture', 149.99, 40, 'ComfortSeating', '2023-02-10'),
('Desk', 'Furniture', 199.99, 25, 'WorkSpace', '2023-03-05'),
('Bookshelf', 'Furniture', 99.99, 15, 'BookHaven', '2023-01-20'),
('Dining Table', 'Furniture', 299.99, 8, 'HomeStyle', '2023-02-15'),
('Sofa', 'Furniture', 799.99, 5, 'ComfortCouch', '2023-03-01'),
('Bed', 'Furniture', 599.99, 7, 'RestEasy', '2023-02-28'),
('Nightstand', 'Furniture', 79.99, 50, 'SleepWell', '2023-01-12'),
('Duvet Cover', 'Bedding', 29.99, 100, 'SoftSleep', '2023-03-15'),
('Pillow', 'Bedding', 19.99, 120, 'CloudRest', '2023-01-05'),
('Curtains', 'Home Decor', 39.99, 60, 'WindowTreats', '2023-02-22'),
('Wall Art', 'Home Decor', 89.99, 30, 'ArtisticVibes', '2023-04-05'),
('Vase', 'Home Decor', 24.99, 150, 'FloralEssence', '2023-01-15'),
('Rug', 'Home Decor', 99.99, 20, 'CozyHome', '2023-03-20'),
('Cookware Set', 'Kitchen', 149.99, 15, 'ChefPro', '2023-01-28'),
('Cutlery Set', 'Kitchen', 79.99, 35, 'SharpEdge', '2023-02-12'),
('Dinner Plates', 'Kitchen', 49.99, 60, 'PlatePerfect', '2023-03-09'),
('Glassware Set', 'Kitchen', 29.99, 80, 'ClearView', '2023-04-01'),
('Garden Hose', 'Garden', 19.99, 90, 'GardenTools', '2023-02-18'),
('Lawn Mower', 'Garden', 299.99, 12, 'MowMaster', '2023-03-04'),
('Shovel', 'Garden', 24.99, 70, 'DigIt', '2023-01-10'),
('Rake', 'Garden', 14.99, 100, 'GardenTools', '2023-04-20'),
('Fertilizer', 'Garden', 9.99, 200, 'GrowFast', '2023-02-28');




-- Find Categories with Average Price Above a Certain Value

SELECT category, sum(price) FROM products GROUP BY category HAVING AVG (price) > 
( SELECT AVG(price) FROM products );

SELECT product_name, sum(price) FROM products GROUP BY product_name HAVING AVG (price) > 
( SELECT AVG(price) FROM products );

-- Count Products in Categories with Low Stock

SELECT category, COUNT(*) AS product_count FROM products WHERE category IN 
( SELECT category FROM products GROUP BY category HAVING SUM(stock) > 50 )
GROUP BY category;


--  Get the Most Expensive Product in Each Category

SELECT p.category, p.product_name, p.price FROM products p
WHERE price = ( SELECT MAX(price) FROM products WHERE category = p.category );



-- List Suppliers with More Products than the Average

SELECT supplier FROM products GROUP BY supplier HAVING COUNT(*) > 
(SELECT AVG(product_count) FROM (SELECT COUNT(*) AS product_count FROM products GROUP BY supplier)
 AS avg_count );
 
 
 ----------------------------------------
-- date & time function
 
select user() ;

select month("2000-12-12") ;

select year("2000-12-12") ;

select day("2000-12-12") ;

select week("2024-12-25") ;

select quarter("2000-10-12") ;


new.
old.

select sysdate() ;

select now() ;

select CURDATE() ;

select time("2024-12-25 10:06:19") ;

select hour("11:30:45") ;

select minute("11:30:45") ;

select second("11:30:45") ;

select weekday("2024-12-22");

select dayname("2024-10-29") ;

select monthname("2024-12-25 10:06:19") ;


select DATEDIFF("2024-10-30", "2024-10-01") ;

select DATE_ADD("2024-10-01", interval 20 day) ;

select DATE_ADD("2024-10-01", interval -2 month) ;

select DATE_ADD("2024-10-01", interval 2 year) ;

---------------------------------------------------------

SELECT CONCAT(category, ' + ', product_name, " + ", supplier) AS full_name FROM products;

SELECT SUBSTRING(product_name, 1, 4) AS short_name, product_name FROM products;

select length(category), category from products ;

select upper(category), category from products ;

select lower(category), category from products ;

SELECT category,
    GROUP_CONCAT(product_name SEPARATOR ', ') AS ordered_products
FROM products GROUP BY category;

-------------------------------

select * from products ;

select round(price) from products ;

SELECT ROUND(price, 1) AS rounded_price FROM products;

select abs(price) from products ;

SELECT category,
    GROUP_CONCAT(stock SEPARATOR ', ') AS ordered_products
FROM products GROUP BY category;


-- COALESCE(): Returns the first non-null value in a list of expressions.

SELECT COALESCE(discounted_price, regular_price) AS final_price FROM products;

CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2)
);


INSERT INTO employees (employee_id, first_name, last_name, salary, bonus)
VALUES
    (1, 'John', 'Doe', 60000, NULL),
    (2, 'Jane', 'Smith', 55000, 5000),
    (3, 'Alice', 'Johnson', 72000, NULL),
    (4, 'Bob', 'Brown', 80000, 3000);
    
SELECT employee_id,
       first_name,
       last_name,
       salary,
       COALESCE(bonus, 1000) AS bonus
FROM employees;

select * from employees ;


-- IFNULL() / ISNULL(): Returns a specified value if the expression is NULL.

SELECT IFNULL(discounted_price, regular_price) AS final_price FROM products;

SELECT employee_id,
       first_name,
       last_name,
       salary,
       IFNULL(bonus, 1000) AS bonus
FROM employees;

SELECT employee_id,
       first_name,
       last_name,
       salary,
       ISNULL(bonus) AS bonus
FROM employees;

SELECT RAND() AS random_number;








SELECT IFNULL(discounted_price, regular_price) AS final_price FROM products;



