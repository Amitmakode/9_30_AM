use ddl ;

-- constraint

Primary key
foreign key
unique
not null
index
default
check
enum
auto_increment 


#NOT NULL Constraint

CREATE TABLE Student (Id INTEGER, 
LastName TEXT NOT NULL, 
FirstName TEXT NOT NULL, 
City VARCHAR(35));

select * from student ;

INSERT INTO Student VALUES(1, 'Hanks', 'Peter', 'New York');  
INSERT INTO Student VALUES(2, NULL, 'Amanda', 'Florida');

INSERT INTO Student VALUES(3, "lee", 'Amanda', null);


#UNIQUE Constraint
CREATE TABLE ShirtBrands(Id INTEGER,
BrandName VARCHAR(40) UNIQUE, 
Size VARCHAR(30));

select * from shirtbrands ;

INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Pantaloons', 38), (2, 'Cantabil', 40); 
 
INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, 'Raymond', 38), (2, 'Cantabil1', 40); 

INSERT INTO ShirtBrands(Id, BrandName, Size) VALUES(1, null, 38) ;



-- CHECK Constraint
-- CHECK (expression) 
 
CREATE TABLE Persons (  
    ID int NOT NULL,  
    `Name` varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
);  

select * from persons ;

INSERT INTO Persons(Id, `Name`, Age)   
VALUES (1,'Robert', 28), (2, 'Joseph', 35), (3, 'Peter', 40);  

INSERT INTO Persons(Id, `Name`, Age) VALUES (1, "vijay", null); 


-- DEFAULT Constraint

CREATE TABLE Persons1 (  
    ID int NOT NULL,  
    `Name` varchar(45) NOT NULL,  
    Age int,  
    City varchar(25) DEFAULT 'New York'  
);  

select * from persons1 ;

INSERT INTO Persons1(Id, `Name`, Age, City)   
VALUES (1,"juhi", 15, 'Florida'),   
(2, 'Joseph', 35, 'California'),   
(3, 'Peter', 40, null);  

INSERT INTO Persons1(Id, `Name`, Age) VALUES (1,'Brayan', 15);
  
SELECT * FROM Persons1; 



-- AUTO_INCREMENT Constraint

CREATE TABLE Animals(  
id int AUTO_INCREMENT primary key,   
`name` CHAR(30) NOT NULL 
);  

INSERT INTO Animals (`name`) VALUES   
('Tiger'),('Dog'),('Penguin'),   
('Camel'),('Cat'),('Ostrich'); 

INSERT INTO Animals (id, `name`) VALUES   
(22, 'Tiger'),(101, 'Dog'),(107,'Penguin') ;

SELECT * FROM Animals;



-- ENUM Constraint

CREATE TABLE Shirts (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    `name` VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')  );  
    
CREATE TABLE Shirts1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(35),
    size ENUM('small', 'medium', 'large', 'x-large')  DEFAULT 'small'
);    

INSERT INTO Shirts(id, `name`, size)     
VALUES (1,'t-shirt', 'medium'),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large'),
(4, 'formal-shirt',null); 

INSERT INTO Shirts( `name`, size)     
VALUES ('t-shirt', 'medium'),     
( 'casual-shirt', 'small'),     
('formal-shirt', 'large'),
('formal-shirt',null); 

INSERT INTO Shirts1(`name`)     
VALUES ('t-shirt') ;

select * from shirts ;
select * from customers1 ;


----------------


create table employee (
id int auto_increment primary key,
`name` varchar(20) not null default "unknown",
age int not null check(age >= 18) default 18,
email varchar(20) not null unique,
department enum ("admin", "HR", "sales", "production", "marketing") not null default "marketing" );


insert into employee (`name`, age, email, department)
values ("avantika", 19, "avnt1@gmail.com", "admin") ;

select * from employee ;


