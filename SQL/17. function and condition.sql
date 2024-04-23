use class10 ;

DELIMITER $$
create function add_col(a INT)
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE b int ;
	set b = a + 10 ;
	return b ;
end $$


show tables ;

select * from bank ;

select max(age), min(balance) from bank ;

select age, add_col(age) from bank ;

select  add_col(10);


use amit ;

DELIMITER $$
create function final_profits(profit int , discount int )
returns int
Deterministic
Begin 
Declare fp int ;
set fp = profit - discount ;
return fp;
end $$

select * from sdf ;

select profit,discount, final_profits(profit, discount) from sdf ;

DELIMITER $$
create function final_profits_real(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6) )
returns decimal
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - sales * discount;
return final_profit;
end $$

1+1 = 2  -- add
'1'+'1' = 11 -- concat

2*2 = 4  -- multiple
'2'*4 = 2222   -- repeat


DELIMITER $$
create function int_to_str(a INT)
returns varchar(20)
Deterministic
BEGIN 
DECLARE b varchar(20);
set b = a;
return b;
end $$

select * from sdf ;

select quantity, int_to_str(quantity) from sdf ;

-- function 

1  - 100 - super affordable product 
100 -300 - affordable 
300 - 600 - moderate price 
600 + - expensive 

1- 5 - toddler 
5 - 10 - kids
10 - 18 - tenagers
18 - 30 - young
30 - 60 - man
60 -70 - senior citizen 
70 + - super senior


DELIMITER &&
create function mark_sales(a int) 
returns varchar(30)
DETERMINISTIC
begin 
declare b varchar(30); 
if a  <= 100  then 
	set b = "super affordable product" ;
elseif a > 100 and a < 300 then 
	set b = "affordable" ;
elseif a >300 and a < 600 then 
	set b = "moderate price" ;
else 
	set b = "expensive" ;
end if ;
return b;
end &&


select sales, mark_sales(sales) from sdf ;


DELIMITER &&
create function mark_sales1(a int) 
returns varchar(30)
DETERMINISTIC
begin 
declare b varchar(30); 
if a  <= 100  then 
	set b = "super affordable product" ;
elseif a > 100 and a <= 300 then 
	set b = "affordable" ; 
elseif a =  300 then 
	set b = "affordable with 300" ;    
elseif a >300 and a < 600 then 
	set b = "moderate price" ;
else 
	set b = "expensive" ;
end if ;
return b;
end &&


delimiter &&
create function age_cat(a int)
returns int
Deterministic
Begin
declare b int;
if a <=5 then
	set b = "toddler";
elseif a > 5 and a < 10 then
	set b = "kids";
elseif a >= 10 and a < 18 then
	set b = "Teenagers";
elseif a >=18 and a < 30 then
	set b = "adults";
elseif a >= 30 and a < 60 then
	set b = "man";
else
	set b = "senior citizen";
end if;
return b;
END &&



delimiter &&
create function age_cat1(a int)
returns varchar(20)
Deterministic
Begin
declare b varchar(20);
if a <=5 then
	set b = "toddler";
elseif a > 5 and a < 10 then
	set b = "kids";
elseif a >= 10 and a < 18 then
	set b = "Teenagers";
elseif a >=18 and a < 30 then
	set b = "adults";
elseif a >= 30 and a < 60 then
	set b = "man";
else
	set b = "senior citizen";
end if;
return b;
END &&

select age, age_cat1(age) from bank ;

select * from dress ;

delimiter &&
create function categories(a varchar(20))
returns int
Deterministic
Begin
declare b int;
if a = "low" then
	set b = 100 ;
elseif a = "average" then
	set b = 1000 ;
else
	set b = 2000 ;
end if;
return b;
END &&

select * from dress ;

select price, categories(price) from dress ;


