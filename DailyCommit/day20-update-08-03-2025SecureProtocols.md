# DAY 20- 3rd AUGUST 2025

# Networking Secure Protocols

As we read in the previous chapter of core protocols are not secure. We know that during transport a hacker can steal them and it can help him to gain insight our profile.

Authenticity means ensuring we are talking with the correct server, not a fake one.

**Transport Layer Security (TLS) is added** to existing protocols to protect communication confidentiality, integrity, and authenticity. Consequently, HTTP, POP3, SMTP, and IMAP become HTTPS, POP3S, SMTPS, and IMAPS, where the appended “S” stands for Secure. 

**Similarly, it is deemed insecure to remotely access a system using the TELNET protocol; Secure Shell (SSH) was created to provide a secure way to access remote systems.**


## TLS (Transport Layer Security)

At one point, you would only need a packet-capturing tool to read all the chats, emails, and passwords of the users on your network.

*Nowadays, it has become uncommon to come across a service that sends login credentials in cleartext.*

Like SECURE SOCKET LAYER (SSL), its predecessor, TLS is a cryptographic protocol operating at the OSI model’s transport layer. 
It allows secure communication between a client and a server over an insecure network. 
By secure, we refer to confidentiality and integrity; TLS ensures that no one can read or modify the exchanged data.

Like SSL, its predecessor, TLS is a cryptographic protocol operating at the OSI model’s transport layer. **It allows secure communication between a client and a server over an insecure network. By secure, we refer to confidentiality and integrity; TLS ensures that no one can read or modify the exchanged data.**

Generally speaking, getting a certificate signed requires paying an annual fee. However, Let’s Encrypt allows you to get your certificate signed for free.

This certificates tells your server is reliable and can be trusted.
**A self-signed certificate cannot prove the server’s authenticity as no third party has confirmed it.**


## HTTPS

**HTTP relies on TCP and uses port 80 by default. We also saw how all HTTP traffic was sent in cleartext for anyone to intercept and monitor.** 

After resolving the domain name to an IP address, the client will carry out the following two steps:
    1. Establish a TCP three-way handshake with the target server
    2. Communicate using the HTTP protocol; for example, issue HTTP requests, such as GET / HTTP/1.1

### HTTP Over TLS:

HTTPS will require the following three steps (after resolving the domain name):
    1. Establish a TCP three-way handshake with the target server
    2. Establish a TLS session
    3. Communicate using the HTTP protocol; for example, issue HTTP requests, such as GET / HTTP/1.1

- TCP session is established in the first three packets, marked with 1.
    - SYN 
    - SYN, ACK
    - ACK

- Then, *several packets are exchanged to negotiate the TLS protocol, marked with 2.* This is checking tls.
    **1 and 2 are where the TLS negotiation and establishment take place.** So, if they show you a pic and ask how many packets it took to establish a connection? ADD paackets from 1 and 2 before http data.

- Finally, HTTP application data is exchanged, marked with 3.
    we see that it says “Application Data” because there is no way to know if it is indeed HTTP or some other protocol sent over port 443.

If one tries to follow the stream of packets and combine all their contents, they will only get gibberish. 

In wireshark, **The exchanged traffic is encrypted; the red is sent by the client, and the blue is sent by the server. There is no way to know the contents without acquiring the encryption key.**

### Getting the Encryption Key:
Adding TLS to HTTP leads to all the packets being encrypted. **Until you get the private key everything is safe.**
Although it is improbable that we will have access to the keys used for encryption in a TLS session. It is still possible for hackers to get that key.

*The key takeaway is that TLS offered security for HTTP without requiring any changes in the lower or higher layer protocols. In other words, TCP and IP were not modified, while HTTP was sent over TLS the way it would be sent over TCP.*


## SMTPS, POP3S, and IMAPS

Similar to http when we get other protocols over TLS they become secure, same process. some of them are:

HTTPS : 443
SMPTS : 465 & 587
POP3S : 995
IMAPS : 993
FTPS  : 990

#### Question
If you capture network traffic, in which of the following protocols can you extract login credentials: SMTPS, POP3S, or IMAP?

#### Answer

IMAP because it is not secured.


## SSH Secure Shell 

This is a secure version of telnet. Why? because *telnet's all the traffic is sent in cleartext. Meaning your credentials are not encrpted and if anyone gets hold on the packets they can see your credentials.*

Nowadays, when you use an SSH client, it is most likely based on OpenSSH libraries and source code.

OpenSSH offers several benefits. We will list a few key points:
    Secure authentication: **Besides password-based authentication, SSH supports public key and two-factor authentication.**
    Confidentiality: **OpenSSH provides end-to-end encryption**, protecting against eavesdropping. Furthermore, it notifies you of new server keys to protect against man-in-the-middle attacks.
    Integrity: **In addition to protecting the confidentiality of the exchanged data, cryptography also protects the integrity of the traffic.**
    Tunneling: **SSH can create a secure “tunnel” to route other protocols through SSH. This setup leads to a VPN-like connection.**
    X11 Forwarding: If you connect to a Unix-like system with a graphical user interface, SSH allows you to use the graphical application over the network.


- You would issue the command `ssh <username>@<ip/hostname>` to connect to an SSH server, if username is same as your current user name then `ssh <ip/hostname>`

- Then, you will be asked for a password; however, if public-key authentication is used, you will be logged in immediately.

- The argument -X is required to support running graphical interfaces. And you use it like this `ssh <username>@<ip/hostname> -X.`

**While the TELNET server listens on port 23, the SSH server listens on port 22.**



## SFTP and FTPS
SFTP, SSH File Transport Protocol, allows secure file transfer. **It is part of the SSH protocol suite and shares the same port number, 22.**

If enabled in the OpenSSH server configuration, you can **connect** using a command such as **`sftp username@hostname.`** Once logged in, you can issue commands such as **`get filename`** and **`put filename** to download and upload files, respectively. Generally speaking, SFTP commands are Unix-like and can differ from FTP commands.

**SFTP should not be confused with FTPS.** You are right to think that FTPS stands for File Transfer Protocol Secure. **FTPS it is secured using TLS, just like HTTPS.** **While FTP uses port 21, FTPS usually uses port 990.** It requires certificate setup, and **it can be tricky** to allow over strict firewalls as it uses separate connections for control and data transfer.

**SFTP IS SIMPLE TO SET UP**.


## VPN

When tcp/ip were made they can transfer packets. If 1 router goes down tcp will calculate other routes and send the packets from different route. If some how packets felt threatened on a route and refuse to go mid way, tcp will send them from different way automatically. BUt there was no machanism to determine whether  ensure that all data leaving or entering a computer is protected from disclosure and alteration.

*Almost all companies require “private” information exchange in their virtual network.*
So, a VPN provides a very convenient and relatively inexpensive solution. 
**The main requirements are Internet connectivity and a VPN server and client.**

So, (branch company's path) different devices-different data -> database server -> vpn client (encrpyted) -> router ->  internet  -> vpn server (main company) -> decrypt -> firewall -> to the database server -> to the devices.

**A tunnel in networking (used in VPNs, SSH, etc.) is a secure, encapsulated connection that routes traffic between two points over an untrusted network (like the internet) as if they were directly connected.** It is literally a turnel.

When we try to access an Internet service or web application, **they will not see our public IP address but the VPN server’s.**
This is why some Internet users connect over **VPN to circumvent geographical restrictions.**
**Furthermore, the local ISP will only see encrypted traffic,** which limits its ability to censor Internet access.

**In other words, if a user connects to a VPN server in Japan, they will appear to the servers they access as if located in Japan.**
These servers will customise their experience accordingly, such as redirecting them to the Japanese version of the service.

**When you use a VPN, you usually expect all your internet traffic to go through the VPN's secure tunnel—hiding your real IP and encrypting everything. But sometimes, VPNs don’t work this way.**

- Normal VPN: All your internet traffic goes through the VPN (e.g., browsing, YouTube, downloads).
- Limited VPN: Only traffic to the private network (like a company’s files/database) goes through the VPN.
    Example: **Your office VPN lets you access work files but doesn’t hide your Netflix traffic.**

Even if a VPN claims to hide your IP, sometimes:
    - DNS leaks: Your computer asks your ISP (not the VPN) for website addresses, exposing your real location.
    - WebRTC leaks: Browsers can accidentally reveal your true IP.
         **Fix: Run a DNS leak test (just Google "DNS leak test") to check.**

         