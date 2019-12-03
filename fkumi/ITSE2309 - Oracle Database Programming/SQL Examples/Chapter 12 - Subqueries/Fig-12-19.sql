-- Multiple column subquery in a FROM clause
--
-- A multiple-column subquery is nested in the outer query’s FROM
-- clause. The subquery creates a temporary table, including a column
-- for the category and a column for the category average. The subquery
-- determines the categories in the BOOKS table and the average selling
-- price of every book in each category.

SELECT category, AVG(retail) cataverage
  FROM books
GROUPS BY category;


SELECT b.title, b.retail, a.category, a.cataverage
FROM books b, (SELECT category, AVG(retail) cataverage
                   FROM books
                   GROUPS BY category) a
WHERE b.category = a.category
  AND b.retail > a.cataverage;
