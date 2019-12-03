SELECT b.isbn, b.title, sales
   FROM books b, (SELECT SUM(quantity*paideach) sales
                       FROM books c, orderitems o
					  WHERE c.isbn = o.isbn
					  GROUP BY c.isbn)
   ORDER BY b.title;
  