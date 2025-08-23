# Day 39- 22nd august 2025

# Owasp top 10 2021 p4

## Cryptographic Failures (Supporting Material 1)

Mostly we store data is database. Most of them use SQL.

In production envirnoment, mostly they use services like mysql or mariadb to run/work on this database that are setup on a specific server.

However, small companies to avoid database headace uses files to store data on their device disk. This files are called flat-files.

If somehow this files are underneath the root directory of the website(attacker can gain access on your computer and without any higher privilage he can download it ) we can download the file and proccess it on our device to gain data.

TO do this:
1. gain access in the target server.
2. find the file and if found download it on your machine.
3. Once downloaded locate it using `ls -l` find the file.
4. Use `file <filename>` to know the type of file it is.
5. Mostly your attack machine linux will have necessary tools pre install if not search google install them.
6. Use them to see the data. For e.g. on using `file <filename>` if we get file type sqlite3. Just use `sqlite3 <filename>` now you can play with it.
7. HERE WE WILL FIND PASSWORD HASH.


`PRAGMA table_info(table_name)`; is a SQLite-specific command used to retrieve metadata about the structure of a specific table.
In simple terms, it's like asking the database: **"Show me the blueprint for this table."**


## Cryptographic Failures (Supporting Material 2)

Take that hash and use either a online hash cracker or john.


## 3. Injection

Here we misuse the data input section of any website. 

We give a malicious input that alter the backend code and gives us output that we wish for.

Mainly we use sql injection or command injection.

SQL Injection: This occurs when user-controlled input is passed to SQL queries. As a result, an attacker can pass in SQL queries to manipulate the outcome of such queries.

Command injection: This occurs when user input is passed to system commands. As a result, an attacker can execute arbitrary system commands on application servers, potentially allowing them to access users' systems.


WE need to senitise the user's input before it hits the system. How?:

**Using an allow list:** when input is sent to the server, this *input is compared to a list of safe inputs or characters.* If the input is marked as safe, then it is processed. Otherwise, it is rejected, and the application throws an error.

**Stripping input:** If the input contains dangerous characters, these are removed before processing.

Instead of manually constructing allow lists or stripping input, various libraries exist that can perform these actions for you.