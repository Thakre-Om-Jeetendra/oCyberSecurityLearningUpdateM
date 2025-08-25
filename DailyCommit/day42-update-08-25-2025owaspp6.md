# day 42 25th august 2025

# owasp top 10 2021 

## 4. Insecure Design

Vulnerability inherent to app's architechture.

These happens when you don't keep vulnerabilities that might effect in the future from the beginning.

Sometimes these happens because the developer wants to take shortcut while building the app and either do not test the app or disable security protocols for quick testing and forgets to turn them on again.

e.g. A dev may disable otp verification to make a qick and easy test resulting in ignoring minor security issues or forgetting to turn them on again.

One e.g. is instagram. Some time ago insta use to let user reset the password when you enter a 6 digit number that you get on your phone via sms or email.

It had a limit of 250 trys and after that it will block the request.

So if an attacker wants to change the password he must get it in 250 try but to a 6 digit number via brute force it might take a million trys.

Here is the catch someone found out that those 250 attempts were tied to 1 ip add. Meaning if the attacker changes his ip add after every 250 attempts he can crack it.

Well no doubt the app worked great and it was full of security that is why they did not find this on surface level. But once the attacker got on the start level he found this vulnerability. 

Well usually it is very difficult to handle this type of vulnerabilities You have to go to start and change it, check if the change in the beginning will change other things in the whole app and if there are now any new vulnerabilities after the new changes.

We call this precautions threat modelling, so later we do not find anything that will take a reset to whole app's code.

1000000/25 it might look imposible to use these many ips but we got cloud server that makes this easy.

## 5. Security misconfiguration

When security fails to work or configure the input properly.

When does this happens?:

- Poor configuration on the cloud server
- having unnecessary previlages available to see for the user on the front end.
- Default account with unchanged password.
- Error messages with over explaination. Attacker can catch the vulnerabilities present in the code.
- Not using https headers.

This vulnerability leds to different vulnerabilities like injections or cryptographic failure.

Remember in our web applications module we talked about how it is not recommended to leave the debugger for the audience. Well we have a case here.

In 2015 patreon was hacked and 5 days before a researcher reported the authorities that he found a debugging interface on werkzeng framework.

Werkzeng provides a web interface for web servers to execute python code. 

The debugger can be accessed via using `/console` in url. 

Note: weekzeng is a python based framework meaning using `$(ls -l)` won't work because that is inliner for bash.

We can use `import os; print(os.popen("ls -l").read())`  to list things.
breakdown: 

- Imports Python's os module, which provides functions for interacting with the operating system.

- os.popen("ls -l") - Opens a pipe to execute the shell command ls -l (which lists files in detailed format).

- .read() - Reads the output of that command.

- print() - Outputs the result.


## 6. Vulnerable and Outdated Components

lets say the target has not updated there service for a long time. And the service they are using has outdated long ago. They might haave some vulnerabilities. 

For example, let's say that a company hasn't updated their version of WordPress for a few years, and using a tool such as [WPScan](https://wpscan.com/), you find that it's version 4.6. 

Some quick research will reveal that WordPress 4.6 is vulnerable to an unauthenticated remote code execution(RCE) exploit, and even better, you can find an exploit already made on [Exploit-DB](https://www.exploit-db.com/exploits/41962).

As you can see, this would be quite devastating because it requires very little work on the attacker's part. 

Since the vulnerability is already well known, someone else has likely made an exploit for the vulnerability already. 

The situation worsens when you realise that it's really easy for this to happen. 

If a company misses a single update for a program they use, it could be vulnerable to any number of attacks.

