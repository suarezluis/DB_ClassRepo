SELECT b.isbn, b.title, sales
   FROM books b, (SELECT SUM(quantity*paideach) sales
                       FROM orderitems o
					  WHERE b.isbn = o.isbn
					  GROUP BY b.isbn)
   ORDER BY b.title;
  