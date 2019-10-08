1)

INSERT INTO orders (order#,customer#,orderdate)
VALUES (1021,1009,'20-JUL-2009');

2)

UPDATE orders 
SET shipzip = 33222
WHERE order# = 1017;

3)

COMMIT;

4)

INSERT INTO orders (order#,customer#,orderdate)
VALUES (1022,2000,'06-AUG-2009');

ERROR at line 1:
ORA-02291: integrity constraint (F8792613.ORDERS_CUSTOMER#_FK) violated -
parent key not found

Customer number is a foreign key, customer number bust exist in another table where that key is imported from.

5)

INSERT INTO orders (order#,customer#)
VALUES (1023,1009);

ERROR at line 1:
ORA-01400: cannot insert NULL into ("F8792613"."ORDERS"."ORDERDATE")

A value for ORDERDATE must be provided, field has a NOT NULL constraint.

6)

UPDATE books
SET cost = '&cost'
WHERE isbn = '&isbn';

7)

SQL> UPDATE books
  2  SET cost = '&cost'
  3  WHERE isbn = '&isbn';

Enter value for cost: 20
old   2: SET cost = '&cost'
new   2: SET cost = '20'
Enter value for isbn: 1059831198
old   3: WHERE isbn = '&isbn'
new   3: WHERE isbn = '1059831198'

1 row updated.

8)

CREATE TABLE category 
  ( 
     catcode  VARCHAR2(3), 
     catdesc VARCHAR2(11) NOT NULL, 
     CONSTRAINT category_catcode_pk PRIMARY KEY (catcode)  
  ); 

INSERT INTO category (catcode,catdesc)
VALUES ('BUS','BUSINESS');

INSERT INTO category (catcode,catdesc)
VALUES ('CHN','CHILDREN');

INSERT INTO category (catcode,catdesc)
VALUES ('COK','COOKING');

INSERT INTO category (catcode,catdesc)
VALUES ('COM','COMPUTER');

INSERT INTO category (catcode,catdesc)
VALUES ('FAL','FAMILY LIFE');

INSERT INTO category (catcode,catdesc)
VALUES ('FIT','FITNESS');

INSERT INTO category (catcode,catdesc)
VALUES ('SEH','SELF HELP');

INSERT INTO category (catcode,catdesc)
VALUES ('LIT','LITERATURE');

ALTER TABLE books 
  ADD (
    catcode VARCHAR2(3),
    CONSTRAINT books_catcode_fk FOREIGN KEY (catcode) REFERENCES category (catcode)
  ); 

UPDATE books
SET catcode = 'BUS'
WHERE category = 'BUSSINES';

UPDATE books
SET catcode = 'CHN'
WHERE category = 'CHILDREN';

UPDATE books
SET catcode = 'COK'
WHERE category = 'COOKING';

UPDATE books
SET catcode = 'COM'
WHERE category = 'COMPUTER';

UPDATE books
SET catcode = 'FAL'
WHERE category = 'FAMILY LIFE';

UPDATE books
SET catcode = 'FIT'
WHERE category = 'FITNESS';

UPDATE books
SET catcode = 'SEH'
WHERE category = 'SELF HELP';

UPDATE books
SET catcode = 'LIT'
WHERE category = 'LITERATURE';

COMMIT;

ALTER TABLE books 
  DROP COLUMN category; 