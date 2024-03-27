# 1. Linux CLI

## Command Lines

### Printing text
```bash
$ echo text_to_print
```
---

### pwd - Print Work Directory
Everything in Linux is a file, as you journey deeper into Linux you’ll understand this, but for now just keep that in mind. Every file is organized in a hierarchical directory tree. The first directory in the filesystem is aptly named the `root` directory. The root directory has many folders and files which you can store more folders and files, etc. Here is an example of what the directory tree looks like:
```bash
$ pwd
```
---

### cd - Change Directory
**Absolute Path**  
**Relative Path**

```bash
$ cd /workspaces/learning-path
$ cd CSS
$ cd .. parentDirectory
$ cd ~ home
$ cd - 
```

---

### ls - List Directories
List directories  
    `-a` param => for all `visibility`  
    `-l` param => `long` details  
```bash
$ ls -a -l
```

---

### touch
Creating a new empty file
```bash
$ touch superduperfile.txt
```

---

### file
Return details about the file

```bash
$file index.html
```
**OUT:** index.html: HTML document, ASCII text

---

### cat
Short for `concat`, combine multiple files and display it together.

```bash
$ cat dogfile catfile
```

---

### less - view the content of file

```bash
$less index.html
```
---

### history & clear
Check the history of commands and clear screen
```bash
$ history
$clear
```
---

### cp - Copy
```bash
$ cp from-file destination_folder
$ cp index.html /www/html-crash
$ cp *.jpg /www
```
``*.html`` => all html files;    
>A useful command is to use the `-r` flag, this will recursively copy the files and directories within a directory.

```bash
$ cp -r Pumpkin/ /home/tony/Documents
```
>You can use the`` -i`` flag (interactive) to prompt you before overwriting a file
```bash
$ cp -i mycoolfile /home/tony/Pictures
```
---

### mv (Move / Rename)
> Move to RENAME files and folders
```bash
$ mv file1 file2_rename
$ mv dir1 dir_2_rename
```

> Move multiple files
```bash
$ mv file_1 file_2 /somedirectory
```

> If override , prompt before ``-i`` flag
```bash
$ mv -i dir1 dir_2_rename
```

---

### mkdir (MakeDirectory)
> Create multiple directories
```bash
$ mkdir dir_1 dir_2 dir_3
```

> Create subdirectories within parent ``-p`` flag
```bash
$ mkdir -p parent_dir/child_dir/fav_dir
```

---

### rm(remove)
> Remove a file
```bash
$ rm file_1
```

> Force remove a file ``-f`` flag
```bash
$ rm -f file_to_force_delete
```

> ``-r`` flag to recursive remove all the files from a directory
```bash
$ rm -r directory_1
```

> remove a directory
```bash
$ rmdir directory_name
```
---

#### help
> Build-in tool on how to use a command
```bash
$ help echo
```

---

#### manual
> Manual program for commands
```bash
$ man echo
```
---

#### whatis
> The ``whatis`` command provides a brief description of command line programs.
```bash
$ whatis cat
```

---

# 2. I/O functions

### stdout (Standard OUT)
> take text into the end of time, if file dosen't exist at the time of execution, it will be created
```bash
$ echo HelloWorld > peanuts.txt
$ echo HelloWorld >> peanuts.txt
```

---

### stdin (Standard IN)
>Just like we had ``>`` for ``stdout`` redirection, we can use ``<`` for ``stdin`` redirection.  
>Normally in the ``cat`` command, you send a file to it and that file becomes the stdin, in this case, we redirected peanuts.txt to be our stdin. Then the output of cat peanuts.txt which would be Hello World gets redirected to another file called banana.txt.

```bash
cat < input.txt > output.txt
```
---

### stderr (Standard Error)
> 0, 1, 2
```bash
ls /fake/directory & > filetext.txt
```

---

### pipe and tee
> Take the output of a command and pass it to another
 
```bash
$ ls -la /etc | less
```
```bash
$ ls | tee peanuts.txt
```
> You should see the output of ls on your screen and if you open up the peanuts.txt file you should see the same information!

---

### Env

> $HOME  
> $USER  
> $env
> $PATH

```bash
$ echo $HOME
$ echo $USER
$ echo $ENV
$ echo $PATH 
```


#3. USER MANAGEMENT
> We haven't gone through permissions yet, but what's happening here is that root is the owner of the file and you'll need root access or be part of the shadow group to read the contents. Now run the command with sudo

```bash
$ sudo cat /etc/shadow
```
---

### switch to superuser
```bash
$ su
```

---

### etc/passwd
> is stored crypted password

```bash
$ cat /etc/passwd
```

---

### etc/shadow
>The /etc/shadow file is used to store information about user authentication. It requires superuser read permissions.

```bash
$ sudo cat /etc/shadow

root:MyEPTEa$6Nonsense:15000:0:99999:7:::
```

---

### /etc/group
> Groups with different users and different permissions.
```bash
$ cat /etc/group
root:*:0:pete
```

---

## User TOOLS

### Adding users

```bash
$ sudo useradd bob
```

---

### Delete Users
```bash
$ sudo userdel bob
```

---

### Changing password
```bash
$ passwd bob
```
---

# 4. Permissions

### File Permission
```bash
$ ls -all
drwxrwxrwx+ 2 codespace root      4096 Jan 19 08:27 .
drwxrwxrwx+ 7 codespace root      4096 Jan 19 07:57 ..
-rw-rw-rw-  1 codespace root      2805 Jan 19 07:57 Commands.md
-rw-rw-rw-  1 codespace codespace   37 Jan 19 08:29 Permissions.md
-rw-rw-rw-  1 codespace root         0 Jan 19 07:57 peanuts.txt
-rw-rw-rw-  1 codespace root      1112 Jan 19 07:57 text-fu.md
-rw-rw-rw-  1 codespace root       888 Jan 19 08:16 user-management.md
```
> The next three parts of the file mode are the actual permissions. The permissions are grouped into 3 bits each. The first 3 bits are user permissions, then group permissions and then other permissions. I've added the pipe to make it easier to differentiate.

```bash
$d| rwx | r-x | r-x 
```
d => directory  
``-`` => file  
Level of permissions 3:  
    r => readable  
    w => writable  
    x => executable  
    - => empty  

### Modify permissions
`CHMOD`

### Adding permissions to a file
```bash
$ chmod u+x myfile
```

### Removing permissions to file
```bash
$ chmod u-x myfile
```

### Adding multiple permissions
```bash
$ chmod ug+x myfile
```

### Permission owner
`CHOWN`
```
$ sudo chown tony myfile
```

# 5.Processes

### top and ps
> See real time proccess background.

```bash
$ ps
$ top
```
![Alt text](image.png)

## Process details

```bash
$ ps l
```

## Terminate process terminal

`ctr + c`  
`ctr + z`

## kill(Terminate)
```bash
$ kill 12445
```
>SIGHUP - Hangup, sent to a process when the controlling terminal is closed. For example, if you closed a terminal window that had a process running in it, you would get a SIGHUP signal. So basically you've been hung up on

>SIGINT - Is an interrupt signal, so you can use Ctrl-C and the system will try to gracefully kill the process

>SIGTERM - Kill the process, but allow it to do some cleanup first

>SIGKILL - Kill the process, kill it with fire, doesn't do any cleanup

>SIGSTOP - Stop/suspend a process

---

# 6. Packages

### Compress de decompress files using GZIP(SINGLE FILE)
> ``GZIP`` it create an arhve with ``.gz`` extension

```bash
$ gzip mycoolfile
$ gunzip mycoolfile.gz
```

### Compress de decompress files using tar(multiple FILEs)

```bash
$ tar cvf mytarfile.tar file1 file2
```
>``c`` - create  
>``v`` - tell the program to be verbose and let us see what it's doing  
>``f`` - the filename of the tar file has to come after this option, if you are creating a tar file you'll have to come up with a name 

```bash
$ tar xvf mytarfile.tar
```
>``x`` - extract

## YUM and APT
### Install Package
>Debian  
`$ apt install package`  
>RPM  
`$ yum install package`

### Remove a package
>Debian    
`$ apt remove package`  
>RPM   
`$ yum erase package`  

### Update a package
>Debian   
`$ apt update; apt upgrade`  
>RPM  
`$ yum update`  

## Compile Source Code
`$ sudo apt install build-essential``
> Once you do that, extract the contents of the package file, most likely a .tar.gz file.  
`$ tar -xzvf package.tar.gz`

> Inside the package contents will be a configure script, this script checks for dependencies on your system and if you are missing anything, you'll see an error and you'll need to fix those dependencies.  
`$ ./configure`

>The ``./`` allows you to execute a script in the current directory.  
`$ make`

> Inside of the package contents, there is a file called Makefile that contains rules to building the software. When you run the make command, it looks at this file to build the software.  

`$ sudo make install`

> This command actually installs the package, it will copy the correct files to the correct locations on your computer. If you want to uninstall the package, use:  

`$ sudo make uninstall`

> Be wary when using make install, you may not realize how much is actually going on in the background. If you decide to remove this package, you may not actually remove everything because you didn't realize what was added to your system. Instead forget everything about make install that I just explained to you and use the checkinstall command. This command will make a .deb file for you that you can easily install and uninstall.
  
`$ sudo checkinstall`  

> This command will essentially "``make install``" and build a ``.deb`` package and install it. This makes it easier to remove the package later on.

# 7. Devices

### /dev
> List de device folder  
```bash
$ ls /dev
```

### Scuzzy Devices
>/dev/sda - First hard disk  
/dev/sdb - Second hard disk  
/dev/sda3 - Third partition on the first hard disk

### /sys
> Both directories /sys and /dev seem to be very similar and they are in some regards, but they do have major differences. Basically, the /dev directory is simple, it allows other programs to access devices themselves, while the /sys filesystem is used to view information and manage the device.
```bash
$ ls -l /sys
```

### Listing USBs
```bash
$ lsusb 
```
### Listing PCI
```bash
$ lspci
```
### Listin SCI
```bash
$ lsscsi
```


# 8.File System 

### Listing the root folder / 
`$ ls -l /`
```
lrwxrwxrwx    1 root      root      7 Dec 11 02:04 bin -> usr/bin
drwxr-xr-x    2 root      root   4096 Apr 15  2020 boot
drwxr-xr-x   12 root      root   3860 Jan 22 08:02 dev
drwxr-xr-x    1 root      root   4096 Jan 19 07:57 etc
drwxrwsr-x    3 codespace golang 4096 Jan 10 19:43 go
drwxr-xr-x    1 root      root   4096 Jan 19 05:48 home
lrwxrwxrwx    1 root      root      7 Dec 11 02:04 lib -> usr/lib
lrwxrwxrwx    1 root      root      9 Dec 11 02:04 lib32 -> usr/lib32
lrwxrwxrwx    1 root      root      9 Dec 11 02:04 lib64 -> usr/lib64
lrwxrwxrwx    1 root      root     10 Dec 11 02:04 libx32 -> usr/libx32
drwxr-xr-x    2 root      root   4096 Dec 11 02:04 media
drwxr-xr-x    2 root      root   4096 Dec 11 02:04 mnt
drwxrwsr-x    1 codespace oryx   4096 Jan 19 05:48 opt
dr-xr-xr-x  224 root      root      0 Jan 22 08:02 proc
drwx------    1 root      root   4096 Jan 10 19:44 root
drwxr-xr-x    1 root      root   4096 Jan 22 08:03 run
lrwxrwxrwx    1 root      root      8 Dec 11 02:04 sbin -> usr/sbin
drwxr-xr-x    2 root      root   4096 Dec 11 02:04 srv
dr-xr-xr-x   12 root      root      0 Jan 22 07:56 sys
drwxr-xrwt+   3 root      root   4096 Jan 22 08:03 tmp
drwxr-xr-x    1 root      root   4096 Jan 10 19:30 usr
drwxr-xr-x    1 root      root   4096 Jan 19 05:48 var
drwxr-xr-x    5 root      root   4096 Jan 22 08:00 vscode
drwxr-xrwx+   5 codespace root   4096 Jan 19 07:57 workspaces
```

> `/` - `root` of the entire filesystem    
> /`bin` - essentially `binaries` (programs)  
> /`boot` - `karnel` files    
> /`dev` - `devices` files  
> /`sys` - more d`etalied device` files  
> /`etc` - `core` system config  
> /`home` - `personal` directories  
> /`opt` - ``optional`` files directory  
> /`media` - `media` directory  
> /`proc` - `process` file directory  
> /`tmp` - `temporary` file directory  
> /`var` - `variable` directory  
> /`sbin` - `essentially` system `binary`  
> /`lib` - `library` files   

### File system types
`$ df -T` - tool for disk /``-T`` type

```
Filesystem     `Type`    1K-blocks     Used Available Use% Mounted on
overlay        overlay  32847680 14089460  17064124  46% /
tmpfs          tmpfs       65536        0     65536   0% /dev
shm            tmpfs       65536        0     65536   0% /dev/shm
/dev/root      ext4     30298176 23096424   7185368  77% /vscode
/dev/sda1      ext4     46127956      460  43751920   1% /tmp
/dev/loop3     ext4     32847680 14089460  17064124  46% /workspaces
```
### Common Types
> `ext4` - This is the most current version of the native Linux filesystems. It is compatible with the older ext2 and ext3 versions. It supports disk volumes `up to 1 exabyte` and file sizes up to 16 terabytes and much more. It is the `standard choice for Linux filesystems`.

### Anatomy of a Disk
>Hard disks can be subdivided into partitions, essentially making multiple block devices. Recall such examples as, /dev/sda1 and /dev/sda2, /dev/sda is the whole disk, but /dev/sda1 is the first partition on that disk. Partitions are extremely useful for separating data and if you need a certain filesystem, you can easily create a partition instead of making the entire disk one filesystem type.

### MBR

>Traditional partition table, was used as the standard  
Can have primary, extended, and logical partitions  
MBR has a limit of four primary partitions  
Additional partitions can be made by making a primary partition into an extended partition  
(there can only be one extended partition on a disk).   Then inside the extended partition you add logical partitions. The logical partitions are used just like any other partition. Silly I know.
Supports disks up to 2 terabytes

### Disk Partitioning
```bash
$ sudo parted
$ select /dev/sdb2

(parted) print                                                            

Model: Seagate (scsi)

Disk /dev/sda: 21.5GB

Sector size (logical/physical): 512B/512B

Partition Table: msdos


Number  Start   End     Size    Type      File system     Flags

 1      1049kB  6860MB  6859MB  primary   ext4            boot

 2      6861MB  21.5GB  14.6GB  extended

 5      6861MB  7380MB  519MB   logical   linux-swap(v1)

 6      7381MB  21.5GB  14.1GB  logical   xfs


```

### Make partition
```bash
$mkpart primary 123 4567
```

> Now just choose a start and end point and make the partition, you'll need to specify the type of partition depending on what table you used.

### Resize partition

`resize 2 1245 3456`

### Make filesystem
```bash
$sudo mkfs -t ext4 /dev/sdb2
Sudo makefiles type ext4 on /dev directory sdb disk partition 2
```

### Mount and Unmount
> Before you can view the contents of your filesystem, you will have to mount it. To do that I'll need the device location, the filesystem type and a mount point, the mount point is a directory on the system where the filesystem is going to be attached. So we basically want to mount our device to a mount point.

```bash
$sudo mount -t ext 4 /dev/sdb2 /mydrive
```

> Simple as that! Now when we go to /mydrive we can see our filesystem contents, the -t specifies the type of filesystem, then we have the device location, then the mount point.

### Unmount

```bash
$sudo unmount /mydrive
$sudo unmount /dev/sdb2
```

### Disk usage
```bash
$du -h /directory
```
> Shows disk usage in the current directory
> -h directory to see for other dirs

### Filesystem repair
> FileSystemCheck
```bash
$sudo fsck -dev/sda2
```
---



# 9. File Sharing over Network

> Sharing & Copying files from a localhost to another remote host on the same network.

### SCP - Secure CoPy

#### Copy a file over from local to remote
```bash
$scp myfile.txt username@remotehost:/remote/directory
```

#### Copy a file from a remote host to localhost
```bash
$scp username@remotehost:/remote/directory/myfile.txt /localhost/directory
```

#### Copy over a directory from local to remote
```bash
$scp -r mydir username@remotehost:/remote/directory
```

### RSYNC - Similar to SCP
> If you already have a part of the documents copyed, RSYNC runs an algorithm that keep already downloaded and copy just the necesary files.
```
-z => compressed files
-v => verbose out
-r => recursive
-h =? humanreadable
```


#### Copy from local to same local
```bash
$rsync -zvr /local/directory/one /local/directory/two
$rsync -zvh backup.tar.gz /tmp/backups/
```

#### Copy/sync files local to remote
```bash
$rsync -zvr local/directory username@remote:remote/directory
$rsync -avzh /root/rpmpkgs root@192.168.0.141:/root/
```

#### Copy from remote to local
```bash
$rsync -zvr username@remote:remote/directory local/directory
$rsync -avzh root@192.168.0.141:/root/rpmpkgs /tmp/myrpms
```

## SimpleHTTP server
```bash
$npm install http-server -g
$http-server
```

# 10. Network Basics

### 10.1. Basics
 - ISP - internet service provider
 - Router - allow each machine on the network to connect to INTERNET.
 - WAN - Wide Area Network , your router encapsulated in the wide NETWORK.
 - WLAN- Wirelesss Local Area Network , network between routers and machines.
 - LAN - Local Area Netowrk.

 ### 10.2. TCP/IP
`TCP/IP` model use the TCP/IP protocol  
`TCP/IP` have multiple layers
 ### Application Layer - TOP LAYER
  The  `TOP LAYER` of the `TCP/IP` model. It determines how your computer's programs (such as your web browser) interface with the transport layer services to view the data that gets sent or received  
 > `HTTP`(HyperTextTransferProtocol) - used for webpages on INTERNET
 ### Transport Layer
 Define how data is transported, including checking correct ports.    
 `TCP` - `Transmission Control Protocol`  

### 10.3. Network Layer 
Specify where `packages` are moved between networks.    
`IP (Internet Protocol)` - route the packets from one machine to another.  

## 10.4. Network Addresses
It's like we are sending a letter to someone, its exact like sending a package. First it needs to know where to send it and must know from who is send.  
OUR HOST it send a package to ANOTHER HOST.   
For this we need MAC address and IP address.    
> MAC address is the physical address of the device.  
> IP address is the virtual address of the device.  
#### MAC address
A MAC address is a unique identifier used as a hardware address. This address will never change  
`00:C4:B5:45:B2:43`
#### IP Address
`IPv4` or `IPv6`  
Looks like this `10.24.12.4`
#### Hostname
Is a more human readable insted of `10.24.12.4`

## 10.5.  Application Layer
> SHORT: APP LAYER encapsulate data in the HEADER

Remember that `packets are used to transmit data` across networks, a `packet consists of a header and payload`. The `header contains information` about `where` the ``packet`` is `  ` and where it came from. The payload is the actual data that is being transferred. As our packet traverses the network, each layer adds a bit of information to the header of the packet. Also keep in mind that different layers use a different term for our "packet". In the transport layer we essentially encapsulate our data in a segment and in the link layer we refer to this as a frame, but just know that packet can be used in regards to the same thing.

First we start off in the application layer. When we send our email through our email client, the application layer will encapsulate this data. The application layer talks to the transport layer through a specified port and through this port it sends its data. We want to send an email through the application layer protocol SMTP (simple mail transfer protocol). The data is sent through our transport protocol which opens a connection to this port (port 25 is used for SMTP), so we get this data sent through this port and that data is sent to the Transport layer to be encapsulated into segments.

## 10.6. Transport Layer
>The `transports layer `helps us transfer our data in a way networks can read it. It breaks our data into chunks that will be transported and put back together in the correct order. These chunks are known as segments. Segments make it easier to transport data across networks.
#### Ports
> Even though we know where we are sending our data via `IP addresses`, they aren't specific enough to send our data to a certain processes or services. `Services such as HTTP use a communication channel via ports`. If we want to send webpage data, we need to send it over the `HTTP` port (port `80`)

#### UDP VS TCP
> UDP dosent care what is the source, it's unrelaiable
### TCP 
`TCP` provides a reliable connection-oriented stream of data. `TCP uses ports` to send data to and from hosts. An application opens up a connection from one `port on its host` to `another port on a remote host`. In order to establish the connection, we use the TCP handshake

#### Network layer
> In the network layer, it receives the segment coming from the transport layer and encapsulates this segment in an IP packet then attaches the IP address of the source host and the IP address of the destination host to the packet header. So at this point, our packet has information about where it is going and where it came from. Now it sends our packet to the physical hardware layer.

# 11. Subneting

### 11.1. IPv4
An IPv4 ip looks like this: `192.168.0.1`. They are unique in the network and it's assigned to a MAC address of a device.  
IPv4 have 32bits
```bash
$ifconfig -a

docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:48:bb:2e:91  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.16.5.4  netmask 255.255.255.0  broadcast 172.16.5.255
        inet6 fe80::222:48ff:fe83:bbfd  prefixlen 64  scopeid 0x20<link>
        ether 00:22:48:83:bb:fd  txqueuelen 1000  (Ethernet)
        RX packets 2112479  bytes 2631106301 (2.6 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 475486  bytes 432068798 (432.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 265008  bytes 166920391 (166.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 265008  bytes 166920391 (166.9 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

### 11.2. Subnets
We can look at `subsets` as some form of `SUBNETWORKs`.

### Subnet Masks
> NETWORK PREFIX 255.255. NETWORK follow by SUBNET MASK 0.0
A typical subnet looks like this:
`255.255.255.0`  
where every 255 is a 8 bits   
SO `255. 255. 255. 0` is 32 bits.
```
123.234.0.0/255.255.0.0
```

### 11.3. Subnet Math
![e](image-1.png)

## 4. IPv6
`2dde:1235:1256:3:200:f8ed:fe23:59cf`

---

# 12. ThroubleShooting

### Using ping
> Testing if either or not a package arrive at destination;

```bash
$ping -c 192.168.0.1
$ping -c www.google.com
NG www.google.com (74.125.239.112) 56(84) bytes of data.

64 bytes from nuq05s01-in-f16.1e100.net (74.125.239.112): icmp_seq=1 ttl=128 time=29.0 ms

64 bytes from nuq05s01-in-f16.1e100.net (74.125.239.112): icmp_seq=2 ttl=128 time=23.7 ms

64 bytes from nuq05s01-in-f16.1e100.net (74.125.239.112): icmp_seq=3 ttl=128 time=15.1 ms
```

### Using traceroute
> Testing how packets are getting routed.
```bash
$traceroute google.com
```

### Using netstat
> An extremely useful tool to get detailed information about your network is netstat. Netstat displays various network related information such network connections, routing tables, information about network interfaces and more, it's the swiss army knife of networking tools.
```bash
$netstat -at
```

# 13. DNS Tools

### nslookup
> Name server lookup, fiind more information about the dns server.
```bash
$nslookup www.google.com

pete@icebox:~$ nslookup www.google.com

Server:         127.0.1.1

Address:        127.0.1.1#53


Non-authoritative answer:

Name:   www.google.com

Address: 216.58.192.4
```

### dig (Domain Information Groper)
> A powerful tool for getting infor about DNS, more flexible then nslookup

```bash
dig www.google.com
; <<>> DiG 9.9.5-3-Ubuntu <<>> www.google.com

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42376

;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; MBZ: 0005 , udp: 512

;; QUESTION SECTION:

;www.google.com.                        IN      A



;; ANSWER SECTION:

www.google.com.         5       IN      A       74.125.239.147

www.google.com.         5       IN      A       74.125.239.144

www.google.com.         5       IN      A       74.125.239.146

www.google.com.         5       IN      A       74.125.239.145

www.google.com.         5       IN      A       74.125.239.148



;; Query time: 27 msec

;; SERVER: 127.0.1.1#53(127.0.1.1)

;; WHEN: Sun Feb 07 10:14:00 PST 2016

;; MSG SIZE  rcvd: 123

```

# 14. NetWorking Commands

### ifconfig - Interface Configuration
Inforamation get:
    - MAC
    - IP
    - MTU

```bash
$ifconfig
```    
> You can view details of a specific interface
```bash
ifconfig wlan0
ifconfig docker0
ifconfig  eth0
```

### Assign IP and gateway to an interface
```bash
$ifconfig interface <address> netmask <address>
$ifconfig eth0 192.168.0.1 255.255.0.0
```

### Disable or enable interaces
```bash
$ifup eth0
$ifdown eth0
```

### Resize the ETU
```bash
$ifconfig mtu xxxx
default 1500
```

### Sudo Traceroute / tracepath
```bash
$ sudo traceroute www.google.com
```

## Ping
> Troubleshoot command
```bash
$ping <destination>
$ping 192.168.0.1
$ping -c 5 192.168.0.1

ping 5 times
```

### NETSTAT
> View the status of the all ports open
```bash
$ netstat -p => for programs
$ netstat -s => for ports
$ netstat -r => routing table
```





