--SELECT 'DROP TABLE '  
--       || table_name  
--       || ' CASCADE CONSTRAINTS;'  
--FROM   user_tables;  
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

-- Populating Data 
INSERT INTO class 
            (class_id, 
             name, 
             description) 
VALUES      (1001, 
             'java', 
             'learn the most used language'); 

INSERT INTO class 
            (class_id, 
             name, 
             description) 
VALUES      (1002, 
             'javascript', 
             'learn the language of the web'); 

INSERT INTO class 
            (class_id, 
             name, 
             description) 
VALUES      (1003, 
             'python', 
             'learn an easy language'); 

INSERT INTO class 
            (class_id, 
             name, 
             description) 
VALUES      (1004, 
             'php', 
             'learn the most comon server-side language'); 

INSERT INTO class 
            (class_id, 
             name, 
             description) 
VALUES      (1005, 
             'html', 
             'learn a markup language'); 

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

-- Populating Data 
INSERT INTO address 
            (zip, 
             street, 
             city, 
             state, 
             class_id) 
VALUES      (11111, 
             '111 1st St', 
             'Austin', 
             'texas', 
             1001); 

INSERT INTO address 
            (zip, 
             street, 
             city, 
             state, 
             class_id) 
VALUES      (22222, 
             '222 2nd St', 
             'Austin', 
             'texas', 
             1002); 

INSERT INTO address 
            (zip, 
             street, 
             city, 
             state, 
             class_id) 
VALUES      (33333, 
             '333 3rd St', 
             'Austin', 
             'texas', 
             1003); 

INSERT INTO address 
            (zip, 
             street, 
             city, 
             state, 
             class_id) 
VALUES      (44444, 
             '444 4th St', 
             'Austin', 
             'texas', 
             1004); 

INSERT INTO address 
            (zip, 
             street, 
             city, 
             state, 
             class_id) 
VALUES      (55555, 
             '555 5th St', 
             'Austin', 
             'texas', 
             1005); 

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

-- Populating Data 
INSERT INTO student 
            (student_id, 
             fname, 
             lname, 
             dob, 
             phone, 
             email, 
             zip) 
VALUES      (1, 
             'Luis', 
             'Suarez', 
             To_date('01/01/1981', 'DD/MM/YYYY'), 
             '1111111111', 
             'suarezluis@gmail.com', 
             11111); 

INSERT INTO student 
            (student_id, 
             fname, 
             lname, 
             dob, 
             phone, 
             email, 
             zip) 
VALUES      (2, 
             'Jonn', 
             'Smith', 
             To_date('01/02/1981', 'DD/MM/YYYY'), 
             '2222222222', 
             'smithjonn@gmail.com', 
             22222); 

INSERT INTO student 
            (student_id, 
             fname, 
             lname, 
             dob, 
             phone, 
             email, 
             zip) 
VALUES      (3, 
             'Jose', 
             'Clark', 
             To_date('01/03/1981', 'DD/MM/YYYY'), 
             '3333333333', 
             'clarkjose@gmail.com', 
             33333); 

INSERT INTO student 
            (student_id, 
             fname, 
             lname, 
             dob, 
             phone, 
             email, 
             zip) 
VALUES      (4, 
             'Max', 
             'Chick', 
             To_date('01/04/1981', 'DD/MM/YYYY'), 
             '4444444444', 
             'chickmax@gmail.com', 
             44444); 

INSERT INTO student 
            (student_id, 
             fname, 
             lname, 
             dob, 
             phone, 
             email, 
             zip) 
VALUES      (5, 
             'Maria', 
             'Doe', 
             To_date('01/05/1981', 'DD/MM/YYYY'), 
             '5555555555', 
             'doemaria@gmail.com', 
             55555); 

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

-- Populating Data 
INSERT INTO parent 
            (parent_id, 
             fname, 
             lname, 
             phone, 
             email, 
             student_id, 
             zip) 
VALUES      (1, 
             'Sr', 
             'Suarez', 
             '1111111111', 
             'suarezsr@gmail.com', 
             1, 
             11111 ); 

INSERT INTO parent 
            (parent_id, 
             fname, 
             lname, 
             phone, 
             email, 
             student_id, 
             zip) 
VALUES      (2, 
             'Sr', 
             'Smith', 
             '2222222222', 
             'suarezsr@gmail.com', 
             2, 
             22222 ); 

INSERT INTO parent 
            (parent_id, 
             fname, 
             lname, 
             phone, 
             email, 
             student_id, 
             zip) 
VALUES      (3, 
             'Sr', 
             'Clark', 
             '3333333333', 
             'suarezsr@gmail.com', 
             3, 
             33333 ); 

INSERT INTO parent 
            (parent_id, 
             fname, 
             lname, 
             phone, 
             email, 
             student_id, 
             zip) 
VALUES      (4, 
             'Sr', 
             'Chick', 
             '4444444444', 
             'suarezsr@gmail.com', 
             4, 
             44444 ); 

INSERT INTO parent 
            (parent_id, 
             fname, 
             lname, 
             phone, 
             email, 
             student_id, 
             zip) 
VALUES      (5, 
             'Sr', 
             'Doe', 
             '5555555555', 
             'suarezsr@gmail.com', 
             5, 
             55555 ); 

--Teacher:   
CREATE TABLE teacher 
  ( 
     teacher_id INT NOT NULL, 
     fname      VARCHAR2(255), 
     lname      VARCHAR2(255), 
     dob        DATE, 
     phone      NUMBER, 
     email      VARCHAR2(255), 
          PRIMARY KEY (teacher_id), 
     class_id   INT NOT NULL REFERENCES class(class_id), 
     zip        NUMBER REFERENCES address(zip) 
  ); 

-- Populating Data 
INSERT INTO teacher 
            (teacher_id, 
             fname, 
             lname, 
             dob, 
             email, 
             class_id, 
             zip) 
VALUES      (1, 
             'Prof', 
             'One', 
             To_date('01/01/1971', 'DD/MM/YYYY'), 
             'profone@gmail.com', 
             1001, 
             11111 ); 

INSERT INTO teacher 
            (teacher_id, 
             fname, 
             lname, 
             dob, 
             email, 
             class_id, 
             zip) 
VALUES      (2, 
             'Prof', 
             'Two', 
             To_date('01/02/1971', 'DD/MM/YYYY'), 
             'proftwo@gmail.com', 
             1002, 
             11111 ); 

INSERT INTO teacher 
            (teacher_id, 
             fname, 
             lname, 
             dob, 
             email, 
             class_id, 
             zip) 
VALUES      (3, 
             'Prof', 
             'Three', 
             To_date('01/03/1971', 'DD/MM/YYYY'), 
             'profthree@gmail.com', 
             1003, 
             11111 ); 

INSERT INTO teacher 
            (teacher_id, 
             fname, 
             lname, 
             dob, 
             email, 
             class_id, 
             zip) 
VALUES      (4, 
             'Prof', 
             'Four', 
             To_date('01/04/1971', 'DD/MM/YYYY'), 
             'proffour@gmail.com', 
             1004, 
             11111 ); 

INSERT INTO teacher 
            (teacher_id, 
             fname, 
             lname, 
             dob, 
             email, 
             class_id, 
             zip) 
VALUES      (5, 
             'Prof', 
             'Five', 
             To_date('01/05/1971', 'DD/MM/YYYY'), 
             'proffive@gmail.com', 
             1005, 
             11111 ); 

--Class Attendance:   
CREATE TABLE attendance 
  ( 
     attendance_date DATE, 
     status          VARCHAR2(255), 
     percentage      NUMBER, 
     remarks         VARCHAR2(255), 
     student_id      INT NOT NULL REFERENCES student(student_id), 
     PRIMARY KEY (attendance_date, student_id) 
  ); 

-- Populating Data 
INSERT INTO attendance 
            (attendance_date, 
             status, 
             percentage, 
             remarks, 
             student_id) 
VALUES      (To_date('12/01/2019', 'DD/MM/YYYY'), 
             'present', 
             100, 
             'Student was here early', 
             1 ); 

INSERT INTO attendance 
            (attendance_date, 
             status, 
             percentage, 
             remarks, 
             student_id) 
VALUES      (To_date('12/01/2019', 'DD/MM/YYYY'), 
             'present', 
             100, 
             'Student was here early', 
             2 ); 

INSERT INTO attendance 
            (attendance_date, 
             status, 
             percentage, 
             remarks, 
             student_id) 
VALUES      (To_date('12/01/2019', 'DD/MM/YYYY'), 
             'present', 
             100, 
             'Student was here early', 
             3 ); 

INSERT INTO attendance 
            (attendance_date, 
             status, 
             percentage, 
             remarks, 
             student_id) 
VALUES      (To_date('12/01/2019', 'DD/MM/YYYY'), 
             'present', 
             100, 
             'Student was here early', 
             4 ); 

INSERT INTO attendance 
            (attendance_date, 
             status, 
             percentage, 
             remarks, 
             student_id) 
VALUES      (To_date('12/01/2019', 'DD/MM/YYYY'), 
             'present', 
             100, 
             'Student was here early', 
             5 ); 