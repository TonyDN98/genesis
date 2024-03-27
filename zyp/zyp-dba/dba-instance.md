# DBA Instance

### Note: We refer an introduction in [dba-arhitecture](./dba-arhitecture.md)

#### Database instance diagram
![memory diagram](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-1.png?ezimgfmt=ng:webp/ngcb8)

As we can see we have 2 types of **memory**:
1. SGA => **SYSTEM GLOBAL AREA**
2. PGA => **PROGRAM GLOBAL AREA**

And 2 types of **processes**:
1. Server Processes
2. Background Processes

### Server Process
> Perform tasks for **CLIENT PROGRAM**   
>Parsing SQL statement returning results to CLIENT.  

**SERVER PROCESS** *pars SQL* => **READ** DB Data FROM Storage => **LOAD** Data into **INSTANCE BUFFER**  

#### Note: READ FROM DB => LOAD TO INSTANCE BUFFER

### PGA
> Each **SERVER PROCESS** has his own **cache** for each **CLIENT**.   
This **CACHE** is know as **PGA**.

#### Let's understand with an example
USER Connected to DB => Trying to EXECUTE SQL `SELECT * FROM students` (at this point it's checking for statement errors and if the table exists) => All this **OPERATIONS** will be **MANAGED BY SERVER PROCESS** (ORACLE will CREATE a SERVER PROCESS to HANDLE the request and MEMORY, that memory is called **PGA**)
##### SERVER PROCESS & PGA 
![example PGA](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-2.png?ezimgfmt=ng:webp/ngcb8)

### Types of  SERVER PROCESS
1. Dedicated SERVER PROCESS
2. Shared SERVER PROCESS

#### Dedicated SERVER PROCESS
> In case of 2 USERS connected to the DataBase, there will be 2 SERVER PROCESSES, each user having a **DEDICATED SERVER PROCESS**

![dedicated-sp](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-4.png?ezimgfmt=ng:webp/ngcb8)

#### Shared Server Process
> In this case processes connect to a **DISPATCHER**. DISPATCHER can **support multiple connection concurrently and it's more efficient.

**Note**: By **DEFAULT** the DataBase it's **SET INTO DEDICATED SERVER PROCESS**, but if we want **SHARED SERVER PROCESS**, we need to change the **initialization parameters** in the **parameter file**.

DEFAULT (DEDICATED) => For (SHARED) => Initialization PARAMETER file


### SGA
1. Maintain data structures and processes
2. Caching data blocks read from disk
3. Buffering **REDO DATA** before write on **REDO LOG Files**.


#### SGA Components
![SGA](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-5.png?ezimgfmt=ng:webp/ngcb8)

1. Shared Pool
2. Database Buffer Cache
3. Redo log Buffer Cache
4. Large Pool
5. Java Pool
6. Streams Pool
7. Fixed SGA


### Shared Pool

**The most important component of SGA**
![Shared  pool](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-6.png?ezimgfmt=ng:webp/ngcb8)

The main purpose it's to **cache METADATA** like Dictionaries, Paths, If tables exist etc.

Shared pool sub-components:
- Data dictionary cache
- Library cache
- Server cache execution plan

It cache information about every SQL statement that is executed.

#### What is Data Dictionary Cache?
**Data Dictionary cache** stores information about the **tables** present inside the database. 

For example, whenever a user runs a SELECT statement, the **SERVER PROCESS** check if that tables exists or not.

#### What is Library Cache?
Library cache stores the SQL statement that is executed , named **execution plan**

#### What is Execution Plan?
The **execution plan** is the procedure of how to execute the statement step-wise, it describes how fast a SQL statement can be executed.

### Database Buffer Cache
![database buffer cache](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-8.png?ezimgfmt=ng:webp/ngcb8)

Database Buffer Cache => Cache User Data  
Database Buffer Cache frequently accesses the database data into the BUFFER MEMORY to improve performance.  
The data is stored in the buffer in form of blocks instead of individual rows 1 block = 8kb

> For example, in order not to confuse we will take the same example from the above. User Jay executed a statement (select from students) after finishing all the parsing the server process copies the table students from the database-to-database buffer cache and stores it in it. After storing it displays the output. Due to this, the statement output will be much faster than the first time.


### Redo Log Buffer
![redo log buffer](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-9.png?ezimgfmt=ng:webp/ngcb8)

> This buffer holds information about changes made in the database.  
> Is designed to store **redo entities**.  
> **Redo entities** are used for database recovery when needed.  
> Found in **Redo Log Files**


![update redo log](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-10.png?ezimgfmt=ng:webp/ngcb8)

The table is already present in the database buffer cache and a new row is added to the table in the buffer cache. So now there is a change in the database. Now the information of changes is stored in the redo log buffer which is again stored in the database. When the user enters commit the data present in the redo log buffer is stored in the database.

Now there should be a question why can’t the data be stored from the database buffer cache to the database. Because the redo log buffer is only for the changes made to the database. Storing the data is faster from the redo log buffer to the database compared to the database buffer cache database and it is more secure to take the information from the redo log buffer rather than the database buffer cache.


### Large pool

![large pool](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-11.png?ezimgfmt=ng:webp/ngcb8)

It's a memory present in the SGA, that is allocated for special features like Shared Server Process.

### What is Java Pool?
Used to parse Java code and scripts. Executed in the **Large pool** and it's parse and stored in the **Java Pool** like a database buffer cache.

**JAVA_POOL_SIZE** it's the parameter that is used to assign memory.

### What is Stream Pool?
Provide memory for Stream Processes.  
**STREAMS_POOL_SIZE** is the parameter ti set the value for stream pool.

### What are streams? 
Streams are not but sharing information as messages between 2 databases.

### What are Background Processes?
Dedicated server-side processes running in the background to manage database.  
Transfer data file from **INSTANCE** to database.  
REQUIRED / OPTIONAL

### Task performed by Background Processes in ORACLE
1. Write database blocks to disk
2. Write Redo Entities to disk
3. Database files on disk are sync 
4. Perform maintenance tasks

### Background Process in ORACLE DATABASE INSTANCE
1. Database Writer Process
2. Log Writer Process
3. Checkpoint
4. System Monitor
5. Process Monitor
6. Recovery Process
7. Listener Registration Process
8. Archive Process



![back processes](https://dotnettutorials.net/wp-content/uploads/2022/07/word-image-28242-13.png?ezimgfmt=ng:webp/ngcb8)


### Database Writer Process(DBWn) n - nr of database writers
Responsible to write content from the database buffer cache to data-files on DISK.  
It writes the modified data (UPDATE, DELETE, INSERT ) , from Database Buffer Cache to data-files on disk.


### Log Writer (LGWR)
Responsible for writing redo records from REDO LOG BUFFER into DISK.

### Checkpoint PRocess (CKPT)
Database Event -> event that sync modified data blocks.
FROM Database Buffer Cache -> DISK.
It trigger LGWR and DBWR to write to database.

### System Monitor Process (SMON)
SMON perform RECOVERY during START-UP sequence if **INSTANCE**  if required.  
CLEAN UP any unused temporary segment.

### Process Monitor ( PMON )
PMON perform RECOVERY **WHEN** a **user process** or a **session** fails. It's also responsible for cleaning up any changes made to blocks in the Database Buffer Cache and release resources previously used by a failed user session.

### Listener Registration Process (LREG)
This process helps users connect remote to Database.
It is responsible for registering the **INSTANCE** with **ORACLE NETWORK LISTENER**.

### Archive Process (ARCn) n - nr of processes
It's responsible to **COPY REDO LOG FILE** to a REMOTE STORAGE DEVICE, after a redo log switch ocurred. FRA (FLASH RECOVERY AREA) used for BACKUP methodology. 


