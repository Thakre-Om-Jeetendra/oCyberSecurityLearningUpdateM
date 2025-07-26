# Day 12 26th july 2025- starting CyberSecurity101

# SEARCH SKILLS
## Introduction
If you search of anything on google you will get millions of results. Most of us will go with first websites that pops up or maybe 3-4 more. But what about those other hidden treasure. Maybe they have something that you need that these top runners don't have it. Just like this notes and me🙂. 

This chapter will equip us with necessary search skills that will lead us to the exact things we need (i.e. me😃).

## Evaluation of Search Results
On internet any one can publish their writings. Anyone can express their feelings and opinions.

But to evaluate the best, we should consider this things:
**1. Source:** Who is the author or the publishing authority. Check whether they are reputable and authoritive on the subject matter. *Publishing a blog does not gives one authority on the subject*. e.g. " Hey, I cleared my medical enterence.": "cool man!" : "Bro, you should not bathe after eating!" : "what? why?" : "cuz, I am a doctor I know!" : "huh(cat meme)? get out...!!!!" p.s clearing a enterence exam does not makes you a doctor!🫥 In case who does this? this is my roommate btw he is pursuing management degree(ya, I live with such people,help🥲)


**2. Evidence and reasoning:** Check if the claim is backup with some credible evidence and logical reasoning. *Seek for hard facts and solid evidence.* e.g."yo, Ai is taking your job!" : "show me where?" : here official news from microsoft : we are cocked! p.s. and the tution fees is too much man!🥲

**3.Objectivity and bias:** Why the author is publishing this? Any hidden agenda like selling some products or competing against a rival. E.g. a big selling company decides to consulting company to launder money😜.

**4.Corroboration and consistency:** Check whether multiple reliable and reputable sources agree on the central claims. E.g. Cross-checking, when you are cheating in exam and you ask a friend(avarage student just like you) and then you ask the topper just to make sure your friend is not wrong. You are feeling my example I know😉.

What do you call a cryptographic method or product considered bogus or fraudulent?: **snake oil** that is what my roommate is.

## Search Engines:
Almost every Internet search engine allows you to carry out advanced searches. This allows you to unlock the full power of internet. Some documents for advance search here:
[Goggle](https://www.google.com/advanced_search)
[DuckDuckGo](https://duckduckgo.com/duckduckgo-help-pages/results/syntax)
[Bing](https://support.microsoft.com/en-us/topic/advanced-search-options-b92e25f1-0085-4271-bdf9-14aaea720930) -never used bing for some reasons.

Let's consider google's search operators. In the advance search webpage they give you examples of all the search type so it is easy but still here:

    **"exact phrase"**: Double quotes indicate that you are looking for pages with the exact word or phrase. For example, one might search for "passive reconnaissance" to get pages with this exact phrase.
    **site:**: This operator lets you specify the domain name to which you want to limit your search. For example, we can search for success stories on TryHackMe using site:tryhackme.com success stories.
    **-**: The minus sign allows you to omit search results that contain a particular word or phrase. For example, you might be interested in learning about the pyramids, but you don’t want to view tourism websites; one approach is to search for pyramids -tourism or -tourism pyramids.
    **filetype:**: This search operator is indispensable for finding files instead of web pages. Some of the file types you can search for using Google are Portable Document Format (PDF), Microsoft Word Document (DOC), Microsoft Excel Spreadsheet (XLS), and Microsoft PowerPoint Presentation (PPT). For example, to find cyber security presentations, try searching for filetype:ppt cyber security.

## Specialized Search Engines:

These were some common search engines that everybody uses. But there are some specific engines for specific uses. We will see them here:

### Shodan:
- It allows you to search for specific types and versions of servers, networking equipment, industrial control systems, and IoT devices.
- [go here](https://www.shodan.io/search/examples)this will take you to examples of stuff you can do on shodan. Try searh apache 2.4.1, it will show you data like how many companies are using it or where the companies are etc.
- Shodan → Like a "Google for unprotected webcams, routers, and industrial machines.

### Censys:
- **Shodan focuses on Internet-connected devices and systems, such as servers, routers, webcams, and IoT devices.**
- **Censys, on the other hand, focuses on Internet-connected hosts, websites, certificates, and other Internet assets.** 
- Some of its use cases include enumerating domains in use, auditing open ports and services, and discovering rogue assets within a network.
- Censys → Like a "Google for certificates and server configurations."

### virustotal:
- An online website that provides a virus-scanning service for files using multiple antivirus engines.
- It allows users to upload files or provide URLs to scan them against numerous antivirus engines and website scanners in a single operation.

### Have I Been Pwned:
- Have I Been Pwned (HIBP) does one thing; it tells you if an email address has appeared in a leaked data breach. 

#### Question:
We know our client(aka browser or search engine) requests server for information from the server. Server has to go on net in order to be global. That means the information is global. When any search engine can easily request the existing information then why do we need a specific search engine?

#### Answer:
1. Deep Web vs. Surface Web: General search engines primarily index the "surface web" (content easily crawlable via links). However, much of the internet's data is in the "deep web" (e.g., databases, academic journals, private forums), which requires specialized tools to access.
    Example: Google Scholar focuses on academic papers, while general Google might miss paywalled or university-hosted research.
Dynamic Content: Some data (e.g., flight prices, stock updates) is generated in real-time and requires dedicated engines to query live databases.

2. Better Results for Niche Queries: A general search engine may prioritize popular or commercial results, while a specialized one can focus on accuracy for a specific domain.
    Example: Searching for a rare medical condition on PubMed yields more precise results than Google.
Custom Ranking Algorithms: Specialized engines use domain-specific criteria to rank results (e.g., legal precedents in LexisNexis vs. general web pages).

3. Some engines aggregate data from closed sources (e.g., government records, patents, or private APIs).
    Example: SEC Edgar for U.S. financial filings, or Wayback Machine for archived web pages.

4. Specialized engines offer tailored filters (e.g., searching for code snippets on GitHub instead of Google).
They may exclude irrelevant content (e.g., a search engine for open-source software won’t return e-commerce links).

5. Some users avoid general engines due to tracking or ads. Alternatives like DuckDuckGo prioritize privacy.
Niche engines may avoid censorship (e.g., Sci-Hub for bypassing paywalls in academic publishing).

6. General engines can’t index everything due to scale constraints. They prioritize high-traffic sites, leaving gaps for niche topics.
Some sites block crawlers (via robots.txt), but specialized engines negotiate access (e.g., LinkedIn for professional profiles).

7. Vertical search engines often serve specific industries (e.g., ThomasNet for industrial suppliers) and monetize through targeted ads or subscriptions.

## Vulnerabilities and Exploits:
### CVE
- Think of the Common Vulnerabilities and Exposures (CVE) program as a dictionary of vulnerabilities.
- This gives us a standardized identifier for vulnerabilities and security issues in software and hardware products. 
- Each vulnerabilty is given a specific id, cve id, this id is unique to that specific vulnerability. So, now anyone even a small ITian can indentify it and search what to do?
- The MITRE Corporation maintains the CVE system.
- CVE™ Program Mission- Identify, define, and catalog publicly disclosed cybersecurity vulnerabilities.
- [Search](https://www.cve.org/) about with your vulnerability's cveid and you get a good report on it.

### Exploit Database
- There are many reasons why you would want to exploit a vulnerable application; one would be assessing a company’s security as part of its red team. 
- Needless to say, we should not try to exploit a vulnerable system unless we are given permission, usually via a legally binding agreement.
- Exploiting a database refers to taking advantage of vulnerabilities or misconfigurations in a database system to gain unauthorized access, steal data, manipulate records, or disrupt operations.
- We need to find a exploit code. [ExploitDatabase](https://www.exploit-db.com/) this has lists exploit codes from various authors; some of these exploit codes are tested and marked as verified.

**Github** contain many tools related to CVEs, along with proof-of-concept (PoC) and exploit codes. 

## Technical Documentation:
### Linux Manual Pages
Linux is cool, you don't need to go anywhere. In the terminal if you want to know what does this does again or what it can do more use `man<command>`. It will open a clean manual hopefully🙂.

### Microsoft Windows
- You can search technical documentation and search there about your quiery or I suggest search Internet or use AI.
- Using AI is better because then you don't have to read through whole document just to know, "how I can find my ip address?" 
- And you can ask AI futher questions like, " How can I find my ip address?" : "here is how you can find your ip add. using terminal. Anything else I can help you with?" : "cool, how do you fuck it up?" : "😕, you good bro?"
- It is fast and easy. And come-on companies won't stop you from using ai for small things. They lauched a ai browser now. And hopefully the company does not hire a child to upload their confindencial data to an outside ai. Hire me instead of such people...

## Social Media
- social media offers a wealth of information for cyber security professionals, whether they are searching for people or technical information. Why is searching for people important, you ask?
- When protecting a company, you should ensure that the people you protect are not oversharing on social media. 
- For instance, their social media might give away the answer to their secret questions, such as, “Which school did you go to as a child?”. Such information might allow adversaries to reset their passwords and take over their accounts effortlessly. (p.s I never though of this thing damn I am glad that I never once mention my personal stuff online,other than some memes, hire me!)
- 




