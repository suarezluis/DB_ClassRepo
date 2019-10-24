1. 

CREATE SEQUENCE costumers_customer#_seq 
  INCREMENT BY 1 
  START WITH 1021 
  NOCACHE 
  NOCYCLE; 

2. 

INSERT INTO customers 
            (customer#, 
             lastname, 
             firstname, 
             zip) 
VALUES      (costumers_customer#_seq.nextval, 
             'Shoulders', 
             'Frank', 
             23567); 

3. 

CREATE SEQUENCE my_first_seq 
  INCREMENT BY -3 
  START WITH 5 
  MAXVALUE 5 
  MINVALUE 0 
  NOCYCLE; 

4.

SELECT my_first_seq.nextval 
FROM   dual; 

SELECT my_first_seq.currval 
FROM   dual; 

SELECT my_first_seq.nextval 
FROM   dual; 

ORA-08004: sequence MY_FIRST_SEQ.NEXTVAL goes below MINVALUE and cannot be instantiated
08004. 00000 -  "sequence %s.NEXTVAL %s %sVALUE and cannot be instantiated"
*Cause:    instantiating NEXTVAL would violate one of MAX/MINVALUE
*Action:   alter the sequence so that a new value can be requested

The next value would be bellow 0 which is not allowed since we specified MINVALUE 0

5. 

ALTER SEQUENCE MY_FIRST_SEQ
      MINVALUE -1000;

6. 

CREATE TABLE email_log
             (emailid NUMBER GENERATED AS IDENTITY PRIMARY KEY,
              emaildate DATE,
              customer# NUMBER);

INSERT INTO email_log 
            (emaildate, 
             customer#) 
VALUES      (sysdate, 
             1007); 

INSERT INTO email_log 
            (emailid, 
             emaildate, 
             customer#) 
VALUES      (DEFAULT, 
             sysdate, 
             1008); 

INSERT INTO email_log 
            (emailid, 
             emaildate, 
             customer#) 
VALUES      (25, 
             sysdate, 
             1009); 

SQL Error: ORA-32795: cannot insert into a generated always identity column
32795.0000 -  "cannot insert into a generated always identity column"
*Cause:    An attempt was made to insert a value into an identity column
           created with GENERATED ALWAYS keywords.
*Action:   A generated always identity column cannot be directly inserted.
           Instead, the associated sequence generator must provide the value.

Is not possible to add values to a GENERATED column

SELECT * FROM email_log;

7. 

CREATE synonym numgen FOR my_first_seq; 

8. 

SELECT NUMGEN.CURRVAL FROM DUAL;

DROP SYNONYM NUMGEN;

DROP SEQUENCE MY_FIRST_SEQ;

9. 

SELECT * 
FROM   books 
WHERE  ( retail - cost ) > 10 
ORDER  BY ( retail - cost ) DESC; 

10.
 
SELECT   * 
FROM     books 
WHERE    retail >= 45 
AND      catcode IN ('COM' , 
                     'FAL') 
AND      pubid IN (1, 
                   3) 
ORDER BY retail;DESC;



