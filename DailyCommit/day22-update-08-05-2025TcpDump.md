# DAY 22- 5TH AUGUST 2025 MY MOTHER'S BIRTHDAY YOOHOOO. 
Even I have not done anything that will make them(my parents) pround yet I will be their child now and forever. I love my family but I am in such a mess now that I am a shame to them, I am a failure right now. I have broke their expectation again and again. 
O GOD, please be with me and held hand show me the way. 

# Tcpdump: The Basics

This room aims to provide you with the basics necessary to use tcpdump. In particular, you will learn how to:
    Capture packets and save them to a file
    Set filters on captured packets
    Control how captured packets are displayed

## Basic Packet Capture

In any real scenario, we must be specific about what to listen to, where to write, and how to display the packets.


### Specify the Network Interface

YOU Decide is which network interface to listen to using **`-i <INTERFACE>`**. You can choose to listen on all available interfaces using `-i any`. E.g. `-i eth0`.
    - `ip address show` (or merely **`ip a s`**) would list the available network interfaces. We see one network card, ens5.

#### Question
Why choose a interface in the first place? Can't we see all trafic at once.

#### Answer
We see traffic is like car traffic. Even though a turnel would have all the cars going in one direction after the end of the turnel they will go to their own way. Some will enter in New York, some will go to New Jerssey and some will be like buses they have their own route.

### Save the Captured Packets

This can be achieved by saving to a file using **`-w <FILE>`**. The file extension is most commonly set to **".pcap"**. The saved packets can be inspected later using another program, such as **"Wireshark"**. You won’t see the packets scrolling when you choose the -w option.

### Read Captured Packets from a File

You can use Tcpdump to read packets from a file by using -r FILE.

#### Question
Why use tcpdump's `-r` when you can just use wireshark to do the same and much more?

#### Answer
Use tcpdump -r for:
    Quick checks, scripting, remote servers, and pre-filtering.

Use Wireshark for:
    Deep inspection, visual analysis, and protocol decoding.

**Think of tcpdump -r as a "quick grep for packets" and Wireshark as a "full packet laboratory."**

-r will be quicker than wireshark.


### Limit the Number of Captured Packets

using **`-c <COUNT no>`**. Without specifying a count, the packet capture will continue till you interrupt it, for example, by pressing **CTRL-C**. Depending on your goal, you only need a limited number of packets.

### Don’t Resolve IP Addresses and Port Numbers

**Tcpdump will resolve IP addresses and print friendly domain names where possible.** So, instead of google's ip you will get google.com. **To avoid making such DNS lookups, you can use the -n argument.** You have to add `-n` to your command to display addresses only in numeric format.

Similarly, **if you don’t want port numbers to be resolved, such as 80 being resolved to http,** you can use the **`-nn`** to *stop both* DNS and port number lookups.

### Produce (More) Verbose Output

**Verbose means more**. There are 3 levels of `-v`. 
`-v`: gives basic info.
`-vv`: more info than `-v`.
`-vvv`: more more info than `-v`.


### Consider the following examples:
    `tcpdump -i eth0 -c 50 -v` captures and displays 50 packets by listening on the eth0 interface, which is a wired Ethernet, and displays them verbosely.

    `tcpdump -i wlo1 -w data.pcap` captures packets by listening on the wlo1 interface (the WiFi interface) and writes the packets to data.pcap. It will continue till the user interrupts the capture by pressing CTRL-C.

    `tcpdump -i any -nn` captures packets on all interfaces and displays them on screen without domain name or protocol resolution.


## Filtering Expressions

Although you can run tcpdump without providing any filtering expressions, this won’t be useful. *Just like in a social gathering, you don’t try to listen to everyone at the same time.*

### Filtering by Host

Let’s say you are *only interested in IP packets exchanged with your network printer or a specific game server.* **You can easily limit the captured packets to this host using host IP or host HOSTNAME**

example: `sudo tcpdump host example.com -w http.pcap` 
breakdown: 
    - sudo: for authority or if you've loggin as root then no need for `sudo`.
    - tcpdump: invoking the lib
    - host: defining what is next.
    - example.com: name of the host.
    - `-w`: command to save
    - http.pcap: the file to save with the extention pcap.

**Want to limit the packets to those from a particular source IP address or hostname, you must use src host IP or `src host HOSTNAME`.**

**limit packets to those sent to a specific destination using dst host IP or `dst host HOSTNAME`.**

This is a filter and `-c <count>` stops after a specfic capture.


#### Filtering by Port

Want to capture packets from a perticular port like port 53? just use the port no. that's  it.

`sudo tcpdump -i ens5 port 53 -n`

==PORT 53 IS A PORT WHERE DNS HAPPENS.==

so, ` tcpdump -r <filename> port 53 -c 1` will give use What is the hostname (subdomain) appears in the first DNS query.

*You can limit the packets to those from a particular source port number or to a particular destination port number using `src port PORT_NUMBER` and `dst port PORT_NUMBER`, respectively.*


### Filtering by Protocol

You can limit your packet capture to a specific protocol; examples include: ip, ip6, udp, tcp, and icmp.

example: `sudo tcpdump -i ens5 icmp -n`

### Logical operators:
- and:
     `tcpdump host 1.1.1.1 and tcp`. *Captures packets where both conditions are true.*
            host 1.1.1.1 → Filters packets involving IP 1.1.1.1 (either source or destination).
            and tcp → Further restricts the output to only TCP packets.

- or:
    `tcpdump udp or icmp`. *Captures packets when either one of the conditions is true*

- not: `tcpdump not tcp` captures all packets except TCP segments. 


**you can count the lines by piping the output via the wc command.**


## Advanced Filtering
greater <LENGTH>: Filters packets that have a length greater than or equal to the specified length
less <LENGTH>: Filters packets that have a length less than or equal to the specified length
e.g. `tcpdump -r <filename> greater<15000> -c -n` will give use top 3 with simplified info. 


**STUCK use command `man pcap-filter`.**

### Binary Operations

A binary operation works on bits, i.e., zeroes and ones. An operation takes one or two bits and returns one bit.

TYPES:
- & (And) takes two bits and returns 0 unless both inputs are 1. **both should be 1 to get 1** this is true or false from python.

- | (Or) takes two bits and returns 1 unless both inputs are 0. This is shown in the table below. **if both are 0 then only we get 0.**

- ! (Not) takes one bit and inverts it; an input of 1 gives 0, and an input of 0 gives 1. **So, 0 will give 1 and 1 will give 0. this will give the opposite answer.**


### Header Bytes

The purpose of this section is to be able to filter packets based on the contents of a header byte. Consider the following protocols: ARP, Ethernet, ICMP, IP, TCP, and UDP.

Using pcap-filter, **Tcpdump allows you to refer to the contents of any byte in the header using the following syntax proto[expr:size]**, where:
    *proto refers to the protocol.* For example, arp, ether, icmp, ip, ip6, tcp, and udp refer to ARP, Ethernet, ICMP, IPv4, IPv6, TCP, and UDP respectively.
    *expr indicates the byte offset, where 0 refers to the first byte.*
    *size indicates the number of bytes that interest us,* which can be one, two, or four. It is optional and is **one by default.**

**This is for byte level filtering. We use `tcpdump -r capture.pcap arp` to filter usally if not dealing with bytes.**

EXAMPLES:
1. `ether[0] & 1 != 0` 
    **BREAKDOWN:** 
        - `ether[0]`: takes the first byte in the Ethernet header and the decimal number 1 (binary digits uses 0s and 1s to make another digits so the 1 is partner of that 0) (i.e., 0000 0001 in binary)
        - & : using & both statement has to be true(1) to get a true(1) answer. 
        - 1 : 1 is 1 = Multicast/Broadcast (sent to multiple devices).
        - !=0: not equal to 0. that 1 should not equal to zero. If this comes true then we know that there are other devices using that ethernet.
    **The purpose:**
        - The purpose of this filter is to show packets sent to a multicast address. 
        **- A multicast Ethernet address is a particular address that identifies a group of devices intended to receive the same data.**

2.`ip[0] & 0xf != 5`
    **BREAKDOWN**:
        - ip[0]: the first byte of ip4 header.
        - &: using & both statement has to be true(1) to get a true(1) answer. 
        - 0xf: 0xf in hex = 00001111 in binary. So it is asking to extact only the lower 4 bits (IHL field) of the ip[0], ignoring the version.
        - !=5: not equal to 5. Ip header has lenght of 5. If the result comes true that means this ip has not all space filled and **it still has IP OPTIONS.**
    **PURPOSE:**
        - Meaning: "Capture only IPv4 packets where the header is longer than 20 bytes (has options)."
        - Ignores: Normal IPv4 packets (no options).
        - he purpose of this filter is to catch all IP packets with options.


## Displaying Packets

-q: Quick output; print brief packet information
-e: Print the link-level header. **If you are on an Ethernet or WiFi network and want to include the MAC addresses in Tcpdump output,** all you need to do is to add this cmd.
-A: Show packet data in ASCII
-xx: Show packet data in hexadecimal format, referred to as hex
-X: Show packet headers and data in hex and ASCII. **If we combine `-A` and `-xx` we get this.**

example: `tcpdump -r <filename> arp -c 1 -e` this will show 1st packet's info including mac address.

