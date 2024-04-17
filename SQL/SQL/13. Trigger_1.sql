use class10 ;

create table test2(
c1 varchar(50),
c2 date,
c3 int);

create table test3(
c1 varchar(50),
c2 date,
c3 int );

create table test4(
c1 varchar(50),
c2 date,
c3 int );

insert into test2 values("abc11" , sysdate(), 435456);

delimiter //
create trigger to_delete_others_before_observation
before delete on test2 for each row 
begin
	insert into test3(c1,c2,c3) values (old.c1, old.c2,old.c3);
end; //

delete from test2 where c1 = 'abc11';

set sql_safe_updates = 0

select * from test2;
select * from test3;
select * from test4;



delimiter //
CREATE TRIGGER trigger_name    
    (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
         ON table_name FOR EACH ROW    
         BEGIN    
        --variable declarations    
        --trigger code    
END; 

create table T1(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date);

create table T2(
course_metor_update varchar(50), 
course_price_update int ,
course_discount_update int );


insert into t1 ( 
course_id, course_desc, course_mentor, course_price, course_discount) 
value(102, "FSDA", "sudhanshu", 4000, 10);

select * from t1 ;

delimiter //
create trigger t1_before_insert
before insert
on t1 for each row
begin
	set new.create_date = sysdate();
end; // 

insert into t1 ( 
course_id, course_desc, course_mentor, course_price, course_discount) 
value(103, "FSDA", "sudhanshu", 4000, 10);

delimiter //
create trigger t1_after_insert
after insert
on t1 for each row
begin
	insert into t1 (create_date) values(sysdate());
end; //


insert into t1 ( 
course_id, course_desc, course_mentor, course_price, course_discount) 
value(104, "FSDA", "sudhanshu", 4000, 10);




