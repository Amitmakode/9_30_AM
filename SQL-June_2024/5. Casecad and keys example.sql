use keyconst ;

## ck with check

CREATE TABLE student_contact1 (
    student_id INT,
    city VARCHAR(100),
    phone_number VARCHAR(20),
    PRIMARY KEY (student_id, city),
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),
        CHECK (LENGTH(phone_number) = 10)  -- Example check constraint
);

INSERT INTO student_contact1 (student_id, city, phone_number) VALUES
(3, 'New York', '55536412343'),
(2, 'Los Angeles', '5554556780');

select * from students ;

select * from student_contact1 ;

## fk with update cascade

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    `name` VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON UPDATE CASCADE
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Marketing');

INSERT INTO employees (employee_id, `name`, department_id) VALUES
(101, 'John Doe', 1),
(102, 'Jane Smith', 2);

-- Updating the department_id in departments table will cascade update in employees table

UPDATE departments SET department_id = 3 WHERE department_id = 1;


select * from departments;

select * from employees;

## fk with multiple column

CREATE TABLE department (
    department_id INT,
    city VARCHAR(100),
    phone_number VARCHAR(20),
    employee_id int,
    PRIMARY KEY (department_id, employee_id) 
) ;

INSERT INTO department (department_id, city, phone_number, employee_id) 
VALUES (1, 'pune',"34523452", 102);

CREATE TABLE employees1 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id, manager_id)
        REFERENCES department(department_id, employee_id)
);

select * from department ;
select * from employees1 ;

INSERT INTO employees1 (employee_id, first_name, last_name, department_id, manager_id) 
VALUES (1, 'John', 'Doe', 1, 102);


UPDATE employees SET department_id = 102 WHERE employee_id = 1 AND manager_id = 102;


DELETE FROM departments WHERE department_id = 101 AND employee_id = 1;

CREATE TABLE departments1 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    employee_id INT,
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);

# delete and update casecad

CREATE TABLE customer_key (  
  ID INT AUTO_INCREMENT,  
  `Name` varchar(50) NOT NULL,  
  City varchar(50) NOT NULL,  
  PRIMARY KEY (ID)  
);  



CREATE TABLE contact_key (  
  ID INT,  
  Customer_Id INT,  
  Customer_Info varchar(50) NOT NULL,  
  `Type` varchar(50) NOT NULL,  
  INDEX par_ind (Customer_Id),  
  CONSTRAINT fk_custom FOREIGN KEY (Customer_Id)  
  REFERENCES customer_key(ID)  
  ON DELETE CASCADE  
  ON UPDATE CASCADE  
); 

insert into customer_key values(1, "avantika", "ngp"), (2, "vijay", "amravati"),(3, "pranjali", "old nagpur") ;


insert into contact_key values(1, 2, "invailid", "unknown"), (2, 1, "invailid", "unknown"),(3, 3, "invailid", "unknown") ;

select * from customer_key;
select * from contact_key ;

update contact_key set customer_id = 4 where id = 3;

update customer_key set ID = 4 where id = 3 ;

set sql_safe_updates = 0;

delete from customer_key where id = 4 ;


## e-commerce example

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Orders table with foreign keys
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items table linking orders to products
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting sample data
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO products (product_name, price) VALUES
('Laptop', 999.99),
('Smartphone', 599.99),
('Tablet', 299.99);

-- Placing orders
INSERT INTO orders (customer_id) VALUES (1);

-- Adding items to orders
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),  -- 2 laptops
(1, 2, 3);  -- 3 smartphones



## healthcare example

-- Patients table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other')
);

-- Doctors table
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100)
);

-- Appointments table with composite key and foreign keys
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date TIMESTAMP,
    PRIMARY KEY (patient_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Prescriptions table linking prescriptions to patients
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medication VARCHAR(100),
    dosage VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Inserting sample data
INSERT INTO patients (first_name, last_name, date_of_birth, gender) VALUES
('John', 'Doe', '1980-05-15', 'Male'),
('Jane', 'Smith', '1990-08-20', 'Female');

INSERT INTO doctors (first_name, last_name, specialization) VALUES
('Dr. Michael', 'Johnson', 'Cardiologist'),
('Dr. Emily', 'Davis', 'Pediatrician');

-- Scheduling appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date) VALUES
(1, 1, '2023-06-15 10:00:00'),
(2, 2, '2023-06-20 11:30:00');

-- Prescribing medications
INSERT INTO prescriptions (patient_id, doctor_id, medication, dosage) VALUES
(1, 1, 'Aspirin', '100mg daily'),
(2, 2, 'Amoxicillin', '250mg three times a day');


## librabry manament example

-- Authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100),
    nationality VARCHAR(50)
);

-- Books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Borrowings table with composite key and foreign keys
CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrowing_date DATE,
    due_date DATE,
    returned_date DATE,
    PRIMARY KEY (member_id, book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Reservations table linking reservations to members and books
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    reservation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Inserting sample data
INSERT INTO authors (author_name, nationality) VALUES
('Jane Austen', 'British'),
('Mark Twain', 'American');

INSERT INTO books (title, author_id, publication_year) VALUES
('Pride and Prejudice', 1, 1813),
('The Adventures of Tom Sawyer', 2, 1876);

INSERT INTO members (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

-- Borrowing books
INSERT INTO borrowings (member_id, book_id, borrowing_date, due_date) VALUES
(1, 1, '2023-06-01', '2023-06-15'),
(2, 2, '2023-06-05', '2023-06-20');

-- Reserving books
INSERT INTO reservations (member_id, book_id) VALUES
(1, 2),
(2, 1);


## online retail example

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Orders table with foreign key
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items table linking orders to products
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inserting sample data
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO products (product_name, price) VALUES
('Laptop', 999.99),
('Smartphone', 599.99),
('Tablet', 299.99);

-- Placing orders
INSERT INTO orders (customer_id) VALUES (1);

-- Adding items to orders
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 999.99),  -- 2 laptops
(1, 2, 3, 599.99);  -- 3 smartphones




## on delete and on update 


-- Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Employees table with foreign key and ON DELETE CASCADE
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE CASCADE
);

-- Inserting sample data
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Marketing');

INSERT INTO employees (employee_id, employee_name, department_id) VALUES
(101, 'John Doe', 1),
(102, 'Jane Smith', 2),
(103, 'Michael Johnson', 1);

-- Deleting a department will automatically delete associated employees due to ON DELETE CASCADE
DELETE FROM departments WHERE department_id = 2;

-- Viewing employees after deletion
SELECT * FROM employees;



##

-- Updating the department_id in departments table will cascade update in employees table
UPDATE departments SET department_id = 3 WHERE department_id = 1;

-- Viewing updated employees
SELECT * FROM employees;

