use practice ;


DELIMITER $$
create function FUN1(A INT) 
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE B int ;
	set B = A + 10 ;
	return B ;
end $$

select * from dress ;

select fun1(rating) from dress ;


DELIMITER $$
create function FUN2(p int, d int )
returns int
Deterministic
Begin 
Declare FP int ;
set FP = p - d ;
return FP;
end $$



select * from bank ;

select fun2(profit, discount) from sales ;


Delimiter &&
create function fun3(bal int)
returns int
deterministic
begin
declare dbal int ;
set dbal = bal-100 ;
return dbal ;
end &&


select balance, fun3(balance) from bank ;

DELIMITER $$
create function FUN3(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6) )
returns decimal
Deterministic
Begin 
Declare final_profit int ;
set final_profit = profit - sales * discount;
return final_profit;
end $$



DELIMITER $$
create function FUN4(F VARCHAR(20), L VARCHAR(20) )
returns int
Deterministic
Begin 
Declare FN int ;
set FN = concat(F, L);
return FN;
end $$


select employee_name, department, fun4(employee_name, department) from employees ;











