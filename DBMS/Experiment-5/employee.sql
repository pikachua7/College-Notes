/*
Script Name: "employee.sql"
=========================
    This script establishes the database for experiments in course named - Database Management Systems Lab [CSP351] of Fifth Semester B. E. [CSE] at RCOEM Nagpur.
    
    AUTHOR      : PROF. D. A. BORIKAR
    AFFILIATION : CSE, RCOEM NAGPUR
    DATE WRITTEN: 03-AUG-2020
    
NOTE: Strictly for use within RCOEM Nagpur for CSP351. Not to be circulated.

*/

REM CONFIGURING EMPLOYEE TABLE

SET ECHO OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET PAGESIZE 25
SET LINESIZE 80

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS PURGE;

CLEAR SCR;
PROMPT
PROMPT
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT |                                                                             |
PROMPT |            DATABASE MANAGEMENT SYSTEMS LAB [CSP351] [2020-2021]             |
PROMPT |                                                                             |
PROMPT |                       EMPLOYEE SCHEMA ESTABLISHMENT                         |
PROMPT |                                                                             |
PROMPT |                                                   BY: PROF. D. A. BORIKAR   |
PROMPT |                                                                             |
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT                                                                              
PROMPT  ~~~  EMPLOYEE SCHEMA IS BEING ESTABLISHED ... PLEASE WAIT...        
PROMPT             

CREATE TABLE EMPLOYEE(
    ENO			NUMBER(4)		NOT NULL,
    FNAME		VARCHAR2(10)	NOT NULL,
    LNAME		VARCHAR2(10)	NOT NULL,
    BIRTHDATE	DATE			NOT NULL,
    GENDER		CHAR(1)		    NOT NULL,
    HIREDATE	DATE			NOT NULL,
    SALARY		NUMBER(8,2)	    NOT NULL,
    DEPARTMENT	CHAR(20),		
    DESIGNATION	VARCHAR2(15)	NOT NULL,
    SSN			CHAR(10)		NOT NULL, 
    CONSTRAINTS EMPLOYEE_PK_ENO PRIMARY KEY (ENO),
    CONSTRAINTS EMPLOYEE_CK_ENO CHECK (ENO >= 7101),
    CONSTRAINTS EMPLOYEE_CK_GENDER CHECK (GENDER IN ('M','F')),
    CONSTRAINTS EMPLOYEE_CK_SALARY CHECK (SALARY >= 30000),
    CONSTRAINTS EMPLOYEE_CK_DESIGNATION CHECK 
    (DESIGNATION IN ('Professor','Research Asst.','Asso. Professor', 'Teaching Asst.','Asst. Professor')),
    CONSTRAINTS EMPLOYEE_UQ_SSN UNIQUE (SSN)
);

PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT |                                                                             |
PROMPT |                       EMPLOYEE SCHEMA ESTABLISHED                           |
PROMPT |                                                                             |
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT
PROMPT

PAUSE DATABASE WILL BE POPULATED NOW. PRESS ANY KEY TO PROCEED.

REM POPULATING EMPLOYEE DATABASE
CLEAR SCR;

PROMPT
PROMPT
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT |                                                                             |
PROMPT |                   DATABASE MANAGEMENT SYSTEMS LAB [CSP351]                  |
PROMPT |                                                                             |
PROMPT |                       POPULATING THE EMPLOYEE SCHEMA                        |
PROMPT |                                                                             |
PROMPT |                                                   BY: PROF. D. A. BORIKAR   |
PROMPT |                                                                             |
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT                                                                              
PROMPT  ~~~  EMPLOYEE SCHEMA IS BEING POPULATED ... PLEASE WAIT...        
PROMPT             

REM POPULATING EMPLOYEE TABLE

INSERT INTO EMPLOYEE VALUES(7102,'Samantha','Jones','31-MAR-1980','F','08-NOV-2006',146500,'Computer Science','Professor','12LS924445');
INSERT INTO EMPLOYEE VALUES(7101,'Eugene','Sabatini','09-NOV-1983','F','10-OCT-2006',150000,'Biotechnology','Professor','11WA132311');
INSERT INTO EMPLOYEE VALUES(7103,'Alexander','Lloyd','30-JAN-1980','M','01-FEB-2007',148000,'Machine Vision','Professor','56TX921165');
INSERT INTO EMPLOYEE VALUES(7104,'Simon','Downing','23-Mar-1988','M','01-SEP-2007',138400,'Data Science','Professor','51MT339105');

INSERT INTO EMPLOYEE VALUES(7107,'Christov','Plutnik','23-May-1988','M','01-SEP-2008',127400,'Computer Science','Asso. Professor','52PK323705');
INSERT INTO EMPLOYEE VALUES(7105,'Christina','Mulboro','11-Jun-1990','F','15-JUL-2008',127400,'Biotechnology','Asso. Professor','52TT336505');
INSERT INTO EMPLOYEE VALUES(7106,'Dolly','Silverline','29-Feb-1992','F','17-AUG-2008',127400,'Machine Vision','Asso. Professor','51ER330455');
INSERT INTO EMPLOYEE VALUES(7108,'Ellena','Sanchez','23-Mar-1988','F','12-NOV-2009',119700,'Data Science','Asso. Professor','51HX399235');

INSERT INTO EMPLOYEE VALUES(7109,'Martina','Jacobson','30-JUN-1984','F','15-NOV-2009',91000,'Nanotechnology','Asst. Professor','56TX811122');
INSERT INTO EMPLOYEE VALUES(7110,'William','Smithfield','02-NOV-1982','M','23-JUN-2010',86400,'Computer Science','Asst. Professor','11WA112121');

INSERT INTO EMPLOYEE VALUES(7111,'Albert','Greenfield','16-APR-1995','M','12-JUL-2016',48200,'Biotechnology','Research Asst.','12LS893456');
INSERT INTO EMPLOYEE VALUES(7112,'James','Washington','15-SEP-1993','M','22-AUG-2017',44600,'Data Science','Research Asst.','13CA123121');

INSERT INTO EMPLOYEE VALUES(7113,'Julia','Martin','09-FEB-1997','F','01-DEC-2018',35600,'Computer Science','Teaching Asst.','23CA911760');
INSERT INTO EMPLOYEE VALUES(7114,'Larry','Gomes','28-AUG-1996','M','18-MAY-2019',32850,'Biotechnology','Teaching Asst.','53TX288761');
INSERT INTO EMPLOYEE VALUES (7115,'Svetlana','Sanders','15-OCT-1997','F','15-JAN-2020',30000,'Machine Vision','Teaching Asst.','24MA123456');
INSERT INTO EMPLOYEE VALUES (7116,'Lovelyn','Brendon','12-DEC-1999','F','17-JUL-2020',30000,'Data Science','Teaching Asst.','43MA156458');
INSERT INTO EMPLOYEE VALUES(7117,'Hector','Hercules','17-APR-1997','M','01-AUG-2020',32200,'Data Science','Teaching Asst.','17KD447711');

COMMIT;

PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT |                                                                             |
PROMPT |                       EMPLOYEE SCHEMA IS UP FOR USE                         |
PROMPT |                                                                             |
PROMPT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PROMPT
PROMPT

PAUSE PRESS ANY KEY TO CONTINUE.

CLEAR SCR;

COLUMN ENO FORMAT 9999
COLUMN SALARY FORMAT 999999.9

PROMPT DATABASE CONTAINS..
PROMPT

SELECT COUNT(*) "Employee#" FROM EMPLOYEE;

SET FEEDBACK 1
SET VERIFY ON
SET ECHO ON 