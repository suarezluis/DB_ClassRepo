select title, retail
  from books 
  where retail <ALL (select retail
                        from books
						where category = 'COOKING');