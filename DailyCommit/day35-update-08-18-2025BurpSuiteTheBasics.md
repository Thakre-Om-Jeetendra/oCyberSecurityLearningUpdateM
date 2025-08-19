# DAY 35 18th august 2025

# Burp Suite: The Basics

Our focus will revolve around the following key aspects:

A thorough introduction to Burp Suite.
A comprehensive overview of the various tools available within the framework.
Detailed guidance on the process of installing Burp Suite on your system.
Navigating and configuring Burp Suite.
We will also introduce the core of the Burp Suite framework, which is the Burp Proxy. 

## What is Burp Suite

- It is a java based framwork.

- For conducting web and mobile application penetration.

- It has become Industry standard.

- Used for APIs (application programming interfaces) too.

- It captures and manipulates HTTP/HTTPS traffic.

- By intercepting requests, we can route them.

- Ability to intercept, view and modify requests before it reaches to the web server.

- even Ability to manipulate response before they get to the user.

- We got burp community, professional and enterprise.

- Burp pro is highly potent with advance options.

- Burp enterprise give scanning more power.

- We need license for both pro and enterprise.



## Features of Burp Community

1. **proxy**: **Enables** Interception and Modificiation.

2. **Repeator**: Capturing, modifing and resending same request for multiple times.

3. **Intruder**: **Spraying** endpoints with requests. Used in **brute force**.

4. **Decoder**: Decode captured info and encode payloads **before sending** to the target.

5. **Comparer**: enables comparison of 2 pieces of data either at word or byte level. Ability to send potentially large data segments directly to the comparer using one key is op.

6. **Sequencer**: Employed when assessing the randomness of tokens, such as session cookie values, etc. If the algorithm lacks secure randomness, it can expose avenus for devasting attacks.

**The Burp Suite Extender** module allows for quick and easy loading of extensions into the framework.

While the marketplace, known as the **BApp Store**, enables downloading of third-party modules.


## The Dashboard

You do not understand anything just use google or gpt it.

They got (?) in the dashboard screen. This (?) will guide you through everything.


## Navigation

If an option is not on the tabs just right click your item and the options will pop up.

shortcutS:

Ctrl + Shift + D- Dashboard.
Ctrl + Shift + T- Target tab.
Ctrl + Shift + P- Proxy tab.
Ctrl + Shift + I- Intruder tab.
Ctrl + Shift + R- Repeater tab.


## Options

global settings: default

project settings: just for the specific project.

Just use search option in the settings.


## Introduction to the Burp Proxy

It **enables** the capture of requests and responses between the user and the target web server. 

This intercepted traffic can be **manipulated**, sent to other tools for further processing, or explicitly allowed to continue to its destination.

### Key Points to Understand About the Burp Proxy

#### Intercepting requests:

- Requests can be intercepted and held on using burp.

- You can see them in the proxy tab and now you can manipulate them before sending them to the original destination.

- Click "interception is on" to turn off this feature.


#### Taking control

Ability to intercept gives you total control on the traffic.

You can manipulate however you want.


#### capture and logging:

- we know capturing happens but logging takes place simuntaniously.

- Logs are kept on every intercept.

- Even when you have the interception option turn off **logging still takes place.**


#### Websocket

It supports wwebsockets for futher web penetration.


#### Logs and history

It keeps every log and the history.
The captured requests can be viewed in the HTTP history and WebSockets history sub-tabs.

Look into proxy settings to explore more features.


### Some Notable Features in the Proxy Settings

1.**Response interception:**

- By default this is off and we only capture the requests.

- Turning this on will grant you asscess to intercept with the responds from the server which are meant to see why the requester.


**2. Match and Replace:**

- Enables the use of regex (regular expression) to modify incoming and outgoing requests.

Allows modifying user agent or manipulating cookie.


## Site Map and Issue Definitions

Target tab has more than scope control. 3 sub-tabs are:

**1. Site map:** 

- **Maps out** web app in tree format. 

- Every page we visit while the proxy is on is displaced here.

- It generates automatically.

- Useful in mapping out APIs.

- Makes visually easy.


**2. Issue definition:**

- We do not have full power while using the free version but can do decent scanning.

- This section provides an extensive list of web vulnerabilities and detail info.


**3. scope settings:**

- Used to avoid capturing unnecessary traffic.

- It enables us to include and exclude specific domains/ips to the scope of our testing.


## Burp browser:

- Just use the browser funtion in the burp app or use foxyproxy.

## Scoping and Targeting

Just go to target tab and click on scope.
add scope we are done.


## Example

Let's say you want to use xss in a website's support.

The website is smart and it has a filter that won't allow any kind of script.

Intercept the request and edit the website directly from the burp.

Make sure to encode it using a right click on your script.

Press `forward` button to send the request.
