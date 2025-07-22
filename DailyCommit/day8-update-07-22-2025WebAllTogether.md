Day 8 - 22 july 2025

# Putting it all together

Browser request for your webpage to the server. Browser reach out to the DNS. DNS search for the requested server. Server has been found. Server gives the ip address and the requested information. Brower receives it and displays it to you after comprending in human language.

## Other components

### **Load balancer**: 
- Distributes incoming network traffic across multiple servers to ensure no single server becomes overwhelmed, improving reliability and performance.
- It uses algorithms like round-robin, least connections, or IP hash to determine which server should handle each request.
    - Round-robin: Distributes requests evenly across servers.
    - Least connections: Directs traffic to the server with the fewest active connections.
    - IP hash: Routes requests based on the client's IP address, ensuring that a client consistently connects to the same server.
- Load balncers does a health test periodically to check if the server is up and running. If not, it will not send any request to that server.

### **CDN (Content Delivery Networks)**:
- A network of distributed servers that deliver web content to users based on their geographic location, improving load times and reducing latency.
- It caches static content like images, videos, and scripts on servers closer to the user, reducing the distance data must travel.
- So, the data that was supposed to be sent from the server is now sent from the nearby server, which is the CDN server. That means, the data was stored in different locations around the world, so that when a user requests it, it can be delivered faster.

### **Database**:
- A structured collection of data that can be easily accessed, managed, and updated.
- Websites often use databases to store **user information**, content, and other data that needs to be retrieved dynamically.
- some common databases: MySQL, MSSQL, MongoDB, Postgres, and more; each has its specific features.

### **WAF (Web Application Firewall)**:
- It sits between your request and the server. It analyzes the request before it reaches the server and blocks any malicious requests.
- It uses rate limiting. A rate limit is a restriction on how many requests a user can make to a server in a given time period. If a user exceeds this limit, the WAF blocks their requests.

## How web servers work
### What is a web server?
- A web server is a software or hardware that serves web content to users over the internet.
- It listens for incoming connections and then utilizes the HTTP protocol to deliver web pages to clients (browsers).
- The most common web server software you'll come across is Apache, Nginx, IIS and NodeJS. 
- Web servers delivers files from its root directory, which is the main folder where all the website files are stored.
- For example, Nginx and Apache share the same default location of /var/www/html in Linux operating systems. If you requested the file http://www.example.com/picture.jpg, it would send the file /var/www/html/picture.jpg from its local hard drive.
### Virtual Hosts
- Web servers can host multiple website domains on a single server using virtual hosts.
- Web servers checks the host header in the HTTP request to determine which website to serve. 
- Virtual hosts are just text-based configuration files.
- If a match is found, the web server serves the corresponding website files. If no match is found, it serves a default website or an error page.
- Virtual Hosts can have their root directory mapped to different locations on the hard drive. For example, one.com being mapped to /var/www/website_one, and two.com being mapped to /var/www/website_two
- There's no limit to the number of different websites you can host on a web server. But the server must have enough resources (CPU, RAM, disk space) to handle the traffic and requests for all the websites.

### Static vs Dynamic Content
**Static content** is fixed and does not change. Examples include HTML files, images, and CSS files. When a user requests static content, the web server simply retrieves the file from its root directory and sends it to the browser.

**Dynamic content** changes. Example a blog page. You might see a article on dog but next day you might see a article on cat. Depending on what word you search, different results will be displayed.

Changes that you see are done in the **backend** by a programming language like PHP, Python, or Node.js. When a user requests dynamic content, the web server processes the request, runs the necessary code, and generates the HTML to send back to the browser. 
What you see in the browser and can change is the **frontend**. The frontend is what you see and interact with, while the backend is what powers the frontend and handles the logic behind the scenes.

### Scripting and backend languages
- Backend languages like PHP, Python, Ruby, and Node.js are used to create dynamic content.
- These languages can interact with databases, call external services, process data from the user, and so much more.

## How does all works:
1. **User Request**: A user enters a URL in their browser or clicks a link.
2. **Local Cache Check**: The browser checks its local cache to see if it has the requested content stored.
3. **ReCURSIVE DNS Lookup**: If the content is not cached, the browser sends a request to a recursive DNS server to resolve the domain name into an IP address.
4. **DNS Resolution**: The recursive DNS server queries the root DNS servers, then the TLD (Top-Level Domain) servers, and finally the authoritative DNS server for the domain to get the IP address.
5.**Authoritative DNS Response**: The authoritative DNS server responds with the IP address of the web server hosting the requested content.
6.**WAF Check**: If a WAF is in place, it inspects the request for malicious content and applies rate limiting if necessary.
7. **Load Balancer**: If a load balancer is used, it distributes the request to one of the available web servers based on its algorithm.
8. **Web Server Processing**: The web server receives the request and checks if the requested content is static or dynamic.
   - If static, it retrieves the file from its root directory and sends it back to the browser.
   - If dynamic, it processes the request using a backend language, interacts with a database if needed, and generates the HTML response.
9. **Database Interaction**: If the request involves dynamic content, the web server queries the database to retrieve or update data.
10. **Response Generation**: The web server generates the HTML response, which may include data from the database, and sends it back to the browser.
11. **CDN Check**: If a CDN is used, it checks if the requested content is cached on the nearest CDN server. If it is, the CDN serves the content directly to the browser, reducing latency.
12. **Browser Rendering**: The browser receives the HTML response and renders the webpage for the user to view. It may also make additional requests for CSS, JavaScript, and images, which follow a similar process.

