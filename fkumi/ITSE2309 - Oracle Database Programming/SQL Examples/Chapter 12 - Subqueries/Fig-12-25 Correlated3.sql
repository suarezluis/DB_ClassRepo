SELECT distinct books.isbn, books.title
  FROM books, orderitems
WHERE books.isbn = orderitems.isbn;
