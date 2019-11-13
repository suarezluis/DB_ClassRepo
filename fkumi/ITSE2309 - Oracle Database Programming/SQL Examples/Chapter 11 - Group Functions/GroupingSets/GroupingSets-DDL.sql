-- Drop the Employee Table
Drop Table Employee Purge;


-- Create the Employee table
Create Table Employee
(
    Id number primary key,
    Name varchar2(25),
    Gender varchar2(10),
    Salary number,
    Country varchar2(10)
);


-- Insert Data into the Employee Table

Insert Into Employee Values (1, 'Mark', 'Male', 5000, 'USA');
Insert Into Employee Values (2, 'John', 'Male', 4500, 'Canada');
Insert Into Employee Values (3, 'Pam', 'Female', 5500, 'USA');
Insert Into Employee Values (4, 'Sara', 'Female', 4000, 'Canada');
Insert Into Employee Values (5, 'Todd', 'Male', 3500, 'Canada');
Insert Into Employee Values (6, 'Mary', 'Female', 5000, 'UK');
Insert Into Employee Values (7, 'Ben', 'Male', 6500, 'UK');
Insert Into Employee Values (8, 'Elizabeth', 'Female', 7000, 'USA');
Insert Into Employee Values (9, 'Tom', 'Male', 5500, 'UK');
Insert Into Employee Values (10, 'Ron', 'Male', 5000, 'USA');

