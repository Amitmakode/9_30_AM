use class10 ;

show tables ;

select * from bank ;

select count(*) from bank ;

select job, marital from bank where marital = "married" ;

select job, marital, education from bank where marital = "married" and education = "primary" ;

select job, marital, education from bank where marital = "married" or education = "primary" ;

-- procedure 

-- limitation : procedure only works on single table


delimiter &&
create procedure job_education(IN A varchar(20), IN B varchar(20))
begin 
select * from bank where job = A and education = B ;
end &&


delimiter &&
create procedure job_education(IN A varchar(20), IN B varchar(20))
begin 
select age, job, education from bank where job = A and education = B ;
end &&

DELIMITER &&
create procedure all_data()
BEGIN
	select * from bank;
END && 


call job_education ("admin.", "unknown") ;


delimiter &&
create procedure multicolumn(IN A varchar(20), IN B varchar(20), IN C int)
begin 
select age, job, education from bank where job = A and education = B and age > C ;
end &&

call multicolumn("services", "secondary", 40 ) ;

select * from bank where age between 20 and 50 ;


DELIMITER &&
CREATE PROCEDURE P2 (IN A INT, IN c int, IN B VARCHAR(20),IN D VARCHAR(20))
BEGIN
SELECT AGE, JOB, BALANCE FROM BANK WHERE AGE >= a AND BALANCE <= C AND (JOB = B OR JOB = D) ;
END &&

call p2 (30, 300, "services", "management") ;

DELIMITER &&
CREATE PROCEDURE P1 (IN A INT, IN B VARCHAR(20), IN c int, IN D VARCHAR(20))
BEGIN
SELECT AGE, JOB, BALANCE FROM BANK WHERE AGE >= a AND BALANCE <= C AND (JOB = b OR JOB = D) ;
END &&

call p1 (30, "services", 300, "management") ;


DELIMITER &&
create procedure ALL_data()
BEGIN
	select * from bank;
END &&  


call all_data() ;












