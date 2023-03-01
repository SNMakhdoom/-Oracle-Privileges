# Oracle-Privileges
This code is a set of SQL commands to perform several tasks in an IT Asset Management (ITAM) system.

The first part of the code creates four users (PROF, ITAM, SAM, OTHMAN) and grants them the privileges to create tables, sequences, types, procedures, triggers, and views. The ITAM user is also granted a quota of 20MB on the USERS tablespace.

The subsequent tasks are as follows:

### Display the list of users and their privileges on the database.

Gather statistics on the ITAM schema and display the tables in the schema ordered by the number of rows.

Display the tables in the ITAM schema ordered by the number of rows.

Grant permissions to the SAM user to insert, select, update, and delete records from various tables in the ITAM schema. SAM is also granted permissions to select certain sequences.

Insert a new record into the CI_INVENTORY table, retrieve it, change it, retrieve it again, delete it, and retrieve it once more.

Grant permissions to the ITAM_USER role to perform the same operations as SAM in task 4.

This code can be used as a template for setting up a basic ITAM system in an Oracle database.




