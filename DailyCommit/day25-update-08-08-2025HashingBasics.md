# DAY 25 08 august 2025

# Hashing Basics

you just downloaded a 6 GB file and want to knOw whether the copy you downloaded is identical to the original file, bit for bit.

Or if a good Samaritan handed you this 6 GB file on a USB memory drive, how can you be sure it is identical to the file you want to download?

The answer to both of the above questions lies in **comparing the hash values of the two files; if two hash values are equal, you can say with very high certainty that the two files are identical.**

**A hash value is a fixed-size string or characters that is computed by a hash function.** A hash function takes an input of an arbitrary size and returns an output of fixed length, i.e., a hash value. 

you will learn about:

Hash functions and collisions
The role of hashing in authentication systems
Recognizing stored hash values
Cracking hash values
The use of hashing for integrity protection

## Hash Functions

Hash functions are different from encryption. 

**There is no key, and it’s meant to be impossible (or computationally impractical) to go from the output back to the input.**

A hash function takes some input data of any size and creates a summary or digest of that data. 

The output has a fixed size. 

It’s hard to predict the output for any input and vice versa. 

Good hashing algorithms will be relatively fast to compute and prohibitively slow to reverse, i.e., go from the output and determine the input. 

Any slight change in the input data, even a single bit, should cause a significant change in the output

Example: If you store T and U in 2 different files and get their hash value both will be completely different even if they are just a number apart in binary.

To know the file content in binary use **`hashdump -c <filename>`**

using ` md5sum <filename>`, `sha1sum <filename>`, `sha256sum <filename>`, and `sha512sum <filename>` will give you the hash. REMEMBER TO ADD `SUM` AFTER THE NAME OF THE ALGORITM.

### Why is Hashing Important?

Hashing helps protect data’s integrity and ensure password confidentiality.

When you try to log into some website the server uses hashing to verify your password. 
**In fact, as per good security practices, a server does not record your password; it records the hash value of your password.** 
Whenever you want to log in, it will calculate the hash value of the password you submitted with the recorded hash value. 

Same with you login into a computer. The device will take ypour pass convert it to a hash and compare it with the stored hash and then decides.

### What’s a Hash Collision

**A hash collision is when two different inputs give the same output.**
Hash functions are designed to avoid collisions as best as possible. 
**Furthermore, hash functions are designed to prevent an attacker from being able to create, i.e., engineer, a collision intentionally.**
However, because the number of inputs is practically unlimited and the number of possible outputs is limited, this leads to a pigeonhole effect.

The pigeonhole effect states that the number of items (pigeons) is more than the number of containers (pigeonholes); some containers must hold more than one item.

MD5 and SHA1 have been attacked and are now considered insecure due to the ability to engineer hash collisions.

## Insecure Password Storage for Authentication

It is important to note **that this does not apply to password managers, where you must retrieve your password in cleartext.** 
On the other hand, a**uthentication mechanisms only need to confirm that the user knows the password** so they can be granted access to the resource; therefore, this problem differs from password managers.

### Storing Passwords in Plaintext

You’re probably familiar with **the “rockyou.txt” password list** on Kali Linux, among many other offensive security distributions. 
This password list came from RockYou, a company that developed social media applications and widgets. They even use to work for facebook.
**They stored their passwords in plaintext, and the company had a data breach. The text file contains over 14 million passwords.**

### Using an Insecure Encryption Algorithm

Adobe’s notable data breach was slightly different. 
Instead of using a secure hashing function to store the hash values of the passwords, the company used a deprecated encryption format. 
Furthermore, password hints were stored in plain text, sometimes containing the password itself. 
Consequently, the plaintext password could be retrieved relatively quickly.

### Using an Insecure Hash Function

LinkedIn also suffered a data breach in 2012. 
LinkedIn used an insecure hashing algorithm, the SHA-1, to store user passwords. 
Furthermore, no password salting was used. 
Password salting refers to adding a salt, i.e., a random value, to the password before it is hashed.

use this `sed -n '<no>p' rockyou.txt` to just print a perticular number item.

## Using Hashing for Secure Password Storage

### Using Hashing to Store Passwords

This is where hashing comes in. What if, instead of storing the password, **you just stored its hash value using a secure hashing function?** 
**This process means you never have to store the user’s password,** and if your database is leaked, an attacker will have to crack each password to find out what the password was.

There’s just one problem with this. *What if two users have the same password? As a hash function will always turn the same input into the same output, you will store the same password hash for each user.*
That means if someone cracks that hash, they gain access to more than one account. It also means someone can create a Rainbow Table to break the hashes.

A **Rainbow Table** is a lookup table of hashes to plaintexts, so you can quickly find out what password a user had just from the hash.

Websites like [hash.com](https://hashes.com/en/decrypt/hash) and [crackstation](https://crackstation.net/) use massive rainbow tables to provide fast password cracking for **hashes without salts**. Doing a lookup in a sorted list of hashes is quicker than trying to crack the hash.


### Protecting Against Rainbow Tables

To protect against rainbow tables, **we add a salt to the passwords.** *The salt is a randomly generated value stored in the database and should be unique to each user.* In theory, you could use the same salt for all users, but duplicate passwords would still have the same hash and a rainbow table could still be created for passwords with that salt.

The salt is added to either the start or the end of the password before it’s hashed, and this means that every user will have a different password hash even if they have the same password. 
Hash functions like Bcrypt and Scrypt handle this automatically. Salts don’t need to be kept private.

Some example:
1. We select a secure hashing function, such as Argon2, Scrypt, Bcrypt, or PBKDF2.
2. We add a unique salt to the password, such as Y4UV*^(=go_!
3. Concatenate the password with the unique salt. For example, if the password is AL4RMc10k, the result string would be AL4RMc10kY4UV*^(=go_!
4. Calculate the hash value of the combined password and salt. In this example, using the chosen algorithm, you need to calculate the hash value of AL4RMc10kY4UV*^(=go_!.
5. Store the hash value and the unique salt used (Y4UV*^(=go_!).

### Using Encryption to Store Passwords

The reason is that even if we select a secure hashing algorithm to encrypt the passwords before storing them, we still need to store the used key. 

Consequently, **if someone gets the key, they can easily decrypt all the passwords.**

So. because encryption can be cracked easily compared to hash, you should not encrypt passwords in password verification systems.


## Recognising Password Hashes

Automated hash recognition tools such as [hashID](https://pypi.org/project/hashID/) exist but are *unreliable for many formats.* For hashes that have a prefix, the tools are reliable. 
Use a healthy combination of context and tools.
If you find the hash in a web application database, it’s *more likely to be MD5 than NTLM (NT LAN Manager).*
Automated hash recognition tools often get these hash types mixed up, highlighting the importance of learning yourself.

### Linux Passwords

On Linux, **password hashes are stored in /etc/shadow,** which is normally only readable by root.
They used to be stored in /etc/passwd, which was readable by everyone.

Each line contains nine fields, separated by colons (:). **The first two fields are the login name and the encrypted password.**

More information about the other fields can be found by executing `man 5 shadow` on a Linux system.

The encrypted password field contains the hashed passphrase with four components: 
    prefix (algorithm id), options (parameters), salt, and hash. 
    It is saved in the format `$prefix$options$salt$hash`. 
    The prefix makes it easy to recognise Unix and Linux-style passwords; it specifies the hashing algorithm used to generate the hash.

### Modern Linux Example

`
username:$y$j9T$76UzfgEM5PnymhQ7TlJey1$/OOSg64dhfF.TigVPdzqiFang6uZA4QA1pzzegKdVm4:19965:0:99999:7:::
`
In the example above, we have four parts separated by $:

username will be your name.
y indicates the hash algorithm used, yescrypt
j9T is a parameter passed to the algorithm
76UzfgEM5PnymhQ7TlJey1 is the salt used
/OOSg64dhfF.TigVPdzqiFang6uZA4QA1pzzegKdVm4 is the hash value


### MS Windows Passwords

MS Windows passwords are hashed using NTLM, a variant of MD4. They’re visually identical to MD4 and MD5 hashes, so it’s very important to use context to determine the hash type.

On MS Windows, password hashes are stored in the **SAM (Security Accounts Manager).** MS Windows tries to prevent normal users from dumping them, but tools like **mimikatz** exist to circumvent MS Windows security. *Notably, the hashes found there are split into NT hashes and LM hashes.*

A great place to find more hash formats and password prefixes is the [Hashcat](https://hashcat.net/wiki/doku.php?id=example_hashes) Example Hashes page. For other hash types, you’ll typically need to check the length or encoding or even conduct some research into the application that generated them. Never underestimate the power of research.

## Password Cracking

**You can’t “decrypt” password hashes. They’re not encrypted. You have to crack the hashes by hashing many different inputs** (such as rockyou.txt as it covers many possible passwords), potentially adding the salt if there is one and comparing it to the target hash. Once it matches, you know what the password was. 

Tools like Hashcat and John the Ripper are commonly used for these purposes.

### Cracking Passwords with GPUs

GPU are very good at some mathematical calculations involved in hash functions. You can use a graphics card to crack many hash types quickly. 
Some hashing algorithms, such as Bcrypt, are designed so that hashing on a GPU does not provide any speed improvement over using a CPU; this helps them resist cracking.

### Cracking on VMs?

The process is slow and puts a lot of load on the cpu.
Best practise is copy the hash from the vm and run the cracking software on the host os.

### Time to Crack Some Hashes USING HELLCAT

#### **Hashcat Syntax Explained (Like You’re 5)**  

You just saw the **basic command structure** for Hashcat, a tool that cracks passwords by brute-forcing or guessing them. Here’s what each part means:  

---

#### **1. `hashcat`**  
The name of the program. You’re telling your computer: *"Hey, run Hashcat!"*  

---

#### **2. `-m <hash_type>`**  
- **What it means**: *"The type of password hash we’re cracking."*  
- **Example**:  
  - `-m 0` → MD5  
  - `-m 1000` → NTLM (Windows passwords)  
  - `-m 1800` → SHA-512 (Linux shadow files)  
- **Why it matters**: Different hashes (like MD5, SHA1, bcrypt) need different cracking approaches.  

---

#### **3. `-a <attack_mode>`**  
- **What it means**: *"How do you want to guess passwords?"*  
- **Common modes**:  
  - `-a 0` → **Dictionary Attack** (Tries passwords from a wordlist, like `rockyou.txt`).  
  - `-a 3` → **Brute-Force** (Tries all possible combinations, e.g., `aaaa`, `aaab`, `aaac`…).  
  - `-a 6` → **Hybrid Attack** (Wordlist + brute-force, e.g., `password123`, `password456`).  

---

#### **4. `hashfile`**  
- **What it means**: *"The file containing the password hash(es) you want to crack."*  
- **Example**:  
  - If you extracted a hash like `5f4dcc3b5aa765d61d8327deb882cf99` (MD5 for "password"), save it to `hashes.txt`.  
  - Then, point Hashcat to it: `hashcat -m 0 -a 0 hashes.txt wordlist.txt`. 
  - You have to use whole path.

---

#### **5. `wordlist`**  
- **What it means**: *"A file full of possible passwords to try."*  
- **Example**:  
  - `rockyou.txt` (famous wordlist with common passwords).  
  - `custom_list.txt` (your own list of guesses).  

---

#### **Full Example**  
Let’s say:  
- You have an **MD5 hash** (`5f4dcc3b5aa765d61d8327deb882cf99`).  
- You want to try passwords from **`rockyou.txt`**.  

**Command**:  
```bash
hashcat -m 0 -a 0 hashes.txt rockyou.txt
```  
Translation:  
*"Hey Hashcat, crack this MD5 hash (`-m 0`) by trying every password in `rockyou.txt` (`-a 0`)."*  

Program, algorithm, method, file and source

---

#### **What Happens Next?**  
1. Hashcat **reads the hash** from `hashes.txt`.  
2. It **tries every password** in `rockyou.txt`, hashes it, and checks for a match.  
3. If it finds a match, it shouts: *"Cracked!"* and shows you the password.  

---

#### **Why This Matters**  
- **Hackers use this** to break weak passwords.  
- **Security pros use this** to test if their users’ passwords are garbage.  

---

#### **Pro Tip**  
Want to see all hash types (`-m`) and attack modes (`-a`)? Run:  
```bash
hashcat --help
```  


## Hashing for Integrity Checking

**Hashing can be used to check that files haven’t been changed.**
If you put the same data in, you always get the same data out. 
Even if a single bit changes, the hash will change significantly

Let's say you downloaded arch linux iso and you want to check if you have downloaded the right one. 
So, you download that file and sha236sum on it get your hash value saved in a file.
Since hash values are public, take that arch hash value and save it to a file. you can just cross check them 

You can also use hashing to find duplicate files; if two documents have the same hash, they are the same document. 
*This is very convenient for finding and deleting duplicate files.*

### HMACs

HMAC (Keyed-Hash Message Authentication Code) is a type of message authentication code (MAC) that uses a cryptographic hash function in combination with a secret key to verify the authenticity and integrity of data.

This is achieved through the use of a secret key to prove authenticity and a hashing algorithm to produce a hash and prove integrity.


## Conclusion

Hashing, as already stated, is a process that takes input data and produces a hash value, a fixed-size string of characters, also referred to as digest. This hash value uniquely represents the data, and any change in the data, no matter how small, should lead to a change in the hash value. Hashing should not be confused with encryption or encoding; hashing is one-way, and you can’t reverse the process to get the original data.

**Encoding converts data from one form to another to make it compatible with a specific system.** ASCII, UTF-8, UTF-16, UTF-32, ISO-8859-1, and Windows-1252 are valid encoding methods for the English language. Note that UTF-8, UTF-16, and UTF-32 are Unicode encodings, and they can represent characters from other languages, such as Arabic and Japanese.

Use `Use <encoding method like base64> -d <FILENAME>`
-d stands for decode.


