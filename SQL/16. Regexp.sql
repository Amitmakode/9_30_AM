use class10 ;
show tables ;

SELECT job FROM bank WHERE job REGEXP '^[ab]';  
SELECT job FROM bank WHERE job REGEXP '^[a]';  
SELECT job FROM bank WHERE job REGEXP '^[arbu]';  
SELECT job FROM bank WHERE job REGEXP '^r';
SELECT job FROM bank WHERE job REGEXP 'd$';
SELECT job FROM bank WHERE job REGEXP '[nd]$';


SELECT job FROM bank WHERE job REGEXP '-'; 
SELECT job FROM bank WHERE job REGEXP '.'; 
SELECT job FROM bank WHERE job REGEXP 'f'; 
SELECT job FROM bank WHERE job REGEXP 'ti'; 


SELECT balance FROM bank WHERE balance REGEXP 43 ; 
SELECT balance FROM bank WHERE balance REGEXP "^[43]" ; 


SELECT ('a' NOT REGEXP '[a-z]') AS not_match;
SELECT ('a'  REGEXP '[a-z]') AS not_match;

SELECT REGEXP_INSTR('a b c d e f', 'b', 4, 1, 0) AS start_index_; 

SELECT REGEXP_INSTR('a b c d a e f a', 'a', 1, 2, 0) AS a_index_2; 


SELECT job, education, balance 
FROM bank   
WHERE education RLIKE 's$|y$';  

SELECT job, education, balance 
FROM bank   
WHERE education RLIKE 'n$|y$';  

SELECT job, education, balance 
FROM bank   
WHERE job RLIKE 't$|d$'; 

SELECT job, education, balance 
FROM bank where job = "retired" and education = "primary" ;

SELECT job, education, balance 
FROM bank   
WHERE job RLIKE 't$|d$' and education rlike "^P|^s"; 

SELECT job, education, balance 
FROM bank   
WHERE job RLIKE 't$|d$' and education rlike "^P|^s"  and balance rlike "^4|3$"  ; 


SELECT job, education, balance 
FROM bank   
WHERE job RLIKE '^u|d$'; 


SELECT   
'Javatpoint' RLIKE '^C | e$' AS 'RLIKE',  
'Javatpoint' NOT RLIKE '^C | e$' AS 'NOT RLIKE';

SELECT job, balance
FROM bank   
WHERE job RLIKE 'ad.in.'; 


SELECT job, balance
FROM bank   
WHERE job RLIKE 'reti..d'; 

SELECT job, balance,marital FROM bank   
WHERE marital RLIKE 's....e';  

SELECT   
'Javatpoint' LIKE 'Java%' AS 'Match',  
'Javatpoint' NOT LIKE 'Java%' AS 'Not-Match'; 

SELECT job from bank where job LIKE 'ent%';

SELECT job from bank where job LIKE 'a%.';

SELECT job from bank where job LIKE 'b%r';

SELECT job from bank where job LIKE '%n';

SELECT * FROM bank WHERE job LIKE 'admin_';

SELECT job from bank where job LIKE 'reti_d';

SELECT job from bank where job LIKE 'reti__d';

SELECT job from bank where job LIKE 'reti..d';

SELECT job from bank where job RLIKE 'reti__d';


