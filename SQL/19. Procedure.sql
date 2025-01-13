use bulk_load ;

show tables ;

Delimiter @@ 
create procedure select_all ()
begin
	SELECT * FROM BANK	;
End @@    

call select_all() ;

select * from bank where age = 45 and job = "admin." and marital = "married" ;


Delimiter @@

create procedure pro2 (IN A int, IN B varchar(20), IN C varchar(20))
begin
	select * from bank where age = A and job = B and marital = C ;
end @@    

select * from sales ;


call pro2(25, "student", "married") ;


Delimiter @@

create procedure pro3(IN A varchar(20))
Begin
	select sales, Quantity, (sales*quantity) as total_sales from sales where ship_mode = A;
end @@    


call pro3 ("second class", 50) ;



    

