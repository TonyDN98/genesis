# DBA Shutdown

#### Connect to database
`sqlplus / as sysdba`

## How do we shutdown ?
We **SHUTDOWN** the database for reasons like:
1. Change a specific **parameter**
2. Patch a database server
3. Perform maintenance

## Modes of shutdown
1. Shutdown Normal
2. Shutdown Transactional
3. Shutdown Immediate
4. Shutdown Abort

#### Shutdown modes

![shutdown-modes](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29307-1.png?ezimgfmt=ng:webp/ngcb8)

Allow new connections ?: **NONE**  
Wait util current session end? : **NORMAL**  
Wait to finish transaction?: **NORMAL / TRANSACTIONAL**  
Force check point and close files?: **Everything except ABORT**

### SHUTDOWN Normal
> It's the safest method of all, doesn't allow **new connection**, wait for **transactions to complete** and **current session**, and **force a checkpoint**. 
#### NOTE: It may take a few hours or even a full day to complete.


### SHUTDOWN Transactional
> It's another safe method to shutdown, **doesn't allow new connections**, doesn't wait for **current session** to end, **force a checkpoint**, it **waits for current transactions to end**

#### NOTE: Tricky because some transactions may take longer time to finish.


### SHUTDOWN Immediate
> It's the most common used method of SHUTDOWN, it **force a checkpoint**, doesn't allow new connections, doesn't wait current session or transactions.

#### NOTE: These three shutdown methods are very safe shutdown methods. These methods will lead to a consistent database.

### SHUTDOWN Abort
> It doesn't allow new connects, don't wait for session or transaction, and it doesn't force checkpoint. That lead to an inconsistent database.

#### NOTE: Don't use it.


## Consistency vs Inconsistency

![cons vs incons](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29307-2.png?ezimgfmt=ng:webp/ngcb8)


> Previously we have discussed the background process. There is a background process called **DBWn**. This is a **database writer**. This writes the data buffers from the database buffer cache to the data files which are present in the physical location. When we hit commit in the database the changes that we made don’t directly store in the datafiles. When any transactions happen in the database the transactions happen in the memory i.e in the database buffer cache. 

For example, we have used an update statement for some rows in the database. In the below image you can see the blocks in brown color. The brown color boxes indicate the modified database. The modified data is referred to as a dirty buffer. So, the updated rows will be stored inside the brown color blocks i.e. dirty buffers.


![dirty-buffer](https://dotnettutorials.net/wp-content/uploads/2022/08/How-to-Shutdown-Oracle-Database.jpg?ezimgfmt=ng:webp/ngcb8)








