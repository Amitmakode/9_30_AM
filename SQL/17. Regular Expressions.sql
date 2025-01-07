use bulk_load ;

show tables ;

SELECT job FROM bank WHERE job REGEXP '^[ab]';

SELECT job FROM bank WHERE job REGEXP "^s" ;

SELECT job FROM bank WHERE job REGEXP "t$" ;

SELECT job FROM bank WHERE job REGEXP "[tn]$" ;

SELECT * FROM bank WHERE job REGEXP '^.{6}$';

SELECT job FROM bank WHERE job REGEXP '-'; 

SELECT balance FROM bank WHERE balance REGEXP 23 ;

SELECT balance FROM bank WHERE balance REGEXP '^33';  

SELECT ('a' NOT REGEXP '[a-z]') AS not_match ;

SELECT REGEXP_INSTR('a b c d e f', 'b', 1, 1, 0) AS start_index_;

SELECT REGEXP_INSTR('a b c b d b e f a', 'b', 1, 3, 0) AS a_index_2 ;  

SELECT REGEXP_INSTR('artificial', 'i', 5, 2, 0) AS a_index_2 ; 


SELECT job, education, balance 
FROM bank   
WHERE education RLIKE 's$|n$'; 

SELECT job, education, balance 
FROM bank   
WHERE job RLIKE 's$|n$'; 

SELECT job, education, balance 
FROM bank   
WHERE job RLIKE '^b|n$'; 

SELECT job, education, balance 
FROM bank   
WHERE job RLIKE '^u|d$'; 


SELECT   
'Javatpoint' RLIKE '^C | e$' AS 'RLIKE',  
'Javatpoint' NOT RLIKE '^C | e$' AS 'NOT RLIKE';

SELECT job, balance
FROM bank   
WHERE job RLIKE 'm........'; 

SELECT   
'Javatpoint' LIKE 'Java%' AS 'Match',  
'Javatpoint' NOT LIKE 'Java%' AS 'Not-Match'; 

SELECT  job from bank where job LIKE 'm%';

SELECT * FROM bank WHERE job LIKE '%t';

SELECT * FROM bank WHERE job LIKE 'r%d';

SELECT * FROM bank WHERE job LIKE 'manag_____';

