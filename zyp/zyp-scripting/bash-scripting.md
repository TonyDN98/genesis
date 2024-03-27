# C1. Introduction to LinuxShell Scripting

### What is Karnel?

Short:   
It's responsible to manage everything (FileManagement, ProcessManagement, I/OManagement, DiskManagement, Device Management)

## Shell
- Command Line Shell
- Graphical Shell  

**Types**  
- Bash
- CSH
- KSH

## Shell Scripting
**Shell Scripting** is like any other programming language.   It's syntax is similar to C++/Python.  

**Shell Keywords** => (if, else, break)  
**Shell Commands** => cd, ls, echo, pwd, touch  
**Functions**  
**Control Flow**

## Why do we need Shell Scripts?
Simple answer. To avoid repetitive tasks and create automation with functions.

### WHERE TO STORE SHELL Scripts?
```bash
sudo mv update.sh /usr/local/bin/update
which update
$update
```
> /usr/local/bin/update

### ShellScripting
```bash
$touch jump.sh
```
**Paste the code**
```bash
# !/bin/bash

# A simple bash script to move up to desired directory level directly

function jump()
{
	# original value of Internal Field Separator
	OLDIFS=$IFS

	# setting field separator to "/"
	IFS=/

	# converting working path into array of directories in path
	# eg. /my/path/is/like/this
	# into [, my, path, is, like, this]
	path_arr=($PWD)

	# setting IFS to original value
	IFS=$OLDIFS

	local pos=-1

	# ${path_arr[@]} gives all the values in path_arr
	for dir in "${path_arr[@]}"
	do
		# find the number of directories to move up to
		# reach at target directory
		pos=$[$pos+1]
		if [ "$1" = "$dir" ];then

			# length of the path_arr
			dir_in_path=${#path_arr[@]}

			#current working directory
			cwd=$PWD
			limit=$[$dir_in_path-$pos-1]
			for ((i=0; i<limit; i++))
			do
				cwd=$cwd/..
			done
			cd $cwd
			break
		fi
	done
}

```
**Change the permission to be a executable**
```bash
$ chmod +x jump.sh
```

**Take the jump.sh** and create another file ``.bashrc``      
The purpose of a .bashrc file is to provide a place where you can set up variables, functions, and aliases, define our prompt, and define other settings that we want to use whenever we open a new terminal window.  

# C2. Create Shell Scripts
### Creating ShellScript
```shell
$ touch script.sh
$ nano scirpt.sh
$ echo "Start fo script"
$ touch file_1.txt
$ ls
$ echo "End of script"
$ chmod +x script.sh
$ ./script.sh
```
### Comments in Shell

```shell
# This is a comment
echo "Testing comments"
```

### Variables in SHELL
```bash
# Accesing ENV variable
$ echo $USER
$ var_name="TONYDN98"
$ echo $var_name
```
Every variable that is declared can be seen in $ENV;

### Define Shell Interpreter
```bash
#!/bin/bash
```

### Integer Comparation
**-eq**=> EQUAL  
**-ne**=> NOT EQUAL  
**-lt**=> LESS THEN  
**-le**=> LESS OR EQUAL  
**-gt**=> GREATER THEN  
**-ge**=> GREATER OR EQUAL  

### String COmapration
**==** =>EQUAL STRING  
**!=** =>NOT EQUAL STING    
**\<** =>LESS THEN ASCII  
**\>** =>GREATER THEN ASCII  

### Conditional Statements
#### if statement
```bash
if [condition]
then
#statement
fi

#! /bin/sh
x = 10
y = 11
if [$x -lt $y]
then
echo "x less then y"
fi
```

#### Check if a file exist 
> -f from file
```bash
#!/bin/bash
if [ -f ~/myfile ]
then
	echo "Found"
else
	echo "Found"
```

#### Check if a program or binary is present on the system
> which htop
```bash
#!/bin/bash

command=/usr/bin/htop
if [ -f $command ]
then
	echo "Command is available let's run"
else
	echo "$command is not avasible installing"
	sudo apt update
	sudo apt install -y htop
fi
$command

```

#### Check if directory exists
```bash
#!/bin/bash
dir="/bin"
if [ -d $dir ]
then
	echo "${dir} exists"
else
	echo "Let's create it"
	mkdir $dir
fi >> some_log.txt
```

#### Check if exists
```bash
#!/bin/sh
if [ -e /file/file_name ]
then
	echo "File exist"
else
	echo "It dosen't"
fi
```

# Exit codes
> $? - access the last code execution
```bash
#!/bin/bash
package=htop
sudo apt install $package
echo "Exit code for package is $?"
if[ $? -eq 0]then
	echo "Install is success"
	echo "The new command is here"
	witch $package
else
	echo "$package failed to install error $?"
```

```bash
#!/bin/bash
package=notinstaller
sudo apt install $package && sudo apt update >> pack_install_result.log
if [ $? -eq 0 ]
then
	echo "Instlal success of $package"
	echo "New command is here"
	which $package
else
	echo "$package failed" >> result_fail.log
fi
```

# Parameters
``$#`` => Number of param passed.      
``$0`` => Name of file  
``$1, $2`` => First and second argument  
``$* => All the arguments``    
``$?`` => Exit code

```bash
./myscirpt.sh first sencond third
#!/bin/bash
echo "$# is the number of arguments"
echo "$0 is the name of file"
echo "$1 is the second"
echo "$2 is the third"
echo "$? is the exit code after execution
echo "$* all the arguments passed"

for argument in $*
do
	echo "$argument"
done
```



#### while loops
```bash
#! /bin/sh
while [ condition ]
do
# set of statements
# `$expr `
done

while [ condition ]
do
x=$((x + 1 ))
done

x=2
while [ $x -lt 6]
do
x=`$expr $x + 1`
done
```

#### for loop
```bash
#! /bin/sh
for local_var in v1 v2 v3 v4
do
#statements
done

for i in 2 3 4 5 6
do
echo $i
done
```
### Case statement
```bash
#!/bin/bash
# Syntax
read distro

case $distro in
	1) echo "1"
	2) echo "2"
	3) echo "3"
	*) echo "enter soomething"
esac
```


#### Arhive with a for loop
```bash
#!/bin/bash
for file in logfiles/*.log
do
	tar -cvf $file.tar.gz $file
done

```

## Positional Arguments
```bash
echo "Nr of arguments $#"
echo "name of script is $0"
echo "arguments is $1 $2 and so on"
# so on util $n
```

## Storing output of a linux command
```bash
#! /bin/sh
var=$(valid linux command)
var=`valid linux command`

b=$(pwd)
c=`pwd`
echo $b
echo $c
d=$(ls /bin grep bash)
echo $d
```

# C3. Basic Commands

### Display the file content on terminal
**cat** => Used to concatenate files. Give output of standard output.
```bash
$ touch languages.txt
$ nano languages.txt
$ cat languages.txt
*Give output*
```
**less** => Show content in terminal.
```bash
$less languages.txt
```

**head** => Show first n lines from file.  
```bash
$ head -2 languages.txt
```
**tail** => Print last n-1 lines from file.  
```bash
$ tail -3 languages.txt
```

### File and Directory Manipulation
**mkdir** => Make directory
```bash
$ mkdir dir_1
```
**rmdir**
```bash
$ rmdir -r -p dir_1
```
**cp**
```bash
$ cp source destionation
```
**mv**
```bash
$ mv source destionation
$ mv file_1 file_1_rename
```
**rm**
```bash
$ rm -r -f file_1
```
**touch**
```bash
$ touch file_1.txt
```

### Basic terminal navigation

**ls** => Listing
```bash
$ ls
```

**ls -a -l** => Listing hide files and details
```bash
$ ls-al
```

**cd** => Change Directory
```bash
$ cd /dir
```

**du** => Disk Usage
```bash
$ du
```

**pwd** => PresentWorkingDirectory
```bash
$ pwd
```

**locate** => Locate a file
```bash
$ locate file_1
```

**df -T** => available disk space / file system TYPE
```bash
$ df -T
```

**echo** => Move data, text to file
```bash
$ echo "HEllloWorld"
```

**gzip / gunzip / tar** => Arhive
```bash
$ gzip file_1 
$ gunzip file_1.gz
$ tar -cvf arhive.tar file_1 file_2
$ tar -xvf arhive.tar
```

### Change File Permission

**chmod** => Change Mode 
```bash
$ chmod + or - xrw file_name
```
**chown** => Change Owner 
```bash
chown -c master file_1
```
**chgrp** => Change Group 

# C4. Linux Directory Structure
![](https://media.geeksforgeeks.org/wp-content/uploads/20210501124411/dir.png)

**/bin** => binaries programs     
**/etc** => IMPORTANT sys config files  
**/home** => home directory   
**/opt** => optional third-party app  
**/tmp** => temporary files   
**/usr** => user related programs   
**/var** => log files   

**/boot** => Contain boot-related information files.     
**/boot/vmlinux** => Linux karnel files   
**/dev** => Device information sda1, sda2    
**/lib** =>Karnel modules and libraries  

### System configuration related files
**/etc/** => here you can find everything that is related with the system information

### User related files
**/usr/** => everything that is related to user programs.

# C5. Input/OUTPUT redirect

### Overwrite REDIRECTION
**>** -> Standard OUTPUT
**<** -> Standard INPUT
> Overwrite redirection is useful when you want to store/save the output of a command to a file and replace all the existing content of that file.

```bash
$ cat > output.txt
Everything that its write here will be in output.txt from 0.
$ cat output.txt
```
![e](https://media.geeksforgeeks.org/wp-content/uploads/20200512211812/Input-and-Output-Redirection-in-Linux.png)

```bash
$ cat < file.txt
# It takes the input from file.txt and display it
```

### Append REDIRECTION
**>>** -> Append OUTPUT
**<<** -> Append INPUT
> With the help of this Redirection, you can append the output to the file without compromising the existing data of the file.
```bash
$ cat > output.txt # first override from 0
$ cat >> output.txt # appended second time
```

# C6. Variables
### Accesing variables
```bash
VAR_1="DEV"
VAR_2="OWL"
echo $VAR_1$VAR_2
```

### Unset a variables
The **unset** command directs a shell to delete a variable and its stored data from list of variables
```bash
var1=5
var2=4
echo "$var1$var2"
unset var1
echo "$var1$var2"
```

### Readonly variable
```bash
# var1 = 5
readonly var1 = 5
echo "$var1"
var1 = 6
echo "$var1"
./bash1: line 8: var1: readonly variable
```

#### Variables Types
**Local Variables**  
used just **in shell** but not outside programs    
`name="Tony"`

**ENV Variable**  
These variables are **commonly used to configure the behavior script and programs that are run by shell**. Environment variables are only created once, after which they can be used by any user. 

``export PATH=/usr/local/bin:$PATH`` would add ``/usr/local/bin`` to the beginning of the shell’s search path for executable programs.

**Shell Variables**  
Variables that are **set by shell itself and help shell to work with functions correctly**. It contains both, which means it has both, some variables are Environment variable, and some are Local Variables.

`$PWD` => Stores working directory
`$HOME` => Users home dir
`$SHELL`=> path to shell program is being used

![e](https://media.geeksforgeeks.org/wp-content/uploads/20230412095214/14.png)

### Store and display massage
```bash
#!/bin/bash
time=$(date +%H)
if [ $time -lt 12];then
    message = "Good Morning User"
elif [ $time -lt 18 ];then
    message = "Good Afternoon User"
else
    message = "Good Evening User"
fi
echo "$message"hours

```

#### What is Shell Variables used for?
**SET ENV variables**  
**SET COnfiguration data**  
**Store temporary data**  
**Pass arguments to scripts**  

### Rules for variable 
**Rule 1:** A name can have letters, numbers and underscore
**Rule 2:** No whitespace between = operators

# C7. String manipulation in ShellScript

## Assign content tp a variable and print it content  '$'
```bash
#!/bin/sh
var_name='value'
echo $var_name
var_name="value"
echo ${var_name}
var_name=value
echo "$var_name"
```

#### Length of string #
```bash
str1 = "Somehting"
echo $#str1
```

### Concatenate charecters between the string
var=${var1}**${var2}**${var3}

# C8. Arrays Basics
```bash
#!/bin/sh
arr=("jayson", "dumbdub", "helomiso", "etc", "dunno", "2")
# Print all elements
echo $arr[*]

# Print first element
echo $arr[0]
index_start = 3
echo $arr[$index_start]

# Print from a particular index
echo $arr[*]:2

# Print from range
echo $arr[*]:0:3

# Print length
echo $#arr[*]

```

# C9. Functions Example
```bash
echo -n "Enter Left-End: " 
read le
echo -n "Enter Right-End: " 
read ri

is_prime(){ 
   if [ $1 -lt 2 ]; then 
       return 
   fi 
   ctr=0 
   for((i=2;i<$1;i++)){ 
       if [ $(( $1 % i )) -eq 0 ]; then 
           ctr=$(( ctr +1 )) 
       fi 
   }
   if [ $ctr -eq 0 ]; then 
       printf "%d " "$1" 
   fi 
}
printf "Prime Numbers between %d and %d are: " "$le" "$ri"
for((i=le;i<=ri;i++)){ 
   is_prime $i 
} 
printf "\n"
```

# C10. Passing arguments cli
**$0** => 0 args, name of file  
**$1** => First arg  
**$2** => Second arg  
**$n** => N arg  

```bash
#!/bin/sh
echo "0st param $0"
echo "1st param $1"
echo "2st param $2"
```

# C11. Standard input output and err
![e](https://media.geeksforgeeks.org/wp-content/uploads/20220109203231/shstreams.png)

```bash
#!/usr/bin/env bash

ls > /tmp/log
cat /tmp/log

ls /not/existed_path > /tmp/log
cat /tmp/log
cat /tmp/log

rm /tmp/log
```

### Error redirect
```bash
#!/usr/bin/env bash

ls /not/existed_path 2>/dev/null
ls * /not/existed_path > /tmp/log 2> /tmp/err_log
cat /tmp/log
rm /tmp/log /tmp/err_log
```

### INPUT
```bash
#!/usr/bin/env bash

grep perfect << EOF
    PERFECT STORY
    past perfect
    is it Perfect?
EOF
```

## C12. Debugging
### print statement
```bash
print Error
```

### Query/proc/sys
```bash
ls /proc
```
