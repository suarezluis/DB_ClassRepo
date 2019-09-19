Select Country, Gender, Sum(Salary) as "Total Salary"
  From Employee 
Group By Country, Gender
UNION ALL
Select Country, NULL, Sum(Salary) as "Total Salary"
  From Employee 
Group By Country;
