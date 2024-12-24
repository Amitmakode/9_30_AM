create database clauses ;
use clauses ;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT,
    supplier VARCHAR(100),
    release_date DATE
);

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


select * from products ;

-- where clause

SELECT * FROM products WHERE price > 200;

SELECT * FROM products WHERE category = 'Electronics';

SELECT *  FROM products WHERE stock = 0;

SELECT count(*) FROM products WHERE release_date > '2023-03-01';

SELECT * FROM products WHERE release_date > '2023-03-01';

SELECT * FROM products WHERE price > 500  and stock > 5 ;

SELECT *  FROM products WHERE stock in (25, 20, 12, 5);

select * from products where price between 300 and 500 ;



-- group by 

SELECT category, COUNT(*) AS product_count FROM products GROUP BY category ;

SELECT supplier, AVG(price) AS average_price FROM products GROUP BY supplier ;

SELECT category, SUM(stock) AS total_stock FROM products GROUP BY category;

SELECT YEAR(release_date) AS release_year, COUNT(*) AS product_count FROM products 
GROUP BY release_year;

SELECT Month(release_date) AS release_month, COUNT(*) AS product_count FROM products 
GROUP BY release_month;


-- having 

SELECT category, COUNT(*) AS product_count FROM products GROUP BY category HAVING COUNT(*) > 5;

SELECT supplier, AVG(price) AS average_price FROM products GROUP BY supplier 
HAVING AVG(price) > 100;

SELECT supplier, MAX(price) AS max_price FROM products GROUP BY supplier 
HAVING MAX(price) < 200;

SELECT month(release_date) AS release_month, COUNT(*) AS product_count FROM products 
GROUP BY release_month HAVING COUNT(*) < 10;


-- order by

SELECT * FROM products ORDER BY price ASC;

SELECT * FROM products ORDER BY stock DESC;

SELECT * FROM products ORDER BY category ASC, price DESC;

SELECT * FROM products ORDER BY supplier ASC, stock ASC;

SELECT * FROM products ORDER BY price ASC, stock DESC;


-- limit and offset

SELECT * FROM products LIMIT 10;

SELECT * FROM products LIMIT 10 OFFSET 5;

SELECT * FROM products ORDER BY id DESC LIMIT 5;

SELECT * FROM products ORDER BY id desc LIMIT 10 OFFSET 10;

-- distinct

SELECT DISTINCT category FROM products;

SELECT DISTINCT * FROM products;

SELECT DISTINCT stock FROM products;


-- IN

SELECT * FROM products WHERE category IN ('Electronics', 'Accessories') order by category asc;

-- Between

SELECT * FROM products WHERE price BETWEEN 199.99 and 500 order by price ;

-----------------------------------------------------------------------------------


SELECT category, AVG(price) AS average_price, COUNT(*) AS product_count FROM products
WHERE stock > 10  -- Filter for products that are in stock
GROUP BY category  -- Group results by category
HAVING COUNT(*) > 5  -- Only include categories with more than 5 products
ORDER BY average_price DESC ;  -- Order the results by average price, highest first


SELECT category, SUM(stock) AS total_stock
FROM products
WHERE stock > 5  -- Include only products that are in stock
GROUP BY category  -- Group by category
HAVING total_stock > 100  -- Only include categories with total stock over 100
ORDER BY total_stock ASC ;  -- Sort by total stock in ascending order








