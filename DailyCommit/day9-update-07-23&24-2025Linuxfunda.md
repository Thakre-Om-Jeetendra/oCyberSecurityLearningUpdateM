Day 9 and day 10 23rd and 24th July 2025

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

- If we want to **send** a copy file to remote computer:

    scp important.txt ubuntu@192.168.1.30:/home/ubuntu/transferred.txt

scp - telling what to do?
imporatant.txt - with whom?
ubuntu@192.168.1.30: - for who?
/home/ubuntu/transferred.txt - where exactly?

- Reverse this thing, if you want to **copy** something from the remote computer to the main one:

    scp ubuntu@192.168.1.30:/home/ubuntu/documents.txt/notes.txt ~/
    
scp - what to do?
ubuntu@192.168.1.30: - from whom to take
/home/ubuntu/documents.txt - from where exactly
/notes.txt  - what to take
~/ do not forget this. this is where you want your incoming file

- TCP is used in these two process.

## Serving file from host -web

- By default python is preinstalled in ubuntus. 
- Python allows user to use its own server to host their files.
- The module called "HTTPServer". This server turns your computer into quick and easy webserver. Here you can upload your files and another computer can easily download them.
- ` python3 -m http.server ` use this to activate the server. Now, your server is activated it will show port 8000.
- Now to work on other commands you have to start another terminal. Remember the terminal with python terminal should keep running in the background.
- wget http://10.10.184.254:8000/myfile
    wget - to get the file
    http:// - protocol invocation
    10.10.184.254: - ip address of the target machine
    /myfile - the file that needs to be downloaded

## Process 101
- Process are the programs that are running on your machine.
- They have their own ids called pid.
- The 60th process will have a pid of 60
- use **ps** to view this processes
    - This will show you general info like name of the program or command. Session it is running, etc.
    - If you use ps for second time you will see that the pid of *the current ps* has inceremented to 1 compared to the previous observation of ps command.
- To know about programs that other users and those that don't run from session(i.e. system processes) we use **ps -aux**. *Again aux is used to know what programs others are running, they won't show up on ps.*
    - we now have "root"  and "cmnatic".
- Use **top** command to know the real time statistic instead of a one time view
    - top will refresh every 10 sec and when user uses this arrows key to brower over.

### Managing Processes
- To kill a command we use **kill** and the associated pid that we wish to kill. If we want to kill PID1338 then `kill 1338`. **Use for low level process not on system level**.
- Below are some of the signals that we can send to a process when it is killed:
    - SIGTERM - Kill the process, but allow it to do some cleanup tasks beforehand. This is to do a clean kill.
    - SIGKILL - Kill the process - doesn't do any cleanup after the fact
    - SIGSTOP - Stop/suspend a process

### How do a process starts:
- The Operating System (OS) uses **namespaces to ultimately split up the resources** available on the computer to (such as CPU, RAM and priority) processes. Think of it as splitting your computer up into slices -- similar to a cake. Processes within that slice will have access to a certain amount of computing power, however, it will be a small portion of what is actually available to every process overall.

- Namespaces are great for security as it is a way of isolating processes from another -- only those that are in the same namespace will be able to see each other.

- The process with an ID of 0 is a process that is started when the system boots.

- Once a system boots and it initialises, **systemd is one of the first processes that are started**. Any program or piece of software that we want to start will start as what's known as a **child process of systemd**. This means that it is controlled by systemd, but will run as its own process (although sharing the resources from systemd) to make it easier for us to identify and the likes.

### Getting processes start on boot
- Some applications can be started on the boot of the system that we own. For example, web servers, database servers or file transfer servers. This software is often critical and is often told to start during the boot-up of the system by administrators.

- To start a process at boot use **`systemct1`-- this command allows us to interact with the systemd process/daemon. `systemctl [option] [service]`.** 
    - For example, to tell apache to start up, we'll use systemctl start apache2. Seems simple enough, right? Same with if we wanted to stop apache, we'd just replace the [option] with stop (instead of start like we provided).
    - **Use this for hig level aka system level service**.
- We can do four options with systemctl:
    - Start
    - Stop
    - Enable
    - Disable

### An Introduction to Backgrounding and Foregrounding in Linux
- echo is a foreground command. Whatevery you type in echo you get it right back on foreground.
- E.g.: echo hi & [1] 16889.
    here echo is foreground command. & is asking [1]16889 to run in the background.
    [1]16889 will be completed but it is running in background and you won't see it.

- This is great for commands such as copying files because it means that we can run the command in the background and continue on with whatever further commands we wish to execute (without having to wait for the file copy to finish first)

- We can use **ctrl + z** instead of & this key can also be *used in pausing a background process.*

### Foregrounding a process
- to foreground a process that is running in background using ctrl + z or &, type **fg** to bring back the focus to foreground. Now the process will be display in the foreground.


## Maintaining Your System: Automation
User may want to schedule a certain action or task to take place after the system has booted. E.g backing up a file or opening sportify as soon as the interface starts.

We are going to use **`cron`process** and how we can *interact* with it using **`crontabs`.**
Crontab is one of the process that starts when system boots.

A crontab is simply a special file with formatting that is recognised by the cron process to execute each line step-by-step. Crontabs require 6 specific values:
    - MIN- What minute to execute at
    - hour- what hour to execute at
    - dom- what day of month to execute at
    - mon- what month of the year to execute at
    - dow- What day of the week to execute at
    - cmd- The actual command that will be executed.

Let's say we wish to backup file name "cprtf" from directory "documents" every 12 hrs. that would be: 0 */12 * * * cp -R /home/cmnatic/Documents /var/backups/
    If we do not wish to provide a value for that specific field, i.e. we don't care what month, day, or year it is executed -- only that it is executed every 12 hours, we simply just place an asterisk.

This is hella confusing but luckily we got sites like [crontabgenerator](https://crontab-generator.org/) and [Cron Guru](https://crontab.guru/) to help us out.

Crontab can be edited using **`crontab -e`** just link nano.

Use **crontab -l** is used to list (display) the current user's cron jobs (scheduled tasks) in the crontab file.

## Maintaining Your System: Package Management
### Introducing Packages & Software Repos
At linux we have **apt**. Just like ms store this place holds apps. When developers wish to submit software to the community, they will submit it to an  "apt" repository. If approved, their programs and tools will be released into the wild. 

This softwares are not part of the linux distro but are open projects that anyone can download and use.

Whilst Operating System vendors will maintain their own repositories, you can also add community repositories to your list! This allows you to extend the capabilities of your OS. Additional repositories can be added by using the add-apt-repositorycommand or by listing another provider! For example, some vendors will have a repository that is closer to their geographical location.

### Managing Your Repositories (Adding and Removing)
Use **apt** command to install software.
apt command is a part of apt software. This comes pre-installed in most of the linux distros.

**To add** repositories use `add-apt-repository`.
Whilst you can *install software* through the use of package installers such as **dpkg**, the benefits of apt means that whenever we update our system -- the repository that contains the pieces of software that we add also gets checked for updates. 

When adding software, the integrity of what we *download* is *guaranteed* by the use of what is called **GPG (Gnu Privacy Guard) keys.**
These keys are essentially a safety check from the developers saying, "here's our software". If the keys do not match up to what your system trusts and what the developers used, then the software will not be downloaded.

1. Let's download the GPG key and use apt-key to trust it:  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

2. Now that we have added this key to our trusted list, we can now add Sublime Text 3's repository to our apt sources list. A good practice is to have a separate file for every different community/3rd party repository that we add.

2.1. Let's create a file named sublime-text.list in /etc/apt/sources.list.d and enter the repository info.

2.2. And now use Nano or a text editor of your choice to add & save the Sublime Text 3 repository into this newly created file:
deb https://download.subl tmetext.com/ apt/ stable/

2.3. After we have added this entry, we need to update apt to recognise this new entry -- this is done using the apt update command

2.4. Once successfully updated, we can now proceed to install the software that we have trusted and added to apt using apt install sublime-text

Removing packages is as easy as reversing. This process is done by using the add-apt-repository --remove ppa:PPA_Name/ppa command or by manually deleting the file that we previously added to. Once removed, we can just use apt remove [software-name-here] i.e. apt remove sublime-text

## Maintaining Your System: Logs
Located in the /var/log directory, these files and folders contain logging information for applications and services running on your system. The Operating System  (OS) has become pretty good at automatically managing these logs in a process that is known as "rotating".

These services and logs are a great way in monitoring the health of your system and protecting it. Not only that, but the logs for services such as a web server contain information about every single request - allowing developers or administrators to diagnose performance issues or investigate an intruder's activity. For example, the two types of log files below that are of interest:
    - access log
    - error log

There are, of course, logs that store information about how the OS is running itself and actions that are performed by users, such as authentication attempts.

Access logs are useful they will help you to know who used what and when.






