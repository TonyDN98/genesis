-- Module 1

-- 1. CREATE a TABLE to store the names and weights of toys
CREATE TABLE toys(
	name VARCHAR2(10),
    weight NUMBER
);

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'toys';

/*
2. Viewing Table Information
user_tables -> user owned tables
all_tables -> all tables that user has access to
dba_tables -> all tables in database
*/

DESC user_tables;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables;

DESC all_tables;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   all_tables;

DESC dba_tables;
  
SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   dba_tables;



-- 3.TRY IT

DROP TABLE bricks;

CREATE TABLE bricks (
color VARCHAR2(10),
shape VARCHAR2(10)
);

DESC bricks;

SELECT table_name
FROM user_tables
WHERE table_name = 'BRICKS';

/*
4. Table Organization
Heap
Index
External
By default, tables are heap-organized. This means the database is free to store rows wherever there is space. You can add the "organization heap" clause if you want to be explicit:
*/

CREATE TABLE table_heap(
    heap_name VARCHAR2(19)
)ORGANIZATION HEAP;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'table_heap';


/*
5. Index-Organized Tables
Unlike a heap table, an index-organized table (IOT) imposes order on the rows within it. It physically stores rows sorted by its primary key. To create an IOT, you need to:
- Specify a primary key for the table
- Add the organization index clause at the end
*/

 CREATE TABLE table_index(
    index_id NUMBER PRIMARY KEY,
    index_name VARCHAR2(10)
 )ORGANIZATION INDEX;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'table_index';

/*
6. External Tables
You use external tables to read non-database files on the database server. For example, comma-separated values (CSV) files. To do this, you need to:
- Create a directory pointing to the location of the file on the server
- Use the organization external clause
- State the directory and name of the file you want to read
*/

CREATE OR REPLACE DIRECTORY path_dir as '/path/to/file';

CREATE TABLE table_extern(
    extern_name VARCHAR2(19),
    extern_id NUMBER
)ORGANIZATION EXTERNAL (
    DEFAULT DIRECTORY path_dir
    LOCATION('external.csv')
);


/*
7. Temporary Tables
Temporary tables store session specific data. Only the session that adds the rows can see them. This can be handy to store working data.

There are two types of temporary table in Oracle Database: global and private.

Global Temporary Tables
To create a global temporary table add the clause "global temporary" between create and table.
The definition of the temporary table is permanent. All users of the database can access it. But only your session can view rows you insert.
*/

CREATE GLOBAL TEMPORARY TABLE global_temp_gtt(
    gtt_name VARCHAR2(10)
);

/*
Private Temporary Tables
Starting in Oracle Database 18c, you can create private temporary tables. These tables are only visible in your session. Other sessions can't see the table!
To create one use "private temporary" between create and table. You must also prefix the table name with ora$ptt_:
For both temporary table types, by default the rows disappear when you end your transaction. You can change this to when your session ends with the "on commit" clause.
But either way, no one else can view the rows. Ensure you copy data you need to permanent tables before your session ends!
*/

CREATE PRIVATE TEMPORARY TABLE private_temp_pvt(
    pvt_name VARCHAR2(10)
);

/*
Viewing Temporary Table Details
The column temporary in the *_tables views tell you which tables are temporary:
*/

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'private_temp_pvt';

/*
8. Partition Tables
Partitioning logically splits up a table into smaller tables according to the partition column(s). So rows with the same partition key are stored in the same physical location.
Range
List
Hash
To create a partitioned table, you need to:

Choose a partition method
State the partition columns
Define the initial partitions
*/

CREATE TABLE partition_range (
  partition_name VARCHAR2(100)
) PARTITION BY RANGE ( partition_name ) (
  PARTITION p0 VALUES less than ('b'),
  PARTITION p1 values less than ('c')
);

CREATE TABLEe partition_list (
  partition_name varchar2(100)
) PARTITION by list ( partition_name ) (
  PARTITION p0 values ('Sir Stripypants'),
  PARTITION p1 values ('Miss Snuggles')
);

CREATE TABLE partition_hash (
  partition_name varchar2(100)
) PARTITION by hash ( partition_name ) partitions 4;


-- By default a partitioned table is heap-organized. But you can combine partitioning with some other properties. For example, you can have a partitioned IOT:

CREATE TABLE toys_part_iot (
  toy_id   integer primary key,
  toy_name varchar2(100)
) organization index 
  PARTITION by hash ( toy_id ) partitions 4;


