SELECT c.isbn, SUM(quantity*paideach) sales
   FROM books c, orderitems o
  WHERE c.isbn = o.isbn
GROUP BY c.isbn;
