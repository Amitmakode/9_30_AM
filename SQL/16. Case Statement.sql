use bulk_load ;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
);


INSERT INTO employees (employee_id, employee_name, salary, department)
VALUES
    (11, 'John Doe', 50000, 'HR'),
    (21, 'Jane Smith', 60000, 'IT'),
    (31, 'Michael Johnson', 55000, 'Finance'),
    (41, 'Emily Davis', 52000, 'IT'),
    (51, 'Chris Lee', 58000, 'HR');
    
    
select * from employees ;   

SELECT employee_name, salary,
case
	WHEN salary < 55000 THEN 'Low'
	WHEN salary >= 55000 AND salary < 60000 THEN 'Medium'
	ELSE 'High'
END AS salary_category
from employees ;


SELECT employee_name, department,salary,
    CASE department
        WHEN 'HR' THEN 'Human Resources'
        WHEN 'IT' THEN 'Information Technology'
        WHEN 'Finance' THEN 'Finance Department'
        ELSE 'Other'
    END AS department_category
FROM
    employees;
    
show tables ;    

select * from bank ;

select job, age,
case 
	when age < 18 then "teenagers"
    when   age >=  18 and age <= 59 then "adults"
    else "seniorCitizen"
end as age_category
from bank ;   

alter table bank
add column age_cat varchar(20) after age ;  


update bank
set age_cat = case
	when age < 25 then "teenagers"
    when   age >=  25 and age <= 55 then "adults"
    else "seniorCitizen"
    end ;
    
delete from employees 
where department = case 
						when department = "HR" and department = 'Finance' then 1
                        else 0
					end = 1; 
                    
                    
DELETE FROM employees
WHERE department = CASE
                    WHEN department = 'HR' THEN 'HR'
                    WHEN department = 'Finance' THEN 'Finance'
                    ELSE NULL
                   END;
                   

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
    orders;
    
    
    
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO customers (customer_id, customer_name)
VALUES
    (1, 'Alice Smith'),
    (2, 'Bob Johnson'),
    (3, 'Charlie Brown'),
    (4, 'David Williams'),
    (5, 'Eve Davis'),
    (6, 'Frank Miller'),
    (7, 'Grace Wilson'),
    (8, 'Henry Moore'),
    (9, 'Ivy Taylor'),
    (10, 'Jack Anderson');
    
INSERT INTO orders1 (order_id, customer_id, order_amount)
VALUES
    (1, 1, 200.00), (2, 1, 150.00), (3, 1, 100.00), (4, 1, 550.00), (5, 2, 30.00),
    (6, 2, 200.00), (7, 2, 50.00), (8, 2, 300.00), (9, 3, 400.00), (10, 3, 600.00),
    (11, 3, 100.00), (12, 4, 700.00), (13, 4, 50.00), (14, 4, 200.00), (15, 5, 120.00),
    (16, 5, 50.00), (17, 5, 20.00), (18, 6, 800.00), (19, 6, 100.00), (20, 6, 300.00),
    (21, 7, 50.00), (22, 7, 120.00), (23, 7, 90.00), (24, 8, 450.00), (25, 8, 150.00),
    (26, 9, 30.00), (27, 9, 90.00), (28, 9, 60.00), (29, 10, 200.00), (30, 10, 300.00);
    
    

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_spent,
    case 
    when  SUM(o.order_amount) < 1000 then "low"
	when  SUM(o.order_amount) >=1000 and SUM(o.order_amount) < 2000 then "medium"
    else "High"
   end as spend_cat 
FROM
    customers c
LEFT JOIN
    orders1 o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name
ORDER BY
      total_spent DESC;
   

    
        
    
                    