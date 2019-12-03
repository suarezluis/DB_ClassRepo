-- Figure 12-25

SELECT title 
  FROM books
WHERE EXISTS (SELECT isbn
              FROM orderitems
              WHERE books.isbn = orderitems.isbn);
