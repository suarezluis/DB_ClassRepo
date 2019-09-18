-- LEFT OUTER JOIN (OLD)

SELECT c.customer#,
       c.lastname,
       c.firstname,
       c.address,
       c.city,
       o.order#,
       o.customer#,
       o.orderdate from customers c, orders o
 WHERE c.customer# = o.customer#(+)
 ORDER by c.lastname, c.firstname;