create database bulk_load ;

use bulk_load ;

select * from bank ;

commit ;


CREATE TABLE sales (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL);
    
    
SET SESSION sql_mode = '';    
    
load data infile 
"F:/Dataset/sales_data_final.csv"
into table sales
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;  

select * from sales ;  

select str_to_date(order_date, "%m/%d/%Y") as order_date_new from sales ;

alter table sales
add column new_order_date date after order_id ; 

update sales
set new_order_date = str_to_date(order_date, "%m/%d/%Y") ;


create view new_sales as select new_order_date, ship_mode, country, sub_category, sales, quantity, discount, profit, shipping_cost from sales ;


select * from new_sales ;





