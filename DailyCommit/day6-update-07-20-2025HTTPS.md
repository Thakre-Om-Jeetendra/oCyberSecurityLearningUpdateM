# Day 6 - july 20, 2025
We learned how HTTPS and DNS works.

## DNS
### What is DNS?
- We know IP addresses and they are in a number format. When IP addresses are used, it is hard to remember them. So, when IP addresses are given a name, it is easier to remember them. That is when IP addresses become DNS.
- DNS or Domain Name System explained using an example:
    - So instead of remembering 104.26.10.229, you can remember tryhackme.com instead.

### Domain name hierarchy
- We got root domain, top-level domain, second-level domain, and subdomain.
- Example: 
    - tryhackme.com
        - com is the top-level domain
        - tryhackme is the second-level domain
        - www is the subdomain
- So, the hierarchy is:
    - Root domain
        - Top-level domain
            - Second-level domain
                - Subdomain
- **TLD** is those .com, .org, .net, etc. They have a specific purpose.
   - Example of TLDs:
    - .com - commercial
    - .org - organization
    - .net - network
    - .edu - education
    - .gov - government
    - .mil - military   

- **SLD** are the names that are registered under the TLDs.
    - Example: 
        - tryhackme.com
            - tryhackme is the SLD
            - com is the TLD
            - upto 63 characters long.
- **Subdomain** is the part of the domain that comes before the SLD.
    - Example:
        - www.tryhackme.com
            - www is the subdomain
            - tryhackme is the SLD
            - com is the TLD
            - upto 63 characters long.
            - can have multiple subdomains.
- **Root domain** is the top-level domain that is not registered.
    - Example:
        - .com
            - . is the root domain
            - com is the TLD
            - can have multiple TLDs.

### DNS Records
- DNS records are the information that is stored in the DNS server.
- There are different types of DNS records:
    - **A record**: Maps a domain name to an IPv4 address.
        -  e.g. 104.26.10.229
    - **AAAA record**: Maps a domain name to an IPv6 address.
        - e.g. 2606:4700:10::681a:0a
    - **CNAME record**: Maps a domain name to another domain name.
        - e.g. www.tryhackme.com to tryhackme.com
    - **MX record**: Maps a domain name to a mail server.
        - e.g. mail.tryhackme.com
    - **TXT record**: Stores text information.
        - e.g. SPF records, DKIM records, etc.

### Making a DNS request
- When you type a domain name in the browser, your computer checks the DNS cache first.
    - If yes, it uses the cached IP address.
    - If no, it sends a DNS request to the Recursive DNS server.
- The Recursive DNS server checks its cache first.
    - If yes, it returns the IP address.
    - If no, it sends a request to the Root DNS server.
- The Root job is to redirect you to the correct Top Level Domain Server, depending on your request. If, for example, you request www.tryhackme.com, the root server will recognise the Top Level Domain of .com and refer you to the correct TLD server that deals with .com addresses.
- The TLD server holds records for where to find the authoritative server to answer the DNS request. The authoritative server is often also known as the nameserver for the domain. For example, the name server for tryhackme.com is kip.ns.cloudflare.com and uma.ns.cloudflare.com. You'll often find multiple nameservers for a domain name to act as a backup in case one goes down.
    - An authoritative DNS server is the server that is responsible for storing the DNS records for a particular domain name and where any updates to your domain name DNS records would be made.
- This nameserver will now send info to the Recursive server, which will then cache the information and send it back to your computer. This comes with a TTL.


## HTTP in Detail
### What is HTTP?
- HTTP stands for Hypertext Transfer Protocol.
- It is the protocol used to transfer data over the web.
- It is a request-response protocol.
- It is a stateless protocol.
### HTTPS
- HTTPS stands for Hypertext Transfer Protocol Secure.
- It is the secure version of HTTP.
- It uses SSL/TLS to encrypt the data transferred over the web.

### Requests And Responses
- browser will need to make requests to a web server for assets.
- you need to tell the browser specifically how and where to access these resources. This is where url comes in.
- URL stands for Uniform Resource Locator.
- It is used to access resources on the web.
    - where http is the scheme, user:password is the user, tryhackme.com is a domain or the host, 80 is the port, view-room is the path, ?id=1 is the query string, and #task3 is the fragment. The full address is http://user:password@tryhackme.com:80/view-room?id=1#task3.

    - **URL Structure**
        - **Scheme**: The protocol used to access the resource (e.g., http, https).
        - **User:Password**: Optional credentials for accessing the resource.
        - **Domain/Host**: The domain name or IP address of the server hosting the resource.
        - **Port**: The port number on which the server is listening (default is 80 for HTTP and 443 for HTTPS).
        - **Path**: The specific location of the resource on the server.
        - **Query String**: Optional parameters passed to the resource, starting with a `?`.
            - For example, /blog?id=1 would tell the blog path that you wish to receive the blog article with the id of 1.
        - **Fragment**: A specific section of the resource, starting with a `#`.

#### Making a Request:
- When you enter a URL in the browser, it sends a request to the server.
- The request contains the method (GET, POST, etc.), the URL, and the headers.
    - GET / HTTP/1.1
    Host: tryhackme.com
    User-Agent: Mozilla/5.0 Firefox/87.0    
    Referer: https://tryhackme.com/ 

- breakdown of the request:
    - **GET**: The HTTP method used to request the resource.
    - **/**: The path of the resource being requested.
    - **HTTP/1.1**: The version of the HTTP protocol being used.
    - **Host**: The domain name of the server being requested.
    - **User-Agent**: Information about the client making the request (browser, OS, etc.).
    - **Referer**: The URL of the page that referred the request.

#### Response
- The server processes the request and sends a response back to the browser.
HTTP/1.1 200 OK

Server: nginx/1.15.8
Date: Fri, 09 Apr 2021 13:34:03 GMT
Content-Type: text/html
Content-Length: 98


<html>
<head>
    <title>TryHackMe</title>
</head>
<body>
    Welcome To TryHackMe.com
</body>
</html>
To breakdown each line of the response:
- **HTTP/1.1 200 OK**: The HTTP version and the status code (200 OK means the request was successful).
- **Server**: The server software handling the request (e.g., nginx).   
- **Date**: The date and time the response was generated.
- **Content-Type**: The type of content being returned (e.g., text/html).
- **Content-Length**: The size of the response body in bytes. Content-Length tells the client how long the response is, this way we can confirm no data is missing.
- The response body contains the actual content of the resource, which can be HTML, JSON, or any other format.


### HTTP Methods
GET Request

This is used for getting information from a web server.

POST Request

This is used for submitting data to the web server and potentially creating new records

PUT Request

This is used for submitting data to a web server to update information

DELETE Request

This is used for deleting information/records from a web server.

### HTTP Status Codes
200 - OK	The request was completed successfully.
201 - Created	A resource has been created (for example a new user or new blog post).
301 - Moved Permanently	This redirects the client's browser to a new webpage or tells search engines that the page has moved somewhere else and to look there instead.
302 - Found	Similar to the above permanent redirect, but as the name suggests, this is only a temporary change and it may change again in the near future.
400 - Bad Request	This tells the browser that something was either wrong or missing in their request. This could sometimes be used if the web server resource that is being requested expected a certain parameter that the client didn't send.
401 - Not Authorised	You are not currently allowed to view this resource until you have authorised with the web application, most commonly with a username and password.
403 - Forbidden	You do not have permission to view this resource whether you are logged in or not.
405 - Method Not Allowed	The resource does not allow this method request, for example, you send a GET request to the resource /create-account when it was expecting a POST request instead.
404 - Page Not Found	The page/resource you requested does not exist.
500 - Internal Service Error	The server has encountered some kind of error with your request that it doesn't know how to handle properly.
503 - Service Unavailable	
This server cannot handle your request as it's either overloaded or down for maintenance.

[http.cat](https://http.cat/) is a great resource to see the status codes in action. It provides images for each HTTP status code, making it easy to visualize the response.

### HTTP Headers
These are headers that are sent from the client (usually your browser) to the server.

    - Host: Some web servers host multiple websites so by providing the host headers you can tell it which one you require, otherwise you'll just receive the default website for the server.
    - User-Agent: This is your browser software and version number, telling the web server your browser software helps it format the website properly for your browser and also some elements of HTML, JavaScript and CSS are only available in certain browsers.
    - Content length: This is the size of the request body in bytes, this is used to ensure that the server has received all of the data it was expecting.
    - Accept encoding: This is the type of encoding that the client can accept, for example, gzip or deflate. This is used to compress the response body to reduce the size of the data being transferred.
    - Cookie: This is used to send cookies from the client to the server. Cookies are small pieces of data that are stored on the client side and are used to remember information about the user, such as login sessions or preferences.

**Common Response Headers:**
- set cookie: Information to store which gets sent back to the web server on each request (see cookies task for more information).

- Cache-Control: How long to store the content of the response in the browser's cache before it requests it again.

- Content-Type: This tells the client what type of data is being returned, i.e., HTML, CSS, JavaScript, Images, PDF, Video, etc. Using the content-type header the browser then knows how to process the data.

- Content-Encoding: What method has been used to compress the data to make it smaller when sending it over the internet.

### Cookies
HTTP is stateless (doesn't keep track of your previous requests), cookies can be used to remind the web server who you are, some personal settings for the website or whether you've been to the website before. 

Cookies can be used for many purposes but are most commonly used for website authentication. 

[great way to understand cookies](https://tryhackme-images.s3.amazonaws.com/user-uploads/5c549500924ec576f953d9fc/room-content/a2117dc267fbb169e38be77c7af44027.png)

