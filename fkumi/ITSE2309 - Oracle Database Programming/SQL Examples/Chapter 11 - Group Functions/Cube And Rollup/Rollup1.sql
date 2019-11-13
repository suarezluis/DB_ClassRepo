Select Country, Sum(Salary) as "Total Salary"
  From Employee 
Group By Rollup(Country);
