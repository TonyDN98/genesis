## What is PL/SQL!
Stands for **procedural language SQL**  
Designed for Oracle Database  

![plsql-engine](https://www.oracletutorial.com/wp-content/uploads/2017/11/plsql-architecture.png)
`PL/SQL` engine compile the code into byte-code and exeuctes the executable code.    
In the moment of submiting the PL/SQL block, the PL/SQL engine runs the **procedural** elements while SQL engine runs the `SQL elements`.

## Programming Guildance
| CATEGORY      | CASE |
| -----------   | ----------- |
| SQL STATEMENTS        | UPPERCASE SELECT INSERT UPDATE       |
| PL SQL                | UPPERCASE BEGIN END INTO                 |
| DATA TYPE             | UPPERCASE DATE INTEGER VARCHAR2              |
| IDENTIFIERS           | LOWERCASE v_name l_status  g_global         |
| TABLES and COLUMNS    |  LOWERCASE table.column_id             |

## Annonymous blocks
Is constructed by **DECLARATION** / **EXECUTION** / **EXCEPTION**
PL/SQL blocks have a name, that can be used later. Block without a name are called annonymous block.

![blocks-info](https://www.oracletutorial.com/wp-content/uploads/2017/11/plsql-anonymous-block.png)

### Declaration section
- Declaring **variables**
- Declaring **constants**
- Declaring **cursors** , and allocate memory for them 
- Define **data types**
- By default it's empty

### Executable section
- It starts with **BEGIN** and stops with **END**
- Statements that are executed when the whole block it's executed
- Executable section it's required

### Exception section
- Catch and resolve exceptions
- It's optional, but it's empty by default, like declare.

### Annonymous blocks
```SQL
BEGIN
    DBMS_OUTPUT.put_line('Hello There!');
END
```

## DIFFERENCES BETWEEN ANNONYMOUS AND SUBPROGRAMS

| ANNONYMOUS      | SUBPROGRAMS |
| -----------   | ----------- |
| Unamed blocks       | Named blocks      |
| Not stored in dbs     | Stored in dbs        |
| Compiled everytime     | Compiled once        |
| Can't take params     | Can take params        |
| Can't return values     | Return values        |

Packages store subprograms
1. Functions 
2. Procedures

## Run a script from a file
```sql
@F:\to_run.sql
@desktop\to.run.sql
```

## TODO: How to run from SQLPLUS


### Declaring variables in annonymous blocks
```SQL
SET SERVEROUTPUT ON;
DECLARE
-- l_prefix for local variables
-- g_prefix for global variables
l_message VARCHAR2(100) := 'Text to be displayed here';
BEGIN
DBMS_OUTPUT.put_line(l_message);
END
```

### Exception-handling a specific error
```sql
DECLARE
x NUMBER;
BEGIN
v_result := 1 / 0;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END
```

### Exception handling with other errors
```SQL
SET serveroutput ON;
DECLARE
l_message VARCHAR2(100) := 'Text to display';
BEGIN
DBMS_OUTPUT.PUT_LINE(l_message);

-- Catch any error and display it with SQLErrorMassage
EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.put_line(SQLERRM);
END;
```

### Nested blocks and concatenation operator
```SQL
SET serveroutput ON;
-- block 1
DECLARE
l_message1 VARCHAR2(50) := 'message1';
BEGIN
-- block 2
  DECLARE
  l_message2 VARCHAR2(50) := l_message1 || 'something else too for second';
  BEGIN
    DBMS_OUTPUT.put_line(l_message2);
  END;
  EXCEPTION
  WHEN OTHERS
  THEN
    DBMS_OUTPUT.put_line(DBMS_UTILITY.format_error_stack);
    DBMS_OUTPUT.put_line(SQLERRM);
END;
```

## Name those blocks!
**Named blocks** are known as **subprograms**  
*Subprograms* are divided in:
1. Functions
2. Procedures

**Procedures** are used to perform some actions.  
**Functions** are used to calculate and return some values.

Let's suppose we need to display a text in multiple applications the best way to do that is a procedure, because it doesn't need to perform any calculation or data or to return anything.

```SQl
CREATE OR REPLACE PROCEDURE
hello_something
IS
l_message VARCHAR2(100);
BEGIN
DBMS_OUTPUT.put_line('Hello uniquevers');
END hello_something;


BEGIN
-- calling the procedure
hello_something;
END;
```

## Parameters
> parameter_name   parameter_mode   data_type
#### Procedure with parameters
```SQL
CREATE OR REPLACE PROCEDURE 
hello_place(place_in IN VARCHAR2)
IS
l_message VARCHAR2(100);
BEGIN   
l_message := 'Hello ' || place_in;
DBMS_OUTPUT.put_line(l_message); 
END hello_place;


BEGIN
hello_place('place');
hello_place('Univers');
hello_place('World');
END;
```




