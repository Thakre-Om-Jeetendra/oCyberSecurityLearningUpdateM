# On day 7 we learned about HTML injection and how it can be used to manipulate web pages. Today, we will see it in action with a simple example.

# ⚠️ For educational purposes only. Do not use maliciously.

# Disclaimer "This simulates attacks for learning defenses".

# Learn how things work and secure them, not how to break them.

## Why?
- I made a simple HTML page that allows users to input their name and then generates a acception page.
- Got this idea from a friend who recently applied for a job and had to create a acception page.
- I found the HTML injection vulnerability in the page and decided to exploit it to show how easy it is to manipulate web pages. Thought it would be fun.

## What?
- The page is very simple, it has a form with a text input for the name and a button to generate the acception page.

## The HTML CODE
Just copy and paste the following code into a file named `whatever.html` and open it in your browser: then you can test the vulnerabilities mentioned below. After that, you can secure it by following the instructions below.


```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceptance Letter Simulator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .input-section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .acceptance-letter {
            display: none; /* Hidden by default */
            background: #fff;
            border: 1px solid #ddd;
            padding: 30px;
            margin-top: 20px;
            border-radius: 8px;
            font-family: "Times New Roman", serif;
            line-height: 1.6;
        }
        .letter-heading {
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 20px;
        }
        .letter-footer {
            margin-top: 40px;
            text-align: right;
        }
        button {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="disclaimer" style="
    background-color: #fff8e1;
    border-left: 4px solid #ffc107;
    padding: 12px;
    margin: 20px 0;
    font-size: 14px;
    color: #5d4037;
">
    <strong>⚠️ Educational Use Only</strong>
    <p>This webpage is part of a security education demonstration. All content and functionality are designed solely for:</p>
    <ul style="margin-top: 8px; margin-bottom: 8px;">
        <li>Learning about web security principles</li>
        <li>Ethical penetration testing practice</li>
        <li>Understanding XSS vulnerabilities and prevention</li>
    </ul>
    <p style="margin-bottom: 0;"><strong>Do not attempt these techniques on websites without explicit permission.</strong></p>

</div>
<p style="font-style: italic; margin-top: 10px;">
    By using this page, you agree that all testing will be conducted ethically and only on this local demonstration environment.
</p>
    <div class="input-section">
        <h2>Submit Your Name</h2>
        <label for="username">Your Full Name:</label>
        <input type="text" id="username" placeholder="John Doe">
        <button onclick="generateLetter()">Generate Acceptance Letter</button>
    </div>

    <div id="acceptanceLetter" class="acceptance-letter">
        <div class="letter-heading">OFFICIAL ACCEPTANCE NOTICE</div>
        
        <p><strong>Dear <span id="letterName">[Name]</span>,</strong></p>
        
        <p>We are pleased to inform you that your application has been <strong>accepted</strong>.</p>
        
        <p>After careful review, we have determined that you meet all the necessary qualifications, and we are excited to welcome you.</p>
        
        <p>Please confirm your participation by replying to this notice.</p>
        
        <div class="letter-footer">
            <p>Sincerely,</p>
            <p><strong>The Admissions Committee</strong></p>
        </div>
    </div>

<script>
    function generateLetter() {
        const name = document.getElementById("username").value;
        document.getElementById("letterName").innerHTML = name; // UNSAFE (for testing)
        document.getElementById("acceptanceLetter").style.display = "block";
    }
</script>

</body>
</html>
```

This code creates a simple HTML page with a form that allows users to input their name and generate an acceptance letter. The letter is displayed below the form when the button is clicked.

## The Vulnerabilities
- Use <img src="x" onerror="alert('Hacked!')"> in the name input field to trigger an alert.
    - That will generate an alert box with the message "Hacked!" when the acceptance letter is generated.
    - This is also know as Classic XSS Payload.

- Use <img src="x" onmouseover="alert('Hacked!')" width="100%">  in the name input field to trigger an alert when you hover over the name in the acceptance letter.
    - This will auto generate an alert box with the message "Hacked!" when you hover over the name in the acceptance letter. 

- Use this <input autofocus onfocus="alert('Hacked!')"> in the name input field to trigger an alert when the input field is focused.
    - This will auto generate an alert box with the message "Hacked!" when you focus on the name input field.

- COOL! 

## How to secure?

in the script tag, change the line(the one that that pulls function generateLetter) from:
```
<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/3.0.5/purify.min.js"></script>
<script>
    function generateLetter() {
        const name = document.getElementById("username").value;
        const cleanName = DOMPurify.sanitize(name); // Removes dangerous HTML
        document.getElementById("letterName").innerHTML = cleanName; // SAFE
        document.getElementById("acceptanceLetter").style.display = "block";
    }
</script>
```

This will sanitize the input and remove any dangerous HTML, preventing the XSS attacks.

## Conclusion
- This is fun but only a kid will miss the importance of securing web applications against HTML injection and XSS attacks.
- Always sanitize user input to prevent malicious code from being executed.
- Use libraries like DOMPurify to help with sanitization.
