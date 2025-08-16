# DAY 33- 16TH AUGUST 2025

# JavaScript Essentials

You can add interactiveness like validation, onClick actions, animations, etc, through JS. 

Learning Objectives:

Understand the basics of JS
Integrating JS in HTML
Abusing Dialogue Function
Bypassing Control Flow Statements
Exploring Minified Files


## Essential Concepts

### Variables

Variables are containers where you save your values/data.

Three types
- `var`, `let` and `const`.
- `var` is function scoped meaning works well over the funtions.
- `let` and `const` are blocked-scoped meaning works only with in the block.
offering better control over variable visibility within specific code blocks.

### Data Types

string , intergers and boolean, etc.

### Functions

A block of code designed to perform a specific task. A purpose is to use the same code again and again in the program.

### Loops


Loops allow you to run a code block multiple times as long as a **condition is true.**

`for`, `while`, and `do...while`, which are used to repeat tasks, like going through a list of items.


### Request-Response Cycle

the request-response cycle is when a user's browser (the client) sends a request to a web server, and the server responds with the requested information.


## JavaScript Overview

### Internal JavaScript

embedding the JS code directly within an HTML document.

The script is inserted between <script> tags. 

These tags can be placed inside the <head> section, typically used for scripts that need to be loaded before the page content is rendered, 

or inside the <body> section, where the script can be utilised to interact with elements as they are loaded on the web page.

### External JavaScript

External JS involves creating and storing JS code in a separate file ending with a **.js file extension.**

This method helps developers keep the HTML document **clean and organised.**

The external JS file can be stored or hosted on the same web server as the HTML document or stored on an external web server such as the cloud.

we use <script src="file.js"></script> to attack the .js file in the html.


### Verifying Internal or External JS

we use `view page source` on the webpage and If you see a <script> tag 
with a src attribute, it indicates that the page is loading external JS from a separate file.


## Abusing Dialogue Functions

JS provides built-in functions like `alert`, `prompt`, and `confirm` to facilitate this interaction.

### Alert

The alert function displays a message in a dialogue box with an "OK" button.

### Prompt

The prompt function displays a dialogue box that asks the user for input.

It returns the entered value when the user clicks "OK", or null if the user clicks "Cancel". 
 
For example, to ask the user for their name, we would use prompt("What is your name?");

### Confirm

The confirm function displays a dialogue box with a message and two buttons: "OK" and "Cancel". 

It returns true if the user clicks "OK" and false if the user clicks "Cancel". 

For example, to ask the user for confirmation, we would use confirm("Are you sure?");. 

To try this out, open the Chrome console, type confirm("Do you want to proceed?"), and press Enter.

### How Hackers Exploit the Functionality

Imagine receiving an email from a stranger with an attached HTML file. 

The file looks harmless, but when you open it, it contains JS that disrupts your browsing experience. 

```

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hacked</title>
</head>
<body>
    <script>
        for (let i = 0; i < 3; i++) {
            alert("Hacked");
        }
    </script>
</body>
</html>

```

This will show hacked! x3.

But imagine the bad guy set it to x500 you will need to keep closing it. Or you can just change I don't know.


## Bypassing Control Flow Statements

**the order** in which statements and code blocks are executed based on certain conditions. 

JS provides several control flow structures such as if-else, switch statements to make decisions, and loops like for, while, and do...while to repeat actions. 

### Conditional Statements in Action

One of the most used conditional statements is the if-else statements, which allows you to **execute different blocks** of code depending on whether a condition evaluates to true or false.

### Bypassing Login Forms

well you can always inspect the page to see this. But I doubt you will be able to because only a non programmer will let credentials open like that.


## Exploring Minified Files

**Minification** in JS is the process of compressing JS files by removing all unnecessary characters, such as spaces, line breaks, comments, and even shortening variable names. 

This helps reduce the file size and improves the loading time of web pages, especially in production environments. 

Minified files make the code more compact and harder to read for humans, but they still function exactly the same.


Similarly, **obfuscation** is often used to make JS harder to understand by adding undesired code, renaming variables and functions to meaningless names, and even inserting dummy code.

use [obfuscator](https://codebeautify.org/javascript-obfuscator#) to turn you code to non human readable format.

use [deobfuscator](https://obf-io.deobfuscate.io/) to turn the obfuscator into readable format.

## Best Practices

### Avoid Relying on Client-Side Validation Only

**One of JS's primary functions is performing client-side validation.** 

Developers sometimes use it for validating forms and rely entirely on it, which is not a good practice. 

Since a user can disable/manipulate JS on the client side, performing validation on the server side is also essential.

### Refrain from Adding Untrusted Libraries

**JS allows you to include any other JS scripts using the src attribute inside a script tag.** 

But have you considered whether the library we include is from a **trusted source?**

Bad actors have uploaded a bundle of libraries on the internet with names that resemble legitimate ones. 

So, if you blindly include a malicious library, you will expose your web application to threats.

### Avoid Hardcoded Secrets

Never hardcode sensitive data like API keys, access tokens, or credentials into your JS code, as the *user can easily check the source code and get the password.* This is what I was talking about in the previous task.

### Minify and Obfuscate Your JavaScript Code

Minifying and obfuscating JS code reduces its size, improves load time, and makes it **harder** for attackers to understand the logic of the code. 

Therefore, always minify and obfuscate the code when using code in production. 

**The attacker can eventually reverse engineer it, but getting the original code will take at least some effort.**


