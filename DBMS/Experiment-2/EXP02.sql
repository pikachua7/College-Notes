/*COLUMN FORMATTING*/

COLUMN DESCRIPT FORMAT A9;
COLUMN V_NAME FORMAT A9;


/*QUERY-2*/
SELECT TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE,OWNER
	FROM USER_CONSTRAINTS
	WHERE TABLE_NAME IN('CUSTOMER','INVOICE','LINE','PRODUCT','VENDOR');

/*OUTPUT*/
/*
TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------
CUSTOMER                       SYS_C0011394                   C
CS540

CUSTOMER                       SYS_C0011395                   C
CS540

CUSTOMER                       SYS_C0011396                   C
CS540

CUSTOMER                       SYS_C0011397                   C
CS540

CUSTOMER                       SYS_C0011398                   C
CS540

CUSTOMER                       SYS_C0011399                   C
CS540

CUSTOMER                       CUSTOMER_CK_C_CODE             C
CS540

TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------

CUSTOMER                       CUSTOMER_CK_C_AREA             C
CS540

CUSTOMER                       CUSTOMER_PK_C_CODE             P
CS540

INVOICE                        SYS_C0011403                   C
CS540

INVOICE                        SYS_C0011404                   C
CS540

INVOICE                        SYS_C0011405                   C
CS540

INVOICE                        INVOICE_CK_INV_NUM             C
CS540

INVOICE                        INVOICE_PK_INV_NUM             P

TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------
CS540

INVOICE                        INVOICE_CUSTOMER_FK_C_CODE     R
CS540

LINE                           SYS_C0011430                   C
CS540

LINE                           SYS_C0011431                   C
CS540

LINE                           SYS_C0011432                   C
CS540

LINE                           SYS_C0011433                   C
CS540

LINE                           SYS_C0011434                   C
CS540


TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------
LINE                           LINE_CK_L_NUM                  C
CS540

LINE                           LINE_CK_L_UNITS                C
CS540

LINE                           LINE_CK_L_PRICE                C
CS540

LINE                           LINE_PK_INV_NUM_L_NUM          P
CS540

LINE                           LINE_INVOICE_FK_INV_NUM        R
CS540

LINE                           LINE_PRODUCT_FK_P_CODE         R
CS540

PRODUCT                        SYS_C0011420                   C
CS540

TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------

PRODUCT                        SYS_C0011421                   C
CS540

PRODUCT                        SYS_C0011422                   C
CS540

PRODUCT                        SYS_C0011423                   C
CS540

PRODUCT                        SYS_C0011424                   C
CS540

PRODUCT                        SYS_C0011425                   C
CS540

PRODUCT                        SYS_C0011426                   C
CS540

PRODUCT                        PRODUCT_CK_P_MIN               C

TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------
CS540

PRODUCT                        PRODUCT_PK_P_CODE              P
CS540

PRODUCT                        PRODUCT_VENDOR_FK_V_CODE       R
CS540

VENDOR                         SYS_C0011409                   C
CS540

VENDOR                         SYS_C0011410                   C
CS540

VENDOR                         SYS_C0011411                   C
CS540

VENDOR                         SYS_C0011412                   C
CS540


TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------
VENDOR                         SYS_C0011413                   C
CS540

VENDOR                         SYS_C0011414                   C
CS540

VENDOR                         SYS_C0011415                   C
CS540

VENDOR                         VENDOR_CK_V_CODE               C
CS540

VENDOR                         VENDOR_CK_V_AREA               C
CS540

VENDOR                         VENDOR_CK_V_STATE              C
CS540

VENDOR                         VENDOR_PK_V_CODE               P
CS540

TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
OWNER
------------------------------


47 rows selected.
*/

/*QUERY-3*/
INSERT INTO LINE VALUES (1009,1,'HW15X',20,15.50);

/*OUTPUT*/
/*
*
ERROR at line 1:
ORA-02291: integrity constraint (CS540.LINE_PRODUCT_FK_P_CODE) violated -
parent key not found


*/


/*QUERY-3 FOR RESOLVING ERROR*/
INSERT INTO VENDOR VALUES(24992,'INDIAN MASTERS','GAURAV',501,2863322,'KY','N');

INSERT INTO PRODUCT VALUES('HW15X','HIVELD HAMMER','10-JAN-2020',60,15,15.50,0,24992);

INSERT INTO CUSTOMER VALUES(10020,'PALIWAL','ATHARVA',904,3562098,500.00);

INSERT INTO INVOICE VALUES(1009,10020,'22-JAN-2020');

INSERT INTO LINE VALUES (1009,1,'HW15X',20,15.50);




/*QUERY-3 SELECT STATEMENTS*/
SELECT * FROM CUSTOMER WHERE C_CODE=10020;
/*

    C_CODE LNAME      FNAME          C_AREA    C_PHONE    BALANCE
---------- ---------- ---------- ---------- ---------- ----------
     10020 PALIWAL    ATHARVA           904    3562098        500
*/
SELECT * FROM INVOICE WHERE INV_NUM=1009;
/*

   INV_NUM     C_CODE INV_DATE
---------- ---------- ---------
      1009      10020 22-JAN-20
	  */
SELECT * FROM VENDOR WHERE V_CODE=24992;
/*

    V_CODE V_NAME                         V_CONTACT                V_AREA
---------- ------------------------------ -------------------- ----------
   V_PHONE V_ V
---------- -- -
     24992 INDIAN MASTERS                 GAURAV                      501
   2863322 KY N
*/
SELECT * FROM PRODUCT WHERE P_CODE='HW15X' AND V_CODE=24992;
/*

P_COD DESCRIPT                       P_DATE           QTY      P_MIN    P_PRICE
----- ------------------------------ --------- ---------- ---------- ----------
    P_DISC     V_CODE
---------- ----------
HW15X HIVELD HAMMER                  10-JAN-20         60         15       15.5
         0      24992
*/
SELECT * FROM LINE WHERE P_CODE='HW15X';
/*
   INV_NUM      L_NUM P_COD    L_UNITS    L_PRICE
---------- ---------- ----- ---------- ----------
      1009          1 HW15X         20       15.5
*/



/*QUERY-4*/

SELECT P_CODE,DESCRIPT,V_CODE
FROM PRODUCT
WHERE UPPER(DESCRIPT) LIKE '%HAMMER%' OR  UPPER(DESCRIPT) LIKE '%SCREW%';

/*OUTPUT*/

/*


P_COD DESCRIPT                           V_CODE
----- ------------------------------ ----------
CH10X Claw Hammer                         21225
SH100 Sledge Hammer
MC001 Metal Screw                         21225
WC025 2.5in wide Screw                    21231
HW15X HIVELD HAMMER                       24992

5 rows selected.

*/


/*QUERY-5*/

SELECT P_CODE,DESCRIPT,P_DATE FROM PRODUCT
WHERE P_DATE>='01-JAN-2020'; 

/*OUTPUT*/
/*


P_COD DESCRIPT                       P_DATE
----- ------------------------------ ---------
CL025 Hrd. Spring 1/4in              15-JAN-20
CL050 Hrd. Spring 1/2in              15-JAN-20
CD00X Cordless Drill                 20-JAN-20
CH10X Claw Hammer                    20-JAN-20
SH100 Sledge Hammer                  02-JAN-20
HC100 Hicut Chain Saw                07-FEB-20
PP101 PVC Pipe                       20-FEB-20
MC001 Metal Screw                    01-MAR-20
WC025 2.5in wide Screw               24-FEB-20
SM48X Steel Malting Mesh             17-JAN-20
HW15X HIVELD HAMMER                  10-JAN-20

11 rows selected.

*/

/*QUERY-6*/

SELECT INVOICE.C_CODE,INV_NUM,INV_DATE FROM CUSTOMER,INVOICE
WHERE CUSTOMER.FNAME='Elena' AND CUSTOMER.LNAME='Johnson' AND CUSTOMER.C_CODE=INVOICE.C_CODE;


/*OUTPUT*/

/*


    C_CODE    INV_NUM INV_DATE
---------- ---------- ---------
     10011       1002 16-JAN-20
     10011       1005 17-JAN-20
     10011       1008 17-JAN-20

3 rows selected.

*/



/*QUERY-7*/

INSERT INTO PRODUCT VALUES('AB111','POWER DRILL',SYSDATE,15,5,125,0.1,24992);

INSERT INTO PRODUCT VALUES('PP102','PVC PIPE',SYSDATE+1,50,12,15.25,0.02,24992);

SELECT * FROM PRODUCT 
WHERE P_CODE='AB111' OR P_CODE='PP102';
/*
P_COD DESCRIPT  P_DATE           QTY      P_MIN    P_PRICE     P_DISC     V_CODE
----- --------- --------- ---------- ---------- ---------- ---------- ----------
AB111 POWER DRI 21-AUG-20         15          5        125         .1      24992
      LL

PP102 PVC PIPE  22-AUG-20         50         12      15.25        .02      24992
*/

/*QUERY-8*/

DELETE FROM VENDOR
WHERE V_CODE=23119;

/*
DELETE FROM VENDOR
*
ERROR at line 1:
ORA-02292: integrity constraint (CS563.PRODUCT_VENDOR_FK_V_CODE) violated -
child record found


*/
ALTER TABLE PRODUCT
DROP CONSTRAINT PRODUCT_VENDOR_FK_V_CODE;

/*Table altered.*/

SELECT TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE,OWNER
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('CUSTOMER') AND CONSTRAINT_TYPE='R';

/*no rows selected*/

SELECT * FROM VENDOR
WHERE V_CODE=23119;

/*
    V_CODE V_NAME    V_CONTACT                V_AREA    V_PHONE V_ V
---------- --------- -------------------- ---------- ---------- -- -
     23119 Blackman  Svetlana Han                901    3562429 GA Y
           Sisters
*/

DELETE FROM VENDOR
WHERE V_CODE=23119;

/*1 row deleted.*/

SELECT * FROM VENDOR
WHERE V_CODE=23119;

/*no rows selected*/

INSERT INTO VENDOR
VALUES(23119,'Blackman Sisters','Svetlana Han',901,3562429,'GA','Y');
/*
    V_CODE V_NAME    V_CONTACT                V_AREA    V_PHONE V_ V
---------- --------- -------------------- ---------- ---------- -- -
     23119 Blackman  Svetlana Han                901    3562429 GA Y
           Sisters
*/
ALTER TABLE PRODUCT
ADD CONSTRAINT PRODUCT_VENDOR_FK_V_CODE FOREIGN KEY(V_CODE) REFERENCES VENDOR(V_CODE);
/*Table altered.*/

SELECT * FROM VENDOR
WHERE V_CODE=23119;
/*
    V_CODE V_NAME    V_CONTACT                V_AREA    V_PHONE V_ V
---------- --------- -------------------- ---------- ---------- -- -
     23119 Blackman  Svetlana Han                901    3562429 GA Y
           Sisters

*/
/*QUERY-9*/

SELECT VENDOR.V_CODE,V_NAME,P_CODE,DESCRIPT,V_CONTACT,P_DATE FROM VENDOR,PRODUCT
	WHERE UPPER(V_STATE)='KY' AND VENDOR.V_CODE=PRODUCT.V_CODE
	ORDER BY VENDOR.V_CODE;


/*OUTPUT*/
/*
    V_CODE V_NAME                         P_COD DESCRIPT
---------- ------------------------------ ----- ------------------------------
V_CONTACT            P_DATE
-------------------- ---------
     21344 Gomez Sons                     SB725 7.25in Saw Blade
Mark Welder          13-DEC-19

     21344 Gomez Sons                     SB900 9.00 in Saw Blade
Mark Welder          13-NOV-19

     21344 Gomez Sons                     RF100 Rat Tail File
Mark Welder          15-DEC-19


    V_CODE V_NAME                         P_COD DESCRIPT
---------- ------------------------------ ----- ------------------------------
V_CONTACT            P_DATE
-------------------- ---------
     24992 INDIAN MASTERS                 HW15X HIVELD HAMMER
GAURAV               10-JAN-20


*/

/*QUERY-10*/

SELECT DISTINCT FNAME||' '||LNAME "CUST_NAME",P_CODE,INV_DATE FROM CUSTOMER,INVOICE,LINE
 WHERE CUSTOMER.C_CODE=INVOICE.C_CODE AND INVOICE.INV_NUM=LINE.INV_NUM AND (P_CODE='CD00X' OR P_CODE='PP101');

/*
CUST_NAME             P_COD INV_DATE
--------------------- ----- ---------
Kathy Smith           CD00X 16-JAN-20
Elena Johnson         PP101 17-JAN-20
*/

/*QUERY-11*/

SELECT CUSTOMER.C_CODE,INVOICE.INV_NUM,L_UNITS,L_PRICE FROM CUSTOMER,INVOICE,LINE
WHERE CUSTOMER.C_CODE=INVOICE.C_CODE AND INVOICE.INV_NUM=LINE.INV_NUM
ORDER BY INV_NUM DESC;

/*
    C_CODE    INV_NUM    L_UNITS    L_PRICE
---------- ---------- ---------- ----------
     10020       1009         20       15.5
     10011       1008          5       5.87
     10011       1008          3     119.95
     10011       1008          1       9.95
     10015       1007          1       4.99
     10015       1007          2      14.99
     10014       1006          3       6.99
     10014       1006          1     109.92
     10014       1006          1       9.95
     10014       1006          1     256.99
     10011       1005         12       5.87
     10018       1004          2       9.95
     10018       1004          3       4.99
     10012       1003          1      39.95
     10012       1003          1      38.95
     10012       1003          5      14.99
     10011       1002          2       4.99
     10014       1001          1       9.95
     10014       1001          1      14.99

19 rows selected.
*/


/*QUERY-12*/

SELECT CUSTOMER.C_CODE,INVOICE.INV_NUM,L_UNITS,L_PRICE,LINE.L_UNITS*LINE.L_PRICE AS SUBTOTAL FROM CUSTOMER,INVOICE,LINE
WHERE CUSTOMER.C_CODE=INVOICE.C_CODE AND INVOICE.INV_NUM=LINE.INV_NUM
ORDER BY INV_NUM DESC;	


/*
    C_CODE    INV_NUM    L_UNITS    L_PRICE   SUBTOTAL
---------- ---------- ---------- ---------- ----------
     10020       1009         20       15.5        310
     10011       1008          5       5.87      29.35
     10011       1008          3     119.95     359.85
     10011       1008          1       9.95       9.95
     10015       1007          1       4.99       4.99
     10015       1007          2      14.99      29.98
     10014       1006          3       6.99      20.97
     10014       1006          1     109.92     109.92
     10014       1006          1       9.95       9.95
     10014       1006          1     256.99     256.99
     10011       1005         12       5.87      70.44
     10018       1004          2       9.95       19.9
     10018       1004          3       4.99      14.97
     10012       1003          1      39.95      39.95
     10012       1003          1      38.95      38.95
     10012       1003          5      14.99      74.95
     10011       1002          2       4.99       9.98
     10014       1001          1       9.95       9.95
     10014       1001          1      14.99      14.99

19 rows selected.
*/




