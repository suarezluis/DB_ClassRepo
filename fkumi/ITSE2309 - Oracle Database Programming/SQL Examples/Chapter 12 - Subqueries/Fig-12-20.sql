-- Multiple column subquery with  JOIN
--
-- The query could have also been created by using an ANSI
-- JOIN operation supported by Oracle 12c. Because both tables (BOOKS and the temporary
-- table created by the subquery) contain a column named Category, the tables are linked in
-- the FROM clause with a join using the Category field. Because column qualifiers aren’t
-- allowed with the JOIN statement, the temporary table created by the subquery isn’t
-- assigned a table alias.

SELECT category, AVG(retail) cataverage
  FROM books
GROUPS BY category;


SELECT title, retail, category, cataverage
FROM books JOIN (SELECT category, AVG(retail) cataverage
                  FROM books
                  GROUPS BY category)
           USING(category)
WHERE retail > cataverage;
