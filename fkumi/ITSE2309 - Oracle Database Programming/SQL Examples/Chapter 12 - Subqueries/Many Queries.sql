SELECT title, MAX(retail)
  FROM books);


SELECT title, retail
  FROM books
  WHERE retail = (SELECT MAX(retail)
                   FROM books);



---------------------------------------------------------------------------


SELECT AVG(retail-cost)
 FROM books.
WHERE category = 'LITERATURE';


SELECT category, AVG(retail-cost) "Average Profit"
FROM books
GROUP BY category
HAVING AVG(retail-cost) > (SELECT AVG(retail-cost)
                            FROM books.
                            WHERE category = 'LITERATURE');



---------------------------------------------------------------------------

SELECT retail
 FROM books
 WHERE category = 'COOKING';



SELECT title, retail
FROM books
WHERE retail <ANY (SELECT retail
                     FROM books
                     WHERE category = 'COOKING');



SELECT title, retail
FROM books
WHERE retail >ANY (SELECT retail
                     FROM books
                     WHERE category = 'COOKING');


----------------------------------------------------------------------------


SELECT category, MAX(retail)
 FROM books
GROOUP BY category;


SELECT title, retail, category
FROM books
WHERE (category, retail) IN (SELECT category, MAX(retail)
                             FROM books
                             GROOUP BY category)
ORDER BY category;



----------------------------------------------------------------------------

SELECT category, MAX(retail) cataverage
                 FROM books
               GROUP by category;


SELECT b.title, b.retail, a.category, a.cataverage
FROM books b, (SELECT category, MAX(retail) cataverage
                 FROM books
               GROUP by category) a
WHERE b.category = a.category 
 AND b.retail > a.cataverage;


--------------------------------------------------------------------------

SELECT e.lname Emp_Lastname,
  e.deptno e_dept,
  d1.dcount edept_count,
  m.lname manager_name,
  m.deptno mdept,
  d2.dcount mdept_count
FROM employees e,
  (SELECT deptno, COUNT(*) AS dcount
    FROM employees
    GROUP BY deptno) d1,
  employees m,
  (SELECT deptno, COUNT(*) AS dcount
    FROM employees
    GROUP BY deptno) d2
WHERE e.deptno = d1.deptno
AND e.mgr = m.empno
AND m.deptno = d2.deptno
AND e.mgr = ‘7839’;


-------------------------------------------------------------------------


WITH dcount AS
  (SELECT deptno, COUNT(*) AS dcount
   FROM employees
   GROUP BY deptno)
SELECT e.lname Emp_Lastname,
   e.deptno e_dept,
   d1.dcount edept_count,
   m.lname manager_name,
   m.deptno mdept,
   d2.dcount mdept_count
FROM employees e,
   dcount d1,
   employees m,
   dcount d2
WHERE e.deptno = d1.deptno
 AND e.mgr = m.empno
 AND m.deptno = d2.deptno
 AND e.mgr = ‘7839’;
