Select Country, Gender, Sum(Salary) as "Total Salary"
  From Employee 
Group By Cube(Country, Gender)
Order By Country, Gender;
