# DAY 16- 07-30-2025 

# Linux Shell
- use `clear` to clear the shell.

## Types of Linux Shells:

- `echo SHELL` to know your current shell.
- `cat /etc/shell` to know all the avaiable shells.
- `<name of the shell>` to switch between shells. This will also give you a small introduction of that shell.

- yo!! you can use tab to autocomplete your command in bash, damn, I did not knew that.

- `history` to know your command history.

### Friendly interface shell aka "FISH" LOL.
- userfriendly, auto completion and correction, etc.
- not good for scripting.

### Zsh
- better features with plugins and frameworks like oh my zsh
- too slow.


## Shell Scripting and Components:

- A shell script is nothing but a set of commands. 
- Suppose a repetitive task requires you to enter multiple commands using a shell. Instead of entering them one after one on every repetition of that task, which may take more of your time, you can combine them into a script. 
- To execute all those commands, you will only execute the script, and all the commands will be executed.


- To create a script file we use extention .sh. So, now our code will be `nano <file name>.sh`
- **you have to start a script with `shebang i.e. #!` always. Followed by the name our interpreter,** you can use cat /etc/shells to choose or look up the name. So, our code will be `#!/bin/bash` this is like <stdio.h> from c.

### Variables

A variable stores a value inside it. Suppose you need to use some complex values, like a URL, a file path, etc., several times in your script. Instead of memorizing and writing them repeatedly, you can store them in a variable and use the variable name wherever you need it.

- You can use different spcrit writer but we will use nano for now.
- Nano <file name>.sh
- **echo to display.**
- **`read` to take input and store in the variable`**. e.g. read $name -> read(thefunction's name to get input) $(to retrieve the value taken) and name(this is the variable where your name will be store).
- ctrl x > y > enter.
- You will go back to the formal cmd.'

- Now to execute the script we will need to give permission to the script. Use **`chmod +x first_script.sh`** 
    - it's the computer equivalent of saying:
        "Hey Linux, this text file is actually a program—let me run it like a boss!"
    - Breakdown:
        - chmod → "Change Mode" (sets file permissions)

        - +x → Add eXecute permission (lets you run the file as a program)

        - first_script.sh → Your script file (replace with your actual filename)

    - Without +x, your script is just a text file—even if it has code inside. 
With +x, you can run it like a real program:

    - `**ls -1 first_script.sh`** use this to know if the file has permission or not.

    - Breakdown of `ls -1`:
        - ls is list
        - -1 is Display output in single column format (one file/folder per line)
    
    -  just running chmod +x will make your script work, but checking permissions first is about good hygiene, security, and debugging—not just making things executable.
    - Blindly running chmod +x on everything is dangerous:

        - What if the script was downloaded from the internet and contains malware?

        - What if it’s a critical system file that shouldn’t be executable?

**- After using chmod use `./<filename>` to execute it**


### Loops

-It is something that is repeating. 
- For example, you have a list of many friends, and you want to send them the same message. Instead of sending them individually, you can make a loop in your script, give your friend list to the loop and the message, and it will send that message to all your friends.

- Open nano. shebang name of the interpreter. code 
```
for i in {1..10}
echo i
done
```
- breakdown:
    - i: is the variable that will hold those natural numbers
    - echo: will display i (the current value of i)
    - done: when i reach 10 it will serve the purpose and the work is "done".

- ctrl x > y > enter
- check permission ls -1 <fileName>. If it is not green no permissions.
- Use chmod +x<fileName> to give permission.
- ./<fileName> to run.


### Conditional Statements

- They help you execute a specific code only when a condition is satisfied; otherwise, you can execute another code.

- Suppose you want to show a specific content to a specific user only. The content is locked behind password. So when you run this .sh it will ask for credentials and only 'the user' will be able to access it.

- nano <filename>.
```
 #! /bin/bash
    - echo "Please enter your name first:"
    read name
    if [ "$name" = "Stewart" ]; then
            echo "Welcome Stewart! Here is the secret: THM_Script"
    else
            echo "Sorry! You are not authorized to access the secret."
    fi

```

- fi is finish.

- `ls -1` if not green no permission. Use `chmod +x <filename>` to give permission. Now `ls -1` text green, permission granted. Use `./<filename>` to run.
- Not working go nano <filename> fix it. Run execution code./

### Comments

- this `#` and you know what is comment.


**Use `sudo su` to become a root user**
