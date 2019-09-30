1
CREATE TABLE category 
  ( 
     catcode CHAR(2), 
     catdesc VARCHAR2(10) 
  ); 

2)
CREATE TABLE employees 
  ( 
     emp#      NUMBER(5), 
     lastname  VARCHAR2(50), 
     firstname VARCHAR2(20), 
     job_class VARCHAR2(4) 
  ); 

3)
ALTER TABLE employees 
  ADD (empdate DATE DEFAULT SYSDATE, enddate DATE); 

4)
ALTER TABLE employees 
  MODIFY (job_class CHAR(2)); 

5)
ALTER TABLE employees 
  DROP COLUMN enddate; 

6)
RENAME employees TO jl_emps; 

7)
CREATE TABLE book_pricing AS 
  (SELECT isbn AS ID, 
          cost, 
          retail, 
          category 
   FROM   books); 

8)
ALTER TABLE book_pricing 
  SET unused (category); 

desc book_pricing; 

9)
TRUNCATE TABLE book_pricing; 

SELECT * 
FROM   book_pricing; 

10)
DROP TABLE book_pricing PURGE;

DROP TABLE jl_emps;

FLASHBACK TABLE jl_emps TO BEFORE DROP;

DESC jl_emps;
