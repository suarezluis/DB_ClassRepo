-- Calculate Sum of Salary by Country and Gender. This can be easily achieved with a Group By query.
-- The result is shown below. 

Select Country, Gender, Sum(Salary) as TotalSalary
  From Employee 
Group By Country, Gender;


-- Now within the same result set, we want to include Sum of Salary just by Country. To achieve this we
-- have to write another query and combine it with the previous one using UNION ALL.  The Result is
-- shown below. Notice the Gender column within the resultset is NULL as we are grouping only by
-- Country column.

Select Country, Gender, Sum(Salary) as TotalSalary
  From Employee 
Group By Country, Gender
UNION ALL
Select Country, NULL, Sum(Salary) as TotalSalary
  From Employee 
Group By Country;


-- Now within the same result set, we want to include Sum of Salary just by Gender. To achieve this we
-- have to write another query and combine it with the previous ones using UNION ALL.  The Result is
-- shown below. Notice the Country column within the resultset is NULL as we are grouping only by
-- Country column.

Select Country, Gender, Sum(Salary) as TotalSalary
  From Employee 
Group By Country, Gender
UNION ALL
Select Country, NULL, Sum(Salary) as TotalSalary
  From Employee 
Group By Country
UNION ALL
Select NULL, Gender, Sum(Salary) as TotalSalary
  From Employee 
Group By Gender;


-- Finally we want the grand total of Salary included in the result set. To achieve this we will have
-- to with a fourth query and combine it with the other queries using UNION ALL as shown below.
-- In this case we are not grouping on any particular column so both Country and Gender columns will be 
-- NULL in the result set.

Select Country, Gender, Sum(Salary) as TotalSalary
  From Employee 
Group By Country, Gender
UNION ALL
Select Country, NULL, Sum(Salary) as TotalSalary
  From Employee 
Group By Country
UNION ALL
Select NULL, Gender, Sum(Salary) as TotalSalary
  From Employee 
Group By Gender
UNION ALL
Select NULL, NULL, Sum(Salary) as TotalSalary
  From Employee;


-- There are 2 problems with the above approach.

-- 1.  The query is huge as we have combined different Group By queries using UNION ALL operator.
--     This can grow even more if we start to add more groups

-- 2.  The Employee table has to be accessed 4 times, once for every query.

-- If we use Grouping Sets, the amount of SQL code could be greatly reduced. The following Grouping
-- Sets query produce the same result as the above UNION ALL query.


Select Country, Gender, Sum(Salary) TotalSalary
  From Employee
Group BY
      GROUPING SETS
      (
            (Country, Gender), -- Sum of Salary by Country and Gender
            (Country),         -- Sum of Salary by Country
            (Gender),          -- Sum of Salary by Gender
            ()                 -- Grand Total
      );

-- The order of the rows in the result set is not the same as in the case of UNION ALL query. To control the
-- order use order by as shown below. 

Select Country, Gender, Sum(Salary) TotalSalary
  From Employee
Group BY
      GROUPING SETS
      (
            (Country, Gender), -- Sum of Salary by Country and Gender
            (Country),         -- Sum of Salary by Country
            (Gender) ,         -- Sum of Salary by Gender
            ()                 -- Grand Total
      )
Order By Grouping(Country), Grouping(Gender), Country, Gender;

