# Day 14 28th july 2025
# Command line
# Windows command line

## Introduction

Graphical User Interface(GUI) everyone uses it because it is easy and appealing for common users or newcomers. 
Command-Line Interface(CLI) this is something every expert uses.
WHy? because it is quick. e.g. to know you ip add you have to go to settings than few other clicks you get to you desire outcome. BUt in CLI you have to type one command `ipconfig` and all information will displace. Want more? go `ipconfig -all`. See this is fast and easy.

Other factors like:
- Lower resource usage: your machine does not have to spend time getting those graphice running. Meaning it system will focus on the task more.
- Automation: creating a batch file or script with the commands you need to repeat is much easier.
- remote management: Easy to use ssh and it's devices. This approch works well even on slow internet and limited resources.

On windows to open CLI do: win+r > cmd.exe/cmd


## Basic System Information:
- We can only issue commands that are set in your system path. To check the command path use `set`.
- Use `ver` to know your current version. This will give you NT (kernel level) version. The NT version is a technical identifier, while the marketing name (e.g., "Windows 11") is what users see.
- Using `systeminfo` will give you your os system info.
- Use `help` than your command to know more about it. This `man` from linux.
- `cls` to clear the screen.

## Network Troubleshooting:

- Again for network use `ipconfig` to know info on your systems ip. For more info `ipconfig -all`  **we can view our DNS servers and confirm that DHCP is enabled.**
- use `ping <target>` to send Internet Control Message Protocol (ICMP) to the server. **This like sending hi to a friend to see if he is online.**
- Use `tracert <target>` traces the network route traversed to reach the target. It expects the routers on the path to notify us if they drop a packet because its time-to-live (TTL) has reached zero. **It will show how many routers did our data travel through**.
- `nslookup <target>` **It looks up a host or domain and returns its IP address.**
- `netstat` a basic netstat **command will show you established connections and lestening ports**.E.g. 10.10.230.237:22 :22 is the port rest is ip add. This will also show us what protocols are our services are using i.e. tcp or ucp.
   - Want to know more go `netstat -h` -h is help, *remember if you use full name you have to use `help` before command. But if you use `<command> -h` it will work fine.*
   - We have popular options in netstat like:
        -a for all it will display all established connections and listening ports. Will show you number only. E.g.  TCP    192.1x8.1.xxx:x0x6x    10x.1x.x6.xx:https     ESTABLISHED
        -b shows the program associated with each listening port and established connection. This will show you the name that -a did not. E.g. TCP    192.1x8.1.xxx:x0x6x    10x.1x.x6.xx:https     ESTABLISHED [brave] this will tell you the name too.
        -o reveals the process ID (PID) associated with the connection. This is ps from linux. Process Id is an id given to process to keep track of what, which and how many process are taking places or have taken place.
        -n uses a numerical form for addresses and port numbers.  E.g.  TCP    192.1x8.1.xxx:x0x6x    10x.1x.x6.xx:443    ESTABLISHED http has replaced with 443.
    - We **combine these four options and execute the `netstat -abon`** command. The result is quite long. It is clear now that the executable sshd.exe is responsible for listening for incoming connections on port 22, We can also see the process ID (PID) associated with each connection.


## File and Disk Management:
### Working with directory:
- `cd` It is the equivalent of asking the system, where am I? **It will take you to your directory**.
- `dir` is like `ls` from linux. This will show what are the child directories.
- `dir /a` this is `ls -a` - Displays hidden and system files as well.
- `dir /s` Displays files in the current directory and all subdirectories.n Just like ls but it will show files without going in the directory.
- `tree` will show you tree ya... the hirarchy or something. We know tree from yesterday, not that one, it was for when company is at 2 different places and want to use same ADB thing(it was so confusing I might need to read it again. Have to make time for that.)
- Just like linux `cd<target_directory>` will take you in the directory.
- using `cd ..` will take you back to point zero.
- Just like linux use `mkdir <name>` to make directory and `rmdir <name>` for removing it.

### Working With Files
- To view the content of the file `type`
- The `copy` command allows you to copy files from one location to another. 
- you can `move` files using the move command
- we can delete a file using `del` or `erase`.
- We can use the wildcard character * to refer to multiple files. For example, copy *.md C:\Markdown will copy all files with the extension md to the directory C:\Markdown.

## Task and Process Management
- want to open taskmanager in CLI `tasklist`. 
- `tasklist /?` is tasklist -h but they don't let you use -h ans even gives you the correct syntax.
- Let’s say that we want to search for tasks related to sshd.exe, we can do that with the command tasklist /FI "imagename eq sshd.exe". Note that /FI is used to set the filter image name equals sshd.exe.
    - tasklist: Windows command to list running processes.

    /FI: Stands for "Filter". Lets you narrow down the list.

    "imagename eq sshd.exe":

    imagename = Process name (like sshd.exe).

    eq = "equals" (exact match).

    sshd.exe = The process you’re searching for.

    What It Does:
    Searches all running processes and only shows entries where the process name is exactly sshd.exe.

    /FI is grep Instead of scrolling through hundreds of processes, you get only the results you need.

    With the process ID (PID) known, we can terminate any task using taskkill /PID target_pid. For example, if we want to kill the process with PID 4567, we would issue the command taskkill /PID 4567.


## conclusion:
- command line can be used for other tasks.

    - chkdsk: checks the file system and disk volumes for errors and bad sectors.
    - driverquery: displays a list of installed device drivers.
    - sfc /scannow: scans system files for corruption and repairs them if possible.

- /? can be used with most commands to display a help page.

Display text files: more file.txt
Pipe long output to view it page by page: some_command | more

- use `shutdown/s` to shutdown the machine. **Every artibute is denoted by it's initial so search like that. E.g. If you want to know about how to abort using shutdown use /? and look for 'a'. If you want to restart look for 'r'.

#### question
what is pipe?

#### answer
Connects commands: Takes the output of the left command and feeds it as input to the right command. Combine tools (e.g., filter, sort, count).
No temporary files needed.
