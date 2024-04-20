-- constraints

use class10 ;

#Constraints used in MySQL

NOT NULL
CHECK
DEFAULT
PRIMARY KEY
AUTO_INCREMENT
UNIQUE 
INDEX
ENUM
FOREIGN KEY



#NOT NULL Constraint

CREATE TABLE not_null (Id INTEGER, LastName text NOT NULL, FirstName TEXT NOT NULL, City VARCHAR(35));

INSERT INTO not_null VALUES(1, 'Hanks', 'Peter', 'New York');  
INSERT INTO not_null VALUES(1, 'Hanks', null , null);

select * from not_null ;



#UNIQUE Constraint

CREATE TABLE unique_cont(Id INTEGER, BrandName VARCHAR(40) UNIQUE, Size VARCHAR(30));

INSERT INTO unique_cont(Id, BrandName, Size) VALUES(1, 'Pantaloons', 38), (2, 'Cantabil', 40);  
  
INSERT INTO unique_cont(Id, BrandName, Size) VALUES(1, 'Raymond', 38), (2, 'Cantabil', 40); 


#CHECK Constraint

#CHECK(expr)  

CREATE TABLE check_cont(  
    ID int NOT NULL,  
    `Name` varchar(45) NOT NULL,  
    Age int CHECK (Age>=18)  
);  


INSERT INTO check_cont(Id, `Name`, Age)   
VALUES (1,'Robert', 28), (2, 'Joseph', 35), (3, 'Peter', 40);  

INSERT INTO check_cont(Id, `Name`, Age) VALUES (4,'Robert', 15); 



#DEFAULT Constraint


CREATE TABLE default_cont (  
    ID int NOT NULL unique,  
    `Name` varchar(45) NOT NULL,  
    Age int check(age>=18),  
    City varchar(25) DEFAULT 'New York'  
);  

INSERT INTO default_cont (Id, `Name`, Age, City)   
VALUES (1,'Robert', 19, 'Florida'),   
(2, 'Joseph', 35, 'California'),   
(3, 'Peter', 40, 'Alaska');  
  
INSERT INTO default_cont (Id, `Name`, Age, city) VALUES (4,'Brayan', 19, null);  
INSERT INTO default_cont (Id, `Name`, Age) VALUES (5,'Brayan', 19);  
SELECT * FROM default_cont ; 


#AUTO_INCREMENT Constraint
#it works with key column only

CREATE TABLE AUTO_INCR_cont(  
id int NOT NULL AUTO_INCREMENT,   
`name` CHAR(30) NOT NULL default "unknown", 
PRIMARY KEY (id));  

INSERT INTO AUTO_INCR_cont(`name`) VALUES   
('Tiger'),('Dog'),('Penguin'),   
('Camel'),('Cat'),('Ostrich'); 

SELECT * FROM AUTO_INCR_cont; 

INSERT INTO AUTO_INCR_cont(id, `name`) VALUES   
(101,'Camel'); 


#ENUM Constraint

CREATE TABLE ENUM_cont (    
    id INT PRIMARY KEY AUTO_INCREMENT,     
    `name` VARCHAR(35),     
    size ENUM('small', 'medium', 'large', 'x-large')    
);  

INSERT INTO ENUM_cont (id, `name`, size)     
VALUES (4,'t-shirt', "X-small"),     
(2, 'casual-shirt', 'small'),     
(3, 'formal-shirt', 'large'); 

select * from ENUM_cont ;

INSERT INTO ENUM_cont (id, `name`, size)     
VALUES (7,'t-shirt', "L") ;

alter table enum_cont 
modify size ENUM("XS",'small', 'medium', 'large', 'x-large', "XXL", "XXXL") ;

alter table enum_cont 
modify size ENUM("S", "M", "L") ;


create table if not exists infinix (
id int auto_increment,
`name` varchar(20) not null unique,
education enum("B.Com", "B.A.", "B.E.", "PhD"),
salary decimal(10,2) check(salary> 20000),
JD date default "2001-1-1",
university varchar(20) null default "RTMNU",
primary key (id)
) ;

insert into infinix values (11, "arijit", "PhD", 21000, "2001-2-1", "lovely") ;

select * from infinix ;

insert into infinix (`name`, education, salary) 
values ("arjit3", "B.Com", 22000) ;

alter table infinix 
modify university varchar(20) not null ;