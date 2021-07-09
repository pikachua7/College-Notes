/*QUERY-2*/

SELECT FNAME,LNAME,ADVISOR,ROLL
FROM STUDENT 
WHERE ROLL=40;

/*OUTPUT*/
/*
FNAME           LNAME              ADVISOR       ROLL
--------------- --------------- ---------- ----------
Atharva         Paliwal                107         40

1 row selected.
*/

/*QUERY-3*/

CREATE SEQUENCE STAFF_SQ
INCREMENT BY 1 START WITH 106
MINVALUE 106
MAXVALUE 110;
/*Sequence created.*/

INSERT INTO STAFF
VALUES(STAFF_SQ.NEXTVAL,'Deo Narayan Mishra','DAT','Assistant','13-Oct-2013');

INSERT INTO STAFF
VALUES(STAFF_SQ.NEXTVAL,'Sanjeev Bamireddy','CSEC','Associate','12-May-2018');

INSERT INTO STAFF
VALUES(STAFF_SQ.NEXTVAL,'Jasmine Arora','CSE','Assistant','11-Aug-2017');

INSERT INTO STAFF
VALUES(STAFF_SQ.NEXTVAL,'Vallabh Pai','CSE','Assistant','17-Sep-2018');

INSERT INTO STAFF
VALUES(STAFF_SQ.NEXTVAL,'Harmeet Khullar','AIML','Assistant','17-Mar-2019');




/*QUERY-4*/
SELECT TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE,OWNER
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('DEPT','STAFF','STUDENT');
/*OUTPUT*/
/*

TABLE_NAME CONSTRAINT_NAME                C OWNER
---------- ------------------------------ - ------------------------------
DEPT       SYS_C0011605                   C CS540
DEPT       SYS_C0011606                   C CS540
DEPT       SYS_C0011607                   C CS540
DEPT       SYS_C0011608                   C CS540
DEPT       SYS_C0011609                   C CS540
DEPT       DEPT_CK_BRANCH                 C CS540
DEPT       DEPT_CK_INTAKE                 C CS540
DEPT       DEPT_CK_YR_EST                 C CS540
DEPT       DEPT_PK_BRANCH                 P CS540
DEPT       SYS_C0011631                   R CS540
STAFF      SYS_C0011614                   C CS540

TABLE_NAME CONSTRAINT_NAME                C OWNER
---------- ------------------------------ - ------------------------------
STAFF      SYS_C0011615                   C CS540
STAFF      SYS_C0011616                   C CS540
STAFF      SYS_C0011617                   C CS540
STAFF      SYS_C0011618                   C CS540
STAFF      STAFF_CK_SID                   C CS540
STAFF      STAFF_CK_DESG                  C CS540
STAFF      STAFF_PK_SID                   P CS540
STAFF      STAFF_FK_DEPT                  R CS540
STUDENT    SYS_C0011623                   C CS540
STUDENT    SYS_C0011624                   C CS540
STUDENT    SYS_C0011625                   C CS540

TABLE_NAME CONSTRAINT_NAME                C OWNER
---------- ------------------------------ - ------------------------------
STUDENT    SYS_C0011626                   C CS540
STUDENT    STUDENT_CK_ROLL                C CS540
STUDENT    STUDENT_PK_ROLL                P CS540
STUDENT    SYS_C0011629                   U CS540
STUDENT    SYS_C0011630                   U CS540

27 rows selected.
*/

ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_FK_ADVISOR_SID FOREIGN KEY(ADVISOR)
REFERENCES STAFF(SID);
/*Table altered.*/


/*QUERY-5*/
/*Giving grant to create VIEW*/
CONNECT SYSTEM/system;
GRANT CREATE VIEW TO CS540;
CONNECT CS540/atharva;
/*---------------------*/
CREATE VIEW STUDENT_VW AS
SELECT ENROLL,LNAME,FNAME,ROLL,ADVISOR
FROM STUDENT;
/*View created.*/
SELECT * FROM STUDENT_VW
WHERE ROLL BETWEEN 1 AND 5
OR ROLL BETWEEN 35 AND 45
OR ROLL BETWEEN 84 AND 89;
/*

ENROLL         LNAME          FNAME            ROLL    ADVISOR REG_DT
-------------- -------------- ---------- ---------- ---------- ---------
               Namjoshi       Naveen             88        109 14-AUG-19
               Tipnis         Tushar             89        110 14-AUG-19
18CSU2001CSU2  Sayed          Afra                1        101 20-JUL-18
18CSU2002CSU2  Wasalu         Akansha             2        104 20-JUL-18
18CSU2003CSU2  Rajendran      Anjali              3        108 19-JUL-18
18CSU2009CSU2  Menghal        Aradhita            4        109 07-JUL-18
18CSU2019CSU2  Gupta          Ayush              41        101 12-JUL-18
18CSU2020CSU2  Kapre          Chaitanya          42        104 25-JUL-18
18CSU2021CSU2  Paliwal        Dev                43        108 21-JUL-18
18CSU2029CSU2  Shukla         Gaurav             44        109 17-JUL-18
16CSU2094CSU2  Rangari        Mayank             87        108 25-JUL-16

ENROLL         LNAME          FNAME            ROLL    ADVISOR REG_DT
-------------- -------------- ---------- ---------- ---------- ---------
18CSU2004CSU2  Fadnavis       Ketki               5        102 14-JUL-18
18CSU2014CSU2  Chandak        Akshat             35        102 20-JUL-18
18CSU2060CSU2  Chole          Amey               36        110 08-AUG-18
18CSU2058CSU2  Virdi          Gursewak           45        110 07-JUL-18
18CSU2015CSU2  Ray            Amit               37        103 20-JUL-18
18CSU2016CSU2  Pandharipande  Aryan              38        106 07-JUL-18
18CSU2056CSU2  Jain           Yash               84        103 03-JUL-18
18CSU2017CSU2  Uplanchiwar    Atharva            39        105 07-JUL-18
18CSU2018CSU2  Paliwal        Atharva            40        107 20-JUL-18
18CSU2057CSU2  Siral          Yogesh             85        105 21-JUL-18
17CSU2047CSU2  Pandey         Shapath            86        107 27-JUL-17

22 rows selected.
*/


/*QUERY-6*/

CREATE OR REPLACE VIEW STUDENT_VW AS
SELECT ENROLL,LNAME,FNAME,ROLL,ADVISOR,REG_DT
FROM STUDENT;
/*View created.*/

INSERT INTO STUDENT_VW 
VALUES('','Namjoshi','Naveen',88,109,'14-AUG-2019');
/*1 row created.*/

INSERT INTO STUDENT_VW 
VALUES('','Tipnis','Tushar',89,110,'14-AUG-2019');
/*1 row created.*/


SELECT * FROM STUDENT_VW
WHERE ROLL=88 OR ROLL=89;

/*

ENROLL        LNAME           FNAME                 ROLL    ADVISOR REG_DT
------------- --------------- --------------- ---------- ---------- ---------
              Namjoshi        Naveen                  88        109 14-AUG-19
              Tipnis          Tushar                  89        110 14-AUG-19
*/

SELECT * FROM STUDENT
WHERE ROLL=88 OR ROLL=89;

/*

ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  88 Namjoshi   Naveen                                  109            14-AUG-19
  89 Tipnis     Tushar                                  110            14-AUG-19
*/


/*QUERY	-7*/

CREATE OR REPLACE VIEW STUDENT_VW_RO AS
SELECT * FROM STUDENT_VW
WITH READ ONLY;		  
/*View created.*/

SELECT * FROM STUDENT_VW_RO
WHERE ROLL BETWEEN 1 AND 5
OR ROLL BETWEEN 35 AND 45
OR ROLL BETWEEN 84 AND 89;

/*

ENROLL         LNAME          FNAME            ROLL    ADVISOR REG_DT
-------------- -------------- ---------- ---------- ---------- ---------
               Namjoshi       Naveen             88        109 14-AUG-19
               Tipnis         Tushar             89        110 14-AUG-19
18CSU2001CSU2  Sayed          Afra                1        101 20-JUL-18
18CSU2002CSU2  Wasalu         Akansha             2        104 20-JUL-18
18CSU2003CSU2  Rajendran      Anjali              3        108 19-JUL-18
18CSU2009CSU2  Menghal        Aradhita            4        109 07-JUL-18
18CSU2019CSU2  Gupta          Ayush              41        101 12-JUL-18
18CSU2020CSU2  Kapre          Chaitanya          42        104 25-JUL-18
18CSU2021CSU2  Paliwal        Dev                43        108 21-JUL-18
18CSU2029CSU2  Shukla         Gaurav             44        109 17-JUL-18
16CSU2094CSU2  Rangari        Mayank             87        108 25-JUL-16

ENROLL         LNAME          FNAME            ROLL    ADVISOR REG_DT
-------------- -------------- ---------- ---------- ---------- ---------
18CSU2004CSU2  Fadnavis       Ketki               5        102 14-JUL-18
18CSU2014CSU2  Chandak        Akshat             35        102 20-JUL-18
18CSU2060CSU2  Chole          Amey               36        110 08-AUG-18
18CSU2058CSU2  Virdi          Gursewak           45        110 07-JUL-18
18CSU2015CSU2  Ray            Amit               37        103 20-JUL-18
18CSU2016CSU2  Pandharipande  Aryan              38        106 07-JUL-18
18CSU2056CSU2  Jain           Yash               84        103 03-JUL-18
18CSU2017CSU2  Uplanchiwar    Atharva            39        105 07-JUL-18
18CSU2018CSU2  Paliwal        Atharva            40        107 20-JUL-18
18CSU2057CSU2  Siral          Yogesh             85        105 21-JUL-18
17CSU2047CSU2  Pandey         Shapath            86        107 27-JUL-17

22 rows selected.
*/

INSERT INTO STUDENT_VW_RO
VALUES('','Goldsmith','Cindrella',91,101,'18-Aug-2019');
/*
EXPLANATION***
INSERT INTO STUDENT_VW_RO
*
ERROR at line 1:
ORA-42399: cannot perform a DML operation on a read-only view
*/



/*QUERY-8*/
CREATE OR REPLACE VIEW STUDENT_VW_CK AS 
SELECT ENROLL,LNAME,FNAME,ROLL,ADVISOR,REG_DT FROM STUDENT
WHERE ADVISOR IN(101,103,105,108,109)
WITH CHECK OPTION CONSTRAINT STUDENT_ADV_CK;

/* View created.*/


/*chhhecckkk*/
SELECT * FROM STUDENT_VW_CK;
/*

ENROLL         LNAME          FNAME                ROLL    ADVISOR REG_DT
-------------- -------------- -------------- ---------- ---------- ---------
               Namjoshi       Naveen                 88        109 14-AUG-19
18CSU2001CSU2  Sayed          Afra                    1        101 20-JUL-18
18CSU2003CSU2  Rajendran      Anjali                  3        108 19-JUL-18
18CSU2009CSU2  Menghal        Aradhita                4        109 07-JUL-18
18CSU2023CSU2  Deshmukh       Ritul                  11        101 18-JUL-18
18CSU2025CSU2  Agnihotri      Shreya                 13        108 07-JUL-18
18CSU2026CSU2  Shukla         Shrishti               14        109 19-JUL-18
18CSU2010CSU2  Muley          Aayush                 31        101 19-JUL-18
18CSU2012CSU2  Kotgirwar      Adesh                  33        108 20-JUL-18
18CSU2013CSU2  Nawghare       Adhney                 34        109 08-AUG-18
18CSU2019CSU2  Gupta          Ayush                  41        101 12-JUL-18

ENROLL         LNAME          FNAME                ROLL    ADVISOR REG_DT
-------------- -------------- -------------- ---------- ---------- ---------
18CSU2021CSU2  Paliwal        Dev                    43        108 21-JUL-18
18CSU2029CSU2  Shukla         Gaurav                 44        109 17-JUL-18
18CSU2032CSU2  Sharma         Keshubh                53        109 20-JUL-18
18CSU2033CSU2  Thorane        Kunal                  54        108 08-AUG-18
18CSU2035CSU2  Tiwari         Nikhil                 56        101 04-JUL-18
18CSU2043CSU2  Parashar       Ritik                  64        108 19-JUL-18
18CSU2044CSU2  Chandani       Rohit                  65        101 08-AUG-18
18CSU2051CSU2  Jha            Shubham                78        109 12-JUL-18
18CSU2052CSU2  Kushwah        Yaman                  79        108 17-JUL-18
16CSU2095CSU2  Soni           Renuka                 30        109 25-JUL-16
16CSU2094CSU2  Rangari        Mayank                 87        108 25-JUL-16

ENROLL         LNAME          FNAME                ROLL    ADVISOR REG_DT
-------------- -------------- -------------- ---------- ---------- ---------
18CSU2006CSU2  Gupta          Muskan                  7        103 19-JUL-18
19CSU2202CSU2  Bhanuse        Prachi                 18        103 11-AUG-19
18CSU2015CSU2  Ray            Amit                   37        103 20-JUL-18
19CSU2205CSU2  Pardhi         Manishkumar            48        103 23-AUG-19
18CSU2038CSU2  Agrawal        Rahul                  59        103 16-JUL-18
18CSU2047CSU2  Sushir         Saurabh                73        103 07-JUL-18
18CSU2056CSU2  Jain           Yash                   84        103 03-JUL-18
17CSU2092CSU2  Soni           Anujesh                67        103 25-JUL-17
18CSU2008CSU2  Taori          Priyal                  9        105 19-JUL-18
18CSU2017CSU2  Uplanchiwar    Atharva                39        105 07-JUL-18
18CSU2030CSU2  Karwa          Harsh                  51        105 11-JUL-18

ENROLL         LNAME          FNAME                ROLL    ADVISOR REG_DT
-------------- -------------- -------------- ---------- ---------- ---------
18CSU2041CSU2  Khandelwal     Raunak                 62        105 19-JUL-18
18CSU2048CSU2  Tapas          Shashank               75        105 07-JUL-18
18CSU2050CSU2  Nemani         Shreyas                77        105 20-JUL-18
18CSU2057CSU2  Siral          Yogesh                 85        105 21-JUL-18

37 rows selected.

*/

INSERT INTO STUDENT_VW_CK
VALUES('','Ford','Sebastian',92,104,'18-Aug-2019');

/*
INSERT INTO STUDENT_VW_CK
            *
ERROR at line 1:
ORA-01402: view WITH CHECK OPTION where-clause violation

*/

/*QUERY-9*/
COLUMN VIEW_NAME FOR A15;
COLUMN VIEW_TYPE FOR A15;
COLUMN TEXT FOR A44 WRAPPED;

SELECT VIEW_NAME,VIEW_TYPE,READ_ONLY,TEXT
FROM USER_VIEWS;


/*

VIEW_NAME       VIEW_TYPE       RO TEXT
--------------- --------------- -- --------------------------------------------
STUDENT_VW                      N  SELECT ENROLL,LNAME,FNAME,ROLL,ADVISOR,REG_D
                                   T
                                   FROM STUDENT

STUDENT_VW_CK                   N  SELECT ENROLL,LNAME,FNAME,ROLL,ADVISOR,REG_D
                                   T FROM STUDENT
                                   WHERE ADVISOR IN(101,

STUDENT_VW_RO                   Y  SELECT "ENROLL","LNAME","FNAME","ROLL","ADVI
                                   SOR","REG_DT" FROM STUDENT_VW
                                   WITH R
*/


SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE,OWNER
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE '%_VW_%';


/*

CONSTRAINT_NAME                C OWNER
------------------------------ - ------------------------------
STUDENT_ADV_CK                 V CS540
SYS_C0011633                   O CS540
*/


/*QUERY-10*/

/*PRIVILAGES*/
CONNECT SYSTEM/system;
GRANT CREATE ANY SYNONYM TO CS540;
CONNECT CS540/atharva;
/*---------------------*/
CREATE SYNONYM FACULTY_SN
FOR STAFF;
/* Synonym created.*/


SELECT * FROM FACULTY_SN;
/*

       SID NAME                      BRAN DESG      JOIN_DT
---------- ------------------------- ---- --------- ---------
       101 Kamalkant Marathe         CSE  Professor 12-JUN-05
       102 Adishesh Vidyarthi        AIML Associate 22-JUL-06
       103 Manishi Singh             DAT  Professor 10-NOV-07
       104 Aasawari Deodhar          CSE  Associate 13-OCT-08
       105 Geetika Goenka            CSEC Professor 15-NOV-09
       106 Deo Narayan Mishra        DAT  Assistant 13-OCT-13
       107 Sanjeev Bamireddy         CSEC Associate 12-MAY-18
       108 Jasmine Arora             CSE  Assistant 11-AUG-17
       109 Vallabh Pai               CSE  Assistant 17-SEP-18
       110 Harmeet Khullar           AIML Assistant 17-MAR-19

10 rows selected.
*/
INSERT INTO FACULTY_SN
VALUES(111,'Dhawal Giri','AIML','Assistant',SYSDATE);
/* 1 row created.*/

SELECT * FROM FACULTY_SN
WHERE SID=111;
/*

       SID NAME                      BRAN DESG      JOIN_DT
---------- ------------------------- ---- --------- ---------
       111 Dhawal Giri               AIML Assistant 26-AUG-20
*/
SELECT * FROM STAFF
WHERE SID=111;
/*
       SID NAME                      BRAN DESG      JOIN_DT
---------- ------------------------- ---- --------- ---------
       111 Dhawal Giri               AIML Assistant 26-AUG-20

*/



/*QUERY-11*/
CREATE UNIQUE INDEX STUDENT_FNAME
ON STUDENT(FNAME);

/*
ON STUDENT(FNAME)
   *
ERROR at line 2:
ORA-01452: cannot CREATE UNIQUE INDEX; duplicate keys found

*/

CREATE INDEX STUDENT_NDX_FNAME
ON STUDENT(FNAME);
/* Index created.*/


SELECT * 
FROM STUDENT
WHERE UPPER(FNAME) IN ('RISHIKESH');
/*

ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  63 Kale       Rishikesh kalerv@rkn 18CSU2042CSU2      104 9834774612 07-JUL-18
                          ec.edu

*/

SELECT *
FROM STUDENT
WHERE UPPER(FNAME) IN ('ATHARVA');
/*
ROLL LNAME      FNAME   EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- ------- ---------- -------------- ------- ---------- ---------
  39 Uplanchiwa Atharva uplanchiwa 18CSU2017CSU2      105 9860320604 07-JUL-18
     r                  rad@rknec.
                        edu

  40 Paliwal    Atharva paliwalap@ 18CSU2018CSU2      107 7218385709 20-JUL-18
                        rknec.edu
*/

SELECT *
FROM STUDENT
WHERE UPPER(FNAME) IN ('YASH');
/*
ROLL LNAME      FNAM EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- ---- ---------- -------------- ------- ---------- ---------
  80 Bhageriya  Yash bhageriyay 18CSU2053CSU2      104 8830170305 19-JUL-18
                     a@rknec.ed
                     u

  81 Daware     Yash dawareya@r 18CSU2054CSU2      102 9325504104 20-JUL-18
                     knec.edu

  82 Roy        Yash royya@rkne 18CSU2059CSU2      110 8378090591 07-JUL-18
                     c.edu

  83 Dhamecha   Yash dhamechayl 18CSU2055CSU2      106 7447339449 21-JUL-18

ROLL LNAME      FNAM EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- ---- ---------- -------------- ------- ---------- ---------
                     @rknec.edu

  84 Jain       Yash jainyt@rkn 18CSU2056CSU2      103 7769989555 03-JUL-18
                     ec.edu

*/

CREATE INDEX STUDENT_NDX_LNAME_FNAME
ON STUDENT(LNAME,FNAME);
/*

Index created.
*/
SELECT *
FROM STUDENT
WHERE UPPER(FNAME)='YASH' AND UPPER(LNAME)='ROY';
/*

ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  82 Roy        Yash      royya@rkne 18CSU2059CSU2      110 8378090591 07-JUL-18
                          c.edu
						  						  
*/
SELECT *
FROM STUDENT
WHERE UPPER(FNAME)='ATHARVA' AND UPPER(LNAME)='PALIWAL';
/*
ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  40 Paliwal    Atharva   paliwalap@ 18CSU2018CSU2      107 7218385709 20-JUL-18
                          rknec.edu
*/
SELECT *
FROM STUDENT
WHERE UPPER(FNAME)='RISHIKESH' AND UPPER(LNAME)='KALE';
/*

ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  63 Kale       Rishikesh kalerv@rkn 18CSU2042CSU2      104 9834774612 07-JUL-18
                          ec.edu
*/

SELECT INDEX_NAME,TABLE_NAME,UNIQUENESS,STATUS
FROM USER_INDEXES
WHERE TABLE_NAME IN('STUDENT');


/*
INDEX_NAME                     TABLE_NAME                     UNIQUENES STATUS
------------------------------ ------------------------------ --------- --------
STUDENT_NDX_FNAME              STUDENT                        NONUNIQUE VALID
SYS_C0011630                   STUDENT                        UNIQUE    VALID
SYS_C0011629                   STUDENT                        UNIQUE    VALID
STUDENT_PK_ROLL                STUDENT                        UNIQUE    VALID
*/


SELECT INDEX_NAME,TABLE_NAME,UNIQUENESS,STATUS
FROM USER_INDEXES
WHERE TABLE_OWNER='CS540' AND TABLE_NAME IN ('STUDENT','STAFF','DEPT');
/*
INDEX_NAME                     TABLE_NAME                     UNIQUENES STATUS
------------------------------ ------------------------------ --------- --------
DEPT_PK_BRANCH                 DEPT                           UNIQUE    VALID
STAFF_PK_SID                   STAFF                          UNIQUE    VALID
STUDENT_PK_ROLL                STUDENT                        UNIQUE    VALID
SYS_C0011629                   STUDENT                        UNIQUE    VALID
SYS_C0011630                   STUDENT                        UNIQUE    VALID
STUDENT_NDX_FNAME              STUDENT                        NONUNIQUE VALID
STUDENT_NDX_LNAME_FNAME        STUDENT                        NONUNIQUE VALID

7 rows selected.
*/




/*QUERY-12*/
CONNECT SYSTEM/system;
ALTER SYSTEM SET QUERY_REWRITE_ENABLED=TRUE;
CONNECT CS540/atharva;


CREATE INDEX STUDENT_NDX_LNAME_FN
ON STUDENT(UPPER(LNAME));
/* Index created.*/

SELECT FNAME,LNAME FROM STUDENT
WHERE UPPER(LNAME)='PALIWAL';

/*

FNAME     LNAME
--------- ----------
Atharva   Paliwal

*/


CREATE INDEX STUDENT_NDX_LNAME_FNAME_FN
ON STUDENT(UPPER(FNAME),UPPER(LNAME));
/* Index created.*/

SELECT FNAME,LNAME FROM STUDENT
WHERE UPPER(LNAME)='PALIWAL' AND UPPER(FNAME)='ATHARVA';

/*

FNAME     LNAME
--------- ----------
Atharva   Paliwal

*/






/* QUERY-13*/

SAVEPOINT SP_NONE;

/*
Savepoint created.
*/

INSERT INTO STUDENT 
VALUES(91,'Goldsmith','Cindrella','','',101,'','18-Aug-2019');
/*1 row created.*/

INSERT INTO STUDENT 
VALUES(92,'Ford','Sebastian','','',104,'','18-Aug-2019');
/*1 row created.*/


SAVEPOINT SP_FORD;

/*Savepoint created.*/

UPDATE STUDENT 
SET ADVISOR=108
WHERE UPPER(FNAME)='NAVEEN' AND UPPER(LNAME)='NAMJOSHI';
/*1 row updated.*/

SAVEPOINT SP_NAV;
/*Savepoint created.*/

UPDATE STUDENT 
SET ADVISOR=111
WHERE UPPER(FNAME)='TUSHAR' AND UPPER(LNAME)='TIPNIS';
/*1 row updated.*/

SAVEPOINT SP_TUS;
/*Savepoint created.*/


SELECT * FROM STUDENT 
WHERE ROLL=91 OR ROLL=92 OR  UPPER(FNAME)='NAVEEN' OR UPPER(FNAME)='TUSHAR';

/*

ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  88 Namjoshi   Naveen                                  108            14-AUG-19
  89 Tipnis     Tushar                                  111            14-AUG-19
  91 Goldsmith  Cindrella                               101            18-AUG-19
  92 Ford       Sebastian                               104            18-AUG-19
*/




/* QUERY-14*/

ROLLBACK TO SAVEPOINT SP_FORD;
/*Rollback complete.*/

SELECT * FROM STUDENT 
WHERE ROLL=91 OR ROLL=92 OR  UPPER(FNAME)='NAVEEN' OR UPPER(FNAME)='TUSHAR';
/*

ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  88 Namjoshi   Naveen                                  109            14-AUG-19
  89 Tipnis     Tushar                                  110            14-AUG-19
  91 Goldsmith  Cindrella                               101            18-AUG-19
  92 Ford       Sebastian                               104            18-AUG-19

*/ 

ROLLBACK TO SAVEPOINT SP_NONE;
/*Rollback complete.*/

SELECT * FROM STUDENT 
WHERE ROLL=91 OR ROLL=92 OR  UPPER(FNAME)='NAVEEN' OR UPPER(FNAME)='TUSHAR';

/*
ROLL LNAME      FNAME     EMAIL      ENROLL         ADVISOR      PHONE REG_DT
---- ---------- --------- ---------- -------------- ------- ---------- ---------
  88 Namjoshi   Naveen                                  109            14-AUG-19
  89 Tipnis     Tushar                                  110            14-AUG-19

*/




