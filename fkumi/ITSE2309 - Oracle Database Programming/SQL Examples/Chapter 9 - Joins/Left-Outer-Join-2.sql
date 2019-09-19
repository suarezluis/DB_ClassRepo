-- JOIN METHOD (LEFT OUTER)

SELECT c.lastname,
       c.firstname,
       o.order#
  FROM customers c LEFT OUTER JOIN orders o using (customer#)
ORDER BY c.lastname, c.firstname;
