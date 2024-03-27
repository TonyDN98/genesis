# DBA Storage

## Oracle Database Storage Structures
Storage structures have 2 types:
1. Logical Storage Structures
2. Physical Storage Structures


![storage-tyoe](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28246-1.png?ezimgfmt=ng:webp/ngcb8)

## Physical Storage Structures
1. **SAN** : Storage Area Network
2. **NAS** : Network Attached Storage
3. **NFS** : Network File System
4. **ASM** : Auto Storage Manager

#### NOTE :  Physical data files are the files in the storage that we can see.


## Logical Storage Structures

1. Oracle Data-Block
2. Extent
3. Segment
4. Tablespace
5. Database


#### Tablespace how data is stored
Oracle data is stored in data-blocks, `1 BLOCK = 8KB` => `1 BLOCK = 1 or more rows`  
```
Tablespace 1 => Database 1 -> extend 84kb
                Database 2 -> extend 96kb
        Database 1 + 2 => Segment 160kb => Segment goes to TableSpace
```


**Table-spaces** are logical storage groups that can be used to store logical database constructs such as tables and indexes. Logically it stores the database files. The relation between the data files and the table-space is many to one. So, we can have many data files present.

Each table-space consists of at least one data file.    

### Diagram
![tablespace-explained](https://www.oracletutorial.com/wp-content/uploads/2019/07/Oracle-tablespace.png)


### Tablespace type
![tablespace-type](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28246-2-768x224.png?ezimgfmt=ng:webp/ngcb8)
1. System
2. Sysaux
3. Temp
4. Undo
5. Users


#### 1. System
* The SYSTEM tablespace is used for core functionality. It stores the data dictionary information means metadata (i.e. data about data)  

* **Data Dictionary** belong to **System** schema
* Oracle create System tablespaces automatically when database is created

#### 2. Sysaux
* The **SYSAUX** tablespace is the helper of the system tablespace. 
* The **SYSAUX** tablespace is an auxiliary tablespace to the SYSTEM tablespace. It helps to reduce the load on the SYSTEM tablespace.
* Oracle creates it automatically when the database is created. 


#### 3. Temp 
* The TEMP tablespace is used to manage space for database sort and joining operations and for storing global temporary tables.

* Oracle uses temporary tablespaces for sorting datasets that are too big to fit into PGA. Other SQL operations that might require disk sorting are: 
 
`CREATE INDEX / ANALYZE / SELECT DISTINCT / ORDER BY / GROUP BY / UNION`

#### 4. Undo
* UNDO tablespace is used to roll back or undo, changes to the database. 
* Roll back transactions when a ROLLBACK statement is issued. 
* Recover the database back to the original state. Provides read consistency. 

**Example**: User runs an update statement and didn’t issue a commit yet. Oracle keeps the old value in the undo tablespace in order to recover the data if the user issues rollback and new values in the database buffer cache and redo log buffer. Once the user issues a commit then the old data present in the undo tablespace is removed and new data present in the database buffer cache and the redo log buffer will be updated to the datafiles. The other users can be able to access the old data which is not committed and the old data stored in the undo tablespace. The user may commit and may not commit. This is the reason UNDO tablespace is created. This provides read consistency.

#### 5. USERS  
* The USERS tablespace stores user’s objects and data. 
* Here we can tables, insert data, and update data. 
* Every database should have a tablespace for permanent user data that is assigned to users. Otherwise, user objects will be created in the SYSTEM tablespace, which is not good practice. 
* In the preconfigured database, USERS is designated as the default tablespace for all new users


### Create Tablespace
```sql 
CREATE TABLESPACE tablespace_name_1
datafile '/disk1/dev/data/data01.dbf' --file
size 50m -- initial size 50 mb
autoextend on -- autoextends
next 512k --extend 512k everytime
maxsize 250m --util reach 250mb
```

### Show `dba_data_files` tablespaces
```sql
SELECT 
   tablespace_name, 
   file_name, 
   bytes / 1024/ 1024  MB
FROM
   dba_data_files;
```
#### OUTPUT
![out](https://www.oracletutorial.com/wp-content/uploads/2019/07/create-tablespace-query-tablespaces.png)


### Associate tablespace to TABLE
```sql
CREATE TABLE t1(
   id INT GENERATED ALWAYS AS IDENTITY, 
   c1 VARCHAR2(32)
) TABLESPACE tablespace_name_1;

BEGIN
   FOR counter IN 1..10000 loop
      INSERT INTO t1(c1)
      VALUES(sys_guid());
   END loop;
END;
```


### Add more space to tablespace
```sql 
ALTER TABLESPACE tablespace_name
ADD datafile 'disk1/dev/data/data02.dbf' -- add datafile
SIZE 50m
AUTOEXTEND ON
NEXT 512K
MAXSIZE 250M
```

### Resize the data-file of database
```sql 
ALTER DATABASE  -- alter database size
DATAFILE '/disk1/dev/data/datafile03.dbf'
RESIZE 100M
```

### Space left in tablespace
```sql
SELECT 
   tablespace_name, 
   bytes / 1024 / 1024 MB
FROM 
   dba_free_space
WHERE 
   tablespace_name = 'tablespace_name_01';
```
