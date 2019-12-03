SELECT isbn, title
  FROM books
 WHERE EXISTS (SELECT isbn
                 FROM orderitems
    			 WHERE books.isbn = orderitems.isbn);
