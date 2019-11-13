Select Country, Gender, Sum(Salary) as "Total Salary"
  From Employee 
Group By Grouping Sets (Rollup(Gender, Country))
Order By Country, Gender;

