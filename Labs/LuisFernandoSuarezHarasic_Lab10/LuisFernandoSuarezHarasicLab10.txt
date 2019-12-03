--1. 

SELECT title, 
       retail 
FROM   books 
WHERE  retail < (SELECT Avg(retail) 
                 FROM   books); 

--2.

SELECT a.title, 
       b.category, 
       a.cost 
FROM   books a, 
       (SELECT category, 
               Avg(cost) averagecost 
        FROM   books 
        GROUP  BY category) b 
WHERE  a.category = b.category 
       AND a.cost < b.averagecost; 

--3.

SELECT order# 
FROM   orders 
WHERE  shipstate = (SELECT shipstate 
                    FROM   orders 
                    WHERE  order# = 1014); 

--4.

SELECT order#, 
       Sum(quantity * paideach) 
FROM   orderitems 
GROUP  BY order# 
HAVING Sum(quantity * paideach) > (SELECT Sum(quantity * paideach) 
                                   FROM   orderitems 
                                   WHERE  order# = 1008); 

--5.

SELECT title 
FROM   books 
WHERE  category IN (SELECT DISTINCT category 
                    FROM   books 
                           JOIN orderitems using(isbn) 
                           JOIN orders using(order#) 
                    WHERE  customer# = 1007) 
       AND isbn NOT IN (SELECT isbn 
                        FROM   orders 
                               JOIN orderitems using(order#) 
                        WHERE  customer# = 1007); 

--6.

SELECT shipcity, 
       shipstate 
FROM   orders 
WHERE  shipdate - orderdate = (SELECT Max(shipdate - orderdate) 
                               FROM   orders); 

--7.

SELECT customer# 
FROM   customers 
       JOIN orders using(customer#) 
       JOIN orderitems using(order#) 
       JOIN books using(isbn) 
WHERE  retail = (SELECT Min(retail) 
                 FROM   books); 

--8.

SELECT Count(DISTINCT customer#) 
FROM   orders 
       JOIN orderitems using(order#) 
WHERE  isbn IN (SELECT isbn 
                FROM   orderitems 
                       JOIN bookauthor using(isbn) 
                       JOIN author using(authorid) 
                WHERE  lname = 'AUSTIN' 
                       AND fname = 'JAMES'); 

--9.
 
SELECT title 
FROM   books 
WHERE  pubid = (SELECT pubid 
                FROM   books 
                WHERE  title = 'THE WOK WAY TO COOK'); 