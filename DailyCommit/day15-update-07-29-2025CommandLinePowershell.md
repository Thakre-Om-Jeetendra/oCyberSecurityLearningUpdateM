# DAY 15- 29th july 2025

# Windows PowerShell

## What Is PowerShell:

It combines command line and scripting language. It is designed for task automation and configuration management. 

In programming, an object represents an item with properties (characteristics) and methods (actions). For example, a car object might have properties like Color, Model, and FuelLevel, and methods like Drive(), HonkHorn(), and Refuel().

in PowerShell, objects are fundamental units that encapsulate data and functionality, making it easier to manage and manipulate information. An object in PowerShell can contain file names, usernames or sizes as data (properties), and carry functions (methods) such as copying a file or stopping a process.

## PowerShell Basics:

- When you launch a powershell `ps` will be used to represent that you are in powershell.

- PowerShell commands are known as cmdlets.

- Cmdlets follow a consistent Verb-Noun naming convention. This structure makes it easy to understand what each cmdlet does. The Verb describes the action, and the Noun specifies the object on which action is performed. For example:

    - Get-Content: Retrieves (gets) the content of a file and displays it in the console.
    - Set-Location: Changes (sets) the current working directory.

- cmdlets are not usally case sensitive. Get-Content = get-content.
- But it is recommended to **use PascalCase.**

- To list all available cmdlets, functions, aliases, and scripts that can be executed in the current PowerShell session, we can use **`Get-Command`. It’s an essential tool for discovering what commands one can use.** This is basically a manual book for all the commands you can use.
    - If we want to display only the available commands of type “function”, we can use -CommandType "Function" This is a filter. So our new command will **`Get-Command -CommandType "Function"` this will filter only give function.**

- We know this one `Get-Help`. You have to use this before the command you want to know about. `man` is an alias of this, these two do same thing.
    - To see the examples, type: `get-help Get-Date -examples`. **To see example of how to use the code use `-example`**.

- These commands takes a longer time to write, so they release "alias". **"Aliases" are shortcuts to big commands like `Get-Children`'s alias is `dir` and `cd` for `Set-Location`.** 
    - Use **`Get-Alias` to get list of all alias**.

- Powershell allows you to download other cmdlets from online repos. These repos are public. People write some useful cmdlets for performing tasks that might takes multiple cmdlets to perform. **Use `Find-Module` to see all the avaiable repos.** 
    - Let's say we want to download a powershell based module but don't know the name of that module. We can just like `Get-Command CommandType "<type>"` **use `Find-Module -Name "powershell*"`** > "Find-Module"(the name give off what it does), "-Name"(this tells what is the Property like what is this? for us it name), "Powershell"(the name of our pattern), "*"(says this is partial name. Show me everything that has this name in it.)
    - Once you found what you needed just say,**`Install-Module -Name "PowerShellGet" `** > "Install-Module"(tells use to install a module), -Name(what's the name), "PowerShellGet"(the name).


## Navigating the File System and Working with Files:

- **Want to use `dir` or `ls` use `Get-ChildItem`**. *NOTE: YOU CAN USE BOTH EITHER `dir` OR `ls` INSTEAD OF `Get-ChildItem`. BECAUSE THESE ARE ALIAS FOR IT.
    - Use ``Get-ChildItem -Path <path you want to go>` to let it know you want to jump to this dir or place.

- **`Set-Location` is `cd` here.** 
    - You can go to a specific location again using `-Path <pathname>` after cd.

- **TO create a new item use `New-Item "<name of the item>" -ItemType "Directory or File"`** this is mdir or touch (dir or file respectivly) from linux.
    - if you know the path use `-Path <whole path>`.

- **To remove use `Remove-Item "<name of the item>" ` this is rm or rm -r from linux**.

- **`Copy-Item <name>` (equivalent to copy) and `Move-Item <name>` (equivalent to move).**

- **To cat the content of a file use `Get-Content`.** *only works on files.*

## Piping, Filtering, and Sorting Data:

- Piping is a technique used in command-line environments that allows **the output of one command to be used as the input for another.** 
    - `|`.
    - piping is even more powerful because it passes objects rather than just text. These objects carry not only the data but also the properties and methods that describe and interact with the data.
    - e.g. if you want to get a list of files in a directory and then sort them by size, you could use the following command: `Get-ChildItem | Sort-Object Length`. Will not only do dir/cd but also sorting all of them by length.

    - Beyond sorting, PowerShell provides a set of cmdlets that, when combined with piping, allow for advanced data manipulation and analysis.

    - To filter objects based on specified conditions, returning only those that meet the criteria, we can use the Where-Object cmdlet.
        - e.g. `Get-ChildItem | Where-Object -Property "Extension" -eq ".txt"` to list only .txt files in a directory. *-eq is equal to*.
        - other operators like:
            `-ne`: not equal, will exclude everything after -ne.
            `-gt`: "greater than". This operator will filter only objects which exceed a specified value. 
            `-ge`: "greater than or equal to."
            `-lt`: "less than."
            `-le`: "less than or equal to."
            `like`: selecting properties that match a specified pattern.
                e.g.: Get-ChildItem | Where-Object -Property "Name" -like "ship*"  
            `select-object`: is used to select specific properties from objects or limit the number of objects returned. It’s useful for refining the output to show only the details one needs.
                e.g.:  Get-ChildItem | Select-Object Name,Length
    
    - You can as many commands you want to pipes.
    
    e.g: `Get-ChildItem -Path "C:\Users\captain\Documents\captain-cabin"| Sort-Object Length -Descending | Select-Object -First 1` this will give you the largest file.

- **`Select-String` this `grep` or `findstr`. It will find the specific content within log files or documents.**
    -  regular expressions (regex). This advanced feature allows for complex pattern matching within files, making it a powerful tool for searching and analysing text data.

How would you retrieve the items in the current directory with size greater than 100? [for the sake of this question, avoid the use of quotes (“ or ‘) in your answer]
    Answer: Get-ChildItem | Where-Object -Property Length -gt 100


## System and Network Information:

- **`Get-ComputerInfo` will do what its name says.**
- **`systeminfo` will give only systeminfo.**
- **`Get-LocalUser` lists all the local user accounts on the system.**
- **`Get-NetIPConfiguration` this is `ipconfig -all`**

## Real-Time System Analysis

- **`Get-Process`  provides a detailed view of all currently running processes, including CPU and memory usage, making it a powerful tool for monitoring and troubleshooting.**

- **`Get-Service allows the retrieval of information about the status of services on the machine,** such as which services are running, stopped, or paused. It is used extensively in troubleshooting by system administrators, but also by *forensics analysts hunting for anomalous services installed on the system.*

- **`Get-NetTCPConnection` displays current TCP connections, giving insights into both local and remote endpoints.** This cmdlet is particularly handy during an incident response or malware analysis task, as it can uncover hidden backdoors or established connections towards an attacker-controlled server.

- **`Get-FileHash` as a useful cmdlet for generating file hashes,** which is particularly valuable in incident response, threat hunting, and malware analysis, as it helps verify file integrity and detect potential tampering.

These cmdlets collectively provide a comprehensive set of tools for real-time system monitoring and analysis, proving especially useful to incident responders and threat hunters. This is more like the `netstat`sets we saw in wcli.

## Scripting:
Scripting is the process of writing and executing a series of commands contained in a text file, known as a script, to automate tasks that one would generally perform manually in a shell, like PowerShell.

scripting is like giving a computer a to-do list, where each line in the script is a task that the computer will carry out automatically. This saves time, reduces the chance of errors, and allows to perform tasks that are too complex or tedious to do manually.

Why too important?:
For blue team PowerShell scripts can automate many different tasks, including log analysis, detecting anomalies, and extracting indicators of compromise (IOCs). These scripts can also be used to reverse-engineer malicious code (malware) or automate the scanning of systems for signs of intrusion.

For the red team PowerShell scripts can automate tasks like system enumeration, executing remote commands, and crafting obfuscated scripts to bypass defences. Its deep integration with all types of systems makes it a powerful tool for simulating attacks and testing systems’ resilience against real-world threats.

system administrators benefit from PowerShell scripting for automating integrity checks, managing system configurations, and securing networks, especially in remote or large-scale environments. PowerShell scripts can be designed to enforce security policies, monitor systems health, and respond automatically to security incidents, thus enhancing the overall security posture.

### Invoke-Command
Invoke-Command is essential for executing commands on remote systems, making it fundamental for system administrators, security engineers and penetration testers.

Invoke-Command enables efficient remote management and—combining it with scripting—automation of tasks across multiple machines. It can also be used to execute payloads or commands on target systems during an engagement by penetration testers—or attackers alike.

by appending the -ScriptBlock { ... } parameter to the cmdlet's syntax, we can execute any command (or sequence of commands) on the remote computer. The result would be the same as if we were typing the commands in a local PowerShell session on the remote computer itself.
    Invoke-Command -ComputerName RoyalFortune -ScriptBlock { Get-Service }
    RoyalFortune is computer's name.

