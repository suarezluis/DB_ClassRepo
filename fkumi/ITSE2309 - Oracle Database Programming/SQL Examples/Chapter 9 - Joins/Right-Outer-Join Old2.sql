-- Right Outer Join (Old)

SELECT c.customer#,
       c.lastname,
       c.firstname,
       c.address,
       c.city,
       o.order#,
       o.customer#,
       o.orderdate
 FROM customers c, orders o
 WHERE c.customer# = o.customer#
 ORDER BY c.customer#, c.lastname, c.firstname;
