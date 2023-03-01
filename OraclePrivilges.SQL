alter session set "_ORACLE_SCRIPT"=true;
create user PROF identified by 1234;
create user ITAM identified by 1234;
create user SAM identified by 1234;
create user OTHMAN identified by 1234;
grant create session,create table,create sequence, create type, create procedure, create
trigger,create view to PROF;

grant create session,create table,create sequence, create type, create procedure, create
trigger,create view to ITAM;

grant create session,create table,create sequence, create type, create procedure, create
trigger,create view to SAM;

grant create session,create table,create sequence, create type, create procedure, create
trigger,create view to OTHMAN;




alter user ITAM quota 20M on USERS; 

grant create session to ITAM;
grant create table to ITAM;
grant create sequence to ITAM; 
grant create type to ITAM;
grant create procedure to ITAM;
grant create trigger to ITAM;
grant create view to ITAM; 
grant select any sequence to ITAM ;
grant alter session to ITAM;


--TASK1--
select username,'none' as privilege, created 
from dba_users 
where 
username in ('ITAM','PROF','SAM','OTHMAN')
union
select grantee,privilege,sysdate 
from dba_sys_privs 
where 
grantee in ('ITAM','PROF','SAM','OTHMAN')
order by username;
 


--TASK2--
exec dbms_stats.gather_schema_stats('ITAM'); 
alter session set "_ORACLE_SCRIPT"=true;
select owner, table_name,num_rows,tablespace_name 
from dba_tables where owner = 'ITAM' 
order by num_rows desc;
 

--TASK3--
select table_name, num_rows from dba_tables 
where owner = 'ITAM' 
order by num_rows desc;

 


--TASK4--
grant insert,select,update,delete on 
ITAM.asset_type to SAM;
grant insert,select,update,delete on 
ITAM.ci_status to SAM;
grant insert,select,update,delete on 
ITAM.department to SAM;
grant insert,select,update,delete on 
ITAM.asset_desc to SAM;
grant insert,select,update,delete on 
ITAM.employee to SAM;
grant insert,select,update,delete on 
ITAM.application to SAM;
grant insert,select,update,delete on 
ITAM.computer to SAM;

grant insert,select,update,delete on 
ITAM.it_service to SAM;

grant insert,select,update,delete on 
ITAM.other to SAM;

grant insert,select,update,delete on 
ITAM.peripheral to SAM;

grant insert,select,update,delete on 
ITAM.it_asset_inv_summary to SAM;
grant insert,select,update,delete on 
ITAM.related_assets to SAM;
grant insert,select,update,delete on 
ITAM.ci_inventory to SAM;
grant insert,select,update,delete on 
ITAM.employee_ci to SAM;
grant insert,select,update,delete on 
ITAM.it_asset_inv_summary to SAM;
--sequence

grant select on ITAM.asset_type_id_seq to SAM;
grant select on ITAM.asset_desc_id_seq to SAM;
grant select on ITAM.emp_id_seq to SAM;
grant select on ITAM.it_asset_inv_summary_id_seq to SAM;
grant select on ITAM.ci_inv_id_seq to SAM;
grant select on ITAM.asset_type_id_seq to SAM;
grant select on ITAM.emp_id_seq to SAM;
--         
select grantee,owner,table_name,grantor,privilege
from dba_tab_privs  where grantee = 'SAM'
order by table_name
;

 


--TASK5--
-- Command 1. Insert a New Record
Insert into ITAM.CI_INVENTORY 
(CI_INV_ID,ASSET_DESC_ID,PURCHASE_OR_RENTAL,UNIQUE_ID,CI_ACQUIRED_DATE,CI_STATUS_CODE,CI_STATUS_DATE)
values (113,1,'IN-HOUSE','Built by Suzanne Johnson in IT Help Dept.',to_date('14-APR-20','DD-MON-RR'),'DISPOSED',to_date('10-JAN-21','DD-MON-RR'));
COMMIT;
-- Command 2. Retrieve the New Record
SELECT * FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=112;
-- Command 3. Change the New Data
UPDATE ITAM.CI_INVENTORY 
SET PURCHASE_OR_RENTAL='OFFICE'
WHERE CI_INV_ID=112;
COMMIT;
-- Command 4. Retrieve the Changed Data
SELECT * FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=112;
-- Command 5.Delete the Data
DELETE FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=112;
COMMIT
-- Command 6. Retrieve the Data
SELECT * FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=112;


--TASK6--
grant insert,select,update,delete on 
ITAM.asset_type to itam_user;
grant insert,select,update,delete on 
ITAM.ci_status to itam_user;
grant insert,select,update,delete on 
ITAM.department to itam_user;
grant insert,select,update,delete on 
ITAM.asset_desc to itam_user;
grant insert,select,update,delete on 
ITAM.employee to itam_user;
grant insert,select,update,delete on 
ITAM.application to itam_user;
grant insert,select,update,delete on 
ITAM.computer to itam_user;

grant insert,select,update,delete on 
ITAM.it_service to itam_user;

grant insert,select,update,delete on 
ITAM.other to itam_user;

grant insert,select,update,delete on 
ITAM.peripheral to itam_user;

grant insert,select,update,delete on 
ITAM.it_asset_inv_summary to itam_user;
grant insert,select,update,delete on 
ITAM.related_assets to itam_user;
grant insert,select,update,delete on 
ITAM.ci_inventory to itam_user;
grant insert,select,update,delete on 
ITAM.employee_ci to itam_user;
grant insert,select,update,delete on 
ITAM.it_asset_inv_summary to itam_user;
--sequence

grant select on ITAM.asset_type_id_seq to itam_user;
grant select on ITAM.asset_desc_id_seq to itam_user;
grant select on ITAM.emp_id_seq to itam_user;
grant select on ITAM.it_asset_inv_summary_id_seq to itam_user;
grant select on ITAM.ci_inv_id_seq to itam_user;
grant select on ITAM.asset_type_id_seq to itam_user;
grant select on ITAM.emp_id_seq to itam_user;
--         
select grantee,owner,table_name,grantor,privilege
from dba_tab_privs where grantee = 'ITAM_USER'
order by table_name;


--TASK7--
grant itam_user to OTHMAN;
select * from dba_role_privs 
where grantee = 'OTHMAN';
 

--TASK8--
select grantee,owner,table_name,grantor,privilege
from dba_tab_privs where grantee = 'OTHMAN'
order by table_name;


--TASK9--
-- Command 1. Insert a New Record
Insert into ITAM.CI_INVENTORY 
(CI_INV_ID,ASSET_DESC_ID,PURCHASE_OR_RENTAL,UNIQUE_ID,CI_ACQUIRED_DATE,CI_STATUS_CODE,CI_STATUS_DATE)
values (113,1,'IN-HOUSE','Built by Suzanne Johnson in IT Help Dept.',to_date('14-APR-20','DD-MON-RR'),'DISPOSED',to_date('10-JAN-21','DD-MON-RR'));
COMMIT;
-- Command 2. Retrieve the New Record
SELECT * FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=113;
-- Command 3. Change the New Data
UPDATE ITAM.CI_INVENTORY 
SET PURCHASE_OR_RENTAL='OFFICE'
WHERE CI_INV_ID=112;
COMMIT;
-- Command 4. Retrieve the Changed Data
SELECT * FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=113;
-- Command 5.Delete the Data
DELETE FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=113;
COMMIT
-- Command 6. Retrieve the Data
SELECT * FROM ITAM.CI_INVENTORY WHERE CI_INV_ID=113;

--TASK10--
A user privilege is a right to execute a particular type of SQL statement, 
or a right to access another user's object. The types of privileges are 
defined by Oracle. Roles, on the other hand, are created by users (usually administrators)
and are used to group together privileges or other roles.



--TASK11--
create view SAM_VIEW
as
select * FROM ITAM.CI_INVENTORY;
 

--TASK12--
SELECT * FROM SAM_VIEW;
 

--TASK13--

create view OTHMAN_VIEW
as
select * FROM ITAM.CI_INVENTORY;
--They didn't allow me to create a view because i use ROLE  
--to grant the priviliges to this user
 

--TASK14--
--USE ADMIN
-- REVOKE THE ROLE PRIVILIGES THEN There is only one method to give the directly table priviliges to the OTHMAN 
 