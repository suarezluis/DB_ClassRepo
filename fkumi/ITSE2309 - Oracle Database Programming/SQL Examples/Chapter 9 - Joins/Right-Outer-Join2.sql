SELECT c.customer#,
       c.lastname,
       c.firstname,
       c.address,
       c.city,
       o.order#,
       o.customer#, 
	   o.orderdate
FROM customers c RIGHT OUTER JOIN orders o on c.customer# = o.customer#
ORDER BY c.lastname, c.firstname;