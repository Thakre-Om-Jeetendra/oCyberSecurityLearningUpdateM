# Day 7 21 july 2025

# How the Website Works

When you visit the website, the following happens:
1. **Request Handling**: The server receives your request and processes it.
2. **Routing**: The server determines which page you are requesting based on the URL.
3. **Data Retrieval**: The server fetches the necessary data from the database or other sources.
4. **Rendering**: The server generates the HTML content for the page.
5. **Response**: The server sends the generated HTML back to your browser.
6. **Display**: Your browser renders the HTML and displays the page to you.

A server is a decicated computer somewhere in the world that is always on and connected to the internet. It has all the resources needed for that website that it owns.

There are 2 major components of a website:
1. **Frontend**: This is what you see and interact with in your browser. It includes HTML, CSS, and JavaScript that create the user interface.
2. **Backend**: This is the server-side logic that processes requests, interacts with the database, and sends responses back to the frontend. It is typically built using languages like Python, Ruby, PHP, or Node.js.

## HTML
**HTML (HyperText Markup Language)** is the standard markup language for creating web pages. It provides the structure of a webpage, allowing you to define elements like headings, paragraphs, links, images, and more.
**CSS (Cascading Style Sheets)** is used to style HTML elements, controlling their appearance, layout, and design. It allows you to apply colors, fonts, spacing, and other visual properties to your HTML content.
**JavaScript** is a programming language that enables interactivity and dynamic behavior on web pages. It allows you to create features like form validation, animations, and real-time updates without requiring a page reload.

Elements are the building blocks of html. Here is a code snippet:
```html
<!DOCTYPE html>
<html>
    <head>
        <title> this is the title of the page</title>
    </head>
    <body>
        <h1>header 1</h1>
        <p>this is a paragraph</p>
    </body>
</html>
```
- The `<!DOCTYPE html>` declaration defines the document type and version of HTML being used.
- The `<html>` element is the root element of an HTML document.
- The `<head>` element contains metadata about the document, such as the title and links to stylesheets or scripts.
- The `<title>` element specifies the title of the webpage, which appears in the browser tab.
- The `<body>` element contains the content of the webpage that is displayed to users.
- The `<h1>` element represents a top-level heading, while `<p>` represents a paragraph of text.
- The `<h1>` element is typically used for the main title of the page, while `<p>` is used for regular text content.

Tags contain attributes that provide additional information about the element. For example: <img src="img/cat.jpg"> for the imag tag.

Elements also have id attributes that allow you to uniquely identify them. For example: `<h1 id="main-title">Header 1</h1>`. This can be useful for styling or scripting purposes.

## Javascript
- JavaScript is a programming language that allows you to add interactivity and dynamic behavior to your web pages. It can manipulate HTML elements, handle events, and perform calculations.
- without JavaScript, a page would not have interactive elements and would always be static.
- Javascript can be added using script tag in the source code of the page, or by linking to an external JavaScript file using the `<script src="path/to/script.js"></script>` tag.
- You can use javacode to find a specific element on the page using its id, and then change its content or style.
- HTML elements can also have events, such as "onclick" or "onhover" that execute JavaScript when the event occurs. The following code changes the text of the element with the demo ID to Button Clicked: <button onclick='document.getElementById("demo").innerHTML = "Button Clicked";'>Click Me!</button> - onclick events can also be defined inside the JavaScript script tags, and not on elements directly. 

## Sensitive Data Exposure
- This usually happens when a website does not properly secure sensitive information, such as passwords, credit card numbers, or personal data. This can lead to unauthorized access and data breaches.
This mostly happen in the frontend.
- We can access the source code in our browser. A website developer may have forgotten to remove login credentials, hidden links to private parts of the website or other sensitive data shown in HTML or JavaScript.
- There could be HTML comments with temporary login credentials, and if you viewed the page's source code and found this, you could use these credentials to log in elsewhere on the application (or worse, used to access other backend components of the site).
- If you are assessing a website the first you should is to check the source code for any sensitive information that should not be there. This could include hardcoded credentials, API keys, or other sensitive data that should be kept private.

## HTML Injection
- This occurs when an unfiltered user input is displayed on a webpage.
- If a website fails to sanitise user input (filter any "malicious" text that a user inputs into a website), and that input is used on the page, an attacker can inject HTML code into a vulnerable website.
- Input sanitisation is very important in keeping a website secure, as information a user inputs into a website is often used in other frontend and backend functionality.
- A user can submit their own HTML(or js) code into a website, and if the website does not properly filter this input, it can lead to HTML injection.
- This can be used to manipulate the page's content, steal cookies, or perform other malicious actions.
- For example, if a website allows users to submit comments, and those comments are displayed on the page without sanitization, an attacker could submit a comment containing malicious HTML or JavaScript code. When other users view the page, the injected code would execute in their browsers, potentially leading to data theft or other attacks.
- To prevent HTML injection, websites should always sanitize user input by removing or encoding any potentially harmful characters or tags before displaying them on the page. This can be done using libraries or frameworks that provide built-in sanitization functions.
- So If I made a code that is malacious and then I use the comment section of a website. If the website does not check the input and allow it to go in for displaying that comment, then the code will be executed in the browser of anyone who views that comment. That code will go in and I can do what ever I want that the code is written to do.
- This can be used to steal cookies, redirect users to other websites, or perform other malicious actions. You know cookies, that stores your personal info like login credentials, and other information about you.
- Lets say the website asks me to enter my name, and I enter `<script>alert("Hello")</script>`. If the website does not sanitize this input, it will display the alert when I view the page. This is a simple example of HTML injection.