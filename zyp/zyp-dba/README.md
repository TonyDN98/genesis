
[What is Oracle Net Listener](https://www.oracletutorial.com/oracle-administration/oracle-listener/)

Oracle net listener is a separate process that runs on the database server computer. It receives incoming client requests and manages the traffic of these requests to the database server. The purpose of the Oracle listener is to listen to the client connections. Oracle uses two main files for network configurations for connection between the client and the database. We will discuss these files in detail.

- listener.ora
- tnsnames.ora

We have an oracle client (client indicates any user or any application user who is connecting to the database) who is trying to connect to the database. In order to connect to a specific database, we need a network. Let us assume that there are six databases. A user needs to connect to database 1. He will connect to the database through the network using a protocol. We need some object to listen to the client connections. We call that object an Oracle listener. Oracle listener listens to the client’s requests.



<h2 id="u2">What is Oracle Listener</h2>   


Oracle listener is a gateway to the actual oracle database. This is a separate component present in the server. The job of the Oracle listener is to wait and listen for the connections of the oracle database.
When a client request comes, the listener first receives it. Then the listener establishes a connection between the client and the database instance.  

Once the client is connected to the database instance successfully, the listener hands over the client connection to the server process.  

If the listener stops running, you cannot connect to the Oracle Database anymore. However, all the existing connections will not be affected.  

![listener](https://www.oracletutorial.com/wp-content/uploads/2019/07/Oracle-Listener.png)

![net](https://dotnettutorials.net/wp-content/uploads/2022/12/word-image-32938-2.png?ezimgfmt=ng:webp/ngcb8)

## What is Listener.ora?
Listener.ora is a sql.net configuration file used to configure oracle database listeners (required to accept remote connection requests which were requested by the clients or users). The location of the listener file is `$ORACLE_HOME/network/admin/`

### tnsnames.ora 

What is tnsnames.ora?

When the oracle client is trying to connect to the database, he needs an oracle listener. The oracle client needs to know about the below information before connecting to the database.

Host name where the listener and database are running.
Port Number
Listener Protocol
Service name that the listener is handling
Instead of mentioning all these parameters every single time during the connection of the database, we use a client-side configuration file called tnsnames.ora. This file will be present on the client side. This file will be present on the server side in case if we want to connect as the client on the server. The purpose of this tnsnames.ora file is to make things simple. Below image is the entry of the tnsname.ora file.

![e](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29685-7.png?ezimgfmt=ng:webp/ngcb8)


![e2](https://dotnettutorials.net/wp-content/uploads/2022/12/word-image-32936-1.png?ezimgfmt=ng%3Awebp%2Fngcb8%2Frs%3Adevice%2Frscb8-1)

> We have a client machine. This client is trying to access a service named pdb1.example.com. We have a database server that contains a listener, instance, and database. The database is a container database that has a pluggable database called PDB1. The service of the pluggable database is pdb1.example.com. Example.com is the domain name.


<h2 id="u3"> Oracle database files</h2>   
<a href="#up">go up</a>

#### Query Data Files and Temp Files in Oracle

![e](https://dotnettutorials.net/wp-content/uploads/2022/09/word-image-30565-9.png?ezimgfmt=ng:webp/ngcb8)


A Database is a collection of database files that organize data and are stored in the disk storage (Physical). Physical indicates the files that we can see in our daily tasks. We have 9 types of files in the Oracle Database. They are as follows:

Datafiles.   
Control files.   
Redo log files.   
Database Backup files.   
Archived Redo log files.   
Parameter files.   
Password files    
Alert log files.   
Trace files.   

### Data Files:
Data Files contain the actual user data, application data, and metadata. i.e Tables, Rows, indexes procedures, views, etc. The combination of datafiles is represented as tablespaces. The data is stored using Database writer.

Note: If you lose Datafiles, you lose your database. The extension for datafiles is ``.dbf``

### Control Files:
Control files stores metadata about the data files and online redo log files like names, locations, timestamp, and status. This information is required by the database instance to start and open the database.

Note: If you lose Control Files, you lose your database. The extension for Control files is ``.ctl``

Redo Log Files:
Redo Log Files stores changes to the database as they occur and are used for data recovery. The redo log files store the changes made to the database like DML and DCL operations. Log writer is used to writing the changes to redo log files.

Note: If you lose Redo log files, you lose your database. The extension for the redo log file is ``.log``


Database Backups Files:
Any backups of your database that you have taken to be stored in any location to recover the database when the database is crashed.
Note: The backup must include the data files, control files, and redo log files to recover because these are the important database files.

## What is a check point?
- Its an event in database when which modify data blocks in memory with the hard-drive.

## Database Instance
A Database Instance is an interface between client applications (users) and the database. An Oracle instance consists of three main parts: System Global Area (SGA), Program Global Area (PGA), and background processes.

#### V$DATABASE/ V$INSTANCE in Oracle

![container](https://dotnettutorials.net/wp-content/uploads/2022/09/word-image-30726-1-768x433.png?ezimgfmt=ngcb8/notWebP)

So, in the bucket container database, we have one seed database and other container databases like PDB1 and PDB2. The container_id for the bucket is 0. The container id for the CDB$ROOT database is 1. The container id for PDB$SEED is 2 and for PDB1 is 3 and for PDB2 is 4

`select name,cdb,con_id,open_mode from v$database;`  

![e](https://dotnettutorials.net/wp-content/uploads/2022/09/word-image-30726-3.png?ezimgfmt=ng:webp/ngcb8)

  
`select * from v$instance;`  
![e](https://dotnettutorials.net/wp-content/uploads/2022/09/word-image-30726-6.png?ezimgfmt=ng:webp/ngcb8)  


<h2 id="u4">startup</h2>   
<a href="#up">go up</a>

## How to start-up the database
Connect to the database using `sqlplus / as sysdba` as shown in the below image. This command indicates connecting to the SYS user.

### `startup` 

> Note: Whenever we connect to a database we are connecting to an instance.

###  [Start-up methods](https://www.oracletutorial.com/oracle-administration/oracle-startup/)


![startup](https://www.oracletutorial.com/wp-content/uploads/2019/07/Oracle-Startup-Stages.png)

#### Open method
1. Opens the online database files present in the database.
2. Acquires the Undo tablespaces
3. Opens the online redo log files.

```sql
/ as sys
startup
select name from v$database;
shutdown immediate
startup nomount;
select count(*) from dba_users;
select status from v$instance;
alter database mount;
alter database open;
```

#### Start-up examples

![startup](https://www.oracletutorial.com/wp-content/uploads/2019/07/Oracle-Startup.png) 

```sql
/ as sysdba sysdba;
startup nomount; -- started instance
alter database mount; -- mount db to instance
DESC v$instance;
SELECT instance_name, status FROM v$instance;
INSTANCE_NAME    STATUS
---------------- ------------
orcl             MOUNTED

alter database open; -- open for users
INSTANCE_NAME    STATUS
---------------- ------------
orcl             OPEN
```
<h2 id="u4">Shuting down a database</h2>   
<a href="#up">go up</a>

[Shuting down a database](https://www.oracletutorial.com/oracle-administration/oracle-shutdown/)

### Methods of shutdown 
![÷](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29307-1-768x189.png?ezimgfmt=ng:webp/ngcb8)


When it shutdown the database the instance is  terminated.  
#### Close the database
> Database it's still mounted.
#### Dismount the database
>After database is closed, oracle unmount the database to deassociate the instance.
#### Shutdown the instance
> Last step it to remove the SGA associated and it's processes.

<h2 id="u5">What is Tablespace</h2>   
<a href="#up">go up</a>


<h2 id="u5">USERS and privileges</h2>   
<a href="#up">go up</a>

[USERS and privileges](https://www.oracletutorial.com/oracle-administration/oracle-create-tablespace/)

### CREATE a user

```sql
 CREATE USER username --username
    IDENTIFIED BY password --passwd
    [DEFAULT TABLESPACE tablespace] --default users tablespace
    [QUOTA {size | UNLIMITED} ON tablespace]
    [PROFILE profile]
    [PASSWORD EXPIRE] -- change after first login
    [ACCOUNT {LOCK | UNLOCK}];
```

```sql
--create user pass
CREATE USER john IDENTIFIED BY abcd1234;
-- output
User JOHN created.

-- select users
SELECT 
    username, 
    default_tablespace, 
    profile, 
    authentication_type
FROM
    dba_users
WHERE 
    account_status = 'OPEN';
```

![users](https://www.oracletutorial.com/wp-content/uploads/2019/06/Oracle-CREATE-USER-example.png)

```sql
GRANT CREATE SESSION TO jane;
SQL> connect jane@orclpdb/abcd1234
ERROR:
ORA-28001: the password has expired

Changing password for jane
New password:<new_password>
Retype new password:<new_password>
Password changed
Connected.
SQL>
```

### [Grant privileges](https://www.oracletutorial.com/oracle-administration/oracle-grant/)
By definition, a privilege is a right to execute an SQL statement or a right to access an object of another user.  

Oracle defines two main types of privileges: **system privileges** and **object privileges**  

#### System privileges
System privileges determine what a user can do in the database. They mainly allow a user to add or modify schema objects in the database like creating tables, creating views, and removing tablespaces.  

 - CREATE SESSION
 - CREATE TABLE
 - CREATE VIEW
 - CREATE PROCEDURE
 - SYSDBA
 - SYSOPER

#### Object privileges
**Object privileges** decide how a user can access the data in the database. The object privileges apply to rows in tables or views
 - INSERT
 - UPDATE
 - DELETE
 - INDEX
 - EXECUTE

 ```sql
 CREATE USER john IDENTIFIED BY abcd1234;
-- grant user acces to create session
GRANT CREATE SESSION TO john;

CREATE TABLE t1(id NUMBER PRIMARY KEY); -- insufficient privileges
GRATE CREATE TABLE TO john;
GRANT SELECT ANY TABLE TO JOHN;
```

### [REVOKE](https://www.oracletutorial.com/oracle-administration/oracle-revoke/)

```sql
CREATE USER toni IDENTIFIED BY passwd; --create
GRANT CREATE SESSION TO toni; -- connect
GRANT SELECT,INSERT,DELETE, UPDATE ON ANY TABLE TO toni; --operations
REVOKE SELECT,INSERT FROM toni; --revoke
```

### USER PROFILE
When you create a new user without specifying a profile, Oracle will assign the DEFAULT profile to the user
```sql
CREATE PROFILE sales LIMIT
    SESSIONS_PER_USER          UNLIMITED 
    CPU_PER_SESSION            UNLIMITED 
    CPU_PER_CALL               3000 
    CONNECT_TIME               60;
```

### Assign profile to user
```sql
CREATE USER toni IDENTIFIED BY 123QWE;
ALTER USER toni PROFILE sales;
```

### CREATE ROLES AND ASSIGN TO USERS
```sql
CREATE USER toni IDENTIFIED BY 123qwe
PROFILE sales;


CREATE ROLE helper;
GRANT CREATE SESSION, INSERT,SELECT TO helper;
GRANT helper TO toni;
```


### [DROP USER cascade](https://www.oracletutorial.com/oracle-administration/oracle-drop-user/)

```sql
CREATE USER foo IDENTIFIED BY 123qwe;
DROP USER foo;

CREATE USER foo 
    IDENTIFIED BY abcd1234 
    QUOTA 5m ON users;

GRANT 
    CREATE SESSION,
    CREATE TABLE
TO foo;
DROP USER foo; -- ORA-01940: cannot drop a user that is currently connected

DROP USER foo CASCADE;
```

### Listing users

```sql
SELECT * FROM dba_users ORDER BY created;; -- all users from db
```
![dba user](https://www.oracletutorial.com/wp-content/uploads/2019/06/Oracle-List-Users-dba_users.png)


```sql
SELECT * FROM all_users ORDER BY created;
```

![alluser](https://www.oracletutorial.com/wp-content/uploads/2019/06/Oracle-List-Users-all_users.png)


<h2 id="u6">Roles</h2>   
<a href="#up">go up</a>

[Roles](https://www.oracletutorial.com/oracle-administration/oracle-create-role/)

A role is a group of privileges. Instead of granting individual privileges to users, you can group related privileges into a role and grant this role to users. Roles help manage privileges more efficiently.

### Create role
```sql
CREATE ROLE mdm;
GRANT SELECT, INSERT, UPDATE, DELETE
ON customers
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON contacts
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON products
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON product_categories
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON warehouses
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON locations
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON employees
TO mdm;

CREATE USER toni IDENTIFIED BY 123QWE;
GRANT mdm TO toni;
SET ROLE mdm; -- in toni session
```

<h2 id="u7">External Tables</h2>   
<a href="#up">go up</a>

[External Tables](https://www.oracletutorial.com/oracle-administration/oracle-external-table/)

An external table is a table whose data come from flat files stored outside of the database.

Oracle can parse any file format supported by the **SQL*Loader**.

![e](https://www.oracletutorial.com/wp-content/uploads/2019/07/Oracle-External-Table.png)

Here is a CSV file that has two columns: **language id** and **name**.

![base](https://www.oracletutorial.com/wp-content/uploads/2019/07/Oracle-External-Table-Data-File.png)

### 1. Create external table 
```sql
-- Create a directory object
create directory lang_external as 'C:\loader';

-- Grand access
grant read,write on directory lang_external to ot;

-- CREATING TABLE EXTERNAL
CREATE TABLE languages(
    language_id INT,
    language_name VARCHAR2(30)
)
ORGANIZATION EXTERNAL(
    TYPE oracle_loader
    DEFAULT DIRECTORY lang_external
    ACCESS PARAMETERS 
    (FIELDS TERMINATED BY ',')
    LOCATION ('languages.csv')
);
```

### 2. SQL Loader
SQL*Loader allows you to load data from an external file into a table in the database. It can parse many delimited file formats such as CSV, tab-delimited, and pipe-delimited.  

To execute the SQL*Load tool, you need at least three files:

The input data file stores delimited or raw data
The parameter file stores the location of the input/output files
The control file contains the specification on how data is loaded.

![loader](https://www.oracletutorial.com/wp-content/uploads/2019/07/oracle-sqlloader.png)

#### INPUT FILE ``email.dat``
```sql
1,john.doe@example.com
2,jane.doe@example.com
3,peter.doe@example.com
```

#### control file ``email.ctr``
```sql
load data into table emails
insert
fields terminated by ","
(
email_id,
email
)
```

#### parameter file `email.par`
```sql
userid=ot@pdborc/Abcd1234
control=email.ctl
log=email.log
bad=email.bad
data=email.dat
direct=true
```

#### CREATE TABLE
```sql
CREATE TABLE emails(
    email_id NUMBER PRIMARY KEY,
    email VARCHAR2(150) NOT NULL
);
```

#### Execute loader
```sql
C:\loader> sqlldr parfile=dept_loader.par
SELECT * FROM emails;
```
![loader](https://www.oracletutorial.com/wp-content/uploads/2019/07/oracle-sqlloader-output.png)


<h2 id="u8">Show Tables</h2>   
<a href="#up">go up</a>

[Oracle Show Tables](https://www.oracletutorial.com/oracle-administration/oracle-show-tables/)


![tables](https://www.oracletutorial.com/wp-content/uploads/2019/06/oracle-show-tables.png)







