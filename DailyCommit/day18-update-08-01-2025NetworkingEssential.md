Day 18- 1st August 2025

# Networking Essentials

## DHCP: Give Me My Network Settings
DHCP helps us to set ip address and automate way to configure connected devices.

First, saves time compare with the manual option.
Second, avoids IP conflicts. 2 devices on a same network can not have same IP Add.

This thing use UDP; the server listens on UDP port 67, and the client sends from UDP port 68. Your smartphone and laptop are configured to use DHCP by default.

DHCP follows four steps: Discover, Offer, Request, and Acknowledge **(DORA)**:
    DHCP **Discover**: The client broadcasts a DHCPDISCOVER message seeking the local DHCP server if one exists. " Yo I want to join the room man is any room avaiable?"
    DHCP **Offer**: The server responds with a DHCPOFFER message with an IP address available for the client to accept. "aye, I got you man. I see a room at 10.10.169.02."
    DHCP **Request**: The client responds with a DHCPREQUEST message to indicate that it has accepted the offered IP. " Oh yes! please let me take that man, thanks."
    DHCP **Acknowledge**: The server responds with a DHCPACK message to confirm that the offered IP address is now assigned to this client. " Alright, this room is now you enjoy your 24hr stay."

```
user@TryHackMe$ tshark -r DHCP-G5000.pcap -n
    1   0.000000    0.0.0.0 → 255.255.255.255 DHCP 342 DHCP Discover - Transaction ID 0xfb92d53f
    2   0.013904 192.168.66.1 → 192.168.66.133 DHCP 376 DHCP Offer    - Transaction ID 0xfb92d53f
    3   4.115318      0.0.0.0 → 255.255.255.255 DHCP 342 DHCP Request  - Transaction ID 0xfb92d53f
    4   4.228117 192.168.66.1 → 192.168.66.133 DHCP 376 DHCP ACK      - Transaction ID 0xfb92d53f

```
breakdown of above code:
    1. tshark - this is wireshark tool cmd. A network protocol analyzer.
    2. -r - for read.
    3. DHCP-G5000 - this is The input packet capture file (.pcap or .pcapng)
    4. -n - this say no naming, it saves time.
    5. 0.0.0.0 is the client's ip add (he is homeless right now). He asks the broadcaster(255.255.255.255) for a room. He gives his fingerprint aka the MAC Address.
    6. The server says, "ya here is one."
    7. Client (still homeless) says, "ok please."
    8. The server says, "here is the key take care man, eat something." The server give him a home address aka the ip address.
    9. Remember the food thing the server gives you that is:
            The leased IP address to access network resources
            The gateway to route our packets outside the local network
            A DNS server to resolve domain names.


## ARP: Bridging Layer 3 Addressing to Layer 2 Addressing
As two hosts communicate over a network, an IP packet is encapsulated within a data link frame as it travels over layer 2. 
The two common data link layers we use are Ethernet (IEEE 802.3) and WiFi (IEEE 802.11).

#### Question:
What with this naming sense? Can't we just use normal name istead of numbers!?

#### Answer:
IEEE- An world wide organisation for electronic engineering. IEEE's fist worked with eternet in year 1980 so we got 80 from there 2 is I think just version/type. Same with internet. AND anything after the '.' just the current version.

Whenever one host needs to communicate with another host on the same Ethernet or WiFi, it must send the IP packet within a data link layer frame.
Although it knows the IP address of the target host, it needs to look up the target’s MAC address so the proper data link header can be created.

However, the devices on the same Ethernet network do not need to know each other’s MAC addresses all the time; they only need to know each other’s MAC addresses while communicating. 
Everything revolves around IP addresses.

**Address Resolution Protocol (ARP) makes it possible to find the MAC address of another device on the Ethernet.**

A host with the IP address 192.168.66.89 wants to communicate with another system with the IP address 192.168.66.1.
It sends an ARP Request asking the host with the IP address 192.168.66.1 to respond. 
The ARP Request is sent from the MAC address of the requester to the broadcast MAC address, ff:ff:ff:ff:ff:ff as shown in the first packet. " hEY, who can help me with printing, text me, here is my number aka MAC Address!"
The ARP Reply arrived shortly afterwards, and the host with the IP address 192.168.66.1 responded with its MAC address. :"Yo! I can help you man, here is my business card aka MAC address."
From this point, the two hosts can exchange data link layer frames.

Use `tcpdump` to know this process on your computer.
``` 
tcpdump -r arp.pcapng -n -v

```

Breakdown:
    1. tcpdump is a wireshark cmd. Used for network traffic analysis.
    2. -r: is read.
    3. arp.pcapng: The input packet capture file.
    4. -n: Disables DNS resolution (shows raw IPs instead of hostnames). Makes process fast.
    5. -v (Verbose Mode): Increases the detail level of packet output.

**An ARP Request or ARP Reply is not encapsulated within a UDP or even IP packet; it is encapsulated directly within an Ethernet frame.**

ARP is considered layer 2 because it deals with MAC addresses. Others would argue that it is part of layer 3 because it supports IP operations. What is essential to know is that ARP allows the translation from layer 3 addressing to layer 2 addressing.

What is the destination MAC address used in an ARP Request?
ff:ff:ff:ff:ff:ff

## ICMP: Troubleshooting Networks
**Internet Control Message Protocol (ICMP) is mainly used for network diagnostics and error reporting.**

**It has 2 popular commands:**
    1.`ping`: This command uses ICMP to test connectivity to a target system and measures the round-trip time (RTT). In other words, it can be used to learn that the target is alive and that its reply can reach our system.
        - The ping command sends an ICMP Echo Request (ICMP Type 8).
        - The computer on the receiving end responds with an ICMP Echo Reply (ICMP Type 0).
        - Many things might prevent us from getting a reply. 
        - *In addition to the possibility of the target system being offline or shut down, a firewall along the path might block the necessary packets for ping to work.*
        - **we used -c 4 to tell the ping command to stop after sending four packets.** I did not knew this and have to use keyboard interrupter always.
    2.`traceroute`: This command is called traceroute on Linux and UNIX-like systems and tracert on MS Windows systems. It uses ICMP to discover the route from your host to the target.
        - The Internet protocol has a field called Time-to-Live (TTL) that indicates the maximum number of routers a packet can travel through before it is dropped.
        - **The router decrements the packet’s TTL by one before it sends it across. When the TTL reaches zero, the router drops the packet and sends an ICMP Time Exceeded message (ICMP Type 11). (In this context, “time” is measured in the number of routers, not seconds.)** 
        - Some routers don’t respond; in other words, they drop the packet without sending any ICMP messages. 
        - Some do and reveal their private address.
        - Some show their public address and domain name. With that we know their geographial locations.
        - Finally, there is always a possibility that an ICMP Time Exceeded message gets blocked and never reaches us.
        - *The traversed route might change as we rerun the command.*

Which IP header field does the traceroute command require to become zero?
TTL (TIME TO LIVE)


## Routing

A few routing protocols so that you become familiar with their names:
    - OSPF (Open Shortest Path First): OSPF is a routing protocol that allows routers to share information about the network topology and calculate the most efficient paths for data transmission. **OSPF opens shorted path**.
    - EIGRP (Enhanced Interior Gateway Routing Protocol): EIGRP is a Cisco proprietary routing protocol that combines aspects of different routing algorithms. It allows routers to share information about the networks they can reach and the cost (like bandwidth or delay) associated with those routes. Routers then use this information to choose the most efficient paths for data transmission. **EIGRP it combines different algorithms to choose most eficient path**.
    - BGP (Border Gateway Protocol): BGP is the primary routing protocol used on the Internet. It allows different networks (like those of Internet Service Providers) to exchange routing information and establish paths for data to travel between these networks. BGP helps ensure data can be routed efficiently across the Internet, even when traversing multiple networks. **This is for the internet beyond LAN. It connects different networks to work on a path.**
    - RIP (Routing Information Protocol): RIP is a simple routing protocol often used in small networks. Routers running RIP share information about the networks they can reach and the number of hops (routers) required to get there. As a result, each router builds a routing table based on this information, choosing the routes with the fewest hops to reach each destination. **This is for LAN this will calculate which path will be best after thinking on different answers. EIGRP but for small network.**


## NAT
We have 4 billion spaces for devices using ipv4. With increase in number of technology we needed a solution and that's were NAT came.

The idea behind NAT lies in **using one public IP address to provide Internet access to many private IP addresses.** In other words, if you are connecting a company with twenty computers, **you can provide Internet access to all twenty computers by using a single public IP address instead of twenty public IP addresses.**

Technically speaking, *the number of IP addresses is always expressed as a power of two.* To be technically accurate, with NAT, **you reserve two public IP addresses instead of thirty-two.** Consequently, *you would have saved thirty public IP addresses.* And those public ip add will subnet other ips typeshyt.

Unlike routing, which is the natural way to route packets to the destination host, routers that support NAT must find a way to track ongoing connections. 

Consequently, **NAT-supporting routers maintain a table translating network addresses between internal and external networks.** Generally, *the internal network would use a private IP address range, while the external network would use a public IP address.*

For instance, the laptop might establish a connection with some web server. *From the laptop perspective, the connection is initiated from its IP address 192.168.0.129 from TCP source port number 15401;* however, **the web server will see this same connection as being established from 212.3.4.5 and TCP port number 19273,** The router does this address translation seamlessly.

#### Question
Assuming that the router has infinite processing power, approximately speaking, how many thousand simultaneous TCP connections can it maintain?

#### Answer
65- we might have infinite router power but we are limited with the number of ports.

#### Question
Why ports are limited?

#### Answer
It is due to the 16-bit port number constraint in the TCP/UDP protocol. 

#### Question
Why Not Increase Port Bits?

#### Answer
Backward Compatibility: Every device on earth assumes 16-bit ports.
IPv6 Doesn’t Fix This: Ports remain 16-bit even in IPv6 (but more IPs help).








