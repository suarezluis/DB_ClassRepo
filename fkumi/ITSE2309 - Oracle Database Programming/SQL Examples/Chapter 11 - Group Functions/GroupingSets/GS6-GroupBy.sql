Select Country, Gender, Sum(Salary) as "TotalSalary"
  From Employee 
Group By Country, Gender
UNION ALL
Select Country, NULL, Sum(Salary) as "TotalSalary"
  From Employee 
Group By Country
UNION ALL
Select NULL, Gender, Sum(Salary) as "TotalSalary"
  From Employee 
Group By Gender;
