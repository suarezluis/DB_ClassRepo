CREaTE MATERIALIZED VIEW test1_mv
REFRESH COMPLETE
START WITH SYSDATE NEXT SYSDATE+7
AS SELECT customer#, city, state, order#, SUM(quantity*retail) AmtDue
   FROM customers JOIN orders USING(customer#)
         JOIN orderitems USING (order#)
		 JOIN books USING(isbn)
   GROUP BY customer#, city, state, order#;