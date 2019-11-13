-- LEFT OUTER JOIN (OLD)

SELECT c.customer#,
       c.lastname,
       c.firstname,
       c.address,
       c.city,
       o.order#,
       o.customer#,
       o.orderdate
 FROM  orders o, customers c
 WHERE c.customer# = o.customer#(+)
 ORDER by c.customer#, lastname, c.firstname;