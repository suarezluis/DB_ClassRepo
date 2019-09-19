-- INNER JOIN METHOD

SELECT c.lastname,
       c.firstname,
       o.order#
 FROM customers c JOIN orders o USING (customer#)
 ORDER BY c.lastname, c.firstname;
