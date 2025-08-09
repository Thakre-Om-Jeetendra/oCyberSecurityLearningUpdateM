# DAY 26 09th august 2025

# John the Ripper: The Basics

John the Ripper is a well-known, well-loved, and versatile hash-cracking tool. **It combines a fast cracking speed with an extraordinary range of compatible hash types.**

Upon the completion of this room, you learn about using John for:
    Cracking Windows authentication hashes
    Crack /etc/shadow hashes
    Cracking password-protected Zip files
    Cracking password-protected RAR files
    Cracking SSH keys

## Basic Terms

We know what are hashes.

In computer science, P and NP are two classes of problems that help us understand the efficiency of algorithms:
    **P (Polynomial Time)**: Class P covers the problems whose solution can be found in polynomial time. Consider sorting a list in increasing order. The longer the list, the longer it would take to sort; however, the increase in time is not exponential.
    **NP (Non-deterministic Polynomial Time)**: Problems in the class NP are those for which a given solution can be checked quickly, even though finding the solution itself might be hard. In fact, we don’t know if there is a fast algorithm to find the solution in the first place.

The algorithm to hash the value will be “P” and can, therefore, be calculated reasonably. 
However, an “un-hashing” algorithm would be “NP” and intractable to solve, meaning that it cannot be computed in a reasonable time using standard computers.

### Where John Comes in

**Even though the algorithm is not feasibly reversible, that doesn’t mean cracking the hashes is impossible.**
If you have the hashed version of a password, for example, and you know the hashing algorithm, you can use that hashing algorithm to hash a large number of words, called a dictionary. 
You can then compare these hashes to the one you’re trying to crack to see if they match. 
If they do, you know what word corresponds to that hash- you’ve cracked it!

This process is called a **dictionary attack**, and John the Ripper, or John as it’s commonly shortened, is a tool for conducting fast brute force attacks on various hash types.

**"Jumbo John"** the most popular version of John The Ripper.


## Cracking Basic Hashes

### John Basic Syntax

`john [options] [file path]`

john: Invokes the John the Ripper program
[options]: Specifies the options you want to use
[file path]: The file containing the hash you’re trying to crack; if it’s in the same directory, you won’t need to name a path, just the file.


### Automatic Cracking

John has built-in features to detect what type of hash it’s being given and to select appropriate rules and formats to crack it for you; **this isn’t always the best idea as it can be unreliable,** but if you can’t identify what hash type you’re working with and want to try cracking it, it can be a good option! To do this, we use the following syntax:
`john --wordlist=[path to wordlist] [path to file]`
    --wordlist=: Specifies using wordlist mode, reading from the file that you supply in the provided path
    [path to wordlist]: The path to the wordlist you’re using, as described in the previous task

Example Usage:

`john --wordlist=/usr/share/wordlists/rockyou.txt hash_to_crack.txt`


### Identifying Hashes

We got hash.com for this task.

ALso a tool called [hash-identifier](https://gitlab.com/kalilinux/packages/hash-identifier/-/tree/kali/master), a Python tool that is super easy to use and will tell you what different types of hashes the one you enter is likely to be, giving you more options if the first one fails.

To use hash-identifier, you can use **wget** or curl to download the Python file hash-id.py from its GitLab page. 
Then, launch it with python3 hash-id.py and **enter the hash** you’re trying to identify. *It will give you a list of the most probable formats.*

```
~bash
wget https://gitlab.com/kalilinux/packages/hash-identifier/-/raw/kali/master/hash-id.py
$ python3 hash-id.py

```

### Format-Specific Cracking

Once you have identified the hash that you’re dealing with, you can tell John to use it while cracking the provided hash using the following syntax:

`john --format=[format] --wordlist=[path to wordlist] [path to file]`

--format=: This is the flag to tell John that you’re giving it a hash of a specific format and to use the following format to crack it
[format]: The format that the hash is in
Example Usage:

`john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt hash_to_crack.txt`

### A Note on Formats:

When you tell John to use formats, if you’re dealing with a **standard hash type**, e.g. md5 as in the example above, you have to prefix it with `raw-` to tell John you’re just dealing with a standard hash type, though this doesn’t always apply.

*To check if you need to add the prefix or not,* you can list all of John’s formats using **`john --list=formats`** and either check manually or grep for your hash type using something like john `--list=formats | grep -iF "md5"`.


## Cracking Windows Authentication Hashes

Authentication hashes are the hashed versions of passwords stored by operating systems; it is sometimes possible to crack them using our **brute-force methods.**

To get your hands on these hashes, you must often already be a **privileged user.**

### NTHash / NTLM

NThash is the *hash format modern Windows* operating system machines use to store user and service passwords.

In Windows, **SAM (Security Account Manager)** is used to store user account information, including usernames and hashed passwords. 

You can acquire NTHash/NTLM hashes by dumping the SAM database on a Windows machine, using a tool like **Mimikatz**, or using the Active Directory database: **NTDS.dit**. 

You may not have to crack the hash to continue privilege escalation, as you can often conduct a **“pass the hash” attack** instead, but sometimes, hash cracking is a viable option if there is a weak password policy.

You can let the `wordlist=` empty if you do not have a specific preference.


## Cracking /etc/shadow Hashes

### Cracking Hashes from /etc/shadow

The /etc/shadow file is the file on Linux machines where password hashes are stored. 

It also stores other information, such as the date of last password change and password expiration information.

This file is usually only accessible by the **root user**, so you must have sufficient privileges to access the hashes. 

However, if you do, there is a chance that you will be able to crack some of the hashes.

### Unshadowing

John can be very particular about the formats *it needs data in to be able to work with it;* for this reason, to crack /etc/shadow passwords, you must combine it with the /etc/passwd file for John to understand the data it’s being given. To do this, we use a tool built into the John suite of tools called unshadow. The basic syntax of unshadow is as follows: 

unshadow [path to passwd] [path to shadow]

unshadow: Invokes the unshadow tool
[path to passwd]: The file that contains the copy of the /etc/passwd file you’ve taken from the target machine
[path to shadow]: The file that contains the copy of the /etc/shadow file you’ve taken from the target machine
Example Usage:

`unshadow local_passwd local_shadow > unshadowed.txt`


We can then feed the output from unshadow, in our example use case called unshadowed.txt, directly into John. 

We should not need to specify a mode here as we have made the input specifically for John; however, in some cases, you will need to specify the format as we have done previously using: `--format=sha512crypt`

`john --wordlist=/usr/share/wordlists/rockyou.txt --format=sha512crypt unshadowed.txt`


shadows stores the hashes, password, etc.
passwd stores the user info like name, comments, etc.


## Single Crack Mode

John also has another mode, called the Single Crack mode. In this mode, John uses only the information provided in the username to try and work out possible passwords heuristically by **slightly changing the letters and numbers contained within the username.**

### Word Mangling

The best way to explain Single Crack mode and word mangling is to go through an example:

Consider the username “Markus”.

Some possible passwords could be:

Markus1, Markus2, Markus3 (etc.)
MArkus, MARkus, MARKus (etc.)
Markus!, Markus$, Markus* (etc.)

### GECOS

GECOS stands for General Electric Comprehensive Operating System.

John’s implementation of word mangling also features compatibility with the GECOS field of the UNIX operating system, as well as other UNIX-like operating systems such as Linux

Looking closely, you will notice that the fields are separated by a colon :. The fifth field in the user account record is the GECOS field. **It stores general information about the user, such as the user’s full name, office number, and telephone number, among other things.** 

John can take information stored in those records, such as full name and home directory name, to add to the wordlist it generates when cracking /etc/shadow hashes with single crack mode.


### Using Single Crack Mode

`john --single --format=[format] [path to file]`

--single: This flag lets John know you want to use the single hash-cracking mode
--format=[format]: As always, it is vital to identify the proper format.
Example Usage:

`john --single --format=raw-sha256 hashes.txt`

### A Note on File Formats in Single Crack Mode:

If you’re cracking hashes in single crack mode, you need to change the file format that you’re feeding John for it to understand what data to create a wordlist from. 
**You do this by prepending the hash with the username that the hash belongs to, so according to the above example, we would change the file hashes.txt**

From 1efee03cdcb96d90ad48ccc7b8666033

To mike:1efee03cdcb96d90ad48ccc7b8666033

use nano to add "user:".


## Custom Rules

Polopassword1!

Consider the password with a capital letter first and a number followed by a symbol at the end. 

This familiar pattern of the password, appended and prepended by modifiers (such as capital letters or symbols), is a memorable pattern that people use and reuse when creating passwords. 

**This pattern can let us exploit password complexity predictability.**

Now, this does meet the password complexity requirements; however, as attackers, we can exploit the fact that we know the likely position of these added elements to create dynamic passwords from our wordlists.


### How to create Custom Rules

[JtR-custom](https://www.openwall.com/john/doc/RULES.shtml) here is the wiki of modifiers.

The first line:

[List.Rules:THMRules] is used to define the name of your rule; this is what you will use to call your custom rule a John argument.

We then use a regex style pattern match to define where the word will be modified; again, we will only cover the primary and most common modifiers here:

Az: Takes the word and appends it with the characters you define
A0: Takes the word and prepends it with the characters you define
c: Capitalises the character positionally
These can be used in combination to define where and what in the word you want to modify.

Lastly, we must define what characters should be appended, prepended or otherwise included. We do this by adding character sets in square brackets [ ] where they should be used. These follow the modifier patterns inside double quotes " ". Here are some common examples:

[0-9]: Will include numbers 0-9
[0]: Will include only the number 0
[A-z]: Will include both upper and lowercase
[A-Z]: Will include only uppercase letters
[a-z]: Will include only lowercase letters
Please note that:

[a]: Will include only a
[!£$%@]: Will include the symbols !, £, $, %, and @
Putting this all together, to generate a wordlist from the rules that would match the example password Polopassword1! (assuming the word polopassword was in our wordlist), we would create a rule entry that looks like this:

[List.Rules:PoloPassword] 

cAz"[0-9] [!£$%@]"

Utilises the following:

c: Capitalises the first letter
Az: Appends to the end of the word
[0-9]: A number in the range 0-9
[!£$%@]: The password is followed by one of these symbols


### Using Custom Rules

We could then call this custom rule a John argument using the  `--rule=PoloPassword flag.`

As a full command: 
`john --wordlist=[path to wordlist] --rule=PoloPassword [path to file]`

Jumbo John already has an extensive list of custom rules containing modifiers for use in almost all cases. If you get stuck, try looking at those rules [around line 678] if your syntax isn’t working correctly.


## Cracking Password Protected Zip Files

Similarly to the unshadow tool we used previously, we will use the **zip2john** tool to *convert the Zip file into a hash format that John can understand and hopefully crack.* The primary usage is like this:

zip2john [options] [zip file] > [output file]

[options]: Allows you to pass specific checksum options to zip2john; **this shouldn’t often be necessary**
[zip file]: The path to the Zip file you wish to get the hash of.
>: This redirects the output from this command to another file.
[output file]: This is the file that will store the output.
Example Usage

`zip2john zipfile.zip > zip_hash.txt`

### Cracking

We’re then able to take the file we output from zip2john in our example use case, zip_hash.txt, and, as we did with unshadow, feed it directly into John as we have made the input specifically for it.

john --wordlist=/usr/share/wordlists/rockyou.txt zip_hash.txt

use `unzip <zip_file>` to view the content, and you know the pass.

## Cracking Password-Protected RAR Archives

RAR archives are compressed files created by the WinRAR archive manager. Like Zip files, they compress folders and files. We can do the same with it like the previous zip file.

Almost identical to the zip2john tool, we will use the **rar2john** tool to convert the RAR file into a hash format that John can understand. The basic syntax is as follows:

rar2john [rar file] > [output file]

rar2john: Invokes the rar2john tool
[rar file]: The path to the RAR file you wish to get the hash of
>: This redirects the output of this command to another file
[output file]: This is the file that will store the output from the command
Example Usage

/opt/john/rar2john rarfile.rar > rar_hash.txt


### Cracking

Once again, we can take the file we output from rar2john in our example use case, rar_hash.txt, and feed it directly into John as we did with zip2john.

`john --wordlist=/usr/share/wordlists/rockyou.txt rar_hash.txt`

use `unrar x <rar file name>`

## Cracking SSH Keys with John

using John to crack the SSH private key password of id_rsa files. 

Unless configured otherwise, you authenticate your SSH login using a password. 

However, you can configure key-based authentication, which lets you use your private key, id_rsa, as an authentication key to log in to a remote machine over SSH. 

However, doing so will often require a password to access the private key; 

**ssh2john** converts the id_rsa private key, which is used to log in to the SSH session, into a hash format that John can work with. 

Jokes aside, it’s another beautiful example of John’s versatility. The syntax is about what you’d expect. 

Note that if you don’t have ssh2john installed, you can use ssh2john.py, located in the /opt/john/ssh2john.py. If you’re doing this on the AttackBox, replace the ssh2john command with python3 /opt/john/ssh2john.py or on Kali, python /usr/share/john/ssh2john.py.

`ssh2john [id_rsa private key file] > [output file]`

ssh2john: Invokes the ssh2john tool
[id_rsa private key file]: The path to the id_rsa file you wish to get the hash of
>: This is the output director. We’re using it to redirect the output from this command to another file.
[output file]: This is the file that will store the output from

Example Usage:

/opt/john/ssh2john.py id_rsa > id_rsa_hash.txt

Cracking
For the final time, we’re feeding the file we output from ssh2john, which in our example use case is called id_rsa_hash.txt and, as we did with rar2john, we can use this seamlessly with John:

john --wordlist=/usr/share/wordlists/rockyou.txt id_rsa_hash.txt


ok no need to specify the formate if nothing matches. just  like above example.
