# DBA Startup

#### Connect to database
`sqlplus / as sysdba`

## How to startup ?
`startup`

**Database** is started,  this command will open the **instance again**.

![database startup](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29305-2.png?ezimgfmt=ng:webp/ngcb8)

#### Note: Every time we connect to a database we are connecting to an instance.

In the image above we can see SGA allocated 2.3GB reserved for System Global Area.  

This **information** is **READ FROM** the **parameter file** `.pfile & .spfile`

## Startup Stages

![startup-stages](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29305-3.png?ezimgfmt=ng:webp/ngcb8)

### startup nomount
**Instance started**, but no associated to **database**.
 **DBA** can use it.

1. Instance is looking and reading parameter files(`.pfiles & .spfiles`)  
2. FROM paramter file , **SGA** memory is allocated. 
3. Starts the background processes.
4. Open `Alert` and `Trace` files.


### startup mount
**Instance started and associated with database**, from **control files** `.ctl`  
**DBA** can use it.  
**NO** operations like INSERT, UPDATE, DELETE are allowed util database is **OPEN**.

### startup open
Database is started and associated with instance. Data file are open for use of users.

1. Open the **ONLINE** data files present on sistem.
2. Acquires **UNDO tablespaces**.
3. Open online redo log files.

## System Users
1. SYS (admin)
2. SYSDBA
3. SYSOPER
4. SYSBACKUP
5. SYSDG
6. SYSKM

#### NOTE: All users in this list are super users.

## Practical

```sql
sqlplus / as sysdba
shutdown immediate;
startup nomount;
-- SGA memory is allocated / .pfile & .spfile are read / start background processes
select count(*) from dba_users;
-- this will raise an error, db or pbdb not open, only fixed tables or views.
select status from v$instance; -- STARTED

--mount
alter database mount;

select status from v$instance; -- MOUNTED

select count(*) from dba_users;
-- this will raise an error, db or pbdb not open, only fixed tables or views.

alter database open;

select status from v$instance; -- OPEN

select (*) from dba_users;
-- 36 users
```


#### NOTE: Note: You may have a question about why we are doing all this process while we can execute using a single statement “startup;”. These operations are required during maintenance tasks. These steps will be used during the patching of the database. There will be multiple actions of fixes will be done during these stages of the database.

## Startup arguments

![startup-arguments](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29305-16.png?ezimgfmt=ng:webp/ngcb8)

