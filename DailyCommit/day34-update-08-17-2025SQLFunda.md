# Day 34 17th august 2025

# SQL Fundamentals

on the **offensive side** of security, it can help us better understand SQL vulnerabilities, such as SQL injections, and create queries that **help us tamper** or retrieve data within a compromised service. 

On the other hand, on the **defensive side**, it can help us navigate through databases and **find suspicious** activity or relevant information; it can also help us better protect a service by implementing restrictions when needed.

ubiquitous : omnipresent or used everywhere.

Learning Objectives
Understand what databases are, as well as key terms and concepts.
Understand the different types of databases.
Understand what SQL is.
Understand and be able to use SQL CRUD Operations.
Understand and be able to use SQL Clauses Operations.
Understand and be able to use SQL Operations.
Understand and be able to use SQL Operators.
Understand and be able to use SQL Functions.


## Databases 101

Databases are an **organised collection** of structured information or data that is easily accessible and can be manipulated or analysed. 

Data can be anything from user's authentication, user generated data to user's history.


## Different Types of Databases

we are going to focus on the **two primary types**: relational databases (aka SQL) vs non-relational databases (aka NoSQL). 

### relational databases:

Like the name says, the data in this database is **related** to each other. This like a box for all gov docs only.

- Data follows a strict structure.

- Always logically represented in rows and colunms though the physical storage can be quite different.

- Best for acurracy and format.

- This is like a military rules/discipline.


### non-relational databases:

This is just a bunch of **random stuff** stored together like my room.

- No structure.

- No defined logical presentation rules.

- Best for random no high value stuff.

- Like how instagram stores all of our posts. Like this shyt is not confidencial.


### Tables, rows and columns

**Tables**: a sheet that has rows and columns.

**columns**: up and down like the table. Vertical. 

**Rows**: this is where the data is stored. Horizontal. When we say rowing a boat that means we are going either forward or backward, no up or down.


### Primary keys and Foreign Keys

Assume got a table that has id and authors. This hold authors' names and listing number for a list aka the id.

we also got a table of books with data including id, name of the book, date and author's id. 

Now our books' table has a author's id that is nothing but the id from authors' table. So when we write a book's name in alphabetical order and the author's name sits on number 26 on the authors' table, we will write 26 in the book's author's id.

**The listing number is Primary key**, it is unique identifier of the data / item.

**The imported number from another table is a foriegn key**, it is from another table but is used in the current table for reference.


## SQL

**DataBase Management System**: (DBMS)

- This is Interface for user to perform tasks like **defining**, **query(search)**, manipulation (managing like **deleting, moving or editing**).

- E.g mysql is a widly used interface to deal with SQL.


SQL (structred query language) is the **programming language** behind the interface. 

This is just like database a **Ubiquitous(omnipresent)** language.

- It is **Fast**.

- **Easy** to learn and use like it is **in plain english.**

- **Reliable** used and **trusted** my many.

- **Flexible** can do many things i.e. **a lot of features.**


To access it just use:

`mysql -u root -p` this will prompt you to enter password and once done you are in.

breakdown:
- mysql: Invoking the interface name mysql.

- `-u`: is user.

-`root`: who is the user?

-`p`: asking it to ask us the password to the user.



## Database and Table Statements

The captilization does not matters, some uses it just for readibility purpose.

### Database Statements

1. **`CREATE DATABASE <name of the database>;`**. Will do exactly what the name suggests.

2. **`SHOW DATABASES;`** will return us the list of all databases in the system.

3. **`USE <DATABASE name>;`** will set the named database as the active database.

4. **`drop <database name>;`** will remove the database.


### Table Statements

How we *populate and interact* with the table.

eVERY thing after the database is active.

1. **`create table <name of the table/title>;`**

```

mysql> CREATE TABLE book_inventory (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    publication_date DATE
);

```
breakdown:
- creating a table named book_inventory.
- creating 3 columns: : book_id, book_name and publication_date.
- column's name book_id. *Data type* "INT". *constraint* "auto increment". *what to* auto increment?"primary key.
- column's name book_name. *Data type* "Varchar(255). *constraint* not null (shall never left empty).
- Publication_date is set as the *data type* DATE (Stores dates only. No time component, Format: 'YYYY-MM-DD').

2. **`show tables`** will show all the tables in our active DB.

3. **`desc <tablename>`** will only show the structure **not the data**in the DB.

4. **`alter <tablename>`** will help you interact with the table.

5. **`drop <tablename>`** will remove the table.


## CRUD Operations

C - CREATE

R - READ

U - UPDATE

D - DELECT


### CREATE

It is use to **create or insert** a new record in a table.

```

mysql> INSERT INTO books (id, name, published_date, description)
    VALUES (1, "Android Security Internals", "2014-10-14", "An In-Depth Guide to Android's Security Architecture");

Query OK, 1 row affected (0.01 sec)

```

BREAKDOWN:
- `INSERT INFO`: is used to specific where the new data will go.

- `books` is the table's name.

- `(id, name, published_date, description)`: these are the names of columns.

- `VALUES` tells we will add these values.

- `(1, "Android Security Internals", "2014-10-14", "An In-Depth Guide to Android's Security Architecture");`: this is the data that we need to insert respectively.

- Query OK, 1 row affected (0.01 sec): success confirmation.


### Read Operation (SELECT)

Used to **read or retrieve** information from a table. This will show data unlike `desc`.

```

mysql> SELECT * FROM books;
+----+----------------------------+----------------+------------------------------------------------------+
| id | name                       | published_date | description                                          |
+----+----------------------------+----------------+------------------------------------------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture |
+----+----------------------------+----------------+------------------------------------------------------+

1 row in set (0.00 sec)  

```

BREAKDOWN:

- `select`: invoking the read operation.

- `*`: indicating all the columns should be shown.

- `from`: from which table?


```

mysql> SELECT name, description FROM books;
+----------------------------+------------------------------------------------------+
| name                       | description                                          |
+----------------------------+------------------------------------------------------+
| Android Security Internals | An In-Depth Guide to Android's Security Architecture |
+----------------------------+------------------------------------------------------+

1 row in set (0.00 sec)

```

- You could be specific like the above e.g. and it will work as a search function.


### Update Operation (UPDATE)

This will **modify** the content.

```

mysql> UPDATE books
    SET description = "An In-Depth Guide to Android's Security Architecture."
    WHERE id = 1;

Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0  

```

BREAKDOWN:

- `UPDATE`: invoking the update operation.

- `set`: invoking the function to set/modify/replace the data.

- `description`: this is a column in our book DB. This is the place we want our update.

- `where`: for which item?

- `id = 1`: for item number 1.

### Delete Operation (DELETE)

The delete removes records from a table. We can achieve this with the `DELETE` statement.

```

mysql> DELETE FROM books WHERE id = 1;

Query OK, 1 row affected (0.00 sec)    

```
BREAKDOWN:
- `delete`: invoking the delete op.

- `from`: from where?

- `books`: the table's name.

- `where`: for which item?

- `id = 1`: for item number 1.


## Clauses

A clause is a part of a statement that specifies the criteria.

It is sub to the operations we learned eariler CRUD.

Clauses can help us define the type of data and how it should be retrieved or sorted. 

we already used some clauses, such as `FROM` that is used to **specify the table** we are accessing with our statement and `WHERE`, which **specifies which records** should be used.

Some other useful clauses like:


### DISTINCT Clause

It helps us to avoid **duplicate** records while doing a query.

e.g. when I use `select * from books;` i will get this response:

```

mysql> SELECT * FROM books;
+----+----------------------------+----------------+--------------------------------------------------------+
| id | name                       | published_date | description                                            |
+----+----------------------------+----------------+--------------------------------------------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture   |
|  2 | Bug Bounty Bootcamp        | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                     |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                                 |
|  5 | Ethical Hacking            | 2021-11-02     | A Hands-on Introduction to Breaking In                 |
|  6 | Ethical Hacking            | 2021-11-02     |                                                        |
+----+----------------------------+----------------+--------------------------------------------------------+

6 rows in set (0.00 sec)

```

We can see Ethical Hacking appears twice. giving use a total of 6 rows. If this was happen to be a big list this could be misleading for someone who just want to know the total number of items.

AFTER USING **`select distinct <item> from <table>`** we solve the duplicate problem:

```

mysql> SELECT DISTINCT name FROM books;
+----------------------------+
| name                       |
+----------------------------+
| Android Security Internals |
| Bug Bounty Bootcamp        |
| Car Hacker's Handbook      |
| Designing Secure Software  |
| Ethical Hacking            |
+----------------------------+

5 rows in set (0.00 sec)

```

we can see the total items are 5 now.


### GROUP BY Clause

What if I want the total non-duplicate items but also want to know how many times an item is been duplicated or what's the quantity of the item? 

```

mysql> SELECT name, COUNT(*)
    FROM books
    GROUP BY name;
+----------------------------+----------+
| name                       | COUNT(*) |
+----------------------------+----------+
| Android Security Internals |        1 |
| Bug Bounty Bootcamp        |        1 |
| Car Hacker's Handbook      |        1 |
| Designing Secure Software  |        1 |
| Ethical Hacking            |        2 |
+----------------------------+----------+

5 rows in set (0.00 sec)

```

BREAKDOWN:

- `SELECT`: Invoking the operation.
- `name`: for what?
- `count(*)`: will count the items.
- `from`: from?
- `books`: name of the table.
- `group by`: when you are done group it by and show me only.
- `name`: the item you are interested in.


### ORDER BY Clause

You want to see your query in ascending or descending order? 

Use `asc` for ascending and `desc` for descending.

e.g.

```

mysql> SELECT *
    FROM books
    ORDER BY published_date ASC;
+----+----------------------------+----------------+--------------------------------------------------------+
| id | name                       | published_date | description                                            |
+----+----------------------------+----------------+--------------------------------------------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture   |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                     |
|  5 | Ethical Hacking            | 2021-11-02     | A Hands-on Introduction to Breaking In                 |
|  6 | Ethical Hacking            | 2021-11-02     |                                                        |
|  2 | Bug Bounty Bootcamp        | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                                 |
+----+----------------------------+----------------+--------------------------------------------------------+

6 rows in set (0.00 sec)

```

BREAKDOWN:

- `select`: invoking the read operation.

- `*`: all columns.

- `from`: from where?

- `books`: name of the table.

- `order by`: invoking the order function.

- `asc`: give me the ascending order.


### HAVING Clause
 
Unlike `where` which is used before grouping/aggrivation, `having` filters after grouping/aggrivation.

WHERE Clause:	
- Filters rows before grouping.

- With any SELECT statement.	

- Can't use aggregate functions.

HAVING Clause: 
- Filters groups after grouping.

- Only with GROUP BY.

- Can use aggregate functions.

```

mysql> SELECT name, COUNT(*)
    FROM books
    GROUP BY name
    HAVING name LIKE '%Hack%';
+-----------------------+----------+
| name                  | COUNT(*) |
+-----------------------+----------+
| Car Hacker's Handbook |        1 |
| Ethical Hacking       |        2 |
+-----------------------+----------+

2 rows in set (0.00 sec)

```

This is like using `search`.

BREAKDOWN:
- FROM books: Accesses the books table.

- GROUP BY name: Groups records by book names (combines duplicates).

- COUNT(*): Calculates how many copies exist for each unique book name.

- HAVING name LIKE '%Hack%': Filters groups to only show books with "Hack" in their name.


## Logical Operators

Just like eveyother languages we got them here.

### LIKE Operator

The LIKE operator is commonly used in conjunction with clauses like **WHERE** in order to *filter for specific patterns* within a column.

e.g.:

```

mysql> SELECT *
    FROM books
    WHERE description LIKE "%guide%";
+----+----------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                            | category           |
+----+----------------------------+----------------+--------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture   | Defensive Security |
|  2 | Bug Bounty Bootcamp        | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                     | Offensive Security |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
+----+----------------------------+----------------+--------------------------------------------------------+--------------------+

4 rows in set (0.00 sec)  

```

### AND Operator


The AND operator uses multiple conditions within a query and **returns TRUE if all of them are true.**

```
mysql> SELECT *
    FROM books
    WHERE category = "Offensive Security" AND name = "Bug Bounty Bootcamp"; 
+----+---------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                | published_date | description                                            | category           |
+----+---------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
+----+---------------------+----------------+--------------------------------------------------------+--------------------+
    
1 row in set (0.00 sec)  

```


### OR Operator

The OR operator combines multiple conditions within queries and returns TRUE if **at least one of these conditions is true.**

e.g.:

```

mysql> SELECT *
    FROM books
    WHERE name LIKE "%Android%" OR name LIKE "%iOS%"; 
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

1 row in set (0.00 sec)

```

### NOT Operator

The NOT operator reverses the value of a boolean operator, allowing us to **exclude a specific condition.**

```

mysql> SELECT *
    FROM books
    WHERE NOT description LIKE "%guide%";
+----+-----------------+----------------+----------------------------------------+--------------------+
| id | name            | published_date | description                            | category           |
+----+-----------------+----------------+----------------------------------------+--------------------+
|  5 | Ethical Hacking | 2021-11-02     | A Hands-on Introduction to Breaking In | Offensive Security |
+----+-----------------+----------------+----------------------------------------+--------------------+

1 row in set (0.00 sec)

```

### BETWEEN Operator

The BETWEEN operator allows us to test if a value exists within a defined **range.**

e.g.:
```

mysql> SELECT *
    FROM books
    WHERE id BETWEEN 2 AND 4;
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                      | published_date | description                                            | category           |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp       | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  3 | Car Hacker's Handbook     | 2016-02-25     | A Guide for the Penetration Tester                     | Offensive Security |
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

```

### Comparison Operators

The comparison operators are used to compare values and check if they meet specified criteria.

**Equal To Operator**: The = (Equal) operator compares two expressions and determines if they **are equal,**or it can check if a value matches another one in a specific column.

```

mysql> SELECT *
    FROM books
    WHERE name = "Designing Secure Software";
+----+---------------------------+----------------+------------------------+--------------------+
| id | name                      | published_date | description            | category           |
+----+---------------------------+----------------+------------------------+--------------------+
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers | Defensive Security |
+----+---------------------------+----------------+------------------------+--------------------+

1 row in set (0.10 sec)

```

**Not Equal To Operator**: The != (not equal) operator compares expressions and tests if they **are not equal;** it also checks if a value differs from the one within a column.
e.g.:

```

mysql> SELECT *
    FROM books
    WHERE category != "Offensive Security";
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
|  4 | Designing Secure Software  | 2021-12-21     | A Guide for Developers                               | Defensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

2 rows in set (0.00 sec)

```

**Less Than Operator**: The < (less than) operator compares if the expression with a given value is lesser than the provided one.

e.g.:

```

mysql> SELECT *
    FROM books
    WHERE published_date < "2020-01-01";
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                   | Offensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

2 rows in set (0.00 sec)

```

**Greater Than Operator**: The > (greater than) operator compares if the expression with a given value is greater than the provided one.

```

mysql> SELECT *
    FROM books
    WHERE published_date > "2020-01-01";
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                      | published_date | description                                            | category           |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp       | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
|  5 | Ethical Hacking           | 2021-11-02     | A Hands-on Introduction to Breaking In                 | Offensive Security |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

```


**Less Than or Equal To and Greater  Than or Equal To Operators**: The <= (Less than or equal) operator compares if the expression with a given value is less than or equal to the provided one. 

On the other hand, The >= (Greater than or Equal) operator compares if the expression with a given value is greater than or equal to the provided one. Let's observe some examples of both below.

e.g.:
```

mysql> SELECT *
    FROM books
    WHERE published_date <= "2021-11-15";
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
| id | name                       | published_date | description                                          | category           |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+
|  1 | Android Security Internals | 2014-10-14     | An In-Depth Guide to Android's Security Architecture | Defensive Security |
|  3 | Car Hacker's Handbook      | 2016-02-25     | A Guide for the Penetration Tester                   | Offensive Security |
|  5 | Ethical Hacking            | 2021-11-02     | A Hands-on Introduction to Breaking In               | Offensive Security |
+----+----------------------------+----------------+------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

```

```

mysql> SELECT *
    FROM books
    WHERE published_date >= "2021-11-02";
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
| id | name                      | published_date | description                                            | category           |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+
|  2 | Bug Bounty Bootcamp       | 2021-11-16     | The Guide to Finding and Reporting Web Vulnerabilities | Offensive Security |
|  4 | Designing Secure Software | 2021-12-21     | A Guide for Developers                                 | Defensive Security |
|  5 | Ethical Hacking           | 2021-11-02     | A Hands-on Introduction to Breaking In                 | Offensive Security |
+----+---------------------------+----------------+--------------------------------------------------------+--------------------+

3 rows in set (0.00 sec)

```

## Functions

### String Functions

Strings functions perform operations on a string, returning a value associated with it.

#### CONCAT() Function

This function is used to add two or more strings together. It is useful to combine text from different columns.

```

mysql> SELECT CONCAT(name, " is a type of ", category, " book.") AS book_info FROM books;
+------------------------------------------------------------------+
| book_info                                                         |
+------------------------------------------------------------------+
| Android Security Internals is a type of Defensive Security book. |
| Bug Bounty Bootcamp is a type of Offensive Security book.        |
| Car Hacker's Handbook is a type of Offensive Security book.      |
| Designing Secure Software is a type of Defensive Security book.  |
| Ethical Hacking is a type of Offensive Security book.            |
+------------------------------------------------------------------+

5 rows in set (0.00 sec)  

```

#### GROUP_CONCAT() Function

This function can help us to concatenate data from multiple rows into one field.

```

mysql> SELECT category, GROUP_CONCAT(name SEPARATOR ", ") AS books
    FROM books
    GROUP BY category;
+--------------------+-------------------------------------------------------------+
| category           | books                                                       |
+--------------------+-------------------------------------------------------------+
| Defensive Security | Android Security Internals, Designing Secure Software       |
| Offensive Security | Bug Bounty Bootcamp, Car Hacker's Handbook, Ethical Hacking |
+--------------------+-------------------------------------------------------------+

2 rows in set (0.01 sec)

```

#### SUBSTRING() Function

This function will retrieve a substring from a string within a query, starting at a determined position. The length of this substring can also be specified.

```

Room progress ( 68% )
Target Machine Information

Title

SQL Fundamentals v4

Target IP Address

10.201.97.26


Expires

47min 3s


Add 1 hour
Terminate
Task 1
Introduction
Task 2
Databases 101
Task 3
SQL
Task 4
Database and Table Statements
Task 5
CRUD Operations
Task 6
Clauses
Task 7
Operators
Task 8
Functions
When working with Data, functions can help us streamline queries and operations and manipulate data. Let's explore some of these functions next.

String Functions

Strings functions perform operations on a string, returning a value associated with it.

CONCAT() Function

This function is used to add two or more strings together. It is useful to combine text from different columns.

Terminal
mysql> SELECT CONCAT(name, " is a type of ", category, " book.") AS book_info FROM books;
+------------------------------------------------------------------+
| book_info                                                         |
+------------------------------------------------------------------+
| Android Security Internals is a type of Defensive Security book. |
| Bug Bounty Bootcamp is a type of Offensive Security book.        |
| Car Hacker's Handbook is a type of Offensive Security book.      |
| Designing Secure Software is a type of Defensive Security book.  |
| Ethical Hacking is a type of Offensive Security book.            |
+------------------------------------------------------------------+

5 rows in set (0.00 sec)  

This query concatenates the name and category columns from the books table into a single one named book_info.

GROUP_CONCAT() Function

This function can help us to concatenate data from multiple rows into one field. Let's explore an example of its usage.

Terminal
mysql> SELECT category, GROUP_CONCAT(name SEPARATOR ", ") AS books
    FROM books
    GROUP BY category;
+--------------------+-------------------------------------------------------------+
| category           | books                                                       |
+--------------------+-------------------------------------------------------------+
| Defensive Security | Android Security Internals, Designing Secure Software       |
| Offensive Security | Bug Bounty Bootcamp, Car Hacker's Handbook, Ethical Hacking |
+--------------------+-------------------------------------------------------------+

2 rows in set (0.01 sec)

The query above groups the books by category and concatenates the titles of books within each category into a single string.

SUBSTRING() Function

This function will retrieve a substring from a string within a query, starting at a determined position. The length of this substring can also be specified.

Terminal
mysql> SELECT SUBSTRING(published_date, 1, 4) AS published_year FROM books;
+----------------+
| published_year |
+----------------+
| 2014           |
| 2021           |
| 2016           |
| 2021           |
| 2021           |
+----------------+

5 rows in set (0.00 sec) 

```

#### LENGTH() Function

This function returns the number of characters in a string. This includes spaces and punctuation. 

```

mysql> SELECT LENGTH(name) AS name_length FROM books;
+-------------+
| name_length |
+-------------+
|          26 |
|          19 |
|          21 |
|          25 |
|          15 |
+-------------+

5 rows in set (0.00 sec)

```

### Aggregate Functions

These functions aggregate the value of multiple rows within one specified criteria in the query; It can combine multiple values into one result.

#### COUNT() Function
This function returns the number of records within an expression, as the example below shows.

```

mysql> SELECT COUNT(*) AS total_books FROM books;
+-------------+
| total_books |
+-------------+
|           5 |
+-------------+

1 row in set (0.01 sec)

```

#### SUM() Function

This function sums all values (not NULL) of a determined column.

```

mysql> SELECT SUM(price) AS total_price FROM books;
+-------------+
| total_price |
+-------------+
|      249.95 |
+-------------+

1 row in set (0.00 sec)

```

#### MAX() Function

This function calculates the maximum value within a provided column in an expression.

```

mysql> SELECT MAX(published_date) AS latest_book FROM books;
+-------------+
| latest_book |
+-------------+
| 2021-12-21  |
+-------------+

1 row in set (0.00 sec)

```

### MIN() Function

This function calculates the minimum value within a provided column in an expression.

```

mysql> SELECT MIN(published_date) AS earliest_book FROM books;
+---------------+
| earliest_book |
+---------------+
| 2014-10-14    |
+---------------+

1 row in set (0.00 sec)

```

