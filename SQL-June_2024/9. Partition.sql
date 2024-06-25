create database partitionn ;

use partitionn ;


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
    
SELECT * FROM Orders;

# 1. Row Number() 

SELECT OrderID, OrderDate, CustomerID, TotalAmount,
ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS RowNumber
FROM  Orders;


# 2. RANK()

SELECT OrderID, OrderDate, CustomerID, TotalAmount,
RANK() OVER(PARTITION BY CustomerID ORDER BY TotalAmount DESC) AS RankByTotalAmount
FROM  Orders;



# 3. DENSE_RANK()

SELECT 
    OrderID,
    OrderDate,
    CustomerID,
    TotalAmount,
DENSE_RANK() OVER(PARTITION BY CustomerID ORDER BY TotalAmount DESC) AS DenseRankByTotalAmount
FROM  Orders;


# 4. Lead() and LAG()

SELECT 
    OrderID,
    OrderDate,
    CustomerID,
    TotalAmount,
    LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrderDate,
    LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousOrderDate
FROM Orders;


---------------------------------------------------------------


# 1. Pertition by range

CREATE TABLE Sales_Partitioned (
    OrderID INT,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)) 
    PARTITION BY RANGE (YEAR(OrderDate)) (
    PARTITION p1 VALUES LESS THAN (2024),
    PARTITION p2 VALUES LESS THAN (2025),
    PARTITION p3 VALUES LESS THAN (2026),
    PARTITION p4 VALUES LESS THAN MAXVALUE
);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'Sales_Partitioned';

INSERT INTO Sales_Partitioned (OrderID, OrderDate, CustomerID, TotalAmount)
VALUES
    (1, '2028-01-01', 101, 150.00),
    (2, '2024-01-02', 102, 200.00),
    (3, '2025-01-05', 103, 75.00),
    (4, '2026-02-10', 101, 300.00),
    (5, '2020-02-15', 102, 100.00),
    (6, '2019-02-28', 103, 250.00) ;
    
    
    
-- Migrate data for 2023

SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM Sales_Partitioned WHERE YEAR(OrderDate) = 2023;

-- Example query for sales in 2023

SELECT * FROM Sales_Partitioned
WHERE OrderDate >= '2023-01-01' AND OrderDate < '2024-01-01';


# 2. list partition

create table  class(
course_name varchar(50),
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list(course_launch_year)(
partition p0 values in(2019,2020),
partition p1 values in(2022,2021),
partition p2 values in(2023,2024, 2025)
);

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class';

insert into class values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2020) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SF' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('sap' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('hana' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('DM' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2021),
('mm' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2024),
('sd' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2024),
('fico' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2025),
('hr' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2025);




CREATE TABLE Products_Partitioned (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)) 
    PARTITION BY LIST (Category) (
    PARTITION electronics_part VALUES IN ('Electronics'),
    PARTITION apparel_part VALUES IN ('Apparel'),
    PARTITION accessories_part VALUES IN ('Accessories'),
    PARTITION other_part VALUES IN ("Furniture")
);


-- partition by hash

create table  class1(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 5;

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'class1';


insert into class1 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 112 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 113 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 114 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 116 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 117 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019),
('Dl' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022),
('SF' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('sap' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023),
('hana' , 118 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2023);




# 4. Composite PARTITION



CREATE TABLE Orders_Partitioned (
    OrderID INT,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)
) 
PARTITION BY RANGE (YEAR(OrderDate))
SUBPARTITION BY HASH (CustomerID)
SUBPARTITIONS 4 (
    PARTITION p1 VALUES LESS THAN (2024),
    PARTITION p2 VALUES LESS THAN (2025),
    PARTITION p3 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);


select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'Orders_Partitioned';

INSERT INTO Orders_Partitioned (OrderID, OrderDate, CustomerID, TotalAmount)
VALUES
    (1, '2024-01-01', 4, 150.00) ;
    
    (2, '2024-01-02', 102, 200.00),
    (3, '2025-01-05', 103, 75.00),
    (4, '2027-02-10', 101, 300.00) ;
    ,
    (5, '2023-02-15', 102, 100.00),
    (6, '2023-02-28', 103, 250.00) ;
