
## VARIABLES
#### Naming Convention
Prefix	Data Type

| Prefix      | DATA |
| ----------- | ----------- |
| local      | l_       |
| global   | g_        |
| variable   | v_        |
| number   | n_        |
| row   | r_        |
| date   | d_        |
| table   | t_        |


---

## C. Interacting PL/SQL wth DML
> Retrive rows with data with `SELECT`  
> Make changes using `DML commands`  
> Control transactions with `ROLLBACK, COMMIT`

#### Retrive rows with SELECT
```sql
DECLARE
v_name employees.first_name%TYPE;
BEGIN
SELECT first_name
INTO v_name
FROM employees
WHERE employe_id = 100;
END;
```
#### DML PL/SQL
```sql
SET SERVEROUTPUT ON;
DECLARE
v_sal employees.salary%TYPE;
v_new employees.salary%TYPE;
BEGIN
SELECT salary
INTO v_sal
FROM employees
WHERE employee_id = 120;

v_new := v_sal / 10;
dbms_output.put_line(v_sal || ' ' || v_new);

UPDATE employees
SET salary = v_new
WHERE employee_id = 120;

COMMIT;
END;


SELECT * FROM employees WHERE employee_id = 120;
```

### Understand implicit cursor
> Oracle have an implicit cursor and goes line-by-line from top to bottom in the `CONTEXT AREA`

```sql
DELETE * FROM USER; -- 3 rows

DECLARE
  v_row_affected NUMBER;
  v_is_affected BOOLEAN := true;
BEGIN
DELETE * FROM USERS;
v_row_affected := SQL%rowcount;
dbms_output.put_line(v_row_affected);

v_is_affected := SQL%found;

IF SQL%FOUND = true THEN
  dbms_output.put_line("DELETED");
  ELSE
  dbms_output.put_line("Didn't");
END IF;

END;
```


| ID      | NAME |
| -----------   | ----------- |
| 1       | Toni <- cursor       |
| 2        | Lara <- cursor      |
| 3        | Alexa <- cursor     |

| CURSOR ATTRIBUTE      | VALUE |
| -----------   | ----------- |
| SQL%notfound        | false       |
| SQL%found        | true       |
| SQL%rowcount        | 3       |

##### !!!! YOU CANT DELETE CREATE TABLEl

## C. DATATYPES
`SCALAR` data  
`COMPOSIT` data  
**SCALAR**:  
- NUMBER
    - PLS_INTEGER specific for PLSQL
    - NUMBER
- BOOLEAN
    - TRUE
    - FALSE
    - NULL
- CHAR
    - CHAR(n)
    - VARCHAR2(n)
- DATE
    - DATE
    - INTERVAL YEAR TO MONTH
    - INTERVAAL DAY TO SECOND


### BIND VARIABLES
> VARIABLE v_name TYPE

```sql
VARIABLE v_sal NUMBER
SET autoprint ON;
BEGIN
SELECT salary INTO :v_sal
FROM employees
WHERE employee_id = 100;
END;

PRINT v_sal --will be available util the end of session;
```


#### Declaring variables
```sql
-- syntax
DECLARE
variable_name datatype [NOT NULL] := initial value;
l_total_sales NUMBER(15,2);
l_credit_limit NUMBER(10,0);
l_contact_name VARCHAR2(255);
BEGIN
NULL;
END;
```

#### NOT NULL CONSTRAIN
```sql
DECLARE
x NUMBER(10,2) NOT NULL := 5;
BEGIN
x := '';
END;
```
> ORA-06502: PL/SQL: numeric or value error

#### Assign values
> Assin operator in PL/SQL is `:=`

#### ANCHORED DECLARATION!!
If your columns data changes over time, you should rewrite the functions.  
So PL/SQL can have variables declared of a `TYPE` of a COLUMN or ROW;

#### ANCHORE BY A COLUMN IN TABLE
```sql
-- ANCHOR BY COLUMN
DECLARE
l_customer_name costumers.name%TYPE;
l_credit costumers.credit_limit%TYPE;
l_id costumer.costumer_id%TYPE;
BEGIN
SELECT name, credit_limit,customer_id
INTO
l_customer_name, l_credit, l_id
FROM customers
WHERE 
    custome_id = 30;
    DBMS_OUTPUT.PUT_LINE(l_customer_name || ' ' || l_credit || ' ' || l_id);

END;
```

#### ANCHORE BY ANOTHER VARIABLE
```sql
DECLARE
-- ANCHOR by VARS
l_credit customer.credit%TYPE;
l_max l_credit%TYPE;
l_min l_credit%TYPE;
BEGIN
SELECT
MIN(credit),
MAX(credit),
AVG(credit)
INTO
l_credit, l_max, l_min
FROM customers
WHERE 
id = 30;

DBMS_OUTPUT.PUT_LINE(l_credit || ' ' || l-max || ' ' || l_min);
END:
```

## COMMENTS
> Single line with `--`  
> Multi line with `/* */`

## CONSTANTS
> by convention constant_names start with `co_`
```sql
-- Constant syntax
constant_name CONSTANT DATATYPE [NOT NULL] := value;

DECLARE
co_payment_tax CONSTANT NUMBER NOT NULL := 5;
co_payments_time CONSTANT NUMBER NOT NULL := 45; --days
BEGIN
co_payment_tax := 10;
END;
```
> PLS-00363: expression 'CO_PAYMENT_TERM' cannot be used as an assignment target

### DIFFERENCE BETWEEN SQL SELECT AND PL/SQL SELECt

> The results that we get from the SELECT statement we need to fetch it `into` a variable.

```sql
DECLARE
v_name employee.first_name%type;
BEGIN
SELECT first_name
INTO v_name
FROM employees;
END;
-- if 0 or more then 1 rows are returned then will be an show error;

DECLARE
v_name employee.first_name%type;
BEGIN
SELECT first_name
INTO v_name
FROM employees
WHERE employee_id = 100;
DBMS_OUTPUT.PUT_LINE(v_name);
END;
-- RETURN 1 row OK

```



## C. CONDITIONAL CONTROL

## IF STATEMENT
3 FORMS:
- IF THEN
- IF THEN ELSE
- IF THEN ELSIF

```sql
IF condition_1 THEN
  statements_1
ELSIF condition_2 THEN
  statements_2
[ ELSIF condition_3 THEN
    statements_3
]
...
[ ELSE
    else_statements
]
END IF;
```

```sql
DECLARE
  n_sales NUMBER := 300000;
  n_commission NUMBER( 10, 2 ) := 0;
BEGIN
  IF n_sales > 200000 THEN
    n_commission := n_sales * 0.1;
  ELSIF n_sales <= 200000 AND n_sales > 100000 THEN 
    n_commission := n_sales * 0.05;
  ELSIF n_sales <= 100000 AND n_sales > 50000 THEN 
    n_commission := n_sales * 0.03;
  ELSE
    n_commission := n_sales * 0.02;
  END IF;
END;
```

## CASE STATEMENT

### SELECTOR VS STATEMENT
#### SELECTOR

```sql
-- SELECTOR
DECLARE
  c_grade CHAR( 1 );
  c_rank  VARCHAR2( 20 );
BEGIN
  c_grade := 'B';
  CASE c_grade
  WHEN 'A' THEN
    c_rank := 'Excellent' ;
  WHEN 'B' THEN
    c_rank := 'Very Good' ;
  WHEN 'C' THEN
    c_rank := 'Good' ;
  WHEN 'D' THEN
    c_rank := 'Fair' ;
  WHEN 'F' THEN
    c_rank := 'Poor' ;
  ELSE
    c_rank := 'No such grade' ;
  END CASE;
  DBMS_OUTPUT.PUT_LINE( c_rank );
END;
```

#### CASE STATEMENT
```sql
--staments
DECLARE
  n_sales      NUMBER;
  n_commission NUMBER;
BEGIN
  n_sales := 150000;
  CASE
  WHEN n_sales    > 200000 THEN
    n_commission := 0.2;
  WHEN n_sales   >= 100000 AND n_sales < 200000 THEN
    n_commission := 0.15;
  WHEN n_sales   >= 50000 AND n_sales < 100000 THEN
    n_commission := 0.1;
  WHEN n_sales    > 30000 THEN
    n_commission := 0.05;
  ELSE
    n_commission := 0;
  END CASE;

  DBMS_OUTPUT.PUT_LINE( 'Commission is ' || n_commission * 100 || '%'
  );
END;

```

## GOTO

```sql
DECLARE
BEGIN
GOTO second_message;

<<first_message>>
DBMS_OUTPUT.PUT_LINE("Hello ");
GOTO the_end;

<<second_message>>
DDBMS_OUTPUT.PUT_LINE("Its goona be first");
GOTO first_message;

<<the_end>>
DBMS_OUTPUT.PUT_LINE("THE END");
END;

```

## NULLS

> PL/SQL NULL statement is a statement that does nothing. It serves as a placeholder statement when you need a syntactical construct in your code but don’t want to perform any actual action.

```SQL
-- placeholder for functions
CREATE OR REPLACE PROCEDURE request_name(
    customer_id customer.customer_id%TYPE
)
AS
BEGIN
NULL;
END;
```

### Handel NULLS in IF 
> use `nvl(statement,value)`
```sql
IF nvl(x,0) <> nvl(y,0) THEN
  dbms_output.put_line("yes");
  ELSE
  dbms_output.put_line("no");
END IF;
```

## Loops
- Basic LOOP (EXIT)
- FOR LOOP (COUNT)
- WHILE LOOP (CONDITION)

#### Basic LOOP
```sql
LOOP

  statement;
EXIT WHEN condition
END LOOP;

DECLARE
v_counter NUMBER :=0;
BEGIN
LOOP
v_counter := v_counter + 1;
dbms_output.put_line(v_counter);
EXIT WHEN v_counter = 4;
END LOOP;
END;
```

#### WHILE LOOP
```sql
WHILE condition
LOOP
  statements;
END LOOP;

DECLARE
v_counter NUMBER :=0;
BEGIN
WHILE v_counter < 5
LOOP
v_counter := v_counter + 1;
dbms_output.put_line(v_counter);
END LOOP;
END;
```

#### FOR LOOP
```sql
FOR index IN RANGE
LOOP
  statements;
END LOOP;

DECLARE
v_counter NUMBER :=0;
BEGIN
FOR i IN 1..5
LOOP
v_counter := v_counter + 1;
dbms_output.put_line(v_counter);
END LOOP;
END;
```

#### LABELED NESTED LOOPS
```sql
DECLARE
v_star VARCHAR2(100) := '*'
BEGIN
<<out_loop>>
FOR i IN 1..5
LOOP
    <<inner_loop>>
    FOR j IN 1..i
    LOOP
        v_star := v_star || '*';
    END LOOP inner_loop;
DBMS_OUTPUT.PUT_LINE(v_star);
END LOOP out_loop;

END;
```

## C. Composite DATATYPEs
Can hold multiple values (RECORDS that means the whole row)

### PL/SQL Records
Store multiple data stored in fields. (a ROW is a RECORD)

#### Programmer defined RECORDS
> WHAT IS THE LOGIC?

If you want just n-1 fields from a table, and now the whole row, use programmer defined RECORDS, if you want the WHOLE ROW use %ROWTYPE;
```sql
DECLARE
TYPE t_EMP IS RECORD(
  v_EMP_id employees.employee_id%TYPE, -- field
  v_first_name employees.employee_first%TYPE, -- field
  v_second_name employees.employee_last%TYPE -- field
)

v_emp t_EMP; -- the v_emp will store a record like t_emp
-- This syntax can be used to specify 2/3 params.
BEGIN
SELECT employee_id,last_name
INTO v_emp.v_EMP_id, v_emp.v_second_name
FROM employees
WHERE employee_id = 100;

-- This syntax is OK because you provided all 3 fields.
SELECT employee_id, first_name, last_name
INTO v_emp
FROM employees
WHERE employee_id = 100;

DBMS_OUTPUT.PUT_LINE(v_emp.v_EMP_id || ' ' || v_emp.v_first_name || ' ' ||  v_emp.v_second_name);
END;

```

### RECORD BASED ON %ROWTYPE (USE THIS)
> WHAT IS THE LOGIC?

If you want the whole row of fields from a table you should use the %ROWTYPE;
```sql
DECLARE
v_dep DEPARTMENTS%ROWTYPE;
BEGIN
SELECT *
INTO v_dep
FROM DEPARTMENTS
WHERE department_id=10;

INSERT INTO copy_TABLE values v_dep;

SELECT * FROM copy_TABLE;
END;
```

### INDEX BY TABLES
```sql
-- syntax
TYPE t_name IS TABLE OF DATATYPE
INDEX BY DATATYPE;
v_name t_name;
v_name(1) := value;
v_name(n) := value;

DECLARE
TYPE v_tab IS TABLE OF VARCHAR2(100) 
INDEX BY PLS_INTEGER;

v_tab_no v_tab;
BEGIN

v_tab_no(1):= 'Something1';
v_tab_no(2):= 'Something2';
v_tab_no(3):= 'Something3';
END;
```

| Unique KEY      | Value |
| ----------- | ----------- |
| 1      | Something1       |
| 2      | Something2       |
| 3      | Something3       |


#### INDEX BY METHODS
| METHOD      | Description |
| ----------- | ----------- |
| EXISTS(n)      | RETURN TRUE IF nth exists      |
| COUNT      | Counts the elements       |
| FIRST      | Return first(smallest index)/ RETURN null if empty    |
| LAST      | Return last (largest index) / Return null if empty       |
| PRIOR(n)      | Return precess of index n       |
| NEXT(n)      | Return next of index n       |
| DELETE / DELETE (n) / DELTE (M,n)      | Delete everything, element, in range    |

### INDEX BY TABLE OF RECORDS

```sql
--syntax
TYPE t_name IS TABLE OF TABLE%ROWTYPE
INDEX BY DATATYPE;
v_name t_name;
v_name(1).TABLE_FIELD_1 = value;
v_name(1).TABLE_FIELD_2 = value;
v_name(2).TABLE_FIELD_1 = value;
v_name(2).TABLE_FIELD_2 = value;

-- example
DECLARE
-- TABLE OF RECORD of TYPE employee ROW
TYPE t_emp IS TABLE OF employees%ROWTYPE
INDEX BY PLS_INTEGER;
v_emp t_emp;
BEGIN
v_emp(1). employee_id = 1;
v_emp(1). first_name = "First";
v_emp(1). last_name = "Last";

v_emp(2). employee_id = 2;
v_emp(2). first_name = "First2";
v_emp(2). last_name = "Last2";

END;
```

| INDEX ID NUMBER      | RECORD |
| ----------- | ----------- |
| 1      | 1 First Last       |
| 2   | 2       First2 Last2  |


### VARRAY
```sql
--syntax
TYPE t_name IS VARRAY(n) OF DATATYPE;
v_name t_name;
v_name(n) := t_name(n1, n2, n3...nx);

-- example
DECLARE
TYPE t_location IS VARRAY(3) of VARCHAR2(100);
locations t_location;
BEGIN
locations(1) :=t_location('loc1', 'loc2', 'loc 3')

END;

```

## C. EXPLICIT CURSOR

DECLARE => OPEN => FETCH => EMPTY? => CLOSE    
DECLARE -> Declare a named CURSOR  
OPEN -> Identify active set.  
FETCH -> Load current row on variable.  
Empty? -> Test for existing row / return to FETCH if row found;  
CLOSE -> Close active set.  

### CURSOR ATTRIBUTES

| ATTRIBUTE      | Description |
| ----------- | ----------- |
| %ISOPEN      | TRUE if cursor is OPEN       |
| %NOTFOUND   | TRUE if the current set dont found       |
| %FOUND   | TRUE if current set found        |
| %ROWCOUNT   | NUMBER of rows returned        |

#### TIPS
- DO NOT include INTO statement in DECLARATION
- YOU CAN USE ORDER BY
- Any SQL valid statement

```sql
-- Method 1. Variable TYPE
DECLARE
CURSOR c_emp IS
  SELECT * 
  FROM employees
  WHERE departament_id = 30;

v_emp_no employees.employee_id%TYPE;
v_name employees.first_name%TYPE;
BEGIN
OPEN c_emp; -- here select statement is  executed;

LOOP
  FETCH c_emp 
  INTO v_emp_no,v_name;
  EXIT WHEN c_emp%NOTFOUND;
END LOOP;
CLOSE c_emp;
END;

-- Method 2. ROWTYPE
DECLARE
CURSOR c_emp IS
  SELECT * 
  FROM employees
  WHERE departament_id = 30;

v_emp employees%ROWTYPE; -- %TABLE ROWTYPE
BEGIN
OPEN c_emp; -- here select statement is  executed;

LOOP
  FETCH c_emp 
  INTO v_emp
  EXIT WHEN c_emp%NOTFOUND;
END LOOP;
CLOSE c_emp;
END;

-- Method 3. CURSOR TYPE
DECLARE
CURSOR c_emp IS
  SELECT * 
  FROM employees
  WHERE departament_id = 30;

v_emp c_emp%ROWTYPE; -- CURSOR TYPE
BEGIN
OPEN c_emp; -- here select statement is  executed;

LOOP
  FETCH c_emp 
  INTO v_emp;
  EXIT WHEN c_emp%NOTFOUND;
END LOOP;
CLOSE c_emp;
END;
```

### GOOD PRACTICE CURSOR
```sql
IF CURSOR%ISOPEN THEN
  NULL;
ELSE
  OPEN CURSOR;
END IF;
```

### GOOD PRACTICE CURSOR WITH FOR LOOP USE THIS
```sql
DECLARE
-- cursor declaration
CURSOR c_emp IS
  SELECT * 
  FROM employees
  WHERE departmement_id = 30;

BEGIN
-- NO NEED TO OPEN
-- NO NEED TO FETCH
FOR i in c_emp
LOOP
  DBMS_OUTPUT.PUT_LINE(i.c_emp);
END LOOP;
-- NO  NEED TO CLOSE
END;
```

### CURSOR WITH PARAMETERS
```sql
DECLARE
CURSOR c_emp_dep(v_dep NUMBER) IS
  SELECT employee_id, employee_name 
  FROM EMPLOYEES
  WHERE department_id = v_dep;

v_id employees.employee_id%TYPE;
v_name employees.employee_id%TYPE;
BEGIN
-- department 10
IF c_emp_dep%ISOPEN THEN
  NULL;
ELSE
  OPEN c_emp_dep(10);
END IF;

  LOOP
    FETCH c_emp_dep INTO v_id, v_name;
    DBMS_OUTPUT.OUT_LINE(v_id || ' ' || v_name);
    EXIT WHEN c_emp_dep%NOTFOUND;
  END LOOP;
CLOSE c_emp_dep;

-- department 20
IF c_emp_dep%ISOPEN THEN
  NULL;
ELSE
  OPEN c_emp_dep(20);
END IF;

  LOOP
    FETCH c_emp_dep INTO v_id, v_name;
    DBMS_OUTPUT.OUT_LINE(v_id || ' ' || v_name);
    EXIT WHEN c_emp_dep%NOTFOUND;
  END LOOP;
CLOSE c_emp_dep;

END;

```

## C. PL/SQL Exceptions

### SYNTAX
```sql
BEGIN
-- execution
  EXCEPTION 
  WHEN e1 THEN
    -- exception handle
  WHEN e2 THEN
    -- exception handle
  WHEN others THEN
    -- exception handle
END;
```

### PL/SQL ``NO_DATA_FOUND`` exception example
```sql
DECLARE
v_emp_name employees.employee_name%TYPE;
v_emp_id employees.employee_id%TYPE := &employee_id
BEGIN

SELECT first
INTO v_emp_name
FROM employees
WHERE employee_id = &v_emp_id;

DBMS_OUTPUT.PUT_LINE(v_emp_name);

EXCEPTION
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('EMP not found!');

END;
```

### PL/SQL ``TOO_MANY_ROWS`` exception example`
```sql
DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT NAME INTO l_name
    FROM customers
    WHERE customer_id > l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('The database returns more than one customer');    
END;
```

## Procedures and Functions 
#### What are Procedures?
- Perform actions
- Can be stored in databases as schema object

### Procedure Syntax
```sql
DECLARE
CREATE OR REPLACE PROCEDURE procedure_name(param_name IN/OUT DATATYPE)
IS
-- declare vars
BEGIN
UPDATE employees
SET name='e'
WHERE dep_id=30;
END;
```

### IN/OUT
```sql
CREATE OR REPLACE PROCEDURE query_n(
v_id IN NUMBER,
v_name OUT employees.first_name,
v_sal OUT employees.salary
)
IS

BEGIN
SELECT first_name,  salary
INTO v_name, v_sal -- OUT
FROM employees
WHERE employee_id = v_id; -- IN
EXCEPTION WHEN
OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLCODE)

END;

--you should have 2 bind VARS
VARIABLE b_first VARCHAR2(100);
VARIABLE b_sal NUMBER;

DECLARE
v_first employees.first_name%TYPE;
v_sal employees.salary%TYPE;
BEGIN
execute query_n(105,:b_first, :b_sal)
print 
END;
```

### Parametre as RECORD

```sql
CREATE OR REPLACE PROCEDURE test_plsql_record(
  rec in DEPARTMENT%ROWTYPE
)
IS 

BEGIN
INSERT INTO DEPARTMENTS values rec;
END;

---
DECLARE
var DEPARTMENT%ROWTYPE;
BEGIN
var.DEPARTMENT_ID = 3;
var.DEPARTMENT_NAME = 'dept'
test_plsql_record(var); -- passing records as param
END;

```

## C. Functions
#### Difference between Functions and Procedurea
| Procedure      | Functions |
| ----------- | ----------- |
| Execute as statement      | Invoked as part of expression       |
| Dont return in header   | RETURN clause in HEADER        |
| Can pass OUT params   | RETURN 1 VALUE        |
| CAN'T be USED IN SELECT   | CAN BE USED IN SELECT        |

### Syntax
```sql
CREATE OR REPLACE FUNCTION get_sal(
  p_emp_id NUMBER
)
RETURN NUMBER
IS
v_sal NUMBER;
BEGIN
SELECT salary 
INTO v_sal
FROM employees
WHERE employee_id = p_emp_id;

RETURN v_sal;
END;


SELECT first_name, get_sal(employee_id) -- here we called
FROM employees
WHERE department_id = 20;
```


```sql
CREATE OR REPLACE FUNCTION add(x number, y number)
RETURN number
IS
BEGIN
RETURN x + y;
END;

CREATE OR REPLACE FUNCTION sub(x number, y number)
RETURN number
IS
BEGIN
RETURN x-y;
END;
```


## C. Packages
> Package header and PACKAGE BODY pack_name  
> Package header have only HEADERS of functions;  
> Package BODY pack_name have body of functions;  

![e](https://www.oracletutorial.com/wp-content/uploads/2017/12/plsql-package.jpg)

```sql
CREATE OR REPLACE PACKAGE math IS
FUNCTION add(x number,y number)
return number;

FUNCTION sub(x number, y number)
return number;
END; --end header

CREATE OR REPLACE PACKAGE BODY math IS
FUNCTION add(x number, y number)
RETURN number
IS
BEGIN
RETURN x + y;
END;

FUNCTION sub(x number, y number)
RETURN number
IS
BEGIN
RETURN x-y;
END;

END;

SELECT math.add(4,5), math.sub(10-2) FROM dual;

DROP FUNCTION add;
DROP FUNCTION sub;
```

#### Package Example
```sql
CREATE OR REPLACE PACKAGE order_mgmt
AS
  gc_shipped_status  CONSTANT VARCHAR(10) := 'Shipped';
  gc_pending_status CONSTANT VARCHAR(10) := 'Pending';
  gc_canceled_status CONSTANT VARCHAR(10) := 'Canceled';

  -- cursor that returns the order detail
  CURSOR g_cur_order(p_order_id NUMBER)
  IS
    SELECT
      customer_id,
      status,
      salesman_id,
      order_date,
      item_id,
      product_name,
      quantity,
      unit_price
    FROM
      order_items
    INNER JOIN orders USING (order_id)
    INNER JOIN products USING (product_id)
    WHERE
      order_id = p_order_id;

  -- get net value of a order
  FUNCTION get_net_value(
      p_order_id NUMBER)
    RETURN NUMBER;

  -- Get net value by customer
  FUNCTION get_net_value_by_customer(
      p_customer_id NUMBER,
      p_year        NUMBER)
    RETURN NUMBER;

END order_mgmt;
```


## C. Understanding BULK COLLECT
In PL/SQL, the BULK COLLECT feature is used to enhance the performance of SQL queries by fetching multiple rows at once and storing them in collections (arrays or nested tables) rather than processing one row at a time.
Consider using bulk collect when your query is already filtered by a WHERE CAUSE. Because it may use a lot of memory.


Here is another example:
```sql
DECLARE
   TYPE collection_type IS TABLE OF table_name%ROWTYPE;
   collection_name collection_type;
BEGIN
   SELECT column1, column2, ...
   BULK COLLECT INTO collection_name
   FROM table_name
   WHERE condition;

   -- Process the data in the collection
END;
```

```sql
DECLARE
TYPE employee_collection IS TABLE OF employees%ROWTYPE;
employee_data employee_collection%TYPE;
BEGIN
SELECT * BULK COLLECT INTO employee_data FROM employees;
END;

```

## C. Triggers
There are 2 types of triggers 
- System Triggers
- DML Triggers 
You can create a trigger for a table, schema or database.

```sql
DECLARE
CREATE OR REPLACE TRIGGER
BEFORE | AFTER 
INSERT | UPDATE | DELETE
ON table_name
FOR EACH ROW
WHEN
   Condition;

BEGIN
NULL;
END;

```

## C. Views
A PL/SQL view is a virtual table that contains data from one or more tables. PL/SQL Views are used to provide security or simplify complex queries. In this article we have a list of operations that can be performed on PL/SQL Views.

```sql
CREATE VIEW sales_employees AS 
SELECT first_name, last_name 
FROM employees 
WHERE department = 'Sales'; 
```

## C.SEQUENCE
In Oracle PL/SQL, a sequence is a database object that generates a unique series of numeric values in ascending or descending order. It is often used to generate primary key values for tables in a database.

```sql
CREATE SEQUENCE my_sequence
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   NOCYCLE;
```

## C. PL/SQL XML

XML (Extensible Markup Language) is a popular format used for data exchange and storage. In Oracle PL/SQL, XML processing is fully supported through the XML DB technology, which allows developers to easily manipulate and store XML documents.

To work with XML in Oracle PL/SQL, you can use the XMLType data type, which is a binary representation of an XML document. 

```sql

DECLARE
  l_xml XMLType;
BEGIN
  l_xml := XMLType('<book><title>My Book</title><author>John Doe</author></book>');
END;
```


## C. JSON 

JSON (JavaScript Object Notation) is a lightweight data format that is easy for developers to read and write and easy for machines to parse and generate. It has become a popular format for exchanging data between web applications and is often used for storing and retrieving data in NoSQL databases.

  
The JSON functions in PL/SQL include:

**JSON_VALUE**: This function extracts a scalar value from a JSON document.  
**JSON_QUERY**: This function extracts a JSON object or array from a JSON document.  
**JSON_TABLE**: This function converts a JSON document into a relational table.  
**JSON_OBJECT**: This function generates a JSON object from a set of key-value pairs.  
**JSON_ARRAY**: This function generates a JSON array from a set of values.  

```sql
DECLARE
  l_json_object JSON_OBJECT_T;
BEGIN
  l_json_object := JSON_OBJECT_T();
  l_json_object.PUT('name', 'John Doe');
  l_json_object.PUT('age', 30);
  DBMS_OUTPUT.PUT_LINE(l_json_object.TO_STRING());
END;
```

## Backup and Restore using RMAN

```sql
-- Create database backup;
BACKUP DATABASE;

-- Backup arhivelog
BACKUP DATABASE PLUS ARHIVELOG;

-- List backups;
LIST BACKUP;

-- COMPRESSED BACKUP
BACKUP AS COMPRESSED BACKUPSET DATABASE;

-- INCREMENTAL BACKUP
BACKUP INCREMENTAL LEVEL 0 DATABASE;
BACKUP INCREMENTAL LEVEL 1 DATABASE;
BACKUP INCREMENTAL LEVEL 2 DATABASE;
```

## Recover a database;
```sql
SET DBID <DBID number>;

STARTUP NOMOUNT;

RESTORE CONTROLFILE FROM "/backup/rman/<name>";

ALTER DATABASE MOUNT;

RESTORE DATABASE;
```














