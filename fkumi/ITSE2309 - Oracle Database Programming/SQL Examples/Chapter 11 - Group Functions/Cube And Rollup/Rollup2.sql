Select Country, Gender, Sum(Salary) as "Total Salary"
  From Employee 
Group By Rollup(Country, Gender)
Order By Country, Gender;

