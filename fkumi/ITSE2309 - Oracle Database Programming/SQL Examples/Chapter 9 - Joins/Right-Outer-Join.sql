-- JOIN METHOD (RIGHT OUTER)

SELECT c.lastname,
       c.firstname,
       o.order#
  FROM customers c RIGHT OUTER JOIN orders o using (customer#)
ORDER BY c.lastname, c.firstname;
