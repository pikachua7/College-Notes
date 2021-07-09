/*QUERY-1 : Create the relations PERSON and CONTACT with specified constraints.*/
/*CREATING TABLE PERSON*/
CREATE TABLE PERSON (
	AADHAR_NO NUMBER(12) NOT NULL,
	FIRST_NAME VARCHAR2(15) NOT NULL,
	LAST_NAME VARCHAR2(15) NOT NULL,
	GENDER VARCHAR2(1) NOT NULL CHECK (GENDER IN('M','F','m','f')),
	BIRTHDATE DATE DEFAULT SYSDATE-(365*16)NOT NULL,
	PINCODE NUMBER(6) NOT NULL,
	EMAIL VARCHAR2(35),
	CONSTRAINT PERSON_PK PRIMARY KEY (AADHAR_NO)
);

/*CREATING TABLE CONTACT*/
CREATE TABLE CONTACT(
	AADHAR_NO NUMBER(12) NOT NULL,
	PHONE NUMBER(10) NOT NULL,
	CONSTRAINT CONTACT_PK  PRIMARY KEY (AADHAR_NO,PHONE),
	CONSTRAINT CONTACT_FK FOREIGN KEY (AADHAR_NO) REFERENCES PERSON(AADHAR_NO)
);

/*QUERY-2 : List the primary key constraints for the Citizen Database. Your output must include
table name, constraint name, constraint type and table owner.*/

SELECT TABLE_NAME , CONSTRAINT_NAME , CONSTRAINT_TYPE , OWNER
	FROM USER_CONSTRAINTS
	WHERE CONSTRAINT_TYPE='P' AND TABLE_NAME IN ('PERSON','CONTACT');

/* QUERY-3 : Insert 5-7 tuples into PERSON table.
	Note:The first tuple will indicate the user-tuple (you) and other tuples will
	indicate information about family members or friends.*/

INSERT INTO PERSON VALUES(1234,'ATHARVA','PALIWAL','M','11-JUNE-2000',440024,'paliwalap@rknec.edu');
INSERT INTO PERSON VALUES(1789,'NEETA','PALIWAL','F','26-SEPTEMBER-1968',440024,'paliwalnp@rknec.edu');
INSERT INTO PERSON VALUES(1034,'ISHIKA','PALIWAL','F','06-JUNE-1988',440024,'paliwalip@rknec.edu');
INSERT INTO PERSON VALUES(1986,'GAURAV','PALIWAL','M','03-JUNE-1994',440024,'paliwalgp@rknec.edu');
INSERT INTO PERSON VALUES(1999,'TEJAS','PALIWAL','M','03-JUNE-1999',440024,'paliwaltp@rknec.edu');



/*QUERY-4 :Insert 8-12 tuples in CONTACT table.
	Note: A person may have one or more phone numbers.
 	Initial two tuples will indicate the user-tuples (you) with different phone
	numbers and other tuples will indicate contact(s) information for persons in
	PERSON table.*/
	
INSERT INTO CONTACT VALUES(1234,7218385709);
INSERT INTO CONTACT VALUES(1234,8087992547);
INSERT INTO CONTACT VALUES(1789,7020396354);
INSERT INTO CONTACT VALUES(1034,9988776633);
INSERT INTO CONTACT VALUES(1986,1234567879);
INSERT INTO CONTACT VALUES(1999,9421365497);


/*QUERY-5 : Save the database state [COMMIT] and List the contents of the Citizen Database.*/

COMMIT;


/* QUERY-6 :List the first name, last name, gender, pincode and email for all persons.*/

SELECT FIRST_NAME,LAST_NAME,GENDER,PINCODE,EMAIL FROM PERSON;


/* QUERY-7 :List the person name and phone numbers for the person with name as that of yours.
	Note:  Use your first name as value in the qualifying condition.*/

SELECT FIRST_NAME,LAST_NAME,PHONE
FROM PERSON,CONTACT WHERE FIRST_NAME='ATHARVA' AND PERSON.AADHAR_NO=CONTACT.AADHAR_NO;

/*QUERY-8 :List the contact numbers for your family.
	Note: Use your family name (last name) as value in the qualifying condition.*/

SELECT FIRST_NAME,PHONE FROM PERSON,CONTACT
WHERE LAST_NAME='PALIWAL' AND PERSON.AADHAR_NO=CONTACT.AADHAR_NO;



/*QUERY-9 :List the persons (i.e., last name, first name) whose 
	contact is the mentioned phone number.
	Note: Use any phone number from the contact table that is shared by one or more
	persons.*/
	  
	 
SELECT FIRST_NAME,LAST_NAME 
FROM PERSON,CONTACT
WHERE PHONE=7218385709 AND PERSON.AADHAR_NO=CONTACT.AADHAR_NO;



















