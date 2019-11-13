-- Right Outer Join (Old)

SELECT c.customer#,
       c.lastname,
       c.firstname,
       c.address,
       c.city,
       o.order#,
       o.customer#,
       o.orderdate
 FROM  orders o, customers c
 WHERE c.customer#(+) = o.customer#
 ORDER BY c.lastname, c.firstname;
