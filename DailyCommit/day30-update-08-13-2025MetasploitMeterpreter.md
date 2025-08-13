# Day 30- 13th august 2025

# Metasploit: Meterpreter

Meterpreter is a Metasploit payload that supports the penetration.

Meterpreter runs on the target system but is **not installed** on it. It runs in memory and **does not write itself to the disk** on the target. 

By default, most antivirus software will **scan new files on the disk** (e.g. when you download a file from the internet) **Meterpreter runs in memory (RAM - Random Access Memory) to avoid** having a file that has to be written to the disk on the target system (e.g. meterpreter.exe). 

This way, **Meterpreter will be seen as a process** and not have a file on the target system.

Meterpreter also **aims to avoid being detected by network-based IPS (Intrusion Prevention System) and IDS (Intrusion Detection System)** solutions by using **encrypted communication** with the server where Metasploit runs (typically your attacking machine). 

If the target organization does **not decrypt and inspect encrypted traffic** (e.g. HTTPS) coming to and going out of the local network, IPS and IDS solutions will **not be able to detect its activities.**

`getpid` returns the process ID with which Meterpreter is running. 

The process ID (or process identifier) is used by operating systems to identify running processes.

for eg. the pid of meterpreter is 302. If the victim uses `ps` the list of pids will have 302 but with different name. Even if you dig dipper with DLL it will not show anything sus. **It is very shealthy**

## Meterpreter Flavors

As you will remember, staged payloads are sent to the target in two steps. 

An initial part is installed (the stager) and requests the rest of the payload.

This allows for a smaller initial payload size. 

The inline payloads are sent in a single step. 

Meterpreter payloads are also divided into **stagged and inline versions.**

However, Meterpreter has a wide range of different versions you can choose from based on your target system. 


We have used the `msfvenom --list payloads` command and grepped "meterpreter" payloads (adding `| grep meterpreter` to the command line), so the output only shows these.

This will show all the versions avaiable for different os.

Your decision on which version of Meterpreter to use will be mostly based on three factors;
1. **The target operating system** (Is the target operating system Linux or Windows? Is it a Mac device? Is it an Android phone? etc.)
2. **Components available** on the target system (Is Python installed? Is this a PHP website? etc.)
3. **Network connection** types you can have with the target system (Do they allow raw TCP connections? Can you only have an HTTPS reverse connection? Are IPv6 addresses not as closely monitored as IPv4 addresses? etc.) 


list other available payloads using the `show payloads`


## Meterpreter Commands

Typing `help` on any Meterpreter session (shown by meterpreter> at the prompt) will list all available commands.

Meterpreter will provide you with three primary categories of tools;

Built-in commands
Meterpreter tools
Meterpreter scripting

If you run the help command, you will see Meterpreter commands are listed under different categories.

Core commands
File system commands
Networking commands
System commands
User interface commands
Webcam commands
Audio output commands
Elevate commands
Password database commands
Timestomp commands


Please note that the list above was taken from the output of the help command on the Windows version of Meterpreter (windows/x64/meterpreter/reverse_tcp).

**These will be different for other Meterpreter versions.**

### Core commands
background: Backgrounds the current session
exit: Terminate the Meterpreter session
guid: Get the session GUID (Globally Unique Identifier)
help: Displays the help menu
info: Displays information about a Post module
irb: Opens an interactive Ruby shell on the current session
load: Loads one or more Meterpreter extensions
migrate: Allows you to migrate Meterpreter to another process
run: Executes a Meterpreter script or Post module
sessions: Quickly switch to another session
File system commands

cd: Will change directory
ls: Will list files in the current directory (dir will also work)
pwd: Prints the current working directory
edit: will allow you to edit a file
cat: Will show the contents of a file to the screen
rm: Will delete the specified file
search: Will search for files
upload: Will upload a file or directory
download: Will download a file or directory
Networking commands

arp: Displays the host ARP (Address Resolution Protocol) cache
ifconfig: Displays network interfaces available on the target system
netstat: Displays the network connections
portfwd: Forwards a local port to a remote service
route: Allows you to view and modify the routing table
System commands

clearev: Clears the event logs
execute: Executes a command
getpid: Shows the current process identifier
getuid: Shows the user that Meterpreter is running as
kill: Terminates a process
pkill: Terminates processes by name
ps: Lists running processes
reboot: Reboots the remote computer
shell: Drops into a system command shell
shutdown: Shuts down the remote computer
sysinfo: Gets information about the remote system, such as OS
Others Commands (these will be listed under different menu categories in the help menu)

idletime: Returns the number of seconds the remote user has been idle
keyscan_dump: Dumps the keystroke buffer
keyscan_start: Starts capturing keystrokes
keyscan_stop: Stops capturing keystrokes
screenshare: Allows you to watch the remote user's desktop in real time
screenshot: Grabs a screenshot of the interactive desktop
record_mic: Records audio from the default microphone for X seconds
webcam_chat: Starts a video chat
webcam_list: Lists webcams
webcam_snap: Takes a snapshot from the specified webcam
webcam_stream: Plays a video stream from the specified webcam
getsystem: Attempts to elevate your privilege to that of local system
hashdump: Dumps the contents of the SAM database



## Post-Exploitation with Meterpreter

### Help

This command will give you a list of all available commands in Meterpreter.

### Meterpreter commands

The `getuid` command will display the user with which Meterpreter is currently running. 

This will give you an idea of your **possible privilege level on the target** system (e.g. Are you an admin level user like NT AUTHORITY\SYSTEM or a regular user?)

The `ps` command will list running processes. 

The PID column will also give you the PID information you will need to migrate Meterpreter to another process.

### Migrate

Migrating to another process will **help Meterpreter interact with it.**

For example, if you see a word processor running on the target (e.g. word.exe, notepad.exe, etc.), you can migrate to it and **start capturing keystrokes** sent by the user to this process. 

Some Meterpreter versions will offer you the `keyscan_start`, `keyscan_stop`, and `keyscan_dump` command options to make Meterpreter act like a keylogger. 

Migrating to another process may also help you to have a more stable Meterpreter session.

To migrate to any process, you need to type the `migrate` command followed by the PID of the desired target process. 

The example below shows Meterpreter migrating to process ID 716 will be 
`migrate 716`.

Be careful; you may **lose your user privileges** if you **migrate from a higher privileged (e.g. SYSTEM) user to a process started by a lower** privileged user (e.g. webserver). **You may not be able to gain them back.**


## Hashdump

The hashdump command will **list the content of the SAM database.**

The SAM (Security Account Manager) database stores user's passwords on Windows systems. 

These passwords are stored in the NTLM (New Technology LAN Manager) format.

These hashes can also be used in **Pass-the-Hash attacks** to authenticate to other systems that these users can access the same network.


### Search

You know what is this, use it everytime.


### Shell

The shell command will launch a regular command-line shell on the target system. 

Pressing `CTRL+Z` will help you go back to the Meterpreter shell.


## Post-Exploitation Challenge

`getsystem` and `hashdump` will provide important leverage and information for privilege escalation and lateral movement.

Finally, you can also use the load command to leverage additional tools such as Kiwi or even the whole Python language.

Meterpreter has functions that can assist all of them.

Gathering further information about the target system.
Looking for interesting files, user credentials, additional network interfaces, and generally interesting information on the target system.
Privilege escalation.
Lateral movement.

**LHOST AND RHOST ARE DIFFERENT THINGS**

if you are cating a file and it is not working it might have gap in the name use "<filename>". 

`search -f <filename>` for file search.