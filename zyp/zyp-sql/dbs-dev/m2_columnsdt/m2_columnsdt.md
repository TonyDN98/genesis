
# Module 2. Columns and DataTypes / Database for Developers Foundation 

[link to course](https://devgym.oracle.com/pls/apex/f?p=10001:329:101471961097466:::329:P329_CLASS_ID:5483)

> Tables may be the foundation of your database, but you need something to hold them back, "COLUMNS".

> **NOTE: At least one column for your table** 
* Every tables of your database, it will have at least one column, based on what you need.

* Name your column meaningful, like weight, height, color, id.

* Choose the correct datatype for your column, or your tables will not stand-up when the volume of your data will grow-up.


#### DATA TYPES:
* **NUMBER**
    * **NUMBER**
        * The most common number dt
        * number( precision, scale )
        * number( 3, 2 ) -9.99 9.99
        * number( 3, -2 ) -99900 99900
        * number(5) -99999 99999
    * **INTEGER**
    * **FLOAT**
    * **DECIMAL**
    * **BINARY_FLOAT**
    * **BINARY_INTEGER**

* **DATES**
    * **DATE**
        * Granular to **SECONDS**
        * Include the **TIME OF DAY**
        * YYYY-MM-DD
        * **TO_DATE** ( '2018-07-23 09:00 AM', 'YYYY-MM-DD HH:MI AM' )
        * When store dates in data base are converted to internal format, when is displayed client control the format.
    * **TIMESTAMPS**
        * Stores even milliseconds
    * **TIME INTERVALS**

* **BINARY**
    * **BLOB** - large amount of binary

* **STRINGS**
    * **CHAR**
        * Store fixed length, up t0 2.000 length
    * **VARCHAR2**
        * Store variable length text, up to 32.767 length
    * **CLOB**
        * "Character Large Object" , large amount of text
* **BINARY** - USED TO STORE in original format. OTHER FILES, VIDEO, AUDIO, WORD
    * **RAW**
        * smaller data type like CHAR, up to 32.767 
    * **BLOB**
        * "Binary Large Object"

> **NOTE: You need to make the correct choose for your data type**

---

#### Q1: Which of the following data types store numeric data in Oracle Database? 
* NUMBER, INTEGER, FLOAT, DECIMAL

#### Q2: True or False / YPu can use a DATE data type to store time zone information
* FALSE, time zone information can be stored using TIMESTAMPs

#### Q3: Which of the following data types store character data (Strings)?
* VARCHAR2 & CLOB

---

### Defining Columns

> A table can have up to 1.000 columns. This columns are defined when you create a table, or you can add this columns to existing tables.  

> Every column has a data, and determine what operations can be done to them. 

```SQL
CREATE TABLE table_with_three_columns(
    char_column VARCHAR2(100),
    number_column NUMBER,
    date_column DATE
);
```

### View information about the columns

> You can find details about columns in your **user tables** by querying **user_tab_columns**.
```SQL
SELECT table_name, columns_name, data_type, data_length, data_precision, data_scale FROM user_tab_columns;
```

### Character Data Type

```SQL
CREATE TABLE character_data(
    varchar_10_col    VARCHAR2(10),
    varchar_4000_col  VARCHAR2(4000),
    char_10_col       CHAR(10),
    clob_col          CLOB
);

SELECT
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale
FROM 
    USER_TAB_COLUMNS
WHERE
    LOWER(table_name) = 'character_data';
```


### Numeric Data Type

```SQL
CREATE TABLE numeric_data (
  number_3_sf_2_dp  NUMBER(3, 2),
  number_3_sf_2     NUMBER(3, -2),
  number_5_sf_0_dp  NUMBER(5, 0),
  integer_col       INTEGER,
  float_col         FLOAT(10),
  real_col          REAL,
  binary_float_col  binary_float,
  binary_double_col binary_double
);

SELECT
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale
FROM 
    USER_TAB_COLUMNS
WHERE
    LOWER(table_name) = 'numeric_data';
```

### Datetime and Interval Data Type

```SQL
CREATE TABLE datetime_data (
  date_col                      DATE,
  timestamp_with_3_frac_sec_col TIMESTAMP(3),
  timestamp_with_tz             TIMESTAMP WITH TIME ZONE,
  timestamp_with_local_tz       TIMESTAMP WITH LOCAL TIME ZONE,
  year_to_month_col             INTERVAL YEAR TO MONTH,
  day_to_second_col             INTERVAL DAY TO SECOND
);

SELECT
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale
FROM 
    USER_TAB_COLUMNS
WHERE
    LOWER(table_name) = 'datetime_data';
```

### Binary Data Type

```SQL
CREATE TABLE binary_data (
  raw_col  RAW(1000),
  blob_col BLOB
);

SELECT
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale
FROM 
    USER_TAB_COLUMNS
WHERE
    LOWER(table_name) = 'binary_data';
```

### Complete the statements
* item_id of type number(20, 0)  
* type of type varchar2 max size 10    
* price_item of type number with precision 10 and scale 2    
* purchased_date of type date    

```SQL
CREATE TABLE inventory_table(
    item_id NUMBER(20,0),
    type VARCHAR2(10),,
    price_item NUMBER(10,2),
    purchesed_date DATE
);

SELECT
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale
FROM 
    USER_TAB_COLUMNS
WHERE
    LOWER(table_name) = 'inventory_table';
```

### Adding columns to existing tables
> ALTER TABLE tab_name ADD (col_name DATA_TYPE);

```SQL
ALTER TABLE table_with_three_columns ADD(
    timestamp_column TIMESTAMP,
    blob_column BLOB
);

SELECT
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale
FROM 
    USER_TAB_COLUMNS
WHERE
    LOWER(table_name) = 'table_with_three_columns';
```

### Remove columns from a table

```SQL
ALTER TABLE table_with_three_columns DROP (
    timestamp_column,
    blob_column
);

SELECT
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale
FROM 
    USER_TAB_COLUMNS
WHERE
    LOWER(table_name) = 'table_with_three_columns';
```
