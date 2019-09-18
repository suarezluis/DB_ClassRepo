Select Country, Gender, Sum(Salary) as "Total Salary"
  From Employee 
Group By Rollup(Gender, Country)
Order By Country, Gender;

