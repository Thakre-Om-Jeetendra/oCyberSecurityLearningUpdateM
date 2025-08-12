# Day 28 11th august 2025

# Metasploit: Introduction

Metasploit is a powerful tool that can support all phases of a penetration testing engagement, from **information gathering to post-exploitation.**

pro version provides GUI. Open source does not.

The Metasploit Framework is a set of tools that allow information gathering, scanning, exploitation, exploit development, post-exploitation, and more.

While the *primary* usage of the Metasploit Framework focuses on the **penetration testing domain,** it is also useful for vulnerability research and exploit development.


## Main Components of Metasploit

Go to terminal and type `msfconsole`.

a few recurring concepts: vulnerability, exploit, and payload:

**Exploit**: *A piece of code to enter* that uses a vulnerability present on the target system.

**Vulnerability**: A design, coding, or logic *flaw affecting the target system.* The exploitation of a vulnerability can result in disclosing confidential information or allowing the attacker to execute code on the target system.

**Payload**: An exploit will take advantage of a vulnerability. However, if we want the exploit to have the result we want (gaining access to the target system, read confidential information, etc.), we need to use a payload. *Payloads are the code that will run on the target system.*

### Auxiliary
Any supporting module, such as scanners, crawlers and fuzzers, can be found here.

### Encoders
Encoders will allow you to **encode the exploit and payload** in the **hope** that a signature-based *antivirus solution may miss them.*

Signature-based antivirus and security solutions have a database of known threats. 
They detect threats by comparing suspicious files to this database and raise an alert if there is a match. 
Thus encoders can have a limited success rate as antivirus solutions can perform additional checks.

### Evasion
While encoders will encode the payload, they should not be considered a direct attempt to evade antivirus software.

On the other hand, “evasion” modules will **try that, with more or less success.**
IN REAL WORLD USE BOTH EVASION AND ENCODERS

### Exploits
Exploits, neatly organized by target system.

### NOPs
A lot of time when we are expoliting on a target system we are interracting with **targer's memory.**
If we mess up little bit it will shutdown that system and crash it.
**NOP makes it easier to interact with that memory.** It makes the area we are exploring broader. 
**They tell the computer to do nothing when we enter and mess around. Note we are not the good person**
It stacks up "do nothing (xn)" and now computer has a small memory gap where we can jump in now without triggering the system we can work the exploit.

### payloads

Again expolit helps us to get in but payloads helps us to run the desire commands. Like starting a calculator, any other app, etc. 

Running command on the target system is already an important step but having an interactive connection that allows you to type commands that will be executed on the target system is better. 
Such an interactive command line is called a "shell". Metasploit offers the ability to send different payloads that can open shells on the target system.

four different directories under payloads: adapters, singles, stagers and stages:

**1. Adapters**: An adapter wraps single payloads to convert them into different formats. For example, a normal single payload can be wrapped inside a Powershell adapter, which will make a single powershell command that will execute the payload.
**This is going to apdate the payload. It will formate it.**

**2. Singles**: Self-contained payloads (add user, launch notepad.exe, etc.) that **do not need (anthing) to download an additional component to run.**

**3. Stagers**: **Responsible for setting up a connection channel between Metasploit and the target system.** Useful when working with staged payloads. “Staged payloads” will first upload a stager on the target system then download the rest of the payload (stage). This provides some advantages as the initial size of the payload will be relatively small compared to the full payload sent at once.

**4. Stages**: *Downloaded by the stager. This will allow you to use larger sized payloads.*

Metasploit has a subtle way to help you identify **single (also called “inline”**) payloads and staged payloads.

generic/shell_reverse_tcp
windows/x64/shell/reverse_tcp

Both are reverse Windows shells. 
The former is an inline (or *single) payload, as indicated by the **“_”** between “shell” and “reverse”.*
While the latter is a *staged payload, as indicated by the “/” between “shell” and “reverse”.*

### Post
Post modules will be useful on the **final stage** of the penetration testing process listed above, **post-exploitation.**

## Msfconsole

Type `msfconsole` in the terminal.
It will open a command line starting "msf6".

use ls for you know listing.
ping google to see connection. Follow it with -c 3 or use ^c to stop the infinite one.

clear to clear the screen. **Most of the linux commands will work.**

Use `help set` it will show you some common syntaxes.
use `histroy` to know your command histroy.

It also support auto complete.

**Msfconsole is managed by context; this means that unless set as a global variable, all parameter settings will be lost if you change the module you have decided to use.** 

In the example below, we have used the ms17_010_eternalblue exploit, and we have set parameters such as `RHOSTS`. 
If we were to switch to another module (e.g. a port scanner), we would need to **set the RHOSTS value again** as all changes we have made remained in the context of the ms17_010_eternalblue exploit. 

use `exploit/windows/smb/ms17_010_eternalblue` command, you will see the command line prompt change from msf6 to “msf6 exploit(windows/smb/ms17_010_eternalblue)”. 

The "EternalBlue" is an exploit allegedly developed by the U.S. National Security Agency **(N.S.A.)** for a vulnerability affecting the SMBv1 server on numerous Windows systems. 
*The SMB (Server Message Block) is widely used in Windows networks for file sharing and even for sending files to printers.*

EternalBlue was leaked by the cybercriminal group "Shadow Brokers" in April 2017. In May 2017, this vulnerability was exploited worldwide in the WannaCry ransomware attack.

The module to be used can also be selected with the use command followed by the number at the beginning of the search result line.

Using `show option` **will print options related to the exploit** we have chosen earlier.

On the other hand, a post-exploitation module may only need us to set a **SESSION ID.**
A session is an existing connection to the target system that the post-exploitation module will use.

The `show` command can be used in any context followed by a module type (auxiliary, payload, exploit, etc.) to list available modules.

instead of `cd` we use `back`.
Further information on any module can be obtained by typing the `info` command within its context.

### Search

One of the most useful commands in msfconsole is search.

This command will search the Metasploit Framework database for modules relevant to the given search parameter. 

You can conduct searches using CVE numbers, exploit names (eternalblue, heartbleed, etc.), or target system.

You may notice the “name” column already gives more information than just the module name. 

You can see the type of module (auxiliary, exploit, etc.) and the category of the module (scanner, admin, windows, Unix, etc.). 

You can use any module returned in a search result with the command use followed by the number at the beginning of the result line. **(e.g. use 0 instead of use auxiliary/admin/smb/ms17_010_command)**

Another essential piece of information returned is in the “rank” column. Exploits are rated based on their reliability. [hEREareRanks](https://docs.metasploit.com/docs/using-metasploit/intermediate/exploit-ranking.html)


`search type:auxiliary telnet` using type will only include the specific type.

Please remember that exploits take advantage of a vulnerability on the target system and may always show unexpected behavior.

*A low-ranking exploit may work perfectly, and an excellent ranked exploit may not, or worse, crash the target system.*


## Working with modules

`use <modulename>` will work like help once you decide just type the name of that module in the termial.

**The Meterpreter prompt**: **This means a Meterpreter agent was loaded to the target system and connected back to you.** You can use Meterpreter specific commands here.

**A shell on the target system:** Once the exploit is completed, you may have access to a command shell on the target system. 
This is a regular command line, and all commands typed here run on the target system.

As mentioned earlier, the `show options` command will list all available *parameters.*

some of these parameters require a value for the exploit to work. 

Some required parameter values will be pre-populated, make sure you check if these should remain the same for your target. 

*For example, a web exploit could have an RPORT (remote port: the port on the target system Metasploit will try to connect to and run the exploit) value preset to 80, but your target web application could be using port 8080.*

we will set the **RHOSTS** parameter to the **IP address of our target system** using the set command. so, `set rhosts <ip>`.

You can also use a file where targets are listed, one target per line using file:/path/of/the/target_file.txt.

**RPORT**: “Remote port”, the port on the target system the vulnerable application is running on.

**PAYLOAD**: The payload you will use with the exploit.

**LHOST**: “Localhost”, the attacking machine (your AttackBox or Kali Linux) IP address.

**LPORT**: “Local port”, the port you will use for the reverse shell to connect back to. This is a port on your attacking machine, and you can set it to any port not used by any other application.

**SESSION**: Each connection established to the target system using Metasploit will have a session ID. You will use this with post-exploitation modules that will connect to the target system using an existing connection.

**You can override any `set` parameter using the `set` command again with a different value.** 
You can also clear any parameter value using the unset command or clear all set parameters with the *`unset all`* command.

You can use the `setg` command to set values that will be used for all modules. **This is set global.**
`unsetg` will do what `unset all` does.

Once all module parameters are set, you can **launch** the module using the `exploit` command. 
Metasploit also **supports the `run` command**, which is an alias created for the exploit command as the word exploit did not make sense when using modules that were not exploits (port scanners, vulnerability scanners, etc.).

The exploit command can be used without any parameters or using the “-z” parameter.

The exploit **-z** command will run the exploit and background the session as soon as it opens.

**Some modules support the `check` option. This will check if the target system is vulnerable without exploiting it.**

**You can use the `background` command or `ctrl+z` to background the session prompt and go back to the msfconsole prompt.**

Again `sessions` can be used to see the session.

To interact with any session, you can use the **sessions -i command followed by the desired session number.** e.g. `sessions -i 2` will play the 2nd option.









