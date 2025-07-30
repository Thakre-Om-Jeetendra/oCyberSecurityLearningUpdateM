# This is a locker script. A user has a locker in a bank. To secure the locker, we have to have a script in place that verifies the user before opening it. When executed, the script should ask the user for their name, company name, and PIN. If the user enters the following details, they should be allowed to enter, or else they should be denied access.
#Username: John
#Company name: Tryhackme
#PIN: 7385

#!/bin/bash
#defining interpreter

Username = ""
CompanyName =""
PIN =""
#variables are set now


for i in {1..3}; do
# Defining the loop

        if [ "$i" -eq 1 ]; then
#-eq is a numeric comparison operator that stands for "equal to". It's used to test if two numbers are equal in conditional statements.
                echo "Enter your Username:"
                read Username
        elif [ "$i" -eq 2 ]; then
                echo "Enter your Company name:"
                read CompanyName
        else
                echo "Enter your PIN:"
                read PIN
        fi
done
#conditional statements are set now
#Using loop was overkill but we had to use everything that we learn so far so here we are.

if [ "$Username" = "John" ] && [ "$CompanyName" = "Tryhackme" ] && [ "$PIN" = "7385" ]; then
        echo "Authentication Successful. You can now access your locker, John."
else
        echo "Authentication Denied!!"
fi
# Checking if the user entered the correct details