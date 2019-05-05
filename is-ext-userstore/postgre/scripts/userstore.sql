create database paneradb;
\c paneradb;

CREATE TABLE DIR_USER
(
   DIR_USER_ID INT NOT NULL,
   USERNAME VARCHAR(240 ),
   PANERA_EMP_NBR VARCHAR(30 ),
   SALESFORCE_USERNAME VARCHAR(240 ),
   CONSTRAINT DIR_USER_PK PRIMARY KEY (DIR_USER_ID),
   CONSTRAINT DIR_USER_UK1 UNIQUE (USERNAME)
);

CREATE TABLE DIR_GROUP
(
   DIR_GROUP_ID INT NOT NULL,
   NAME VARCHAR (240) NOT NULL,
   DESCRIPTION VARCHAR(240 ),
   INSERT_DT DATE NOT NULL,
   LAST_MODIFIED_DT DATE NOT NULL,
   CONSTRAINT DIR_GROUP_PK PRIMARY KEY (DIR_GROUP_ID),
   CONSTRAINT DIR_GROUP_UK1 UNIQUE (NAME)
);

CREATE TABLE DIR_USER_GROUP
(
   DIR_USER_ID INT NOT NULL,
   DIR_GROUP_ID INT NOT NULL,
   INSERT_DT DATE NOT NULL,
   LAST_MODIFIED_DT DATE NOT NULL,
   CONSTRAINT FK_DIR_USER__DIR_USER_GROUP FOREIGN KEY (DIR_USER_ID) REFERENCES DIR_USER (DIR_USER_ID) ,
   CONSTRAINT FK_DIR_GROUP__DIR_USER_GROUP FOREIGN KEY (DIR_GROUP_ID) REFERENCES DIR_GROUP (DIR_GROUP_ID)
);

Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (221,'SF - Integrator','SF Integrator control',to_date('02-MAR-16','DD-MON-RR'),to_date('02-MAR-16','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (282,'BOH - CC','BOH - CC',to_date('11-APR-17','DD-MON-RR'),to_date('11-APR-17','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (284,'BOH - SSIT','BOH - SSIT',to_date('11-APR-17','DD-MON-RR'),to_date('11-APR-17','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (288,'BOH - SS','BOH - SS',to_date('11-APR-17','DD-MON-RR'),to_date('11-APR-17','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (301,'BOH - AM','AM',to_date('08-SEP-17','DD-MON-RR'),to_date('08-SEP-17','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (302,'IPORTAL - Super User','iPortal Superuser',to_date('08-SEP-17','DD-MON-RR'),to_date('08-SEP-17','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (303,'FileAdmin','iPortal File Admin',to_date('08-SEP-17','DD-MON-RR'),to_date('08-SEP-17','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (208,'BOH - Bakers1','Baker BOH',to_date('22-JUL-15','DD-MON-RR'),to_date('22-JUL-15','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (210,'WTM_BAKERS1','When to Manager Bakers',to_date('22-JUL-15','DD-MON-RR'),to_date('22-JUL-15','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (202,'BOH - Bakers','Baker BOH',to_date('22-JUL-15','DD-MON-RR'),to_date('22-JUL-15','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (204,'WTM_BAKERS','When to Manager Bakers',to_date('22-JUL-15','DD-MON-RR'),to_date('22-JUL-15','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (241,'BOH - JVP and RVP','JVP and RVP',to_date('12-AUG-16','DD-MON-RR'),to_date('12-AUG-16','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (261,'BOH - GM','GM',to_date('15-AUG-16','DD-MON-RR'),to_date('15-AUG-16','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (322,'BOH - Enterprise User','BOH - Enterprise User',to_date('05-JUN-18','DD-MON-RR'),to_date('05-JUN-18','DD-MON-RR'));
Insert into DIR_GROUP (DIR_GROUP_ID,NAME,DESCRIPTION,INSERT_DT,LAST_MODIFIED_DT) values (3,'BOH - RHA','Retail Hourly Associate',to_date('24-JUL-13','DD-MON-RR'),to_date('24-JUL-13','DD-MON-RR'));


INSERT INTO dir_user(dir_user_id,username,panera_emp_nbr,salesforce_username) VALUES (1,'agogoi','agogoi@panera.com','agogoi@sfdc.com');
INSERT INTO dir_user(dir_user_id,username,panera_emp_nbr,salesforce_username) VALUES (2,'dgogoi','dgogoi@panera.com','dgogoi@sfdc.com');
INSERT INTO dir_user(dir_user_id,username,panera_emp_nbr,salesforce_username) VALUES (3,'sgogoi','sgogoi@panera.com','sgogoi@sfdc.com');
