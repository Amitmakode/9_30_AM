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

