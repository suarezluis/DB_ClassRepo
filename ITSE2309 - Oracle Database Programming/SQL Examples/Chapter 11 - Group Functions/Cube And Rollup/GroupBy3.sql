Select Country, Gender, Sum(Salary) as "Total Salary"
  From Employee 
Group By Gender, Country
Order By Country, Gender;
