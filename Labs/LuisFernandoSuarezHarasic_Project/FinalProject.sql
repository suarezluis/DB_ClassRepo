SELECT 'DROP TABLE ' 
       || table_name 
       || ' CASCADE CONSTRAINTS;' 
FROM   user_tables; 

DROP TABLE address CASCADE CONSTRAINTS; 

DROP TABLE attendance CASCADE CONSTRAINTS; 

DROP TABLE class CASCADE CONSTRAINTS; 

DROP TABLE parent CASCADE CONSTRAINTS; 

DROP TABLE student CASCADE CONSTRAINTS; 

DROP TABLE teacher CASCADE CONSTRAINTS; 

--Class table:  
CREATE TABLE class 
  ( 
     class_id    INT NOT NULL, 
     name        VARCHAR2(255), 
     description VARCHAR2(255), 
     PRIMARY KEY (class_id) 
  ); 

--Address table:  
CREATE TABLE address 
  ( 
     zip      NUMBER NOT NULL, 
     street   VARCHAR2(255), 
     city     VARCHAR2(255), 
     state    VARCHAR2(255), 
          PRIMARY KEY (zip), 
     class_id INT REFERENCES class(class_id) 
  ); 

--Student table:  
CREATE TABLE student 
  ( 
     student_id INT NOT NULL, 
     fname      VARCHAR2(255), 
     lname      VARCHAR2(255), 
     dob        DATE, 
     phone      NUMBER, 
     email      VARCHAR2(255), 
          PRIMARY KEY (student_id), 
     zip        NUMBER NOT NULL REFERENCES address(zip) 
  ); 

--Parent table:  
CREATE TABLE parent 
  ( 
     parent_id  INT NOT NULL, 
     fname      VARCHAR2(255), 
     lname      VARCHAR2(255), 
     phone      NUMBER, 
     email      VARCHAR2(255), 
          PRIMARY KEY (parent_id), 
     student_id INT REFERENCES student(student_id), 
     zip        NUMBER REFERENCES address(zip) 
  ); 

--Teacher:  
CREATE TABLE teacher 
  ( 
     teacher_id INT NOT NULL, 
     fname      VARCHAR2(255), 
     dob        DATE, 
     phone      NUMBER, 
     email      VARCHAR2(255), 
          PRIMARY KEY (teacher_id), 
     class_id   INT NOT NULL REFERENCES class(class_id), 
     zip        NUMBER REFERENCES address(zip) 
  ); 

--Class Attendance:  
CREATE TABLE attendance 
  ( 
     attendance_date DATE, 
     status          VARCHAR2(255), 
     percentage      NUMBER, 
     remarks         VARCHAR2(255), 
          PRIMARY KEY (attendance_date), 
     student_id      INT NOT NULL REFERENCES student(student_id) 
  ); 