# Notes SQL
## OracleSQL 
#### DDL, DML, DQL   
Operații de ``creare`` / ``alterare`` a tabelelor  
``Constrângeri`` între tabele PK, FK  
``Incrementari`` automat generate  
#### DQL  
Clauză ``SELECT``   
``DUAL``  
Clauză ``ORDER BY`` - NULLS FIRST | LAST  
Select ``DISTINCT``  
Clauză ``WHERE`` ( filtrează liniile )  - used in DML  
Operatori de ``comparare`` ( <> != = NOT IN, NOT BETWEEN , NOT EXIST, IS NOT NULL )   
``Alias``  
``FETCH`` - ``offset`` x ``fetch`` next x rows  
``AND`` , ``OR`` , ``IN``, ``LIKE``, ``IS NOT NULL``  
``JOINS`` ( INNER, LEFT , SELF)  
Clauza ``GROUP BY`` - înaintea lui ORDER BY  
Clauza ``HAVING`` - filtru pentru GROUP BY  
Operatorul ``UNION`` / ``UNION ALL``  
``Subquery``  
Operatorul ``INTERSECT``   
#### DML  
INSERT / UPDATE / DELETE   

#### Ce este o baza de date noSQL:  
``Not only SQL`` , neralationar, bazate pe colecții de ``documente`` și valori ``key:value ``  
``MongoDB`` - baza de date bazată pe documente JSON  
``Redis`` - Baza de date bazată pe structuri de date.   
Diferența dintre Relaționar și Nerelationar  
>dacă în același tabele am adaugă în permanenta coloane noi, peste inserarile vechi, noile date vor avea date lipsa. De aici avem nevoie de a extrage datele și a crea relationarile in alte tabele. Când datele vor fi aduse înapoi, le vom unii folosind JOIN.
## Q & A
### What is a database?
A `database` is an `organized collection` of structured data

## SELECT simple
Note that the `SELECT` statement is very complex and consists of many clauses such as `ORDER BY`, `GROUP BY`, `HAVING`, `JOIN`;  

```sql
SELECT
  column_1, 
  column_2, 
  ...
FROM
  table_name;

SELECT * FROM customers;
```

## Oracle Dual Table
Oracle `DUAL` table which is a special `table` used for `evaluating expressions` or `calling functions`.  
```sql
SELECT
  UPPER('This is a string')
FROM
  dual;

-- calling built-in functions
SELECT
  (10 + 5)/2
FROM
  dual;
```

## ORDER BY

```sql
SELECT
    column_1,
FROM
    table_name
ORDER BY
    column_1 [ASC | DESC] [NULLS FIRST | NULLS LAST]
```
By `default`, the `ORDER BY` clause sorts rows in ascending order whether you specify `ASC` or not. If you want to sort rows in `descending` order, you use `DESC` explicitly.
  
`NULLS FIRST` places NULL values before non-NULL values and `NULLS LAST` puts the NULL values after non-NULL values.

```sql
SELECT
    name,
    credit_limit
FROM
    customers
ORDER BY
    2 DESC,
    1;
```
> NOTE TO SELF: 1 and 2 are the number of the columns;

## SELECT DISTINCT != UNIQUE

The `DISTINCT` clause is used in a `SELECT` statement to `filter duplicate rows` in the result set. It ensures that rows returned are unique for the column or columns specified in the SELECT clause.

```sql
SELECT DISTINCT column_1
FROM table;

-- or

SELECT
    DISTINCT column_1,
    column_2,
    column_3
FROM
    table_name;
```

## WHERE Clause
Beside the `SELECT` statment, `WHERE` clause can be used in `DELETE` and `UPDATE` statement also, to specify whch rows to be deleted or updated.  
`WHERE` clause appear `after FROM` clause but `before ORDER BY` clause;

```sql
SELECT 
    column_1
FROM
    table_name
WHERE
    search_condition
ORDER BY
    sort_expression
```

```sql
SELECT
    product_name,
    description,
    list_price,
    category_id
FROM
    products
WHERE
    product_name = 'Kingston';
```

## COMPARISON OPERATORS WHERE CLAUSE
`= ` => EQUAL    
`!=`, `<>` => Different  
`<` `>` `<=` `>=` => lt gt  
[`NOT`]`IN(value_1, value_2, value_3)` => equal or `NOT` to any value from list);    
[`NOT`] `BETWEEN v1 AND v2` => >=v1 <=v2  
[`NOT`] `EXIST` => Returns true if at least 1 row is returned;  
`IS` [`NOT`] `NULL`  => NULL test

## ALIAS
Can be used for more readability of a query
```sql
-- Alias Column name
SELECT
  first_name AS forename,
  last_name  AS surname
FROM
  employees;
```
By default, Oracle capitalize the column names when displayed. If you want to be case sensitiveuse `" "`  
```sql
SELECT
    first_name "FirstNameCase",
    last_name "LastNameCase"
FROM
    employees;
```
> Using `alias` for an expression;  
```sql
SELECT
  first_name  || ' '  || last_name AS "Full Name"
FROM
  employees;
```
> Using `alias` for a calculation expression;
```sql
SELECT
    product_name,
    last_price - initial_price "gross_profit"
FROM
    products
ORDER BY
    gross_profit DESC;
```

> ORACLE TABLE `ALIAS` in `JOINS`
```sql
SELECT
e.first_name "Employee",
d.first_name "Manager"
FROM employee e
INNER JOIN employee m
ON
    m.employee_id = e.employee_id;
```

## FETCH 
`FETCH` clause can be used in the end of `SELECT` statementtment to `LIMIT` the output results;  
`OFFSET x` => IGNORE FIRST x rows  
FETCH NEXT x[%] ROWS ONLY  
![fetch](https://www.oracletutorial.com/wp-content/uploads/2017/11/Oracle-FETCH-OFFSET-example.png)

## AND Operator

```
expression_1 AND expression_2
```
> AND RESULTS

`TRUE AND TRUE` => TRUE  
`TRUE AND FALSE` => FALSE  
`FALSE AND TRUE` => FALSE  
`FALSE AND FALSE` => FALSE  
`NULL AND FALSE` => FALSE  
`NULL AND TRUE` => NULL  
`NULL AND NULL` => NULL  

```SQL
-- AND e1 AND e2
SELECT
    order_id,
    customer_id,
    status,
    order_date
FROM
    orders
WHERE
    status = 'Shipped'
    AND salesman_id = 60
    AND EXTRACT(YEAR FROM order_date) = 2017
ORDER BY
    order_date;
```

```sql
-- OR / AND
SELECT
    order_id,
    customer_id,
    status,
    salesman_id,
    order_date
FROM
    orders
WHERE
    (
        status = 'Canceled'
        OR status = 'Pending'
    )
    AND customer_id = 44
ORDER BY
    order_date;
```

## OR Operator
```
expression_1 OR expression_2
```
> OR RESULTS

`TRUE OR TRUE` => TRUE   
`TRUE OR FALSE` => TRUE  
`FALSE OR TRUE` => TRUE  
`FALSE OR FALSE` => FALSE  
`NULL OR FALSE` => FALSE  
`NULL OR TRUE` => TRUE  
`NULL OR NULL` => NULL  

```SQL
SELECT
    order_id,
    customer_id,
    status,
    salesman_id,
    order_date
FROM
    orders
WHERE
    salesman_id IN(
        60,
        61,
        62
    )
ORDER BY
    5 DESC;
```

## IN OPERATOR
IN operator determine either a value matching or NOT in a given list or SUB-QUERY  
`expression [NOT] IN (v1,v2...)` => value in list  
`expression [NOT] IN (SELECT column_1 FROM table;)` => value in query  

```sql
SELECT 
    employee_id,
    first_name,
    last_name
FROM employees
WHERE
    employee_id IN( --sub-query
        SELECT
            DISTINCT salesman_id
            FROM orders
            WHERE
                status = 'canceled'
    );
ORDER BY
    first_name;
```

## LIKE OPERATOR
Test `matching` specific patterns;  
> '%' => sequence of characters  
> '_underscore' => only one character  

`expression [NOT] LIKE '%something%'`

> Use `LOWER()` / `UPPER()` to match case-insensitive

```sql
UPPER( last_name ) LIKE 'ST%'

LOWER(last_name LIKE 'st%'
```

```sql
SELECT
    first_name,
    last_name,
    email
FROM
    contacts
WHERE
    UPPER( first_name ) LIKE 'CH%';
ORDER BY
    first_name;
```

## IS[NOT] NULL
`expression | column IS NOT NULL`
In a database NULL it's special. It mark that information is mission and it cannot compare with other values and numbers. It cannot even compare with itself.
NULL AND / OR / = NULL => NULL

```sql
SELECT * FROM orders
WHERE salesman_id IS NOT NULL
ORDER BY order_date DESC;

SELECT * FROM orders
WHERE salesman_id IS NULL
ORDER BY order_date DESC;
```

## ORACLE JOINS
> NOTE TO SELF: JOINS join the data HORIZONTALLY
### INNER JOIN

> The `INNER JOIN` return rows from `LEFT TABLE` that `match` ROWS FROM `RIGHT TABLE`

![](https://www.oracletutorial.com/wp-content/uploads/2019/02/Oracle-Joins-Inner-Join.png)

```SQL
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
INNER JOIN palette_b b ON a.color = b.color
```
![](https://www.oracletutorial.com/wp-content/uploads/2019/02/Oracle-Join-inner-join-example.png)

```sql
SELECT
    *
FROM
    orders
INNER JOIN order_items ON
    order_items.order_id = orders.order_id -- join predicate
ORDER BY
    order_date DESC;
```
#### INNER JOIN USING CLAUSE
Besides the `ON` clause, it is possible to use the `USING` clause to specify which columns to test for equality when joining tables.  

The following illustrates the syntax of the INNER JOIN with the USING clause.
```sql
SELECT
  *
FROM
  T1
INNER JOIN T2 USING( c1, c2, ... );


SELECT
  *
FROM
  orders
INNER JOIN order_items USING( order_id )
ORDER BY
  order_date DESC;
```

#### INNER JOIN MULTIPLE TABLES
```sql
SELECT
  name AS customer_name,
  order_id,
  order_date,
  item_id,
  quantity,
  unit_price
FROM
  orders
INNER JOIN order_items USING(order_id)
INNER JOIN customers USING(customer_id)
ORDER BY
  order_date DESC,
  order_id DESC,
  item_id ASC;
```

### LEFT JOIN

> The `left join` returns all rows from the `left table` with the matching rows if available from the `right table`. If there is `no matching row` found from the right table, the `left join will have null values` for the columns of the right table

```sql
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
LEFT JOIN palette_b b ON a.color = b.color;
```

![](https://www.oracletutorial.com/wp-content/uploads/2019/02/Oracle-Join-left-join-example.png)


## GROUP BY CLAUSE

The GROUP BY Clause is used in SELECT statement, it's often used with aggregate functions like AVG() , COUNT(), MAX(), MIN(), SUM().  
The GROUP BY clause appears after WHERE if it's present.
```sql
SELECT 
   column_list 
FROM 
  T 
WHERE 
   condition
GROUP BY c1, c2, c3;
```

#### Example with aggregate function GROUP BY
```sql
SELECT
    customer_id,
    COUNT(order_id)
FROM
    orders
GROUP BY
    customer_id
ORDER BY
    customer_id
```

## HAVING CLAUSE
> Used to filter data returned by GROUP BY, it appears right after GROUP BY  
> Note that the `HAVING` clause `filters groups of rows` while the `WHERE` clause `filters rows`. This is the main difference between the `HAVING` and WHERE clauses.

```sql
SELECT
    order_id,
    SUM( unit_price * quantity ) order_value
FROM
    order_items
GROUP BY
    order_id
HAVING
    SUM( unit_price * quantity ) > 1000000
ORDER BY
    order_value DESC;
```

## UNION OPERATOR
``Combine results`` from 2 or more `SELECT` statements, into `one` single return set.  
D`ata types` and the exact same `ammont` of rows must be the `equal`.    
By `default` `UNION` return the `UNIQUE` records, if we want `all` the records `UNION ALL` must be used.    
``UNION removes duplicates.``

```sql
-- UNIQUE
SELECT
    column_list_1
FROM
    T1
UNION 
SELECT
    column_list_1
FROM
    T2;

-- ALL

SELECT
    column_list
FROM
    T1
UNION ALL 
SELECT
    column_list
FROM
    T2;
```

![](https://www.oracletutorial.com/wp-content/uploads/2017/09/Oracle-UNION.png)
> AFTER UNION 2 and 3 will be REMOVED.
![](https://www.oracletutorial.com/wp-content/uploads/2017/09/Oracle-UNION-ALL.png)

## INTERSECT OPERATOR
``Similar`` rules like ``UNION``, it can be done in 2 or more SELECT statements.  
Must match the ``same size and data type``.  
It returns ``UNIQUE values``

![](https://www.oracletutorial.com/wp-content/uploads/2017/09/Oracle-INTERSECT.png)
Intersection between T1 and T2 result => 2 , 3

## INSERT INTO TABLE
To insert a new record in the table we use INSERT STATEMENT;

```sql
INSERT INTO table_name(col_1, col_2, col_3)
VALUES (v1, v2, v3);
```
Columns that you omit the values into insert statement, it will use the default value or null;  

```sql
-- Creating
CREATE TABLE discounts (
    discount_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    discount_name VARCHAR2(255) NOT NULL,
    amount NUMBER(3,1) NOT NULL,
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
);

-- Inserting
INSERT INTO discounts(discount_name, amount, start_date, expired_date)
VALUES('Summer Promotion', 9.5, DATE '2017-05-01', DATE '2017-08-31');
```

## INSERT INTO SELECT
The ``data type`` selected must ``match`` the table data definition;
Sometimes you just need to copy data from a table to another;
```sql
INSERT INTO table_name
SELECT
    col_1,
    col_2,
    col_3
FROM
    source_table
WHERE
    condition;
```

## INSERT ALL
It can ``INSERT`` multiple rows in one STATEMENT with  ``INSERT ALL``
It can have ``IF/ELSE`` clause to put data in a specific table that match a condition;

```sql
-- syntax
INSERT ALL
    INTO table_name(col1,col2,col3) VALUES(val1,val2, val3)
    INTO table_name(col1,col2,col3) VALUES(val4,val5, val6)
    INTO table_name(col1,col2,col3) VALUES(val7,val8, val9)
Subquery;
```

```sql
-- example
INSERT ALL 
    INTO fruits(fruit_name, color)
    VALUES ('Apple','Red') 

    INTO fruits(fruit_name, color)
    VALUES ('Orange','Orange') 

    INTO fruits(fruit_name, color)
    VALUES ('Banana','Yellow')
SELECT 1 FROM dual;
```

```sql
-- Conditional Insert
INSERT [ ALL | FIRST ]
    WHEN condition1 THEN
        INTO table_1 (column_list ) VALUES (value_list)
    WHEN condition2 THEN 
        INTO table_2(column_list ) VALUES (value_list)
    ELSE
        INTO table_3(column_list ) VALUES (value_list)
Subquery
```

```sql
INSERT ALL | FIRST
   WHEN amount < 10000 THEN
      INTO small_orders
   WHEN amount >= 10000 AND amount <= 30000 THEN
      INTO medium_orders
   ELSE
      INTO big_orders
  SELECT order_id,
         customer_id,
         (quantity * unit_price) amount
  FROM orders
  INNER JOIN order_items USING(order_id);
```

## UPDATE STATEMENT
``WHERE CLAUSE`` can we use to ``update`` multiple rows at once;


```sql
-- syntax for single / multiple rows
UPDATE table_name
SET
    column = value
WHERE
    condition
```

```sql
UPDATE
    parts
SET
    lead_time = 30,
    cost = 120,
    status = 1
WHERE
    part_id = 5;
```

## DELETE STATEMENT
``WHERE CLAUSE`` can we use to ``DELETE`` multiple rows at once;

```sql
DELETE
FROM
    table_name
WHERE 
    clause;


DELETE
FROM
    sales
WHERE
    order_id = 1
    AND item_id = 1;
```

## SUBQUERY
It can be done basically everywhere where is a CONDITION
SELECT / INSERT / UPDATE / DELETE / FROM / WHERE

```sql
--WHERE
SELECT
    product_id,
    product_name,
    list_price
FROM
    products
WHERE
    list_price = (
        SELECT
            MAX( list_price )
        FROM
            products
    )
```

```sql
-- SELECt
SELECT
    product_name,
    list_price,
    ROUND(
        (
            SELECT
                AVG( list_price )
            FROM
                products p1
            WHERE
                p1. category_id = p2.category_id
        ),
        2
    ) avg_list_price
FROM
    products p2
ORDER BY
    product_name;
```

```sql
-- FROM
SELECT
    order_id,
    order_value
FROM
    (
        SELECT
            order_id,
            SUM( quantity * unit_price ) order_value
        FROM
            order_items
        GROUP BY
            order_id
        ORDER BY
            order_value DESC
    )
FETCH FIRST 10 ROWS ONLY; 
```

## EXISTS
``EXIST`` OPERATOTR ``returns TRUE``   
Must return at least one row;
``DIFFERENCE`` between ``EXISTS`` & ``IN``, is that ``EXISTS`` stop execution after he find the first row that match, ``IN`` must evaluate every item on the list.  

```sql
SELECT
     *
FROM 
    table_name
WHERE
    EXISTS(SUBQUERY)
```

```sql
SELECT
    name
FROM
    customers c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            orders
        WHERE
            customer_id = c.customer_id
    )
ORDER BY
    name
```



## CREATE TABLE STATEMENT
``Create`` a table using ``CREATE TABLE``;  
```sql
-- syntax
CREATE TABLE table_name(
    col_1 data_type constrains,
    col_2 data_type constrains,
    ...
    table_constrains
)
```
`FIRST`: `CREATE TABLE tab_name` clause;  
`SECOND` : Column definition: column_name, data_type , constrains  
`THIRD` :  Add table constrains if applicable;

```sql
-- example
CREATE TABLE ot.person( -- FIRST
    person_id NUMBER GENERATE BY DEFAULT AS IDENTITY, -- SECOND
    first_name VARCHAR2(50) NOT NULL,-- SECOND
    last_name VARCHAR2(50) NOT NULL,-- SECOND
    PRIMARY KEY(person_id)   -- THIRD
)
```

##  Identity Column
The ``identity`` column is very useful for the ``surrogate primary key column``.   When you insert a new row into the identity column, Oracle ``auto-generates`` and insert a sequential value into the column.  

``GENERATE keyword`` is mandatory;  
``Option to generate values``:    
    ``GENERATE ALWAYS`` => AUTO_GENERATE by system, if it tries to INSERT will cause an error;  
    ``GENERATE BY DEFAULT`` => AUTO_GENERATE if value is not provided  
    ``GENERATE BY DEFAULT ON NULL`` => AUTO_GENERATE if null value is inserted   or nothing.  

We can have a ``number`` for identify column:  
    ``START WITH initial_value`` => by default starts with 1 if not specified.  
    ``INCREMENT BY interval_value`` => increment by +n  

```sql
CREATE TABLE identity_demo (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    description VARCHAR2(100) NOT NULL
);

INSERT INTO identity_demo(description)
VALUES('Oracle identity column demo with GENERATED ALWAYS');

SELECT *
FROM identity_demo;

-- 1. Oracle identity ....
-- AUTO_INCREMENTED and GENERATED 
```

## ALTER TABLE
ADD more columns  ;  
REMOVE columns  ;  
MODIFY column constrains;  
RENAME table;  

```sql
ALTER TABLE table_name
ACTION

ALTER TABLE table_name
ADD column_name type constrain;

ALTER TABLE person
ADD(
 birthday DATE NOT NULL,
 SEX VARCHAR2(5) NOT NULL
);
```

```sql
ALTER TABLE person
MODIFY birthday DATE NULL;
```

```sql
ALTER TABLE table_name
DROP(col_1, col_2, col_3);

ALTER TABLE table_name
RENAME COLUMN from_name TO toName;
```

## PRIMARY KEY
A primary key is a column or a combination of columns in a table , that UNIQUE identifies a row in a table;  
It cannot contain NULL VALUE;
MUST BE UNIQUE in all TABLE;

```sql
CREATE TABLE purchase_orders (
    po_nr NUMBER PRIMARY KEY,
    vendor_id NUMBER NOT NULL,
    po_status NUMBER(1,0) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL 
);
```

```sql
CREATE TABLE purchase_orders (
    po_nr NUMBER,
    vendor_id NUMBER NOT NULL,
    po_status NUMBER(1,0) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    CONSTRAINT pk_purchase_orders PRIMARY KEY(po_nr) -- constrains a diferent table PM
);
```

```sql
-- CREATING PKs
CREATE TABLE supplier_groups(
    group_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    group_name VARCHAR2(255) NOT NULL,
    PRIMARY KEY (group_id)  
);

CREATE TABLE suppliers (
    supplier_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    supplier_name VARCHAR2(255) NOT NULL,
    group_id NUMBER NOT NULL,
    PRIMARY KEY(supplier_id)
);
```

```sql
CREATE TABLE suppliers (
    supplier_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    supplier_name VARCHAR2(255) NOT NULL,
    group_id NUMBER NOT NULL,
    PRIMARY KEY(supplier_id),
    FOREIGN KEY(group_id) REFERENCES supplier_groups(group_id)
);
```

## SQL VS noSQL
``NoSQL`` -> Not only SQL  
MongoDB / REDIS  
NoSQL databases are more flexible schemas then regular SQL.  
It can use JSON documents to store the information and return them.    
Can have different data-schema, for example REDIS is based on data structure models. Using strings, hashs etc.    

    NoSQL is an approach to database management that can accommodate a wide variety of data models, including key-value, document, columnar and graph formats. A NoSQL database generally means that it is non-relational, distributed, flexible and scalable.

## Types on noSQL
``Document databases``  
 Also called ``document stores``, these databases store semi-structured data and descriptions of that data in document format. They enable developers to create and update programs without needing to reference master schema. Use of document databases has increased along with the use of ``JavaScript`` and the ``JavaScript Object Notation (JSON)``, a data interchange format that has gained wide currency among web application developers. Document databases are used for content management and mobile application data handling, such as blogging platforms, web analytics and e-commerce applications. Couchbase Server, CouchDB, MarkLogic and ``MongoDB`` are examples of document databases.

``Key-value stores``  
  Also known as ``key-value databases``, these systems implement a simple data model that pairs a ``unique key`` with an associated value. Because this model is simple, it can be used to develop highly scalable and performant applications. ``Key-value databases`` are ideal for session management and caching in web applications, such as those needed when managing shopping cart details for online buyers or for managing session details for multiplayer gaming. Implementations differ in the way they are oriented to work with RAM, solid-state drives or disk drives. Examples of popular ``key-value databases`` include Aerospike, DynamoDB, ``Redis`` and Riak.

``Data model``   
With NoSQL database systems, ``data is not modeled as tables`` with fixed rows and columns, as with a SQL DBMS. Instead, depending on the NoSQL database, data can be modeled as ``JSON documents``, ``graphs`` with nodes and edges, or ``key-value pairs``. Wide-column stores use the table and row concept, but columns can be dynamic from row to row within a table.

``Schema ``   
The ``schema`` for a NoSQL database is flexible, meaning there is no fixed structure to the data,`` data types`` and ``lengths`` for data elements. Data can be stored in a ``free-form``, or schemaless manner. This approach offers programmers a higher degree of flexibility, which can ease development efforts.

















