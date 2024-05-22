-- M1. Creating a table with 3 columns;
CREATE TABLE table_with_3_columns(
    char_column VARCHAR2(100),
    number_column NUMBER,
    date_column DATE
);

-- M2. View column informations
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
    LOWER(table_name) = 'table_with_3_columns';

DESC user_tab_columns;


-- M3. Character Data Type

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
    

-- M4. Numberic Data Type

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
    
-- M5. DATE Data Type

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
    
-- M6. Binary Data Type
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
    
-- M7. Exercise Inventory
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
    
-- M8. Adding columns to existing Tables
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
    
-- M9. Remove columns from tables
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
