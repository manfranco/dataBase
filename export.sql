--------------------------------------------------------
-- Archivo creado  - martes-mayo-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View STUDENT_COURSE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."STUDENT_COURSE" ("NAME_USER", "USERNAME", "NAME") AS 
  select u.name_user, u.username, c.name
from usuario u inner join ACCESS_COURSE  ac on (u.id_user = ac.id_user)
inner join course c on (ac.ID_COURSE = c.ID_COURSE)
;
--------------------------------------------------------
--  DDL for View TEXTS_COURSE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."TEXTS_COURSE" ("NAME", "REFERENCE") AS 
  SELECT c.name, t.reference
from course c inner join access_texts at
on (c.id_course = at.id_course) inner join
texts t on (at.id_texts = t.id_texts)
;
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "SYSTEM"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Table ACCESS_CLASS_EVAL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ACCESS_CLASS_EVAL" 
   (	"ID_CLASS" NUMBER(*,0), 
	"ACE_ID" NUMBER(*,0), 
	"ID_COURSE" NUMBER(*,0), 
	"ACCESS_TIME" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ACCESS_COURSE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ACCESS_COURSE" 
   (	"ID_USER" NUMBER(*,0), 
	"ID_COURSE" NUMBER(*,0), 
	"ID_ACCESS" NUMBER(*,0), 
	"ACCESS_TIME" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ACCESS_TEXTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ACCESS_TEXTS" 
   (	"ID_TEXTS" NUMBER(*,0), 
	"AT_ID" NUMBER(*,0), 
	"ID_COURSE" NUMBER(*,0), 
	"ACCESS_TIME" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ACCESS_WORKSHOP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ACCESS_WORKSHOP" 
   (	"ID_WORKSHOP" NUMBER(*,0), 
	"AW_ID" NUMBER(*,0), 
	"ID_COURSE" NUMBER(*,0), 
	"ACCESS_TIME" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CLASS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CLASS" 
   (	"ID_CLASS" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE), 
	"DATES" TIMESTAMP (6)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COURSE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."COURSE" 
   (	"DIFFICULTY" NUMBER(*,0), 
	"LANGUAGE" CHAR(3 BYTE), 
	"ID_COURSE" NUMBER(*,0), 
	"START_TIME" DATE, 
	"END_TIME" DATE, 
	"NAME" VARCHAR2(50 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TAGS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TAGS" 
   (	"ID_TAGS" NUMBER(*,0), 
	"NAME_TAG" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TEXTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TEXTS" 
   (	"ID_TEXTS" NUMBER(*,0), 
	"REFERENCE" VARCHAR2(120 BYTE), 
	"AUTHOR" VARCHAR2(120 BYTE), 
	"CONTENT" VARCHAR2(120 BYTE), 
	"ISBN" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."USUARIO" 
   (	"ID_USER" NUMBER(*,0), 
	"USERNAME" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(30 BYTE), 
	"NAME_USER" VARCHAR2(120 BYTE), 
	"EMAIL_USER" VARCHAR2(120 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WORKSHOP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WORKSHOP" 
   (	"ID_WORKSHOP" NUMBER(*,0), 
	"ACTIVITY" VARCHAR2(120 BYTE), 
	"CLUE" VARCHAR2(120 BYTE), 
	"SOLUTIONS" VARCHAR2(120 BYTE), 
	"ID_TAGS" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_EVOLVE_SEQ$
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."LOGMNR_EVOLVE_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_SEQ$
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."LOGMNR_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_UIDS$
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."LOGMNR_UIDS$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MVIEW$_ADVSEQ_GENERIC
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."MVIEW$_ADVSEQ_GENERIC"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 50 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MVIEW$_ADVSEQ_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."MVIEW$_ADVSEQ_ID"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_EXCEPTIONS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_EXCEPTIONS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_FLAVOR_NAME_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_FLAVOR_NAME_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_FLAVORS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_FLAVORS_S"  MINVALUE -2147483647 MAXVALUE 2147483647 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT_LOG_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT_LOG_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_REFRESH_TEMPLATES_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_REFRESH_TEMPLATES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_REPPROP_KEY
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_REPPROP_KEY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_RUNTIME_PARMS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_RUNTIME_PARMS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_OBJECTS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_PARMS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_PARMS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_REFGROUPS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_SITES_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_SITES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMP_OUTPUT_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMP_OUTPUT_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_USER_AUTHORIZATIONS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_USER_PARM_VALUES_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_USER_PARM_VALUES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TEMPLATE$_TARGETS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."TEMPLATE$_TARGETS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into SYSTEM.STUDENT_COURSE
SET DEFINE OFF;
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Miguel','mmoral27','JAVA');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Jose','jalzat39','JAVA');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Duvan','dantivar','SCRUM ');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Cristian','carist31','JAVA');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Diego','dcifuen3','SCRUM ');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Esteban','eechava6','JAVA');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Marco','mfranc18','SCRUM ');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Juan','jhenaom6','JAVA');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Emanuel','emadrid3','SCRUM ');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Keila','kmartin5','C++');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Miguel','mmoral27','HASKEL');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Jose','jalzat39','SQL');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Duvan','dantivar','HASKEL');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Cristian','carist31','HASKEL');
Insert into SYSTEM.STUDENT_COURSE (NAME_USER,USERNAME,NAME) values ('Diego','dcifuen3','SQL');
REM INSERTING into SYSTEM.TEXTS_COURSE
SET DEFINE OFF;
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('JAVA','birthsensesloppypenitentocean');
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('SQL','skatehategreasycoordinatedlaborer');
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('HASKEL','bloodybombjamwoozyquiver');
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('C++','smokesmothercelebrateowloffbeat');
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('SCRUM ','sleetscarecrowwastedeadagree');
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('SQL','entertainingscreamjuicyunarmedforgetful');
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('HASKEL','spuriousgroupwalkoverflowdaffy');
Insert into SYSTEM.TEXTS_COURSE (NAME,REFERENCE) values ('SCRUM ','colorremoveslayinsectvie');
REM INSERTING into SYSTEM.ACCESS_CLASS_EVAL
SET DEFINE OFF;
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('1','1','1',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('2','2','2',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('3','3','4',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('4','4','3',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('5','5','5',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('6','6','2',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('7','7','1',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('8','8','2',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('9','9','5',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('10','10','4',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('11','11','3',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_CLASS_EVAL (ID_CLASS,ACE_ID,ID_COURSE,ACCESS_TIME) values ('12','12','2',to_date('16/05/17','DD/MM/RR'));
REM INSERTING into SYSTEM.ACCESS_COURSE
SET DEFINE OFF;
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('1','1','1',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('2','1','2',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('3','2','3',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('4','1','4',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('5','2','5',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('6','1','6',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('7','2','7',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('8','1','8',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('9','2','9',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('10','3','10',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('1','4','11',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('2','5','12',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('3','4','13',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('4','4','14',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.ACCESS_COURSE (ID_USER,ID_COURSE,ID_ACCESS,ACCESS_TIME) values ('5','5','15',to_timestamp('16/05/17 08:53:53,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
REM INSERTING into SYSTEM.ACCESS_TEXTS
SET DEFINE OFF;
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('1','1','1',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('2','2','5',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('3','3','4',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('4','4','3',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('5','5','2',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('6','6','5',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('7','7','4',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_TEXTS (ID_TEXTS,AT_ID,ID_COURSE,ACCESS_TIME) values ('8','8','2',to_date('16/05/17','DD/MM/RR'));
REM INSERTING into SYSTEM.ACCESS_WORKSHOP
SET DEFINE OFF;
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('1','1','1',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('2','2','2',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('3','3','5',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('4','4','4',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('5','5','3',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('6','6','2',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('7','7','4',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('8','8','5',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('9','9','3',to_date('16/05/17','DD/MM/RR'));
Insert into SYSTEM.ACCESS_WORKSHOP (ID_WORKSHOP,AW_ID,ID_COURSE,ACCESS_TIME) values ('10','10','1',to_date('16/05/17','DD/MM/RR'));
REM INSERTING into SYSTEM.CLASS
SET DEFINE OFF;
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('1','nosesupreme',to_timestamp('01/05/17 11:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('2','hatequilt',to_timestamp('15/05/17 04:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('3','complainbite',to_timestamp('21/05/17 01:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('4','inscribecreep',to_timestamp('05/06/17 03:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('5','sapvoracious',to_timestamp('20/05/17 09:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('6','delaytray',to_timestamp('31/05/17 12:30:00,000000000 PM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('7','nutdisgusting',to_timestamp('14/06/17 06:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('8','aboriginalpen',to_timestamp('20/06/17 09:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('9','electricconsider',to_timestamp('01/07/17 11:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('10','pulleducation',to_timestamp('11/07/17 02:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('11','mindlesscalendar',to_timestamp('07/06/17 05:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
Insert into SYSTEM.CLASS (ID_CLASS,NAME,DATES) values ('12','volatilecontrast',to_timestamp('30/06/17 01:00:00,000000000 AM','DD/MM/RR HH12:MI:SSXFF AM'));
REM INSERTING into SYSTEM.COURSE
SET DEFINE OFF;
Insert into SYSTEM.COURSE (DIFFICULTY,LANGUAGE,ID_COURSE,START_TIME,END_TIME,NAME) values ('1','ENG','1',to_date('11/05/17','DD/MM/RR'),to_date('11/05/17','DD/MM/RR'),'JAVA');
Insert into SYSTEM.COURSE (DIFFICULTY,LANGUAGE,ID_COURSE,START_TIME,END_TIME,NAME) values ('3','ESP','2',to_date('14/05/17','DD/MM/RR'),to_date('14/05/17','DD/MM/RR'),'SCRUM ');
Insert into SYSTEM.COURSE (DIFFICULTY,LANGUAGE,ID_COURSE,START_TIME,END_TIME,NAME) values ('4','ENG','3',to_date('10/05/17','DD/MM/RR'),to_date('10/05/17','DD/MM/RR'),'C++');
Insert into SYSTEM.COURSE (DIFFICULTY,LANGUAGE,ID_COURSE,START_TIME,END_TIME,NAME) values ('5','GER','4',to_date('11/05/17','DD/MM/RR'),to_date('11/05/17','DD/MM/RR'),'HASKEL');
Insert into SYSTEM.COURSE (DIFFICULTY,LANGUAGE,ID_COURSE,START_TIME,END_TIME,NAME) values ('1','FRA','5',to_date('05/05/17','DD/MM/RR'),to_date('05/05/17','DD/MM/RR'),'SQL');
REM INSERTING into SYSTEM.TAGS
SET DEFINE OFF;
Insert into SYSTEM.TAGS (ID_TAGS,NAME_TAG) values ('1','REGEX');
Insert into SYSTEM.TAGS (ID_TAGS,NAME_TAG) values ('2','FUNCTIONS');
Insert into SYSTEM.TAGS (ID_TAGS,NAME_TAG) values ('3','OOP');
Insert into SYSTEM.TAGS (ID_TAGS,NAME_TAG) values ('4','LANGUAGES');
Insert into SYSTEM.TAGS (ID_TAGS,NAME_TAG) values ('5','ALGORITHMS');
REM INSERTING into SYSTEM.TEXTS
SET DEFINE OFF;
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('1','birthsensesloppypenitentocean','Jane O. Raper','weekgreataxiomaticdigimpulsewaylayaddicteddecisiveunderwearencroach','ABC-abc-1234');
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('2','skatehategreasycoordinatedlaborer','Audrey C. Harrah','tricksomberimperilstrongtieanxiousinquireaddressfurtivenoisy','0123-4567');
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('3','bloodybombjamwoozyquiver','Kristen A. Lorenzo','cautiouscheeserelationuttermostsixshakesteadfastubiquitousinsurancesubstantial','1234567890');
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('4','smokesmothercelebrateowloffbeat','Amy R. Ontiveros','envytownillegallookrewindaddvolleyballimplydampcrib','ABC-1234');
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('5','sleetscarecrowwastedeadagree','Andrew S. Shackelford','uninterestednightringssheetsplendidswelteringbedscorruptshaggythought','Aa-1234');
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('6','entertainingscreamjuicyunarmedforgetful','Harley C. Hocking','romanticavailableclosedamuckthrillsowfloweryoptimizesmellants','ABC-1234-/+');
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('7','spuriousgroupwalkoverflowdaffy','Shirley D. Cabrales','gaudyobeisantfitrayprobablecreateexcellentzestybeautifyjustify','123456789');
Insert into SYSTEM.TEXTS (ID_TEXTS,REFERENCE,AUTHOR,CONTENT,ISBN) values ('8','colorremoveslayinsectvie','Alonso L. Marks','transfercontestshowtendencydullsquareexcitedvoicelesswinweary','101234567890');
REM INSERTING into SYSTEM.USUARIO
SET DEFINE OFF;
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('1','mmoral27','111','Miguel','mmoral27@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('2','jalzat39','123','Jose','jalzat39@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('3','dantivar','contraseña','Duvan','dantivar@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('4','carist31','c4r1st','Cristian','carist31@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('5','dcifuen3','Dcin','Diego','dcifuen3@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('6','eechava6','54321','Esteban','eechava6@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('7','mfranc18','qwerty','Marco','mfranc18@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('8','jhenaom6','asdfg','Juan','jhenaom6@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('9','emadrid3','zxcvb','Emanuel','emadrid3@eafit.edu.co');
Insert into SYSTEM.USUARIO (ID_USER,USERNAME,PASSWORD,NAME_USER,EMAIL_USER) values ('10','kmartin5','password','Keila','kmartin5@eafit.edu.co');
REM INSERTING into SYSTEM.WORKSHOP
SET DEFINE OFF;
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('1','applessitevasivesleeplegal','withdrawtail','saltcherrygovernor','1');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('2','sagobscenecreammotivateapatheticraggedpocket','blossomstand','opensecretaryfanatical','2');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('3','incandescentfeathercollarconfusedbreakfastkeygrindignorantletbelong','ajarengrave','warmhairuse','4');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('4','giganticgodlycloverholidaydeclare','organizefriction','squarelikeablesavory','3');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('5','impulseaftermathsquealingmushysanctionleafstormy','kickcloudy','talkcherrydaffy','5');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('6','titlehumdrumornamentinhabitapprovaldirectpoutairplane','honorableguide','laborerstemdispensable','2');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('7','pluckyorangesupplycountspray','glowset','cuddlyunusedexotic','1');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('8','forcecleavechickenpushyrenouncedizzy','infestruthless','standingheadyweak','4');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('9','crookedsoneatabletirepet','difficultblack-and-white','optimallegaleight','1');
Insert into SYSTEM.WORKSHOP (ID_WORKSHOP,ACTIVITY,CLUE,SOLUTIONS,ID_TAGS) values ('10','foldjumbledowlcrazysweet','hard-to-finddoctor','hearludicrousservant','2');
--------------------------------------------------------
--  DDL for Index SYS_C007081
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007081" ON "SYSTEM"."ACCESS_CLASS_EVAL" ("ACE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007018
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007018" ON "SYSTEM"."ACCESS_COURSE" ("ID_ACCESS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007058
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007058" ON "SYSTEM"."ACCESS_TEXTS" ("AT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007040
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007040" ON "SYSTEM"."ACCESS_WORKSHOP" ("AW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007062
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007062" ON "SYSTEM"."CLASS" ("ID_CLASS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007014
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007014" ON "SYSTEM"."COURSE" ("ID_COURSE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007032
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007032" ON "SYSTEM"."TAGS" ("ID_TAGS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007054
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007054" ON "SYSTEM"."TEXTS" ("ID_TEXTS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C006998
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C006998" ON "SYSTEM"."USUARIO" ("ID_USER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C007035
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007035" ON "SYSTEM"."WORKSHOP" ("ID_WORKSHOP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger ACCESS_TIME_CLASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."ACCESS_TIME_CLASS" 
BEFORE INSERT ON ACCESS_CLASS_EVAL FOR EACH ROW
BEGIN
if inserting then
:new.access_time := sysdate;
end if;
END;
/
ALTER TRIGGER "SYSTEM"."ACCESS_TIME_CLASS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ACCESS_TIME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."ACCESS_TIME" 
BEFORE INSERT ON ACCESS_COURSE for EACH ROW
BEGIN
if inserting then
:new.access_time := sysdate;
end if;
END;
/
ALTER TRIGGER "SYSTEM"."ACCESS_TIME" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ACCESS_TIME_TEXTS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."ACCESS_TIME_TEXTS" 
BEFORE INSERT ON ACCESS_TEXTS FOR EACH ROW
BEGIN
if inserting then
:new.access_time := sysdate;
end if;
END;
/
ALTER TRIGGER "SYSTEM"."ACCESS_TIME_TEXTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ACCESS_TIME_WORKSHOP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."ACCESS_TIME_WORKSHOP" 
BEFORE INSERT ON ACCESS_WORKSHOP FOR EACH ROW
BEGIN
if inserting then
:new.access_time := sysdate;
end if;
END;
/
ALTER TRIGGER "SYSTEM"."ACCESS_TIME_WORKSHOP" ENABLE;
--------------------------------------------------------
--  DDL for Procedure CHECK_ACCESS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECK_ACCESS" 
(
 COURSE_ID IN NUMBER 
,INPUT_ID IN NUMBER
, TYPE IN VARCHAR2 DEFAULT 'CLASS'
) AS
temp_number int;
cursor number_class is
select max(ace_id)+1
from access_class_eval;
cursor number_texts is
select max(at_id)+1
from access_texts;
cursor number_workshop is
select max(aw_id)+1
from access_workshop;
BEGIN
if type = 'CLASS' then
open number_class;
fetch number_class into temp_number;
close number_class;
insert into access_class_eval(id_class, ace_id, id_course)
values (input_id,temp_number,course_id);
elsif type = 'TEXTS' then
open number_texts;
fetch number_texts into temp_number;
close number_texts;
insert into access_texts(id_texts, at_id, id_course)
values (input_id,temp_number,course_id);
elsif type = 'WORK' then
open number_workshop;
fetch number_workshop into temp_number;
close number_workshop;
insert into access_workshop(id_workshop, aw_id, id_course)
values (input_id,temp_number,course_id);
end if;
commit;
END CHECK_ACCESS;

/
--------------------------------------------------------
--  DDL for Procedure REGISTER_CURSE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."REGISTER_CURSE" 
(
  USER_ID IN NUMBER 
, COURSE_ID IN NUMBER 
) AS 
temp_number int;
cursor number_access is
select max(id_access)+1
from access_course;
BEGIN
open number_access;
fetch number_access into temp_number;
close number_access;
insert into ACCESS_COURSE(id_user,id_course, ID_ACCESS)
values (user_id, course_id,temp_number);
commit;
END REGISTER_CURSE;

/
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=

/
--------------------------------------------------------
--  DDL for Function CHECK_PASSWORD
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SYSTEM"."CHECK_PASSWORD" 
(
  USERNAME_IN IN VARCHAR2 
, PASSWORD_IN IN VARCHAR2 
) RETURN BOOLEAN AS
temp_user int;
BEGIN
select count(u.ID_USER) into temp_user 
from usuario u
where u.username = username_in and
password = password_in;
if temp_user is null then
return false;
else return true;
end if;
END CHECK_PASSWORD;

/
--------------------------------------------------------
--  DDL for Function CHECK_USER
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SYSTEM"."CHECK_USER" 
(USER_IN IN VARCHAR2)
RETURN BOOLEAN AS
temp_user int;
cursor usuarios is
select id_user
from usuario
where username = user_in;
BEGIN
open usuarios;
fetch usuarios into temp_user;
close usuarios;
if temp_user is null then
return true;
else return false;
END IF;
END CHECK_USER;

/
--------------------------------------------------------
--  DDL for Function CREATE_USER
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SYSTEM"."CREATE_USER" 
(
  USERNAME IN VARCHAR2 
, PASSWORD IN VARCHAR2
, NAME IN VARCHAR2
, EMAIL IN VARCHAR2 
) RETURN NUMBER AS 
temp_number int;
cursor number_user is
select max(id_user)+1
from usuario;
BEGIN
open number_user;
fetch number_user into temp_number;
close number_user;
insert into usuario(id_user,username,password,name_user, email_user)
values (temp_number, username, password, name, email);
commit;
return temp_number;
END CREATE_USER;

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
/
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  Constraints for Table ACCESS_CLASS_EVAL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_CLASS_EVAL" ADD PRIMARY KEY ("ACE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_CLASS_EVAL" MODIFY ("ID_COURSE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_CLASS_EVAL" MODIFY ("ACE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_CLASS_EVAL" MODIFY ("ID_CLASS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACCESS_COURSE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_COURSE" ADD PRIMARY KEY ("ID_ACCESS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_COURSE" MODIFY ("ID_ACCESS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_COURSE" MODIFY ("ID_COURSE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_COURSE" MODIFY ("ID_USER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACCESS_TEXTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_TEXTS" ADD PRIMARY KEY ("AT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_TEXTS" MODIFY ("ID_COURSE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_TEXTS" MODIFY ("AT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_TEXTS" MODIFY ("ID_TEXTS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACCESS_WORKSHOP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_WORKSHOP" ADD PRIMARY KEY ("AW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_WORKSHOP" MODIFY ("ID_COURSE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_WORKSHOP" MODIFY ("AW_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ACCESS_WORKSHOP" MODIFY ("ID_WORKSHOP" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLASS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CLASS" ADD PRIMARY KEY ("ID_CLASS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."CLASS" MODIFY ("ID_CLASS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COURSE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."COURSE" ADD PRIMARY KEY ("ID_COURSE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."COURSE" MODIFY ("ID_COURSE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TAGS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TAGS" ADD PRIMARY KEY ("ID_TAGS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."TAGS" MODIFY ("ID_TAGS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TEXTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TEXTS" ADD PRIMARY KEY ("ID_TEXTS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."TEXTS" MODIFY ("ID_TEXTS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."USUARIO" ADD PRIMARY KEY ("ID_USER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."USUARIO" MODIFY ("ID_USER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WORKSHOP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WORKSHOP" ADD PRIMARY KEY ("ID_WORKSHOP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."WORKSHOP" MODIFY ("ID_TAGS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."WORKSHOP" MODIFY ("ID_WORKSHOP" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ACCESS_CLASS_EVAL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_CLASS_EVAL" ADD CONSTRAINT "FK_ACE_CLASS" FOREIGN KEY ("ID_CLASS")
	  REFERENCES "SYSTEM"."CLASS" ("ID_CLASS") ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_CLASS_EVAL" ADD CONSTRAINT "FK_ACE_COURSE" FOREIGN KEY ("ID_COURSE")
	  REFERENCES "SYSTEM"."COURSE" ("ID_COURSE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACCESS_COURSE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_COURSE" ADD CONSTRAINT "FK_COURSE_ACCESS" FOREIGN KEY ("ID_COURSE")
	  REFERENCES "SYSTEM"."COURSE" ("ID_COURSE") ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_COURSE" ADD CONSTRAINT "FK_USER_ACCESS" FOREIGN KEY ("ID_USER")
	  REFERENCES "SYSTEM"."USUARIO" ("ID_USER") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACCESS_TEXTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_TEXTS" ADD CONSTRAINT "FK_AT_COURSE" FOREIGN KEY ("ID_COURSE")
	  REFERENCES "SYSTEM"."COURSE" ("ID_COURSE") ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_TEXTS" ADD CONSTRAINT "FK_AT_TEXTS" FOREIGN KEY ("ID_TEXTS")
	  REFERENCES "SYSTEM"."TEXTS" ("ID_TEXTS") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACCESS_WORKSHOP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ACCESS_WORKSHOP" ADD CONSTRAINT "FK_AW_COURSE" FOREIGN KEY ("ID_COURSE")
	  REFERENCES "SYSTEM"."COURSE" ("ID_COURSE") ENABLE;
  ALTER TABLE "SYSTEM"."ACCESS_WORKSHOP" ADD CONSTRAINT "FK_AW_WORKSHOP" FOREIGN KEY ("ID_WORKSHOP")
	  REFERENCES "SYSTEM"."WORKSHOP" ("ID_WORKSHOP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WORKSHOP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WORKSHOP" ADD CONSTRAINT "FK_WORKSHOP_TAG" FOREIGN KEY ("ID_TAGS")
	  REFERENCES "SYSTEM"."TAGS" ("ID_TAGS") ENABLE;
