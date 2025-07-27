# Day 13- 27th july 2025

# Active Directory Basics

## Windows domains:
- You have big company with 100 employees and 50 computers. 
- a Windows domain is a group of users and computers under the administration of a given business.
- The main idea behind a domain is to centralise the administration of common components of a Windows computer network in a single repository called Active Directory (AD). 
- The server that runs the Active Directory services is known as a Domain Controller (DC).

The main advantages of having a configured Windows domain are:
- Centralised identity management: All users across the network can be configured from Active Directory with minimum effort.
- Managing security policies: You can configure security policies directly from Active Directory and apply them to users and computers across the network as needed.
- e.g. In school/university networks, you will often be provided with a username and password that you can use on any of the computers available on campus.
- Policies will usually be deployed throughout the network so that you don't have administrative privileges over those computers.

## Active Directory:
- In a Windows domain, credentials are stored in a centralised repository.
- This service acts as a catalogue that holds the information of all of the "objects" that exist on your network. Amongst the many objects supported by AD, we have users, groups, machines, printers, shares and many others.
### Users are one of the objects known as security principals, meaning that they can be authenticated by the domain and can be assigned privileges over resources like files or printers. 

It represents user in 2 types:
- People: It treats them like employees.
- services: It treats them according to the work that is done on that domain.

### We got machines. Every machine in you office will be connected to active directory will be added in the machine object.
The machine accounts themselves are local administrators on the assigned computer, they are generally not supposed to be accessed by anyone except the computer itself, but as with any other account, if you have the password, you can use it to log in.
Identifying machine accounts is relatively easy. They follow a specific naming scheme. The machine account name is the computer's name followed by a dollar sign. For example, a machine named DC01 will have a machine account called DC01$.

### Security groups
- you can define user groups to assign access rights to files or other resources to entire groups instead of single users.
- Groups can have both users and machines as members. If needed, groups can include other groups as well.
- Members of this group:
    - domain admins: Users of this group have administrative privileges over the entire domain. By default, they can administer any computer on the domain, including the DCs.
    - Server Operators: Users in this group can administer Domain Controllers. They cannot change any administrative group memberships.
    - Backup Operators: Users in this group are allowed to access any file, ignoring their permissions. They are used to perform backups of data on computers.
    - Account Operators: Users in this group can create or modify other accounts in the domain.
    - Domain Users: Includes all existing user accounts in the domain.
    - Domain Computers: Includes all existing computers in the domain.
    - Domain Controllers: Includes all existing DCs on the domain.

### Active Directory Users and Computers
- This will open up a window where you can see the hierarchy of users, computers and groups that exist in the domain.
- These objects are organised in Organizational Units (OUs) which are container objects that allow you to classify users and machines.
- OUs are mainly used to define sets of users with similar policing requirements.
- The people in sales will have different policies than the IT ones.
- A user can be part of 1 OUs at a time.    
- You can add a child or delete one, edit one, etc. makes things easy. You can even change passwords for the users.

Some containers are auto made by windows like:
- Builtin: Contains default groups available to any Windows host.
- Computers: Any machine joining the network will be put here by default. You can move them if needed.
- Domain Controllers: Default OU that contains the DCs in your network.
- Users: Default users and groups that apply to a domain-wide context.
- Managed Service Accounts: Holds accounts used by services in your Windows domain.

### Security Groups vs OUs
- OUs are handy for applying policies to users and computers
- Security Groups, on the other hand, are used to grant permissions over resources. 

## Managing Users in AD:
### Deleting extra OUs and users
- To delete an additional department, go to view on the top then advange then right click the thing disable the protection feature.

### Delegation

- You can give specific users some control over some OUs.
- One of the most common use cases for this is granting IT support the privileges to reset other low-privilege users' passwords.

- Right click on the OU container. next>add>add name and then check>next>choose the rights>finish.

## Managing computer in AD:
- an excellent starting point is segregating devices according to their use.
Such as:

1. Workstations: This is the device they will use to do their work or normal browsing activities. These devices should never have a privileged user signed into them.
2. Servers:  Servers are generally used to provide services to users or other servers.
3. Domain Controllers: Domain Controllers allow you to manage the Active Directory Domain. These devices are often deemed the most sensitive devices within the network as they contain hashed passwords for all user accounts within the environment.

## Group Policies:
- Windows manages such policies through Group Policy Objects (GPO). GPOs are simply a collection of settings that can be applied to OUs. GPOs can contain policies aimed at either users or computers, allowing you to set a baseline on specific machines and identities.
- SYSVOL  is the name of the network share used to distribute GPOs to domain machines

## Authentication Methods
All credentials are stored in the domain controllers. Whenever a user tries to authenticate to a service using domain credentials, the service will need to ask the Domain Controller to verify if they are correct.
- Two protocols are used:
Kerberos: Used by any recent version of Windows. This is the default protocol in any recent domain.
NetNTLM: Legacy authentication protocol kept for compatibility purposes.

### Kerberos Authentication
This is default for new windows.
- Users who log into a service using Kerberos will be assigned tickets. Think of tickets as proof of a previous authentication. 
-  Users with tickets can present them to a service to demonstrate they have already authenticated into the network before and are therefore enabled to use it.

this is what happens:
1. users sends their username and pass encrypted to the key distributor center.
Kdc will create a Ticket Granting Ticket (TGT), which will allow the user to request additional tickets to access specific services. 
it allows users to request service tickets without passing their credentials every time they want to connect to a service.
 a Session Key is given to the user.
  the TGT is encrypted using the krbtgt account's password hash, and therefore the user can't access its contents.
  the KDC has no need to store the Session Key as it can recover a copy by decrypting the TGT if needed.

When user wants to connect to internet sevice. They will use their TGT to ask the KDC for a Ticket Granting Service (TGS). TGS are tickets that allow connection only to the specific service they were created for.

The TGS is encrypted using a key derived from the Service Owner Hash. The Service Owner is the user or machine account that the service runs under.

## Trees, Forests and Trusts
so far we talked about domain(dc root).

thm.local domain was split into two subdomains for UK and US branches, you could build a tree with a root domain of thm.local and two subdomains called uk.thm.local and us.thm.local, each with its AD, computers and users

The new country has different laws and regulations that require you to update your GPOs to comply. In addition, you now have IT people in both countries, and each IT team needs to manage the resources that correspond to each country without interfering with the other team. 

 Active Directory supports integrating multiple domains so that you can partition your network into units that can be managed independently. If you have two domains that share the same namespace (thm.local in our example), those domains can be joined into a Tree.

 ### Foreset: 2 Tress coming together. eg. thm and mhs different work but can be handle as one.

### Trust relationship
 having a trust relationship between domains allows you to authorise a user from domain THM UK to access resources from domain MHT EU.

 One - way: only one company shares the resources.
two way: both parties agress on sharing each other resources.

