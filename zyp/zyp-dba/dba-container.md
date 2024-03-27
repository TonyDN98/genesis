# DBA Shift FROM Container to Pluggable

## Connect as SYSDBA
1. **COMMAND:** `sqlplus / as sysdba`

```sql
SQLPLUS / as SYSDBA;
```

## Check if we are connected
2. **COMMAND:** `show con_name`

> Once you have logged in to the database always check the database name using the command `Show con_name`

```sql
SHOW CON_NAME;
-- CDB$ROOT
-- CONTAINER DATABASE ROOT
```

![con_name](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29946-2.png?ezimgfmt=ng:webp/ngcb8)
##### NOTE: CONTAINER DATABASE ROOT


## Show pluggable databases
3. **COMMAND:**: `show pdbs`
> After you check de `con_name` you need to see how many pluggable databases are connected.

```sql
SHOW PDBS;
```

![pdbs](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29946-3.png?ezimgfmt=ng:webp/ngcb8)

In the current **ROOT Database** we have 2 databases installed:
1. PDB$SEED => container_id = 2
2. TONYPDB => container_id = 3

#### NOTE: TONYPDB database is MOUNTED

## OPEN the DATABASE
4. **COMMAND:** `ALTER PLUGGABLE DATABASE pdbs_name [ALL] OPEN|CLOSE`
```sql
ALTER PLUGGABLE DATABASE TONYPDB OPEN; --OPEN
SHOW PDBS; -- MODE: WRITE OPEN;
```

## OPEN ALL the DATABASES
```sql
-- OPEN ALL DATABASES
ALTER PLUGGABLE DATABASE ALL OPEN;
```

## CLOSE the DATABASE

```sql
ALTER PLUGGABLE DATABASE TONYPDB CLOSE;
SHOW PDBS; --MODE: MOUNTED;
```

## Change Current CONTAINER
5. **COMMAND:** `ALTER SESSION SET CONTAINER = TONYPDB`;




