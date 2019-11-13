-- 1

-- (Traditional)

SELECT b.title, 
       p.contact, 
       p.phone 
FROM   books b, 
       publisher p 
WHERE  p.pubid = b.pubid;

-- (With JOIN)

SELECT b.title, 
       p.contact, 
       p.phone 
FROM   books b 
       join publisher p USING(pubid);

-- 2

-- (Traditional)

SELECT c.firstname, 
       c.lastname, 
       o.order# 
FROM   customers c, 
       orders o 
WHERE  c.customer# = o.customer# 
       AND o.shipdate IS NULL; 

-- (With JOIN)

SELECT c.firstname, 
       c.lastname, 
       o.order# 
FROM   customers c 
       join orders o USING(customer#) 
WHERE  o.shipdate IS NULL;

-- 3 

-- (Traditional)

SELECT DISTINCT c.customer#, 
       c.lastname 
       from customers c, 
       orders o, 
       books b, 
       orderitems oi 
       where c.customer# = o.customer# 
AND    o.order# = oi.order#
and    oi.isbn = b.isbn
and    c.state = 'FL' 
AND    b.category = 'COMPUTER';

-- (With JOIN)

SELECT DISTINCT customer#, 
                c.lastname 
FROM   customers c 
       join orders o USING (customer#) 
       join orderitems oi USING (order#) 
       join books b USING (isbn) 
WHERE  state = 'FL' 
       AND category = 'COMPUTER';

-- 4

-- (Traditional)

SELECT DISTINCT b.title 
FROM   customers c, 
       orders o, 
       books b, 
       orderitems oi 
WHERE  c.customer# = o.customer# 
       AND o.order# = oi.order# 
       AND oi.isbn = b.isbn 
       AND c.firstname = 'JAKE' 
       AND c.lastname = 'LUCAS';

-- (With JOIN)

SELECT DISTINCT b.title 
FROM            customers c 
join            orders o 
ON              c.customer#=o.customer# 
join            orderitems oi 
ON              o.order#= oi.order# 
join            books b 
ON              b.isbn = oi.isbn 
WHERE           c.firstname = 'JAKE' 
AND             c.lastname = 'LUCAS';

-- 5 

-- (Traditional)

SELECT b.title, 
       i.paideach - cost 
FROM   customers c, 
       orders o, 
       orderitems i, 
       books b 
WHERE  c.customer# = o.customer# 
       AND o.order# = i.order# 
       AND i.isbn = b.isbn 
       AND c.firstname = 'JAKE' 
       AND c.lastname = 'LUCAS' 
ORDER  BY o.orderdate, 
          i.paideach - b.cost DESC; 

-- (With JOIN)

SELECT b.title, 
       i.paideach - b.cost 
FROM   customers c 
       JOIN orders o using (customer#) 
       JOIN orderitems i using (order#) 
       JOIN books b using (isbn) 
WHERE  c.firstname = 'JAKE' 
       AND c.lastname = 'LUCAS' 
ORDER  BY o.orderdate, 
          i.paideach - b.cost DESC; 

-- 6 

-- (Traditional)

SELECT b.title 
FROM   books b, 
       bookauthor ba, 
       author a 
WHERE  b.isbn = ba.isbn 
       AND ba.authorid = a.authorid 
       AND a.lname = 'ADAMS'; 

-- (With JOIN)

SELECT b.title 
FROM   books b 
       JOIN bookauthor using (isbn) 
       JOIN author a using (authorid) 
WHERE  a.lname = 'ADAMS'; 

-- 7

-- (Traditional)

SELECT p.gift 
FROM   books b, 
       promotion p 
WHERE  b.retail BETWEEN p.minretail AND p.maxretail 
       AND b.title = 'SHORTEST POEMS'; 

-- (With JOIN)

SELECT p.gift 
FROM   books b 
       JOIN promotion p 
         ON b.retail BETWEEN p.minretail AND p.maxretail 
WHERE  b.title = 'SHORTEST POEMS'; 

-- 8

-- (Traditional)

SELECT a.lname, 
       a.fname, 
       b.title 
FROM   books b, 
       orders o, 
       orderitems i, 
       customers c, 
       bookauthor t, 
       author a 
WHERE  c.customer# = o.customer# 
       AND o.order# = i.order# 
       AND i.isbn = b.isbn 
       AND b.isbn = t.isbn 
       AND t.authorid = a.authorid 
       AND c.firstname = 'BECCA' 
       AND c.lastname = 'NELSON'; 

-- (With JOIN)

SELECT a.lname, 
       a.fname, 
       b.title 
FROM   customers c 
       JOIN orders using (customer#) 
       JOIN orderitems using (order#) 
       JOIN books b using (isbn) 
       JOIN bookauthor using (isbn) 
       JOIN author a using (authorid) 
WHERE  c.firstname = 'BECCA' 
       AND c.lastname = 'NELSON'; 

-- 9

-- (Traditional)

SELECT b.title, 
       o.order#, 
       c.state 
FROM   books b, 
       orders o, 
       orderitems i, 
       customers c 
WHERE  c.customer# (+) = o.customer# 
       AND o.order# (+) = i.order# 
       AND i.isbn (+) = b.isbn; 

-- (With JOIN)

SELECT b.title, 
       order#, 
       c.state 
FROM   books b 
       left outer join orderitems i USING (isbn) 
       left outer join orders USING (order#) 
       left outer join customers c USING (customer#); 

-- 10

-- (Traditional)

SELECT e.fname 
       || ' ' 
       || e.lname "Employee Name", 
       e.job, 
       m.fname 
       || ' ' 
       || m.lname "Manager Name" 
FROM   employees e, 
       employees m 
WHERE  e.mgr = m.empno (+) 
ORDER  BY "Manager Name"; 

-- (With JOIN)

SELECT e.fname 
       || ' ' 
       || e.lname "Employee Name", 
       e.job, 
       m.fname 
       || ' ' 
       || m.lname "Manager Name" 
FROM   employees e 
       left outer join employees m 
                    ON e.mgr = m.empno 
ORDER  BY "Manager Name"; 