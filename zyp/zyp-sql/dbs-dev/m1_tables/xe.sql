-- Creating default Heap Organized Oracle Table
CREATE TABLE heap_table(
    column1 varchar2(20),
    column2 varchar2(20),
    column3 int
)ORGANIZATION HEAP;

DESC heap_table;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'heap_table';

-- Creating Index Organized Table
CREATE TABLE index_table(
    column1 varchar2(20) primary key,
    column2 varchar2(20),
    column3 int
)ORGANIZATION INDEX;

DESC index_table;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'index_table';

-- GLOBAL TEMPORARY TABLE
CREATE GLOBAL TEMPORARY TABLE temp_table(
    column1 varchar2(20),
    column2 varchar2(20),
    column3 int
);

desc temp_table;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'temp_table';

-- CREATE DIRECTORY
CREATE OR REPLACE DIRECTORY tmp as '/tmp';

-- CREATE EXTERNAL  TABLE using DIRECTORY
CREATE TABLE extern_table(
    column1 varchar2(20),
    column2 varchar2(20),
    column3 int
)ORGANIZATION EXTERNAL(
    DEFAULT DIRECTORY tmp
    LOCATION('file.txt')
);

DESC extern_table;

SELECT table_name, iot_name, iot_type, external, 
       partitioned, temporary, cluster_name
FROM   user_tables
WHERE  table_name = 'extern_table';


-- TODO 
-- CLUSTERER TABLES;
CREATE CLUSTER prime_cluster(
    comm_column number
);

-- first table cluster
CREATE TABLE cluster_one(
    column1 varchar2(20),
    column2 varchar2(20),
    column3 int
)CLUSTER prime_cluster(column1);
-- second table cluster
CREATE TABLE cluster_two(
    column1 varchar2(20),
    column2 varchar2(20),
    column3 int
)CLUSTER prime_cluster(column1);

-- Partition TABLE
CREATE TABLE bricks(
    color varchar2(29),
    weight int
)PARTITION BY LIST(color)(
    PARTITION p_black values ('black')
);

INSERT INTO bricks VALUES('black', 2);
INSERT INTO bricks VALUES('black', 3);
INSERT INTO bricks VALUES('red', 5);
INSERT INTO bricks VALUES('red', 6);
INSERT INTO bricks VALUES('blue',7);
INSERT INTO bricks VALUES('blue', 2);
INSERT INTO bricks VALUES('blue', 3);

COMMIT;



