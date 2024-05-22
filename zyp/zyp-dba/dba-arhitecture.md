 # Oracle Architecture

### Note: Dynamic Perform View in ORACLE

 Dynamic performance views because they are updated continuously while the database is open and in use. It is the same data dictionary tables but the major difference is the view keeps on updating when required. Their contents relate mainly to the performance of the database. Dynamic performance views are identified by the `prefix V_$`

##### Example
 ```sql
 $instance
 $pdbs
 $parameters
 ```

 ### Note: What is a database?
 It contains a collection of database files `.dbf for example`.
 - Data files `.dbf`
 - Control Files `.ctl`
 - Redo Files `redo.log`
 - Backup Files `.bak`
 - Archive Redo Files `.log`
 - Parameter Files `.spfile` / `.par`
 - Password File `.pfile`
 - Alert Log Files
 - Trace Files
#### DataBase Files
 ![database files](https://dotnettutorials.net/wp-content/uploads/2022/06/word-image-27931-1-768x475.png?ezimgfmt=ng:webp/ngcb8)

 ### Note: What is a Database Instance?
 It's a set of processes and memory that manage database files. An **instance** exists only in memory RAM and it's very important to remember that.

 #### DataBase Memory
 ![database memory](https://dotnettutorials.net/wp-content/uploads/2022/06/word-image-27931-2.png?ezimgfmt=ng:webp/ngcb8)

#### Important Notes:
1. Every Running Oracle Database must be associated with at least one database instance.
2. Now, one more important point is that an instance exists in memory and a database exists on disk, so an instance can exist without a database and a database can exist without an instance.
3. Losing an instance is no issue, but losing data files for example losing the database. That means if you lose some data file, it means you are losing the database. If you lose the instance, no issue, you can create the instance again.

**The Oracle Instance** it's the Program or Binary that it's loaded into the **SERVER RAM** and an **INSTANCE** is created every time we **START** a database.

#### ORACLE RAC(Real App Cluster)
Server Machine DataBase => x DataBase INSTANCES
![RAC](https://dotnettutorials.net/wp-content/uploads/2022/06/word-image-27931-6.png?ezimgfmt=ng:webp/ngcb8)