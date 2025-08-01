# Day 11 25th july 2025

# Microsoft system

Just like how we explore linux we will explore microsoft system.

# Windows Fundamentals 1

Current version is ver.11.

We all use windows in our day to day life and in most of the cooperate world uses it.


It is an easy target for the attackers.

## File system:

It uses **NTFS(new technology file system).**
Before NTFS it was FAT16/FAT32 and HPFS.

You still see FAT partitions in use today. For example, you typically see FAT partitions in USB devices, MicroSD cards, etc.

NTFS is known as a journaling file system. *In case of a failure, the file system can automatically repair the folders/files on disk using information stored in a log file.* This function is not possible with FAT.   

NTFS addresses many of the limitations of the previous file systems; such as: 
    Supports files larger than 4GB
    Set specific permissions on folders and files
    Folder and file compression
    Encryption ( Encryption File System or EFS )

On NTFS volumes, *you can set permissions that grant or deny access to files and folders.*
The permissions are:

    Full control
    Modify
    Read & Execute
    List folder contents
    Read
    Write

NTFS gives you **Alternate Data Streams ( ADS ).**
Alternate Data Streams  (ADS) is a file attribute specific to Windows  NTFS.

Every file has at least one data stream ( $DATA ), and *ADS allows files to contain more than one stream of data.* Natively Window Explorer doesn't display ADS to the user. There are 3rd party executables that can be used to view this data, but Powershell gives you the ability to view ADS for files.

From a security perspective, malware writers have used ADS to hide data.

Not all its uses are malicious. For example, when you download a file from the Internet, there are identifiers written to ADS to identify that the file was downloaded from the Internet.

## Windows folder:

The Windows folder **( C:\Windows )** is traditionally known as the folder which contains the Windows operating system. 

The folder doesn't have to reside in the C drive necessarily. It can reside in any other drive and technically can reside in a different folder. 
This is where the environmental variables comes in play.
The **system environment variable** for the Windows directory is %windir% . 

The System32 folder holds the important files that are critical for the operating system.

You should proceed with extreme caution when interacting with the **system32** folder. Accidentally deleting any files or folders within System32 can render the Windows OS inoperational.

## User Account Control

- Majority of home windows users are logged in as local administors.
- A user doesn't need to run with high (elevated) privileges on the system to run tasks that don't require such privileges.
- This elevated privilege increases the risk of system compromise because it makes it easier for malware to infect the system. Consequently, since the user account can make changes to the system, the malware would run in the context of the logged-in user.
- To protect the local user with such privileges, Microsoft introduced User Account Control (UAC). 
- When a user with an account type of administrator logs into a system, the current session doesn't run with elevated permissions. When an operation requiring higher-level privileges needs to execute, the user will be prompted to confirm if they permit the operation to run. 
- This are those prompts that pops up when use try to download something and the windows asks yes or no.

## Settings and control panel

**Control Panel** is the menu where you will access more complex settings and *perform more complex actions.*

**settings** day to day changes. Easy for non technical users.

## Task manager

- This `top` for windows
- The Task Manager provides information about the applications and processes currently running on the system. Other information is also available, such as how much CPU and RAM are being utilized, which falls under Performance. 

# Windows Fundamentals 2

## System Configuration

- The System Configuration utility **(MSConfig)** is for advanced troubleshooting, and its main purpose is to help diagnose startup issues. 
- You need local administrator rights to open this utility.
- This utility has 5 tabs:
    - **General:** we can select what devices and services for Windows to load upon boot. The options are: Normal, Diagnostic, or Selective. 
    - **Boot:** we can define various boot options for the Operating System. 
    - **Service:** lists all services configured for the system regardless of their state (running or stopped). A service is a special type of application that runs in the background.  
    - **Startup:** Nothing to see here. This will tell you to open task manager and see startup option there.
    - **tool:** we can run to configure the operating system further.

## Change UAC Settings:

You can change your or anyone else UAC(User Account Control) settings. *If you gain access of someone's account and lower this to "not recommended" that will be a jackpot. Because now you can download/change whatever you want at core level without getting caught by the user.*

You will find this setting **in tool section of msconfig**.

## Computer management:

You can access this with **`compmgmt` or in the tool section of msconfig.**

three primary sections: 
    - **System Tools**
        - **Task scheduler:** 
            - This is crontab of windows. We can create and manage common tasks that our computer will carry out automatically at the times we specify.
            - A task can be like opening a application or running script. 
            - This can be run at the log in, log out or at any time while you are doing your work in the frontend.
            - As many time you want, every 5 mins ok!

        - **Event viewer:** 
            - You can see event that have occurred on the computer. 
            - This is close enough to logs of linux.
            - These records of events can be seen as an audit trail that can be used to understand the activity of the computer system. 
            - This information is often used to diagnose problems and investigate actions executed on the system. 
            - Event viewer has 3 more panels:
                1. The pane on the left provides a hierarchical tree listing of the event log providers.
                2. The pane in the middle will display a general overview and summary of the events specific to a selected provider.
                    - The standard logs are visible under Windows Logs.
                3. The pane on the right is the actions pane.
        - **Shared folder**: Here you will see a complete list of shares and folders shared that others can connect to. 
            As with any object in Windows, you can right-click on a folder to view its properties, such as Permissions (who can access the shared resource). 
            **Session**: you will see a list of users who are currently connected to the shares.
            All the folders and/or files that the connected users access will list under Open Files.
        - **In Performance**, you'll see a utility called Performance Monitor (perfmon).
        - Perfmon is used to view performance data either in real-time or from a log file. 
        - This utility is useful for troubleshooting performance issues on a computer system, whether local or remote. 

        - **Device Manager** allows us to view and configure the hardware, such as disabling any hardware attached to the computer.

    - **Storage**
        - Under Storage is Windows Server Backup and Disk Management. We'll only look at Disk Management in this room.
        - Disk Management is a system utility in Windows that enables you to perform advanced storage tasks.  Some tasks are:
            Set up a new drive
            Extend a partition
            Shrink a partition
            Assign or change a drive letter (ex. E:) 

    - Services and Applications.
         - a service is a special type of application that runs in the background. Here you can do more than enable and disable a service, such as view the Properties for the service. 
         - WMI Control configures and controls the Windows Management Instrumentation (WMI) service.

## System Information

- use `msinfo32` to access to it.
- This tool gathers information about your computer and displays a comprehensive view of your hardware, system components, and software environment, which you can use to diagnose computer issues.
- There are 3 sections in it:
    - [Hardware Resources](https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/hardware-resources) This is not for normal users.
    - **Components:** you can see specific information about the hardware devices installed on the computer.
    - **Software Environment:** you can see information about software baked into the operating system and software you have installed. Other details are visible in this section as well, such as the Environment Variables and Network Connections. 
        - Environment variables store information about the operating system environment. This information includes details such as the operating system path, the number of processors used by the operating system, and the location of temporary folders.
        -  For example, the WINDIR environment variable contains the location of the Windows installation directory. Programs can query the value of this variable to determine where Windows operating system files are located.
- System Summary will display general technical specifications for the computer, such as processor brand and model.

## Resource monitor

- Access with **`resmon`.**
- *Resource Monitor displays per-process and aggregate CPU, memory, disk, and network usage information,* in addition to providing details about which processes are using individual file handles and modules.
- Advanced filtering allows users to isolate the data related to one or more processes (either applications or services), start, stop, pause, and resume services, and close unresponsive applications from the user interface.
- It also includes a process analysis feature that can help identify deadlocked processes and file locking conflicts so that the user can attempt to resolve the conflict instead of closing an application and potentially losing data.
- this utility is geared primarily to advanced users who need to perform advanced troubleshooting on the computer system.
- Resmon has four sections:
    1. CPU
    2. Disk
    3. Network
    4. Memory

## Command Prompt
- When the GUI (graphical user interface) was introduced, it allowed users to perform complex tasks with a few clicks of a button instead of entering commands in the command prompt. 
### Useful commands:
- `whoami` to know who are you
- `hostname` output computer's name
- `ipconfig` to know your current ip
- `/?` this `man` of windows. E.g. `ipconfig /?` will show you the manual.
- `cls` to clear the command screen.
- `netstat`Per the help manual, this command will display protocol statistics and current TCP/IP network connections. It has different useful parameters. `ss` in linux
- `net` If you type net without a sub-command, the output will show the syntax for the root command showing a few of the sub-commands you can use.
    - `/?` this will not work for`net` you have to use `nethelp`.
    -  if you wish to see the help information for net user , the command is net help user.
- this is a list of cmds, [cmdsList](https://ss64.com/nt/).

## Registry Editor

- In `msconfig` tools section at the end you will see registry editor.
- Is a central hierarchical database used to store information necessary to configure the system for one or more users, applications, and hardware devices.
- The registry contains information that Windows continually references during operation, such as:
    - Profiles for each user
    - Applications installed on the computer and the types of documents that each can create
    - Property sheet settings for folders and application icons
    - What hardware exists on the system
    - The ports that are being used.

- Warning: The registry is for advanced computer users. Making changes to the registry can affect normal computer operations. Meaning you move a small stone and the whole generation is gone.

- Use `regedit` to make the whole generation disappear. PS. I broke that remote computer from hackthebox

# Windows Fundamentals 3
## Windows updates
- Windows Update is a service provided by Microsoft to provide security updates, feature enhancements, and patches for the Windows operating system and other Microsoft products, such as Microsoft Defender. 
- Updates are typically released on the 2nd Tuesday of each month. This day is called Patch Tuesday. 
- That doesn't necessarily mean that a critical update/patch has to wait for the next Patch Tuesday to be released. If the update is urgent, then Microsoft will push the update via the Windows Update service to the Windows devices.
- Another way to access Windows Update is from the Run dialog box, or CMD, by running the command control /name Microsoft.WindowsUpdate.

## Windows security
- Windows Security is your home to manage the tools that protect your device and your data.
-  Protection areas.
    - Virus & threat protection
    - Firewall & network protection
    - App & browser control
    - Device security

-a quick comment on the status icons.
    - Green means your device is sufficiently protected, and there aren't any recommended actions.
    - Yellow means there is a safety recommendation for you to review.
    - Red is a warning that something needs your immediate attention.

## Virus & threat protection:
- there are 2 parts in this: 
    Current threats
    Virus & threat protection settings

### Current threats
- Scan options:
    - Quick scan - Checks folders in your system where threats are commonly found.
    - Full scan - Checks all files and running programs on your hard disk. This scan could take longer than one hour.
    - Custom scan - Choose which files and locations you want to check.

- Threat history:
    - Last scan - Windows Defender Antivirus automatically scans your device for viruses and other threats to help keep it safe.
    - Quarantined threats - Quarantined threats have been isolated and prevented from running on your device. They will be periodically removed.
    - Allowed threats - Allowed threats are items identified as threats, which you allowed to run on your device. 

Warning: Allow an item to run that has been identified as a threat only if you are 100% sure of what you are doing. 

### Virus & threat protection settings
Manage settings:
    - Real-time protection - Locates and stops malware from installing or running on your device.
    - Cloud-delivered protection - Provides increased and faster protection with access to the latest protection data in the cloud.
    - Automatic sample submission - Send sample files to Microsoft to help protect you and others from potential threats. 
    - Controlled folder access - Protect files, folders, and memory areas on your device from unauthorized changes by unfriendly applications.
    - Exclusions - Windows Defender Antivirus won't scan items that you've excluded.
    - Notifications - Windows Defender Antivirus will send notifications with critical information about the health and security of your device.

Warning: Excluded items could contain threats that make your device vulnerable. Only use this option if you are 100% sure of what you are doing. 

### Virus & threat protection updates
Check for updates - Manually check for updates to update Windows Defender Antivirus definitions.  

### Ransomware protection
Controlled folder access - Ransomware protection requires this feature to be enabled, which in turn requires Real-time protection to be enabled.

### You can perform on-demand scans on any file/folder by right-clicking the item and selecting 'Scan with Microsoft Defender'.

## Firewall & network protection:
Per Microsoft, "Traffic flows into and out of devices via what we call ports. A firewall is what controls what is - and more importantly isn't - allowed to pass through those ports. You can think of it like a security guard standing at the door, checking the ID of everything that tries to enter or exit".

Per Microsoft, "Windows Firewall offers three firewall profiles: domain, private and public".

    Domain - The domain profile applies to networks where the host system can authenticate to a domain controller. 
    Private - The private profile is a user-assigned profile and is used to designate private or home networks.
    Public - The default profile is the public profile, used to designate public networks such as Wi-Fi hotspots at coffee shops, airports, and other locations.

Warning: Unless you are 100% confident in what you are doing, it is recommended that you leave your Windows Defender Firewall enabled. 

**Command to open the Windows Defender Firewall is WF.msc**

## App & browser control:
Per Microsoft, "Microsoft Defender SmartScreen protects against phishing or malware websites and applications, and the downloading of potentially malicious files".

This is the thing that appears when you pirate a ren'py game and a alert pops up saying,"this is risky." And we still go for it.🥲

## Device security:
They say,"You'll probably never change any of these settings."(They don't know me).

### Core isolation
Memory Integrity - Prevents attacks from inserting malicious code into high-security processes.

Trusted Platform Module (TPM) technology is designed to provide **hardware-based, security-related functions.** A TPM chip is a secure crypto-processor that is designed to carry out cryptographic operations. The chip includes multiple physical security mechanisms to make it tamper-resistant, and malicious software is unable to tamper with the security functions of the TPM.

## Bitlocker
Per Microsoft, "BitLocker Drive Encryption is a data protection feature that integrates with the operating system and addresses the threats of data theft or exposure from lost, stolen, or inappropriately decommissioned computers".

With TPM this becomes gold.
The TPM is a hardware component installed in many newer computers by the computer manufacturers. It works with BitLocker to help protect user data and to ensure that a computer has not been tampered with while the system was offline".

## Volume Shadow Copy Service

The Volume Shadow Copy Service (VSS) coordinates the required actions to create a consistent shadow copy (also known as a snapshot or a point-in-time copy) of the data that is to be backed up.

Volume Shadow Copies are stored on the System Volume Information folder on each drive that has protection enabled.

If VSS is enabled (System Protection turned on), you can perform the following tasks from within advanced system settings. 

    Create a restore point
    Perform system restore
    Configure restore settings
    Delete restore points

**This is like a checkpoint for us**

*From a security perspective, malware writers know of this Windows feature and write code in their malware to look for these files and delete them. Doing so makes it impossible to recover from a ransomware attack unless you have an offline/off-site backup.* SMART. So to do this they have to turnoff other features first, meaning you have to first make a way through the whole system.

Attackers use built-in Windows tools and utilities in an attempt to go undetected within the victim environment.  This tactic is known as Living Off The Land.