--1 

CREATE VIEW contact AS 
SELECT contact, 
       phone 
FROM   publisher; 

--2

CREATE OR replace VIEW contact AS SELECT contact, 
       phone 
FROM   publisher WITH read only; 

--3

CREATE force VIEW lab11 AS SELECT col1, 
       col2 
FROM   firstattempt; 

--4

DESC lab11; 

--5

CREATE VIEW reorderinfo AS 
SELECT isbn, 
       title, 
       contact, 
       phone 
FROM   books 
JOIN   publisher 
using (pubid); 

--6

UPDATE reorderinfo 
SET    contact='luis suarez' 
WHERE  contact='renee smith'; 

--SQL Error: ORA-01779: cannot modify a column which maps to a non key-preserved table
--01779. 00000 -  "cannot modify a column which maps to a non key-preserved table"
--*Cause:    An attempt was made to insert or update columns of a join view which
--           map to a non-key-preserved table.
--*Action:   Modify the underlying base tables directly.

-- It is not posible to modify data on a view, to acomplish that data has to be modified on the table

--7

UPDATE reorderinfo 
SET    isbn=2147428899 
WHERE  title='SHORTEST POEMS'; 

--Error report -
--ORA-02292: integrity constraint (F8792613.ORDERITEMS_ISBN_FK) violated - child record found
-- There is a constrain and a child of that data has benn found

--8

DELETE 
FROM   reorderinfo 
WHERE  contact='SEBASTIAN JONES'; 

--Error report -
--ORA-02292: integrity constraint (F8792613.ORDERITEMS_ISBN_FK) violated - child record found
-- There is a constrain and a child of that data has benn found

--9

ROLLBACK; 

--10

DROP VIEW reorderinfo;