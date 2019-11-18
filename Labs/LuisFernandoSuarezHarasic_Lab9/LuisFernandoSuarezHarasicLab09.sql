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
          category; 

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


-- -- 1.

-- SELECT COUNT(*)
-- FROM books
-- WHERE category = 'COOKING';

-- -- 2.

-- SELECT COUNT(*)
-- FROM books
-- WHERE retail > 30;

-- -- 3.

-- SELECT MAX(pubdate)
-- FROM books;

-- -- 4.

-- SELECT SUM((retail-cost)*quantity)
-- FROM orders JOIN orderitems USING(order#) JOIN books USING(isbn)
-- WHERE customer# = 1017;

-- -- 5.

-- SELECT MIN(retail)
-- FROM books
-- WHERE category = 'COMPUTER';

-- -- 6.

-- SELECT AVG(SUM((retail-cost)*quantity))
-- FROM orders JOIN orderitems USING(order#) JOIN books USING(isbn)
-- GROUP BY order#;

-- -- 7.

-- SELECT customer#, COUNT(*)
-- FROM orders
-- GROUP BY customer#;

-- -- 8.

-- SELECT name, category, AVG(retail)
-- FROM books JOIN publisher USING(pubid)
-- WHERE category IN('COMPUTER', 'CHILDREN') 
-- GROUP BY name, category;

-- -- 9.

-- SELECT DISTINCT firstname, lastname
-- FROM customers JOIN orders USING(customer#) JOIN orderitems USING(order#) JOIN books USING(isbn)
-- WHERE (state = 'FL' or state = 'GA')
-- GROUP BY order#, firstname, lastname
-- HAVING SUM(retail*quantity)>80;

-- -- 10.

-- SELECT MAX(retail)
-- FROM books JOIN bookauthor USING(isbn) JOIN author USING(authorid)
-- WHERE lname = 'WHITE'
-- AND fname = 'LISA';