use class10 ;

show databases;

show tables;

select * from sales ;

select * from sales where market = "EU" ;

select * from sales where country = "france" and market = "EU" ;

select * from sales where quantity > 400 ;

-- procedure

DELIMITER &&
create procedure proc1(IN var int)
BEGIN
	select * from sales where quantity > var ;
END &&

call proc1(1000) ;

delimiter &&
create procedure proc2 (in var varchar(20), in var1 int)
begin
select region, profit, segment, country, shipping_cost from sales where country = var and  shipping_cost > var1 ;
end &&

drop procedure proc2; 

call proc2("INDIA", 80);


DELIMITER &&
create procedure `ALL`()
BEGIN
	select * from sales;
END &&

call `all`() ;

DELIMITER &&
CREATE PROCEDURE P1 (IN A INT, IN c int, IN B VARCHAR(20),IN D VARCHAR(20))
BEGIN
SELECT country, region, sales, segment, shipping_cost FROM sales WHERE quantity >= A AND profit <= C AND (country = B OR country = D) ;
END &&

call p1(300, 50, "India", "france") ;

DELIMITER &&
CREATE PROCEDURE P2 
(IN A int, IN B varchar(30), IN C Date, IN D varchar(20), IN E varchar(20), IN F float, IN G float )
BEGIN
SELECT Quantity, Ship_mode, order_date_real, country, profit, dicount, segment, region FROM sales
WHERE quantity > A and Ship_mode = B and order_date_real = C and (country = D or County = E) 
and (profit > F or profit = G) ;
END &&

call p2(300, "second class", "2011-05-01", "cuba", "australia", 0.5, 1.0 ) ;















