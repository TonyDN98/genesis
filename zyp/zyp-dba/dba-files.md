# DBA Files

![dba-files](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28244-1.png?ezimgfmt=ng:webp/ngcb8)

## Data Files
Data files contain the actual user-data, application-data, metadata :
- Table
- Rows
- Indexes procedures
- Views

> Combination of data-files is represented as **TABLE SPACES**.  

Data is stored using **Database Writer**.

#### NOTE: If you lose data-files `.dbf` you lose your database.

## Control Files
Control files stored meta-data about data-files and Redo files like:
- Names
- Location
- Timestamp
- Status

#### NOTE: This information is required by the **INSTANCE** to **STARTUP and OPEN**.

#### NOTE: If you lose control-files `.ctl` you lose your database.

## Redo log files

> Redo Log Files stores changes to the Database when they occur and they used for **RECOVERY**.  

#### NOTE:  **Log Writer Process** is used to write the changes to REDO LOG FILES.

#### NOTE: If you lose redo-log-files `.log` you lose your database.


## Database Backups Files
Backups contain (data-files, control-files, redo-log-files), it's important for **RECOVERY**.

## Archived Redo Log Files

This is explained as a group of redo log files. All the redo log files are archived and stored in some other location for backup and recovery purposes. Contains ongoing history of the data changes. Using the backup file and archived redo log files you can recover your Oracle database


![example-recovery](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28244-2.png?ezimgfmt=ng:webp/ngcb8)

**Example** : let us take an oracle database named dotnet_db1. The **backup of this database is initiated at 2 PM**. The backup file is stored in some other location. At 4 PM database crashed and all the data is lost. We have to restore the data back to dotnet_db1 which is more important. We need to look into the files and how we can restore the entire database back to normal.

Now we have the **backup file which has taken back up at 2 PM**. So, the data will be available till 2 PM. `What about remaining transactions between 2 Pm to 4 PM?` Now the `archive redo log files` come into place. It stores all the changes that happen to the database. So, we can use the archived redo log files to recover the data from 2 PM to 4 PM, and using these backup files and archived redo log files we can restore the database and put it in the normal situation.

#### NOTE: For a FULL Recovery here come in place DATABASE BACKUP + ARCHIVE REDO LOGs.  BACKUP at some point + ARCHIVE util PRESENT.

## Parameter file:

2 parameter files:
1. Pfile (Parameter File)
2. Spfile (Server Parameter File)

This files define how instance is configured when it starts up.
All configurations of database are present in the parameter file.

#### Note: Spfile is a binary and can't be edited directly, just with oracle commands. Pfile si a parameter file, you can edit it. =

#### Note: If you lose your Spfile you can recreate it again, but it's better to take a backup spfile in order to restore all the configurations of database.


## Password file
It store passwords for users with **administrative privilegies** in order to connect remotely.

#### Note: DBA password cannot be stored in the database, because Oracle cannot access the database before the instance is started, Therefore, the authentication of the DBA must happen outside of the database. The password file will be present in the below location:

`$ORACLE_HOME \database\ PWD sid. ora(sid is database name)`


## Alert Log / Trace files (background processes)
Contains log of errors in order, use for troubleshooting.
For ex: when database start and stop.
`../trace/*trc`



