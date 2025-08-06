# DAY 23 6th august 2025

# Nmap: The Basics
will learn how to:
    Discover live hosts
    Find running services on the live hosts
    Distinguish the different types of port scans
    Detect the versions of the running services
    Control the timing
    Format the output

nmap is ping on steriod.


## Host Discovery: Who Is Online

This task aims to find out how to use Nmap to discover the live hosts.

 Nmap uses multiple ways to specify its targets:
    IP range using -: If you want to scan all the IP addresses from 192.168.0.1 to 192.168.0.10, you can write 192.168.0.1-10
    IP subnet using /: If you want to scan a subnet, you can express it as 192.168.0.1/24, and this would be equivalent to 192.168.0.0-255
    Hostname: You can also specify your target by hostname, for example, example.thm

 **`-sn` option, i.e., ping scan, if  you want to discover the online hosts on a network.**

### Scanning a “Local” Network:

we use the term “local” to refer to the network we are directly connected to, such as an Ethernet or WiFi network.

If we run `-sn <our ip add 0/24>` we will get the name of the device, that device's mac address and we can figure out the network card vendors, which is beneficial information as it can help us guess the type of target device(s).

when we run this scan, we are sending arp request and if the target response nmap mark it as "host is up" and gives us the latency.


### Scanning a “Remote” Network

In this context, *“remote” means that at least one router separates our system from this network.* 
As a result, **all our traffic to the target systems must go through one or more routers.**
- Unlike scanning a local network, we cannot send an ARP request to the target.

e.g: Our system has the IP address 192.168.66.89 and belongs to the 192.168.66.0/24. Even if our ip belongs to the same subnet as other. Our network has to go through a different router.

This is return us only "the host is up or not" and latency that's it.

Well how does nmap knows if the host is alive or dead?:
    - It throws 2 icmp requests.
    - If the host is alive it will respond.
    - If is the host does not replies, it will send two ICMP echo (ping) requests, two ICMP timestamp requests, two TCP packets to port 443 with the SYN flag set, and two TCP packets to port 80 with the ACK flag set. The target didn’t respond to any it is declared "dead".

Nmap sent two ICMP echo (ping) requests, two ICMP timestamp requests, two TCP packets to port 443 with the SYN flag set, and two TCP packets to port 80 with the ACK flag set. The target didn’t respond to any. We observe several ICMP destination unreachable packets from the 192.168.11.151 router.

**`-sL` only lists the targets to scan without actually scanning them. This important because we don't want to waste time scanning useless stuff.**

## Port Scanning: Who Is Listening

As the title suggest we are going to search the webservice now. 
By network service, we mean any process that is listening for incoming connections on a TCP or UDP port. 
Common network services include web servers, which usually listen on TCP ports 80 and 443, and DNS servers, which typically listen on UDP (and TCP) port 53.

TCP has 65,535 ports, and the same applies to UDP.


### Scanning TCP Ports:

ou attempt to complete the TCP three-way handshake with every target port; however, only open TCP ports would respond appropriately and allow a TCP connection to be established. 

But you have to use `telnet` and have to try connect every port.

#### Connect scan:

Connect scan does the same thing as above.
But now it will do it for us instead of us doing everything manually.

**`-sT`** will trigger the scan. 
It will try the three-way handshake with every target TCP port.
If the TCP port turns out to be open and Nmap connects successfully, Nmap will tear down the established connection.

##### Question
What does Tear-down means?

#### Answer
Tearing Down the Connection: Instead of keeping the connection alive or sending/receiving data (like a browser would), Nmap immediately closes the connection (sends a FIN or RST packet) after confirming the port is open.

#### SYN Scan (Stealth):

This will the most used one. **`-sS`**

Unlike connect scan, which will completely connect with the target, this will never complete the connection.

This will give out "syn" and the target will send "syn-ack" but then this will send "rst". The taget will "syn" and this will "rst-ack". And the process ends.

The advantage is that this is expected to lead to fewer logs as the connection is never established, thus stealthy.

### Scanning UDP ports:

MOstly almost every service uses TCP but if we find some using UDP then use this  **`-sU`.**

examples include DNS, DHCP, NTP (Network Time Protocol), SNMP (Simple Network Management Protocol), and VoIP (Voice over IP). 

UDP does not require establishing a connection and tearing it down afterwards.

If several ICMP destination unreachable (port unreachable) responses as Nmap sends UDP packets to closed UDP ports. No futher investigation like TCP.

### Limiting the Target Ports:

Nmap will by default will scan first 1000 most common ports across the internet. For that you just need `nmap<target ip/name>`.

But we might need something else so:
    - `-F` will things faster. It will now only scan most common 100 instead of 1000.
    - `-p[range]`: a specific range of ports. e.g. **p10-1024** will only scan from port 10 to 1024.
    

## Version Detection: Extract More Information

### OS Detection

As the name suggest it help detect the os version but **it is not reliable**.

use  `-o`. This will only guess maybe between x or z.

### Service and Version Detection

You discovered several open ports and want to know what services are listening on them. **`-sV`** enables version detection.


### BOTH

If you want to use both `-o` x `-sV`, use **`-A`.** 

This option enables OS detection, version scanning, and traceroute, among other things.

But this is "loud". This things send so many things at the target all of the sudden that the target get's alert.


### Forcing the Scan

when we run our port scan `-sS` and there is a possibility that the target host does not reply during the host discovery phase (e.g. a host doesn’t reply to ICMP requests or maybe the firewall shit). 

Consequently, Nmap will mark this host as down and won’t launch a port scan against it. 

We can ask Nmap to treat all hosts as online and port scan every host, including those that didn’t respond during the host discovery phase. 

This choice can be triggered by adding the **`-Pn`** option.


## Timing: How Fast is Fast?

Running your scan at its normal speed might trigger an IDS (intrusion detection system) or other security solutions. It is reasonable to control how fast a scan should go depending on your situation.

we launch a SYN scan targeting the 100 most common TCP ports, nmap -sS 10.201.87.37 -F. We repeated the scan with different timings: T0, T1, T2, T3, and T4.

T0 (paranoid): 9.8 hours - It is the slowest chance of triggering a ids is low. 
T1 (sneaky): 27.53 minutes - if you do not have patience to wait of almost 10hr this is good too.
T2 (polite): 40.56 seconds
T3 (normal): 0.15 seconds - this is the default, so, when run your scan this is takes place
T4 (aggressive): 0.13 seconds - this thing is brute force. I don't care just get me in typeshyt. This is when you do not care if you are discovered but want to get in and get things done asap.

### Other methods are like this:
 
**1. Parallel Probes (`--min-parallelism` & `--max-parallelism`)**
- **What it means**: Controls how many **simultaneous port scans** Nmap runs at once.  
- **Why it matters**: More parallel probes = faster scan, but too many can overwhelm the network.  

**Example**:  
Imagine Nmap is a **team of workers** knocking on doors (ports) to see which ones are open:  
- **Default**: Nmap automatically adjusts workers based on network conditions.  
  - If the network is slow (packets dropping), it reduces workers to **1** (one knock at a time).  
  - If the network is fast, it increases workers to **hundreds** (many knocks at once).  
- **Manual Control**:  
  ```bash
  nmap --min-parallelism 10 --max-parallelism 50 target.com
  ```  
  - **Minimum 10 workers**: Never go below 10 simultaneous probes.  
  - **Maximum 50 workers**: Never exceed 50, even if the network can handle more.  

**When to Use?**  
✔ If the network is **unstable** (e.g., Wi-Fi drops packets), set `--max-parallelism` to a low number (e.g., `10`).  
✔ If you want **faster scans** on a reliable network, increase `--max-parallelism` (e.g., `100`).  

---

**2. Packet Rate Control (`--min-rate` & `--max-rate`)**
- **What it means**: Controls how many **packets per second** Nmap sends.  
- **Why it matters**: Higher rate = faster scan, but may trigger firewalls or get you blocked.  

#### **Example**:  
Think of Nmap as a **machine gun** shooting packets:  
- **Default**: Nmap adjusts speed automatically (slow on bad networks, fast on good ones).  
- **Manual Control**:  
  ```bash
  nmap --min-rate 100 --max-rate 500 target.com
  ```  
  - **Minimum 100 packets/sec**: Never go slower than this.  
  - **Maximum 500 packets/sec**: Never exceed this, even if the network allows it.  

**When to Use?**  
✔ **Slow scans** (`--max-rate 50`) for stealth (avoid detection).  
✔ **Fast scans** (`--max-rate 1000`) for quick results on safe networks.  

---

**Key Differences**  
| Feature | `--min/max-parallelism` | `--min/max-rate` |
|---------|------------------------|------------------|
| **Controls** | Number of **simultaneous probes** (workers) | **Packets per second** (speed) |
| **Use Case** | Adjusts **concurrency** (how many ports are checked at once) | Adjusts **bandwidth** (how aggressively packets are sent) |
| **Example** | `--max-parallelism 20` (max 20 ports scanned at once) | `--max-rate 200` (max 200 packets/sec) |

---

**Which One Should You Use?**  
- **For stability** (avoiding timeouts/drops) → Use `--max-parallelism`.  
- **For speed control** (avoiding detection/overload) → Use `--max-rate`.  


The last option we will cover in this task is --host-timeout <time>. This option specifies the maximum time you are willing to wait, and it is suitable for slow hosts or hosts with slow network connections.

This is like gambling you set a mindset like after spending 50 dollars you will backout. The difference is you will actually backout from scanning unlike the gambling(you might spend $1000- I know from a personal experience, it was a friend 😜).


## Output: Controlling What You See

### Verbosity and Debugging

We know about our friend verbose from the previous chapter. It provides addition details that are not displayed normally. We know verbose types: -v, -vv, -vvv, -vvvv Or -v, -v2, -v3, -v4, -v5, etc.

Same thing if you want to know more about the scan and in more details like debugging level typeshty then we have: -d to -d9


### Saving Scan Report

The three most useful are normal (human-friendly) output, XML output, and grepable output, in reference to the grep command.

You can select the scan report format as follows:
    -oN <filename> - Normal output
    -oX <filename> - XML output
    -oG <filename> - grep-able output (useful for grep and awk)
    -oA <basename> - Output in all major formats

So, you use  nmap `-sS 192.168.139.1 -oA gateway` this will auto store your results in oN, oX and oG. You do not need to separetly go to add extension to gateway file.

## Use sudo :

**It is worth noting that it is best to run Nmap with sudo privileges so that we can make use of all its features. Running Nmap with local user privileges will still work; however, you should expect many features to be unavailable. You get a minimal portion of Nmap’s power when running it as a local user.**


