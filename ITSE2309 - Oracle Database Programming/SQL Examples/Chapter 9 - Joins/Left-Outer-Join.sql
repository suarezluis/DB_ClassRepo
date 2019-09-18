-- LEFT OUTER JOIN

SELECT c.customer#,
   c.lastname,
   c.firstname,
   c.address,
   c.city,
   o.order#,
   o.customer#,
   o.orderdate
 FROM customers c LEFT OUTER JOIN orders o
   ON c.customer# = o.customer#
 ORDER BY c.lastname, c.firstname;