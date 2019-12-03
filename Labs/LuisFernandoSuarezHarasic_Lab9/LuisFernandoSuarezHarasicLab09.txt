-- 1. 
SELECT Count(*) 
FROM   books 
WHERE  category = 'COOKING'; 

-- 2. 
SELECT Count(*) 
FROM   books 
WHERE  retail > 30; 

-- 3. 
SELECT Max(pubdate) 
FROM   books; 

-- 4. 
SELECT Sum(( retail - cost ) * quantity) 
FROM   orders 
       JOIN orderitems using(order#) 
       JOIN books using(isbn) 
WHERE  customer# = 1017; 

-- 5. 
SELECT Min(retail) 
FROM   books 
WHERE  category = 'COMPUTER'; 

-- 6. 
SELECT Avg(Sum(( retail - cost ) * quantity)) 
FROM   orders 
       JOIN orderitems using(order#) 
       JOIN books using(isbn) 
GROUP  BY order#; 

-- 7. 
SELECT customer#, 
       Count(*) 
FROM   orders 
GROUP  BY customer#; 

-- 8. 
SELECT NAME, 
       category, 
       Avg(retail) 
FROM   books 
       JOIN publisher using(pubid) 
WHERE  category IN( 'COMPUTER', 'CHILDREN' ) 
GROUP  BY NAME, 
          category 
HAVING Avg(retail) > 50; 

-- 9. 
SELECT DISTINCT firstname, 
                lastname 
FROM   customers 
       JOIN orders using(customer#) 
       JOIN orderitems using(order#) 
       JOIN books using(isbn) 
WHERE  ( state = 'FL' 
          OR state = 'GA' ) 
GROUP  BY order#, 
          firstname, 
          lastname 
HAVING Sum(retail * quantity) > 80; 

-- 10. 
SELECT Max(retail) 
FROM   books 
       JOIN bookauthor using(isbn) 
       JOIN author using(authorid) 
WHERE  lname = 'WHITE' 
       AND fname = 'LISA'; 
