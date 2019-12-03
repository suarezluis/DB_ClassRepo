-- The most common reason for nesting subqueries is to create a chain of data. For
-- example, you need to find the name of the customer who has ordered the most books
-- from JustLee Books (not including multiple quantities of the same book) on one order.

-- Here are the steps for creating the query below:

-- 1. The goal of the query is to count the number of items placed on each order
--    and identify the order—or orders, in case of a tie—with the most items. The
--    nested subquery identified by A in Figure 12-27 finds the highest count of
--    books in any order.

-- 2. The value of the highest count of items ordered is then passed to the outer
--    subquery, B.

-- 3. The outer subquery, B, is then used to identify which orders have the same
--    number of items as the highest number of items that the innermost
--    subquery, A, found.

-- 4. After the order numbers have been identified, they are then passed to the
--    outer query, C, which determines the customer number and name of the
--    person who placed the orders. In this case, two customers tied for placing an
--    order with the most items.

-- The statement uses the IN operator in the outer query’s WHERE clause because the
-- subquery, B, might return multiple rows.

SELECT customer#, lastname, firstname 
  FROM customers JOIN orders USIDG(customer#) -- C
 WHERE order# IN (SELECT order#
                    FROM orderitems -- B
                    GROUP BY order#
                    HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                                        FROM orderitems      -- A
                                        GROUP BY order#));

