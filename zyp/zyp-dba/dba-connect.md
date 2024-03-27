# DBA Connecting

## Connection to a database
- TCP/IP Connections
- Secure TCP/IP Connections

## How to connect to a database?
Connecting to Oracle with **Oracle NET Services**

> An important component that is associated with the oracle net services is the **Oracle Net Listener**.

### What is Oracle Net Listener?
It receives incoming client requests and manage the traffic of this requests on server.  
Oracle uses 2 types of files for network configuration between clients and servers.

1. Listener.Ora
2. Tnsnames.Ora

#### Example

> We have an oracle client (client indicates any user or any application user who is connecting to the database) who is trying to connect to the database. In order to connect to a specific database, we need a network. Let us assume that there are six databases. A user needs to connect to database 1. He will connect to the database through the network using a protocol. `We need some object to listen to the client connections. We call that object an Oracle listener. Oracle listener listens to the client’s requests.`

![oracle-listener-example](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29685-1.png?ezimgfmt=ng:webp/ngcb8)

## What is Oracle Listener ?
> **SERVER** to know about **CLIENT**. WHO IS CONNECTING?

1. A **listener** is an actual gateway to database.    

2. The job of listener is to wait and listen the incoming connections from users to server.  

3. Multiple instances running on the same server can have the **listener** defined.

4. Oracle listener is the process that receives incoming client connections. There is always a file that is configured for the listener. We call the file name `listener.ora`

### Listener.ora
**Location**: `$ORACLE_HOME/network/admin/listener.ora`
Used to **config** data 

#### Listener.ora example

![listener.ora](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29685-2.png?ezimgfmt=ng:webp/ngcb8)

`LISTENER` is here the name of our listener  

**First Address**
1. PROTOCOL used is `TCP`
2. HOST is `oracletest.com`
3. PORT is `1521`

#### NOTE: Protocol: TCP and PORT:1521 are the default params. 

### What is IPC Protocol?
> Used when both CLIENT/SERVER are located on the same machine. 

### What is a Service Name?
**Client** => Connect to Database  
**Combination**: HOSTNAME & Service Name

> Service name: An oracle database is represented to clients as a service name. It is just an alias for the database. A database can have one or multiple service names associated with it. 

`Service Name` is basically the `DATABASE ALIAS`

### 1 Service for Database
We have a database called **tonydb**, this database is present on server.
The database **tonydb** is associated with service **tonydb_service**.
Client => `tonydb_service` to connect to **tonydb** database.

![one-service-database](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29685-4.png?ezimgfmt=ng:webp/ngcb8)

## What is tnsnames.ORA?

> **FROM CLIENT** to know about **SERVER**. WHERE TO CONNECT ?

When the oracle client is trying to connect to the database, he needs an oracle listener. The oracle client needs to know about the below information before connecting to the database.
1. Tnsnames.ora present on client side and server side also
2. Purpose to make things simpler.

#### NOTE: Client-side configuration file called tnsnames.ora

1. HOSTNAME where **LISTENER and DATABASE** is running
2. PORT
3. LISTENER PROTOCOL
4. Service name that LISTENER is HANDING

![tnsnames.ora](https://dotnettutorials.net/wp-content/uploads/2022/08/word-image-29685-7.png?ezimgfmt=ng:webp/ngcb8)

1. `jaydb` can be renamed
2. Have 2 parts: Description and Connection
3. Description part => Address Information (PROTOCOL:TCP, HOST[oracletest.com service_name], PORT:1521 )


