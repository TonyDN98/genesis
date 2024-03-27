
# Module 1. Tables / Database for Developers Foundation 

[link to course](https://devgym.oracle.com/pls/apex/f?p=10001:329:102188500772540:::329:P329_CLASS_ID:5482)

> Before you create a table ,you should rly think of what kind of database you gonna create. Because migration it's very difficult.

1. Heap Organized Tables  **default**
    * It will store rows whenever will find space
2. Index Organized Tables
    * Everything goes exactly when it should(it's annoying and hard), according to **primary key**
    * When retrieve elements from table (it's much more easier).
3. External Tables
    * Used to access non-database files.
    * Often used before inserting the data into your real table.
4. Temporary Tables
    * Store private data for each session
    * No one can see or access this data.
5. Partition Tables
    * Split the table into smaller tables.
    * Rows are split into partitions, according to **partition key**
6. Table Clusters
    * Physically store **related data** together
    * Much easier to find stuff.

#### Q1: True about Heap Organization?
* They are the default table type in Oracle.
* There is no order on how it's stored data, any new row will be **inserted whenever there will be space in the table**.
* You **can't group rows next to eachother** in heap, instead we can use **cluster**
* **Partitioning** is an extra property you can add to heap tables. You can also **partition index organized tables and table clusters**


### Viewing Table Information
**user_tables** -> user owned tables  
**all_tables** -> all tables that user has access to  
**dba_tables** -> all tables in database  
```sql
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

```


### Heap Organization
```sql
CREATE TABLE <table_name>(
    <column_name> <data_type>, 
    <column_name> <data_type>, 
    <column_name> <data_type> 
) [ORGANIZATION HEAP];


CREATE TABLE table_heap(
    heap_name VARCHAR2(19)
)ORGANIZATION HEAP;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'table_name';
```

> Heap organized tables are good for general purpose storage. They are the most flexible table type and will be the most common type you'll create.  
> By default, tables are heap-organized. This means the database is free to store rows wherever there is space. You can add the "organization heap" clause if you want to be explicit 

### Index Organized Tables IOT
An IOT stores data physically ordered according to the **primary key**. These are most suitable when you want to **ensure fast data access by this key**

> Unlike a heap table, an index-organized table (IOT) imposes order on the rows within it. It physically stores rows sorted by its primary key. To create an IOT, you need to:
- Specify a primary key for the table
- Add the organization index clause at the end

```sql
create table <table_name>(
    <column_name> <data_type> primary key,
    <column_name> <data_type>,
    <column_name> <data_type>
) organization index;

 CREATE TABLE table_index(
    index_id NUMBER PRIMARY KEY,
    index_name VARCHAR2(10)
 )ORGANIZATION INDEX;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'table_index';
```

### External Tables
>Access non-database files or import from other files.  
> You use external tables to read non-database files on the database server. For example, comma-separated values (CSV) files. To do this, you need to:
- Create a directory pointing to the location of the file on the server
- Use the organization external clause
- State the directory and name of the file you want to read

```sql
-- directory
CREATE OR REPLACE directory tmp AS '/tmp';

-- external table
CREATE TABLE external_table(
    <column_name> <data_type>,
    <column_name> <data_type>
)ORGANIZATION EXTERNAL(
    DEFAULT directory tmp
    LOCATION('file.txt')
);
```

### Partition Tables
>Partitioning logically splits up a table into smaller tables according to the partition column(s). So rows with the same partition key are stored in the same physical location.
- Range
- List
- Hash

>To create a partitioned table, you need to:
- Choose a partition method
- State the partition columns
- Define the initial partitions

```sql

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


```


### Temporary Table
It stores private data for each session

#### Global Temporary Table
> To create a global temporary table add the clause "global temporary" between create and table.  
> The definition of the temporary table is permanent. All users of the database can access it. But only your session can view rows you insert.
```sql
CREATE GLOBA temporary TABLE temp_table(
    <column_name> <data_type>,
    <column_name> <data_type>
);

CREATE GLOBAL TEMPORARY TABLE global_temp_gtt(
    gtt_name VARCHAR2(10)
);

```

#### Private Temporary Tables

> Starting in Oracle Database 18c, you can create private temporary tables. These tables are only visible in your session. Other sessions can't see the table!
> To create one use "private temporary" between create and table. You must also prefix the table name with ora$ptt_:
> For both temporary table types, by default the rows disappear when you end your transaction. You can change this to when your session ends with the "on commit" clause.
> But either way, no one else can view the rows. Ensure you copy data you need to permanent tables before your session ends!

```sql
CREATE PRIVATE TEMPORARY TABLE private_temp_pvt(
    pvt_name VARCHAR2(10)
);
```

#### Viewing Temporary Table Details
The column temporary in the *_tables views tell you which tables are temporary:

```sql
SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'private_temp_pvt';
```

### Clustering

1. A cluster store a group of tables with same columns. First create the **cluster**

```sql
create cluster prime_cluster(
    column_common number
);
```

2. With the cluster in place, you can assign tables to it as shown. The cluster clause states which cluster to use and which of the table's columns are the cluster key. 
```sql
create table cluster_tab1(
    column_common number
)cluster prime_cluster (column_common);
```

3. This places a second table in the cluster "clus". Oracle Database will store rows from cluster_tab1 with the same value for col1 in the same location. For example, if you have rows with COL1 = 1 in cluster_tab1 and cluster_tab2 these rows are both in the same place.

```sql
create table cluster_tab2(
    column_common number
)cluster prime_cluster  (column_common);
```







