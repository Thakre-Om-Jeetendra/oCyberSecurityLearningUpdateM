# Day 5 - Update - july 19, 2025

## 1.Packets & Frames

### 1. What are Packets and Frames
- Packets and frames are small pieces of data that, when forming together, make a larger piece of information or message. However, they are two different things in the OSI model.
- A frame is at layer 2 - the data link layer, meaning there is no such information as IP addresses. Think of this as putting an envelope within an envelope and sending it away. The first envelope will be the packet that you mail, but once it is opened, the envelope within still exists and contains data (this is a frame).
- This is encapsulated data, meaning that the frame is inside the packet. The packet is the outer layer, and the frame is the inner layer.
- Packets are efficent because the data is broken down into smaller pieces, which can be sent over the network more easily. This is especially important for large files or messages that need to be transmitted quickly.
- Some notabel headers in packets include:
  - Source IP address
  - Destination IP address
  - Checksum
  - Time to Live (TTL)

- Packets have ip but frames do not.

### 2.TCP/IP (The Three-Way Handshake)
- We know Transmission Control Protocol from the previous day, but what is the three-way handshake?
- TCP have various section add for encapsulation.
- Some important headers in TCP include:
  - **Source port**
    - It is like a sea port from the senders side. A value is chosen randomly (out of the ports from 0-65535 that aren't already in use at the time).
  - **Destination port**
    - As the name suggests, this is the port where ship(data) is going to be recieved. Unlike the source port, this value is not chosen at random.
  - **Sequence number**
   - When a connection occurs, the first piece of data transmitted is given a random number.
  - **Acknowledgment number**
    - After a piece of data has been given a sequence number, the number for the next piece of data will have the sequence number + 1. We'll
  - **Flags (SYN, ACK, FIN, etc.)**
    - This header determines how the packet should be handled by either device during the handshake process. Specific flags will determine specific behaviours.
  - **Source IP address**
    - This is the IP address of the sender, which is used to identify the source of the data.
  - **Destination IP address**
    - Recievers IP address.
  - **checksum**
    - This value is what gives TCP integrity. A mathematical calculation is made where the output is remembered. When the receiving device performs the mathematical calculation, the data must be corrupt if the output is different from what was sent.
  - **Data**
    - this header is where the data, i.e. bytes of a file that is being transmitted, is stored.

- **Three-way handshake** - the term given for the process used to establish a connection between two devices. 
- The process is as follows:
  1. **SYN** - A SYN message is the initial packet sent by a client during the handshake. This packet is used to initiate a connection and synchronise the two devices together
  2. **SYN-ACK** - This packet is sent by the receiving device (server) to acknowledge the synchronisation attempt from the client.
  3. **ACK** - The sender sends a final packet with the ACK flag set, confirming the connection.
  4. **Data Transfer** - After the three-way handshake is complete, data can be sent between the two devices.
  5. **FIN** - When the data transfer is complete, a FIN packet is sent to terminate the connection. This packet indicates that the sender has finished sending data and is ready to close the connection.
  6. **RST** - If there is an error during the connection establishment or data transfer, a RST packet can be sent to reset the connection. This packet indicates that the connection has been terminated due to an error or unexpected condition.

##### question: 3 way hanshake is the term given for the process used to establish a connection between 2 devices. I thought the process was called session?- The term "session" refers to a broader concept that encompasses the entire communication process between two devices, including the establishment, maintenance, and termination of the connection. The three-way handshake is a specific part of that session establishment process, specifically for TCP connections.

##### question: So should the tcp 3 ways handshake included in the session layer rather than the transport layer? Since it is dealing with the establishment of a session between two devices?- The three-way handshake is indeed part of the session establishment process, but it is primarily associated with the transport layer (Layer 4) of the OSI model. The transport layer is responsible for providing reliable communication between devices, and the three-way handshake is a mechanism used to establish that reliable connection. The session layer (Layer 5) deals with managing sessions and maintaining connections, but the actual connection establishment through the three-way handshake occurs at the transport layer.

- Any sent data is given a random number sequence and is reconstructed using this number sequence and incrementing by 1. Both computers must agree on the same number sequence for data to be sent in the correct order. This order is agreed upon during three steps:

    - 1. SYN - Client: Here's my Initial Sequence Number(ISN) to SYNchronise with (0)
    - SYN/ACK - Server: Here's my Initial Sequence Number (ISN) to SYNchronise with (5,000), and I ACKnowledge your initial number sequence (0)
    - ACK - Client: I ACKnowledge your Initial Sequence Number (ISN) of (5,000), here is some data that is my ISN+1 (0 + 1)

- Because TCP reserves system resources on a device, it is best practice to close TCP connections as soon as possible.
- To close the connection, the FIN packet is sent. This is how the process works:
  - Client: I am done sending data, here is a FIN packet.
  - Server: I ACKnowledge your FIN packet, here is my FIN packet.
  - Client: I ACKnowledge your FIN packet, the connection is now closed.

##### question: fin is used to cleanly close the connection after it has been completed but I thought it was session's job to close connection. - FIN (L4): Closes the data pipe (transport layer).Session (L5): Manages higher-level state (e.g., user authentication).

### 3. UDP (User Datagram Protocol)
- We know UDP from the previous day. It just have a few headers that are different from TCP.
- Some important headers in UDP include:
    - Time to Live (TTL)
    - Source port
    - Destination port
    - Source Address
    - Destination Address
    - Data
- UDP is stateless. No acknowledgement is sent during a connection.
- Request and response are sent without waiting for an acknowledgement.

### 4. Intro to Ports:
- Ports are like sea ports for data.
- Think of a harbour and port. Ships wishing to dock at the harbour will have to go to a port compatible with the dimensions and the facilities located on the ship. When the ship lines up, it will connect to a port at the harbour. Take, for instance, that a cruise liner cannot dock at a port made for a fishing vessel and vice versa.
-  When a connection has been established (recalling from the OSI model's room), any data sent or received by a device will be sent through these ports. In computing, ports are a numerical value between 0 and 65535 (65,535).
- Because ports can range from anywhere between 0-65535, there quickly runs the risk of losing track of what application is using what port. A busy harbour is chaos! Thankfully, we associate applications, software and behaviours with a standard set of rules. For example, by enforcing that any web browser data is sent over port 80, software developers can design a web browser such as Google Chrome or Firefox to interpret the data the same way as one another.
- This means that all web browsers now share one common rule: data is sent over port 80. How the browsers look, feel and easy to use is up to the designer or the user's decision.
- Any port that is within 0 and 1024 (1,024) is known as a common port. 
- Common ports are reserved for specific applications and services. For example:
  - Port 80: HTTP (Hypertext Transfer Protocol) - used for web traffic.
  - Port 443: HTTPS (HTTP Secure) - used for secure web traffic.
  - Port 21: FTP (File Transfer Protocol) - used for file transfers.
  - Port 22: SSH (Secure Shell) - used for secure remote access.

## 2. Extending Your Network
### 1. Introduction to Port Forwarding:
- Port forwarding is an essential component in connecting applications and services to the Internet. Without port forwarding, applications and services such as web servers are only available to devices within the same direct network.
- If the administrator wanted the website to be accessible to the public (using the Internet), they would have to implement port forwarding.
- computer to router, router to internet, internet to router, router to computer.
- Port forwarding is configured at the router of a network.

### 2. Firewall 101:
- A firewall is a device within a network responsible for determining what traffic is allowed to enter and exit. Think of a firewall as border security for a network. An administrator can configure a firewall to permit or deny traffic from entering or exiting a network based on numerous factors such as:
    - Where the traffic is coming from? (has the firewall been told to accept/deny traffic from a specific network?)
    - Where is the traffic going to? (has the firewall been told to accept/deny traffic destined for a specific network?)
    - What port is the traffic for? (has the firewall been told to accept/deny traffic destined for port 80 only?)
    - What protocol is the traffic using? (has the firewall been told to accept/deny traffic that is UDP, TCP or both?)
- Firewalls perform packet inspection to determine the answers to these questions.
- Hardware firewalls used for big businesses. 
- Software firewalls used for home users.
- 2 TYPES:
    - **Stateful** 
        - This type of firewall uses the entire information from a connection; rather than inspecting an individual packet, this firewall determines the behaviour of a device based upon the entire connection.
        - This firewall type consumes many resources in comparison to stateless firewalls as the decision making is dynamic. For example, a firewall could allow the first parts of a TCP handshake that would later fail.
        - If a connection from a host is bad, it will block the entire device.
    - **Stateless**
        - This type of firewall inspects each packet individually, making decisions based on the information contained within that packet.
        - Stateless firewalls are less resource-intensive than stateful firewalls, as they do not need to maintain a record of the entire connection.
        - However, these firewalls are great when receiving large amounts of traffic from a set of hosts (such as a Distributed Denial-of-Service attack)
        - dummy: these firewalls are only effective as the rules that are defined within them. If a rule is not exactly matched, it is effectively useless.

### 3. VPN  basic:
- A VPN (Virtual Private Network) is a technology that allows users to create a secure connection over the Internet. It encrypts the data sent between the user's device and the VPN server, making it difficult for anyone to intercept or read the data.
-  Virtual Private Network (or VPN for short) is a technology that allows devices on separate networks to communicate securely by creating a dedicated path between each other over the Internet (known as a tunnel). Devices connected within this tunnel form their own private network.
- Remember port forwarding? So in order to get your data or web service known to the whole world you need to port forward. If you dont port forward, your data is only available to devices within the same network aka the direct network. When you port forward your device gets a public IP address. And thus your data is available to the whole world.
- VPN allows the user to enter in the direct network of the service provider. This means that the user can access the service as if they were physically present in the same location as the service provider.And the service provider does not know where are you from because it is not availabe in the public domain. And the service provider don't have to port forward the service to the whole world. 
- VPN allows:
    - Allows networks in different geographical locations to be connected.
    - Offers privacy.
    - Offers anonymity.

- VPN techologies like:
    - PPP
        - allow for authentication and provide encryption of data. VPNs work by using a private key and public certificate (similar to SSH). A private key & certificate must match for you to connect.
        - This technology is not capable of leaving a network by itself (non-routable).
    - PPTP
        - The Point-to-Point Tunneling Protocol (PPTP) is the technology that allows the data from PPP to travel and leave a network. 

        - PPTP is very easy to set up and is supported by most devices. It is, however, weakly encrypted in comparison to alternatives.
    - IPSec
        - Internet Protocol Security (IPsec) encrypts data using the existing Internet Protocol (IP) framework.

        - IPSec is difficult to set up in comparison to alternatives; however, if successful, it boasts strong encryption and is also supported on many devices.

### 4. LAN Networking Devices:
- We know how LAN works.
- Router are used at layer 3 and used for routing packets.
- Switches are used at layer 2 and used for switching frames.
- layer 2 switches are solely responsible for sending frames to the correct device.
- layer 2 can't work at layer 3 because it does not have the IP address information. It only has the MAC address information.
- layer 3 switches will send frames to devices (as layer 2 does) and route packets to other devices using the IP protocol. 

- We got **VLANs** allows specific devices within a network to be virtually split up. This split means they can all benefit from things such as an Internet connection but are treated separately. This network separation provides security because it means that rules in place determine how specific devices communicate with each other. 
- Let's say a company has a sales team and a marketing team. The sales team needs to access customer data, while the marketing team needs to access social media platforms. By creating VLANs, the company can ensure that the sales team can only access customer data and the marketing team can only access social media platforms. This separation helps to protect sensitive information and ensures that each team can work efficiently without interference from the other.