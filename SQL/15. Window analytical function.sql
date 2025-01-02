use clauses ;

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, OrderDate, CustomerID, TotalAmount)
VALUES
    (1, '2023-01-01', 101, 150.00),
    (2, '2023-01-02', 102, 200.00),
    (3, '2023-01-05', 103, 75.00),
    (4, '2023-02-10', 101, 300.00),
    (5, '2023-02-15', 102, 100.00),
    (6, '2023-02-28', 103, 250.00),
    (7, '2023-03-05', 101, 180.00),
    (8, '2023-03-08', 102, 220.00),
    (9, '2023-03-12', 103, 90.00),
    (10, '2023-04-01', 101, 280.00),
    (11, '2023-04-02', 102, 150.00),
    (12, '2023-04-05', 103, 200.00),
    (13, '2023-05-10', 101, 320.00),
    (14, '2023-05-15', 102, 180.00),
    (15, '2023-05-20', 103, 150.00),
    (16, '2023-06-01', 101, 200.00),
    (17, '2023-06-05', 102, 300.00),
    (18, '2023-06-10', 103, 250.00),
    (19, '2023-07-01', 101, 150.00),
    (20, '2023-07-02', 102, 200.00),
    (21, '2023-07-05', 103, 75.00),
    (22, '2023-08-10', 101, 300.00),
    (23, '2023-08-15', 102, 100.00),
    (24, '2023-08-28', 103, 250.00),
    (25, '2023-09-01', 101, 180.00),
    (26, '2023-09-08', 102, 220.00),
    (27, '2023-09-12', 103, 90.00),
    (28, '2023-10-01', 101, 280.00),
    (29, '2023-10-02', 102, 150.00),
    (30, '2023-10-05', 103, 200.00),
    (31, '2023-11-10', 101, 320.00),
    (32, '2023-11-15', 102, 180.00),
    (33, '2023-11-20', 103, 150.00),
    (34, '2023-12-01', 101, 200.00),
    (35, '2023-12-05', 102, 300.00),
    (36, '2023-12-10', 103, 250.00),
    (37, '2024-01-01', 101, 150.00),
    (38, '2024-01-02', 102, 200.00),
    (39, '2024-01-05', 103, 75.00),
    (40, '2024-02-10', 101, 300.00),
    (41, '2024-02-15', 102, 100.00),
    (42, '2024-02-28', 103, 250.00),
    (43, '2024-03-05', 101, 180.00),
    (44, '2024-03-08', 102, 220.00),
    (45, '2024-03-12', 103, 90.00),
    (46, '2024-04-01', 101, 280.00),
    (47, '2024-04-02', 102, 150.00),
    (48, '2024-04-05', 103, 200.00),
    (49, '2024-05-10', 101, 320.00),
    (50, '2024-05-15', 102, 180.00),
    (51, '2024-05-20', 103, 150.00),
    (52, '2024-06-01', 101, 200.00),
    (53, '2024-06-05', 102, 300.00),
    (54, '2024-06-10', 103, 250.00);

select * from orders ;


select sum(totalamount) as total from orders ;

select max(totalamount) as total from orders ;

select min(totalamount) as total from orders ;

select avg(totalamount) as total from orders ;

select customerid, sum(totalamount) as total from orders
group by customerid ;



----------------------------------------------------------

CREATE TABLE employees1 (
    employee_id INT,
    employee_name VARCHAR(100),
    region VARCHAR(50),
    department VARCHAR(50),
    sales DECIMAL
);

-- Insert sample data into the table (100 records)
INSERT INTO employees1 (employee_id, employee_name, region, department, sales)
VALUES
(1, 'Alice', 'North', 'Sales', 5000),
(2, 'Bob', 'North', 'Sales', 7000),
(3, 'Charlie', 'South', 'Marketing', 3000),
(4, 'David', 'North', 'Sales', 4000),
(5, 'Eve', 'South', 'Sales', 6000),
(6, 'Frank', 'South', 'Marketing', 8000),
(7, 'Grace', 'North', 'HR', 2000),
(8, 'Hannah', 'South', 'HR', 3500),
(9, 'Ivy', 'West', 'Sales', 5500),
(10, 'Jack', 'East', 'Sales', 4500),
(11, 'Kylie', 'West', 'HR', 2500),
(12, 'Liam', 'East', 'Sales', 7000),
(13, 'Megan', 'North', 'Marketing', 9000),
(14, 'Nate', 'South', 'HR', 3800),
(15, 'Olivia', 'West', 'Sales', 6000),
(16, 'Paul', 'East', 'Marketing', 5000),
(17, 'Quinn', 'North', 'HR', 2700),
(18, 'Rita', 'South', 'Sales', 8000),
(19, 'Sam', 'West', 'Marketing', 3500),
(20, 'Tom', 'East', 'HR', 2200),
(21, 'Uma', 'North', 'Sales', 7500),
(22, 'Vera', 'South', 'Marketing', 3200),
(23, 'Walter', 'North', 'HR', 1900),
(24, 'Xena', 'East', 'Sales', 5000),
(25, 'Yara', 'South', 'HR', 2700),
(26, 'Zoe', 'West', 'Sales', 6500),
(27, 'Alan', 'East', 'Sales', 4600),
(28, 'Becky', 'South', 'HR', 3100),
(29, 'Carlos', 'North', 'HR', 2900),
(30, 'Diana', 'West', 'Marketing', 7000),
(31, 'Ethan', 'South', 'Sales', 4200),
(32, 'Fiona', 'North', 'Marketing', 8400),
(33, 'Gina', 'East', 'HR', 2800),
(34, 'Howard', 'South', 'Marketing', 7700),
(35, 'Iris', 'West', 'Sales', 6000),
(36, 'Jake', 'East', 'Sales', 5100),
(37, 'Kim', 'South', 'HR', 2600),
(38, 'Leo', 'North', 'Sales', 6400),
(39, 'Maya', 'South', 'Sales', 6800),
(40, 'Nora', 'West', 'Marketing', 5400),
(41, 'Oscar', 'North', 'Sales', 5600),
(42, 'Paula', 'East', 'Marketing', 6200),
(43, 'Quincy', 'South', 'Sales', 7700),
(44, 'Randy', 'West', 'Sales', 4600),
(45, 'Sophie', 'North', 'HR', 2400),
(46, 'Tony', 'South', 'HR', 3300),
(47, 'Ursula', 'West', 'Marketing', 6500),
(48, 'Victor', 'North', 'Sales', 5800),
(49, 'Wendy', 'South', 'Sales', 4000),
(50, 'Xander', 'East', 'Sales', 5300),
(51, 'Yasmine', 'West', 'HR', 2600),
(52, 'Zach', 'South', 'Sales', 5200),
(53, 'Ava', 'North', 'Sales', 7300),
(54, 'Brandon', 'East', 'Sales', 5800),
(55, 'Caitlin', 'West', 'Sales', 4600),
(56, 'Derek', 'North', 'Marketing', 9000),
(57, 'Emily', 'South', 'HR', 3300),
(58, 'Felix', 'East', 'HR', 3500),
(59, 'Graham', 'North', 'HR', 2300),
(60, 'Holly', 'South', 'Sales', 7000),
(61, 'Isaac', 'West', 'HR', 2700),
(62, 'Julia', 'North', 'Sales', 8100),
(63, 'Kevin', 'South', 'Marketing', 5400),
(64, 'Laura', 'East', 'Sales', 6000),
(65, 'Mike', 'North', 'HR', 2200),
(66, 'Nancy', 'West', 'Marketing', 7500),
(67, 'Oscar', 'South', 'HR', 3800),
(68, 'Pamela', 'East', 'Sales', 6700),
(69, 'Quincy', 'North', 'Marketing', 5000),
(70, 'Rachel', 'South', 'Sales', 5700),
(71, 'Steve', 'West', 'Sales', 6900),
(72, 'Tina', 'South', 'Marketing', 6500),
(73, 'Ulysses', 'East', 'HR', 3000),
(74, 'Vince', 'North', 'Sales', 4800),
(75, 'Will', 'South', 'Sales', 4900),
(76, 'Xena', 'West', 'HR', 2900),
(77, 'Yvonne', 'North', 'HR', 3400),
(78, 'Zoe', 'South', 'Sales', 7600),
(79, 'Amy', 'East', 'Sales', 5400),
(80, 'Brad', 'North', 'HR', 2100),
(81, 'Claire', 'South', 'Sales', 6700),
(82, 'Doug', 'West', 'Marketing', 4500),
(83, 'Ella', 'North', 'Sales', 4800),
(84, 'Felicia', 'South', 'HR', 2200),
(85, 'George', 'East', 'Sales', 5100),
(86, 'Hannah', 'West', 'HR', 3800),
(87, 'Ivan', 'South', 'Sales', 5600),
(88, 'Jackie', 'North', 'Sales', 6900),
(89, 'Kimberly', 'South', 'HR', 3100),
(90, 'Landon', 'West', 'Sales', 5300),
(91, 'Monica', 'East', 'Marketing', 6000),
(92, 'Nancy', 'South', 'HR', 2400),
(93, 'Olivia', 'West', 'Sales', 5500),
(94, 'Parker', 'North', 'HR', 3200),
(95, 'Quinn', 'South', 'Sales', 5200),
(96, 'Rachel', 'East', 'Marketing', 5000),
(97, 'Samantha', 'South', 'HR', 3100),
(98, 'Terry', 'North', 'Sales', 4600),
(99, 'Ursula', 'South', 'Sales', 6000),
(100, 'Victor', 'West', 'HR', 4200);

select * from employees1 ;

select region, max(sales) from employees1 group by region ;

SELECT 
    employee_id,
    employee_name,
    region,
    department,
    sales,
    ROW_NUMBER() OVER (PARTITION BY region, department ORDER BY sales DESC) AS `row_number`
FROM employees1
ORDER BY region, department, `row_number`;

SELECT 
    employee_id,
    employee_name,
    region,
    department,
    sales,
    rank() OVER (PARTITION BY region, department ORDER BY sales DESC) AS `rank_number`
FROM employees1
ORDER BY region, department, `rank_number`;

SELECT 
    employee_id,
    employee_name,
    region,
    department,
    sales,
dense_rank() over(partition by region, department order by sales Desc) as "Rank"
from employees1 ;     

SELECT 
    employee_id,
    employee_name,
    region,
    department,
    sales,
dense_rank() over(partition by department order by sales Desc) as "Rank"
from employees1 ; 

SELECT 
    employee_id,
    employee_name,
    region,
    department,
    sales,
dense_rank() over(order by sales Desc) as "Rank"
from employees1 ; 


SELECT 
    employee_id,
    employee_name,
    region,
    department,
    sales,
    `Rank`
FROM (
    SELECT 
        employee_id,
        employee_name,
        region,
        department,
        sales,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY sales DESC) AS `Rank`
    FROM employees1
) AS ranked_employees
WHERE `Rank` <= 3
ORDER BY department, `Rank`;


SELECT 
    employee_id,
    employee_name,
    region,
    department,
    sales,
    `Rank`
FROM (
    SELECT 
        employee_id,
        employee_name,
        region,
        department,
        sales,
        DENSE_RANK() OVER (PARTITION BY region ORDER BY sales DESC) AS `Rank`
    FROM employees1
) AS ranked_employees
WHERE `Rank` <= 3
ORDER BY region, `Rank`;


