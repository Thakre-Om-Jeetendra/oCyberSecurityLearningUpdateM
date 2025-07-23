Day 9 23rd July 2025

# Linux Fundamentals - Part 1

## Introduction to Linux
It does not need an introoduction. Just have to start using it. It is a free and open-source operating system that is widely used in servers, desktops, and embedded systems. Linux is known for its stability, security, and flexibility.
Use ubuntu or any other distribution you like.

## command line interface (CLI):
You have to use command line to do most of the work. The point is to use the user interface minimal and use the commmand line to perform tasks.

## some useful commands:

1. **Echo** - is use to print something you want to see on the screen. This is like the  rint function in python.

2. **Whoami** - is used to see the current user you are logged in as. This is like the getpass.getuser() function in python.

3. **ls** - is use to list the items in the current directory/folder. You can use ls to know what is inside any directory or folder as long as you know the name.

4. **cd** - is used to change the current directory/folder. You can use it like this: cd <directory_name>.

5. **cat** - is used to display the contents of a file. You can use it like this: cat <file_name>. You can use cat to output the content in any directory without cd in it first. cat /home/ubuntu/Documents/todo.txt. Sometimes things like usernames, passwords (yes - really...), flags or configuration settings are stored within files where "cat" can be used to retrieve these.

6. **pwd** - is used to print the current working directory. This is like knowing the current path you are in. Finding out the full path of our current working directory.

7. **find** - as the name suggests, it is used to find stuff, if you know the name. there are varients like:
   - find -name <file_name> - to find a file by its name. Know the name but not the location.
   - If you don't know the name, but know the type of file. Use wildcard(*) to find files of a specific type. For example, to find all text files, you can use: find . -name "*.txt". This will search for all files with the .txt extension in the current directory and its subdirectories.

8. **wc** - is used to count the number of lines, words, and characters in a file. You can use it like this: wc <file_name>. This is useful to know how many lines, words, or characters are in a file. eg. wc -l access.log this will show the number of entries.

9. Let's say you want to know if this specific ip had logged in or not. You can use cat but then you have to scroll through all entries and search it induvidually. Instead, use **grep**. This will find the specific string you are looking for in a file. You can use it like this: grep <string> <file_name>. For example, to find all entries with the IP address. example: ```grep "18.203.122.01" access.log``` This will search if that ip address has logged in or not. If it has, it will show the entries with that ip address.

## Operators:

1. **&** - This is used to run a command in the background. For example, if you want to run a command and not wait for it to finish, you can use: <command> &. This will run the command in the background and return control to the terminal.

2. **&&** - This command lets you run multiple commands in a single line. command 2 will only run if command 1 is successful.

3. **>** -  This is a redirector. meaning that we can take the output from a command (such as using cat to output a file) and direct it elsewhere. Let's use ``` echo howdy``` this will print howdy on the screen. But if you want to save it to a file, you can use: ```echo howdy > hello.txt```. This will create a file called hello.txt and write howdy in it. If the file already exists, it will be overwritten.

4. **>>** - This operator does the same function of the > operator but appends the output rather than replacing (meaning nothing is overwritten). Same with the howdy example, but now the text howdy will be added to the end of the file instead of replacing the whole content.

# Linux part 2

## SSH (Secure Shell):
- SSH is a protocol used to securely connect to a remote server. It allows you to execute commands on the remote server as if you were sitting in front of it. You can use SSH to manage servers, transfer files, and perform other tasks remotely.

- In this section, we will learn how to use it the common way of interacting with it via command line interface.

### What is SSH and how does it work?
SSH is a protocol that encrypts your data between devices. The data leaves your computer in encrypted form for travel and is decrypted by the server. This means that even if someone intercepts the data, they will not be able to read it.

Example: your computer("ram ram")-> on the internet ("e10081008fdid")-> server("ram ram"). The data is encrypted on your computer and decrypted on the server. This is how SSH works.

SSH allows us to execute commands on another device remotely. 

ssh <username>@<ip_address> - This is the command to connect to a remote server using SSH. You will be prompted to enter the password for the user on the remote server.

## Intro to flags and Switches:

A majority of commands allow for arguments to be provided. These arguments are identified by a hyphen and a certain keyword known as flags or switches.

When using a command, unless otherwise specified, it will perform its default behaviour. For example, ls lists the contents of the working directory. However, hidden files are not shown. We can use flags and switches to extend the behaviour of commands.

Using ls **-a** will show all files, including hidden files. The -a flag is used to show all files. Hidden files are files that start with a dot (.) and are not shown by default.

Command with **--help** will show the help for that command. This is useful to know what flags and switches are available for that command.
This option is, in fact, a formatted output of what is called the man page (short for manual), which contains documentation for Linux commands and applications.

**The man(ual) page:**
This provide use with a detailed description of the command, its options, and how to use it. You can access the documentation for a command by typing `man <command_name>`. For example, `man ls` will show the documentation for the ls command. 

## Filesystem interaction:

we know cd, ls, find, cat, pwd, wc and grep commands. These commands are used to interact with the filesystem.

1. *To create a file*, use **touch** as `touch <file_name>`. This will create an empty file with the specified name. For example, `touch myfile.txt` will create an empty file called myfile.txt.

2. *To create a directory*, use **mkdir** as `mkdir <directory_name>`. This will create a new directory with the specified name. For example, `mkdir mydir` will create a new directory called mydir.

3. *To copy a file*, use **cp** as `cp <source_file> <destination_file>`. This will copy the source file to the destination file. For example, `cp myfile.txt myfile_copy.txt` will create a copy of myfile.txt called myfile_copy.txt. Use different name for the new file, otherwise it will overwrite the existing file.

4. *To move a file*, use **mv** as `mv <source_file> <destination_file>`. This will move the source file to the destination file. For example, `mv myfile.txt mydir/myfile.txt` will move myfile.txt to the mydir directory. This will help change the name, move the file to different directory, merge two files, etc.

5. *To delete/remove a file*, use **rm** as `rm <file_name>`. This will delete the specified file. For example, `rm myfile.txt` will delete myfile.txt. Be careful with this command, as it does not move the file to the trash, it permanently deletes it. To remove file `rm <file_name>`. To remove a directory, `rm -R <directory_name>`

6. *file*. determine the type of a file, use **file** as `file <file_name>`. This will show the type of the file. For example, `file myfile.txt` will show that myfile.txt is a text file. Text files usually have an extension of ".txt". But this is not necessary. There might be a different content in the file, but it has a .txt extension. So, it is better to use the file command to determine the type of the file.

Similarly to using cat, we can provide full file paths, i.e. directory1/directory2/note for all of these commands

## Permissions 101:

- 'ls' is list and '-l' is long format. This will show the permissions of the files in the current directory. For example, `ls -l` will show the permissions of the files in the current directory.

- A file or folder can have a couple of characteristics that determine both what actions are allowed and what user or group has the ability to perform the given action -- such as the following:
    - Read
    - Write
    - Execute 

- In linux there are three types of users:
    - Owner: The user who owns the file.
    - Group: The group that the file belongs to.
    - Others: All other users.
- Meaning you can own a file, and let another user or group of users have access to it. This is done by setting the permissions for the file.

### Switching users:
Switching between users on a Linux install is easy work thanks to the su command. Unless you are the root user (or using root permissions through sudo), then you are required to know two things to facilitate this transition of user accounts:
    - The user we wish to switch to
    - The user's password
su is used to switch users. You can use it like this: `su <username>`. Read `man su` for more info.
 
we will see `-l` or `--login` switch here. 

##### question:
*I want to switch user. if i use su <username> it asks for password if I use su -l <username> it does the same then why should I use su -l<username>?*
-   su -l = Full login shell (correct environment + home dir, totally new one).
-   su = Partial switch (keeps your environment, keeps your environement of pervious user).
-   Prefer su -l for interactive work, plain su for quick commands.


### Common directories:

**1. cd /etc:**
- This etc folder is common location to store system files of you operating system.

**the sudoers file** contains a list of the users & groups that have permission to run sudo or a set of commands as the root user.

the **"passwd"** and **"shadow"** files. These two files are special for Linux as they show how your system stores the passwords for each user in encrypted formatting called sha512.

**2. cd /var**
- This folder stores data that is frequently accessed or written by services or applications running on the system. For example, log files from running services and applications are written here (/var/log), or other data that is not necessarily associated with a specific user (i.e., databases and the like).

**3.cd /root**
- Unlike the /home directory, the /root folder is actually the home for the "root" system user. There isn't anything more to this folder other than just understanding that this is the home directory for the "root" user. But, it is worth a mention as the logical presumption is that this user would have their data in a directory such as "/home/root" by default.  
- You can not access if you are a substitute user.

**4. cd /tmp**
- Short for "temporary", the /tmp directory is volatile and is used to store data that is only needed to be accessed once or twice. Similar to the memory on your computer, once the computer is restarted, the contents of this folder are cleared out.
- What's useful for us in pentesting is that any user can write to this folder by default. Meaning once we have access to a machine, it serves as a good place to store things like our enumeration scripts.

# Linux part 3

## Text editors:
- nano a text editor. Use `nano <filename>` this will let you edit text from scratch. You can also make a new file in the same way.
- vim a advance text editor with more features and pre-installed.

## General useful utilities
**1. downloading files (wget):**
- we can download stuff using this if we know the url. We will rewuesst file from http directly as if I am using a browser. 
- E.g. I want to download " myfile.txt" and I know the http "http//somethibg/gif.com" I can download it.

**2. Transferring Files From Your Host - SCP (SSH):**
- Secure copy, or SCP, is just that -- a means of securely copying files. Unlike the regular cp command, this command allows you to transfer files between two computers using the SSH protocol to provide both authentication and encryption.
- This is bilateral meaning copy files & directories from your current system to a remote system and Copy files & directories from a remote system to your current system.
- Provided that we know usernames and passwords for a user on your current system and a user on the remote system.

- If we want to send a copy file to remote computer:

    scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt

scp - telling what to do?
imporatant.txt - with whom?
ubuntu@192.168.1.30: - for who?
/home/ubuntu/transferred.txt - where exactly?

- Reverse this thing, if you want to copy something from the remote computer to the main one:

    scp ubuntu@192.168.1.30:/home/ubuntu/documents.txt notes.txt 
    
scp - what to do?
ubuntu@192.168.1.30: - from whom to take
/home/ubuntu/documents.txt - from where exactly
notes.txt  - what to take









