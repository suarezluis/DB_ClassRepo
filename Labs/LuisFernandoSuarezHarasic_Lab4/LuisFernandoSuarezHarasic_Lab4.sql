1)
CREATE TABLE store_reps 
  ( 
     rep_id NUMBER(5), 
     last   VARCHAR2(15), 
     first  VARCHAR2(10), 
     comm   CHAR(1) DEFAULT 'Y', 
     CONSTRAINT store_reps_rep_id_pk PRIMARY KEY (rep_id) 
  );

2)

ALTER TABLE store_reps
    MODIFY ( last CONSTRAINT store_reps_last_nn NOT NULL ,
             first CONSTRAINT store_reps_first_nn NOT NULL );

3) 

ALTER TABLE store_reps
    ADD CONSTRAINT store_reps_comm_ck CHECK (comm IN ('Y','N'));

4)

ALTER TABLE store_reps
    ADD (
        base_salary NUMBER(7,2), 
        CONSTRAINT store_reps_base_salary_ch CHECK (base_salary > 0)
        );

5)

CREATE TABLE book_stores
    (
        store_id NUMBER(8),
        name VARCHAR2(30) NOT NULL,
        contact VARCHAR2(30),
        rep_id VARCHAR2(5),
        CONSTRAINT book_stores_store_id_pk PRIMARY KEY (store_id),
        CONSTRAINT book_stores_name_uq UNIQUE (name)
    );

6)

ALTER TABLE book_stores 
  ADD CONSTRAINT book_stores_rep_id_fk FOREIGN KEY (rep_id) REFERENCES 
  store_reps (rep_id); 

-- Returns error different datatypes

ALTER TABLE book_stores 
  MODIFY rep_id NUMBER(5); 

ALTER TABLE book_stores 
  ADD CONSTRAINT book_stores_rep_id_fk FOREIGN KEY (rep_id) REFERENCES 
  store_reps (rep_id); 

7)

ALTER TABLE book_stores DROP CONSTRAINT book_stores_rep_id_fk;

ALTER TABLE book_stores 
  ADD CONSTRAINT book_stores_rep_id_fk FOREIGN KEY (rep_id) REFERENCES 
  store_reps (rep_id) ON DELETE CASCADE;

8)

CREATE TABLE project 
  ( 
     proj#    NUMBER(10), 
     p_name   VARCHAR2(30) NOT NULL, 
     p_desc   VARCHAR2(30), 
     p_budget NUMBER(10), 
     CONSTRAINT project_proj#_pk PRIMARY KEY (proj#), 
     CONSTRAINT project_p_name_uq UNIQUE (p_name) 
  ); 

CREATE TABLE workorders 
  ( 
     wo#         NUMBER(10), 
     proj#       NUMBER(10), 
     wo_desc     VARCHAR2(30) NOT NULL, 
     wo_assigned VARCHAR2(30), 
     wo_hours    NUMBER(10) NOT NULL, 
     wo_start    DATE, 
     wo_complete CHAR(1), 
     CONSTRAINT workorders_wo#_pk PRIMARY KEY (wo#), 
     CONSTRAINT workorders_proj#_fk FOREIGN KEY (proj#) REFERENCES project ( 
     proj#), 
     CONSTRAINT workorders_wo_desc_uq UNIQUE (wo_desc), 
     CONSTRAINT workorders_wo_complete_ck CHECK (wo_complete IN ('Y', 'N')) 
  ); 

