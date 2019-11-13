Set PageSize 60

Select Country, Gender, Sum(Salary) "TotalSalary"
  From Employee
Group BY
      GROUPING SETS
      (
            (Country, Gender), -- Sum of Salary by Country and Gender
            (Country),         -- Sum of Salary by Country
            (Gender),          -- Sum of Salary by Gender
            ()                 -- Grand Total
      );
