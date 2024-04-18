use class10; 

select * from course ;
select * from student_join ;

#CTE common table expression

select * from course where course_id in (101,102,106, 108);

with sample_students as 
(select * from course where course_id in (101,102,106, 108))
select * from sample_students where course_tag in('java', "bc", "language");


select * from course where course_id in (101,102,106, 108) and course_tag in('java', "bc", "language");

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student_join s;

with outcoume_cross as 
(select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id 
from course c
cross  join student_join s ) 
select course_id , course_name ,student_id from outcoume_cross where student_id = 301;


select 1 as col1, 2 as col2; 

select 1 as col1, 2 as col2 
union all
select 5, 4;

with ctetest as (select 1 as col1, 2 as col2 
union all
select 3, 4)
select col1 from ctetest;

-- recursive cte

with recursive cte(n) as 
(select 1 
union all 
select n+1 from cte where n<10)
select * from cte;

with recursive cte(n) as 
(select 1 
union all 
select n+2 from cte where n<10)
select * from cte;


select 1 as n, 2 as p, -1 as q ;

with recursive cte as (select 1 as n, 2 as p, -1 as q
union all 
select n+1, p+2, q+4 from cte where n<10 and p<12)
select * from cte;

select 1 as p, 2 as q
union all 
select 1 , 2  ;


with recursive cte as (select 1 as P, 2 as q
union all 
select p+1 , q+2 from cte where p<10)
select * from cte;

with recursive cte as (select 1 as P, 2 as q
union all 
select p+1 , q+2 from cte where p<10 )
select * from cte;


with recursive cte as (select 1 as p, 2 as q
union all 
select p+1, q*2 from cte where q<20)
select * from cte;

select * from bank ;

select count(*) from bank ;

alter table bank
add ID int first ;

with recursive age_cte as (select 1 as id from bank 
union all 
select id +1 from age_cte where id<20)
select * from age_cte ;

WITH RECURSIVE age_cte AS (
    SELECT 1 AS id
    FROM bank
    WHERE id IS NULL
    UNION ALL
    SELECT id + 1
    FROM age_cte
    WHERE id < 10
)
SELECT * FROM age_cte;


WITH RECURSIVE age_cte AS (
    SELECT 1 AS id
    FROM dual -- Assuming 'dual' is a table available in your database, otherwise, replace it with any other suitable table
    UNION ALL
    SELECT id + 1
    FROM age_cte
    WHERE id < 13824 -- Adjust this condition as per your requirement
)
SELECT * FROM age_cte;


SET @@cte_max_recursion_depth = 20000; -- Set the maximum recursion depth to 2000 or any other suitable value

WITH RECURSIVE age_cte AS (
    SELECT 1 AS id
    FROM dual -- Assuming 'dual' is a table available in your database, otherwise, replace it with any other suitable table
    UNION ALL
    SELECT id + 1
    FROM age_cte
    WHERE id < 1000 -- Adjust this condition as per your requirement
)
UPDATE bank b
JOIN age_cte a ON b.id = a.id
SET b.ID = a.id; -- Replace 'new_column' with the name of the column you want to add the sequence to



