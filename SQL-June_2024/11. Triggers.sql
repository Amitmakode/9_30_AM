-- (after/before) (insert/update/delete)


# After Insert


create table trigger1 (
c1 varchar(50),
c2 date,
c3 int);


create table trigger2 (
c11 varchar(50),
c12 date,
c13 int);

insert into trigger1 value ("java", "2000-12-12", 500) ;
insert into trigger2 value ("java1", "2000-12-12", 501) ;

select * from trigger1 ;
select * from trigger2 ;



delimiter //
create trigger t1_to_t2
after insert on trigger1 for each row 
begin
	insert into trigger2 (c11,c12,c13) values ("xyz", sysdate(), 120);
end; //



insert into trigger1 value ("java", "2000-12-12", 500) ;


create table trigger3 (
c14 varchar(50),
c15 date,
c16 int);


delimiter //
create trigger t1_to_t3
after insert on trigger1 for each row 
begin
	insert into trigger3 (c14,c15,c16) values ("pqrs", sysdate(), 100);
end; //


select * from trigger3 ;

-----------------------------------------------------------------------------


# Before Insert


create table trigger11 (
c1 varchar(50),
c2 date,
c3 int);


create table trigger12 (
c11 varchar(50),
c12 date,
c13 int);


insert into trigger11 value ("java", "2000-12-12", 500) ;
insert into trigger12 value ("java1", "2000-12-12", 501) ;


select * from trigger11 ;
select * from trigger12 ;
select * from trigger13 ;


delimiter //
create trigger t11_to_t12
before insert on trigger11 for each row 
begin
	insert into trigger12 (c11,c12,c13) values ("xyz", sysdate(), 120);
end; //


insert into trigger11 value ("java", "2000-12-12", 500) ;



create table trigger13 (
c11 varchar(50),
c12 date,
c13 int);


delimiter //
create trigger t11_to_t13
after insert on trigger11 for each row 
begin
	insert into trigger13 (c11,c12,c13) values (user(), sysdate(), 120);
end; //





select now()

select @current_user 

select user()

select current_time()


-------------------------------------------------



# after update

create table u1 (
c1 varchar(50),
c2 date,
c3 int);


create table u2 (
c11 varchar(50),
c12 date,
c13 int);

insert into u1 value ("java", "2000-12-12", null) ;
insert into u2 value ("java1", "2000-12-12", 501) ;


select * from u1 ;
select * from u2 ;


delimiter //
create trigger u1_to_u2
before update on u1 for each row 
begin
	insert into u2 (c11,c12,c13) values ("xyz", sysdate(), 120);
end; //


insert into u1 values ("abc", "2000-12-11", 4554) ;

update u1 set c3 = 111 where c1 = 'java' ;

select * from u1 ;
select * from u2 ;


set sql_safe_updates = 0 ;


--------------------------------------------


# after update

create table u11 (
c1 varchar(50),
c2 date,
c3 int);


create table u12 (
c11 varchar(50),
c12 date,
c13 int);

insert into u11 value ("java", "2000-12-12", null) ;
insert into u12 value ("java1", "2000-12-12", 501) ;


select * from u11 ;
select * from u12 ;


delimiter //
create trigger u11_to_u12
after update on u11 for each row 
begin
	insert into u12(c11,c12,c13) values ("xyz", sysdate(), 120);
end; //


update u11 set c3 = 80 where c1 = 'java' ;


create table u13 (
c11 varchar(50),
c12 date,
c13 int);


insert into u13 values ("abc", "2000-12-11", 4554) ;

delimiter //
create trigger u11_to_u13
after update on u11 for each row 
begin
	delete from u13 where c11 = "abc" ;
end; //


select * from u11 ;
select * from u12 ;
select * from u13 ;


------------------------------------------------------------------

# before delete


create table d1 (
c1 varchar(50),
c2 date,
c3 int);


create table d2 (
c11 varchar(50),
c12 date,
c13 int);

insert into d1 value ("java", "2000-12-12", 88) ;
insert into d2 value ("java1", "2000-12-12", 501) ;


select * from d1 ;
select * from d2 ;


delimiter //
create trigger d1_to_d2
before delete on d1 for each row 
begin
	insert into d2 (c11,c12,c13) values ("xyz", sysdate(), 120);
end; //


delete from d1 where c1 = "java" ;

select * from d1 ;
select * from d2 ;

set sql_safe_updates = 0 


-------------------------------------------------

# After delete


create table d11 (
c1 varchar(50),
c2 date,
c3 int);


create table d12 (
c11 varchar(50),
c12 date,
c13 int);

insert into d11 value ("java2", "2000-12-12", 88) ;
insert into d12 value ("java1", "2000-12-12", 501) ;


select * from d11 ;
select * from d12 ;


delimiter //
create trigger d11_to_d12
after delete on d11 for each row 
begin
	insert into d12 (c11,c12,c13) values ("xyz1", sysdate(), 120);
end; //


delete from d11 where c1 = "java" ;

select * from d11 ;
select * from d12 ;


---------------------------------------------------



create table t1 (
c1 varchar(50),
c2 date,
c3 int);


create table t2(
c1 varchar(50),
c2 date,
c3 int);


create table t3 (
c1 varchar(50),
c2 date,
c3 int);

create table t4 (
c1 varchar(50),
c2 date,
c3 int);


insert into t1 value ("py", "2000-12-12", 44) ;

insert into t2 value ("java1", "2000-12-12", 501) ;


select * from t1 ;
select * from t2 ;
select * from t3 ;
select * from t4 ;



delimiter //
create trigger tp1_to_t2
after insert on t1 for each row 
begin
	insert into t2 (c1, c2, c3) values (new.c1, new.c2, new.c3) ;
end ; //  



insert into t1 value ("ruby", "2000-07-12", 22) ;


delimiter // 
create trigger tp1_to_t3 
after update on t1 for each row
begin
	insert into t3 (c1,c2,c3) values (user(), date(now()), hour(current_time())) ;
end ; //    


update t1 
set c1 = "C" where c1 = "ruby" ;


delimiter //
create trigger tp1_to_t4 
after delete on t1 for each row
begin
	insert into t4 (c1, c2, c3) values (old.c1, old.c2, old.c3) ;
end ; // 


delete from t1 
where c1 = "c" ;


  
  


    
select date(now())  ;

select date() ;

select sysdate() ; 

select hour(current_time()) ;


select now() ;

select @current_user  ;

select user() ;

select current_time() ;

Delimiter //
CREATE TRIGGER before_insert_products
BEFORE INSERT ON products FOR EACH ROW
BEGIN
    INSERT INTO inventory_log (product_id, `action`, action_timestamp)
    VALUES (NEW.product_id, 'INSERT', NOW());
END;



delimiter //
CREATE TRIGGER after_update_products
AFTER UPDATE ON products FOR EACH ROW
BEGIN
    INSERT INTO inventory_log (product_id, `action`, action_timestamp)
    VALUES (NEW.product_id, 'UPDATE', NOW());
END;



delimiter //
CREATE TRIGGER before_delete_products
BEFORE DELETE ON products FOR EACH ROW
BEGIN
    INSERT INTO inventory_log (product_id, `action`, action_timestamp)
    VALUES (OLD.product_id, 'DELETE', NOW());
END;




delimiter //
CREATE TRIGGER before_insert_products
BEFORE INSERT ON products FOR EACH ROW
BEGIN
    -- Check if the quantity_in_stock is not negative
    IF NEW.quantity_in_stock < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantity in stock cannot be negative';
    END IF;

    -- Log the insertion into inventory_log
    INSERT INTO inventory_log (table_name, record_id, action, action_timestamp, user_id)
    VALUES ('products', NEW.product_id, 'INSERT', NOW(), @current_user);
END;




delimiter //
CREATE TRIGGER after_update_products
AFTER UPDATE ON products FOR EACH ROW
BEGIN
    -- Calculate the change in quantity
    DECLARE delta_quantity INT;
    SET delta_quantity = NEW.quantity_in_stock - OLD.quantity_in_stock;

    -- Update the last_updated timestamp
    UPDATE products SET last_updated = NOW() WHERE product_id = NEW.product_id;

    -- Log the update action into inventory_log
    INSERT INTO inventory_log (`table_nam`, record_id, `action`, action_timestamp, user_id)
    VALUES ('products', NEW.product_id, 'UPDATE', NOW(), @current_user);

    -- Adjust sales records if inventory quantity changes
    IF delta_quantity <> 0 THEN
        UPDATE sales
        SET quantity_sold = quantity_sold + delta_quantity,
            sale_amount = sale_amount + (delta_quantity * NEW.unit_price)
        WHERE product_id = NEW.product_id;
    END IF;
END;

select table_name



delimiter //
CREATE TRIGGER before_delete_products
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
    -- Ensure the product is not referenced in any sales records
    DECLARE sale_count INT;
    SELECT COUNT(*) INTO sale_count FROM sales WHERE product_id = OLD.product_id;
    
    IF sale_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete product with sales records';
    END IF;

    -- Log the deletion action into inventory_log
    INSERT INTO inventory_log (`table_name`, record_id, `action`, action_timestamp, user_id)
    VALUES ('products', OLD.product_id, 'DELETE', NOW(), @current_user);
END; //



delimiter //
CREATE TRIGGER after_insert_sales
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    -- Update the quantity_in_stock in products table
    UPDATE products
    SET quantity_in_stock = quantity_in_stock - NEW.quantity_sold,
        last_updated = NOW()
    WHERE product_id = NEW.product_id;

    -- Log the sale action into inventory_log
    INSERT INTO inventory_log (`table_name`, record_id, `action`, action_timestamp, user_id)
    VALUES ('sales', NEW.sale_id, 'INSERT', NOW(), @current_user);
END; //



