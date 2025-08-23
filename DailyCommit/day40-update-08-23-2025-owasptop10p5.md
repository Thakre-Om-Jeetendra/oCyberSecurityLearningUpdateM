# day 40- 23rd august 2025

# owasp top 10 2021 p5

## 3.1. Command Injection

Serve side code (php) in a web app makes a call to a function that interacts with server's side console line.

Attackers can do anything in the server's console like they are sitting infornt of it.

Once Attacker is in you are out.

Example:

Moocrop want to develop a web app where user types something and it will be displayed on the screen with an ascii cow.

They found out that a linux command `cowsay` does the same thing so instead of writiing the whole code they just added a small code that with take the input, trigger the linux cmd and will display the output on the screen.

Attack:

Bash has inline commands excessiblity. Meaning it let you use command in command.

We pass `$(<cmd>)` in the inputer and this will work in the server side console.
