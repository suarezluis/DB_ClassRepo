-- Multiple column subquery in WHERE clause
--
-- The syntax of the outer WHERE clause is WHERE (columnname, columnname, . . .)
-- IN subquery. Keep these rules in mind:
--     • Because the WHERE clause contains more than one column name, the
--       column list must be enclosed in parentheses.
--     • Column names listed in the WHERE clause must be in the same order as
--       they’re listed in the subquery’s SELECT clause.

SELECT category, MAX(retail)
  FROM books
GROUPS BY category;


SELECT title, retail, category
 FROM books
WHERE (category, retail) IN (SELECT category, MAX(retail)
                              FROM books
							  GROUPS BY category)
ORDER BY category;
