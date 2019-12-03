select title, retail
  from books 
  where retail =ANY (select retail
                        from books
						where category = 'COOKING');