# DAY 24- 7TH AUGUST 2025

# Public Key Cryptography Basics

**authentication**, i.e., you are confirming the identity of who you are talking with.

**authenticity**, i.e., you verify that the message genuinely comes from a specific sender.

**integrity**, i.e., ensuring that the data has not been altered or tampered with.

**confidentiality**, i.e., only the authorised parties can access the data.


Private key cryptography, i.e., **symmetric encryption, mainly protects confidentiality.** 

However, public key cryptography, i.e., **asymmetric cryptography, plays a significant role in authentication, authenticity, and integrity.**


## Common Use of Asymmetric Encryption

Asymmetric encryptions are slow, meaning they take sweet time to decrypt. But symmetric encryptions are fast to decrypt but they are extremely risky.

So, generally we people will use Asymmetric encryption to encrypt the common symmetric key, meaning we just made a secure channel.

Once the receiver gets the Asymmetric encryption he easily opens it and use the symmetric key to open the symmetric ciphertext. 

Why he was easily able to open Asymmetric encryption? because the data was smaller in it (it was just the key to symmetric) so it quick.

In reality, you need more cryptography to verify that the person you’re talking to is who they say they are. This is achieved using digital signatures and certificates.


## RSA

RSA is a public-key encryption algorithm that enables secure data transmission over insecure channels. 

With an insecure channel, we expect adversaries to eavesdrop on it.

### The Math That Makes RSA Secure

Multiplying two large prime numbers is a straightforward operation; however, **finding the factors of a huge number takes much more computing power.**

This is a feasible job by hand or even by computer. 

consider this:
Prime number 1: 982451653031
Prime number 2: 169743212279
Their product: 982451653031 × 169743212279 = 166764499494295486767649

t’s pretty tricky to determine what two prime numbers multiply together to make 14351 and even more challenging to find the factors of 166764499494295486767649.

**In real-world examples, the prime numbers would be much bigger than the ones in this example.** 

A computer can easily factorise 166764499494295486767649; however, **it cannot factorise a number with more than 600 digits.** 

And you would agree that the multiplication of the two huge prime numbers, each around 300 digits, would be easier than the factorisation of their product.


## Diffie-Hellman Key Exchange

### **Diffie-Hellman Key Exchange (Simplified)**  
Imagine two people, **Alice** and **Bob**, want to share a secret number (key) over an insecure channel (like the internet) without ever sending the actual key. Here’s how they do it:

---

### **Step 1: Agree on Public Numbers**  
1. **Pick a large prime number `p`** (e.g., 23).  
2. **Choose a base number `g`** (e.g., 5).  
   - *These are public and known to everyone, even hackers.*

---

### **Step 2: Alice and Bob Choose Private Numbers**  
- **Alice picks a secret number `a`** (e.g., 6).  
- **Bob picks a secret number `b`** (e.g., 15).  
  - *These are never shared with anyone.*

---

### **Step 3: Compute Public Values**  
- **Alice calculates `A = g^a mod p`**:  
  `A = 5⁶ mod 23 = 15,625 mod 23 = **8**`  
- **Bob calculates `B = g^b mod p`**:  
  `B = 5¹⁵ mod 23 = 30,517,578,125 mod 23 = **19**`  
  - *They send `A` and `B` to each other publicly.*

---

### **Step 4: Compute the Shared Secret**  
- **Alice calculates the secret: `s = B^a mod p`**:  
  `s = 19⁶ mod 23 = 47,045,881 mod 23 = **2**`  
- **Bob calculates the secret: `s = A^b mod p`**:  
  `s = 8¹⁵ mod 23 = 35,184,372,088,832 mod 23 = **2**`  

Now, **both have the same secret key (`2`)** without ever transmitting it!  

---

### **Why It’s Secure**  
- **Eavesdroppers see `p=23`, `g=5`, `A=8`, `B=19`** but can’t find `a` or `b` without solving the **discrete logarithm problem** (computationally hard for large primes).  
- **No key is ever sent over the network!**

---

### **Real-World Analogy**  
1. **Public numbers (`p`, `g`)**: Like mixing colors publicly.  
2. **Private numbers (`a`, `b`)**: Like secret ingredients each adds.  
3. **Exchanging `A` and `B`**: Like swapping mixed colors.  
4. **Shared secret**: Both derive the same final color, but outsiders can’t reverse-engineer the secret ingredients.  

---

### **Python Example**  
```python
p, g = 23, 5          # Public
a, b = 6, 15          # Private (never sent!)

A = (g ** a) % p      # Alice sends A=8 to Bob
B = (g ** b) % p      # Bob sends B=19 to Alice

s_Alice = (B ** a) % p  # Alice computes secret: 2
s_Bob = (A ** b) % p    # Bob computes secret: 2

print(s_Alice == s_Bob) # True!
```

---

### **Key Takeaways**  
1. **No key is exchanged directly** → Secure against eavesdropping.  
2. **Security relies on math (discrete logarithms)**.  
3. **Used in HTTPS, VPNs, SSH** to establish session keys.  


## SSH

### Authenticating the Server

The SSH client confirms whether we recognise the server’s public key fingerprint. ED25519 is the public-key algorithm used for digital signature generation and verification. Fingerprint example: SHA256:lLzhZc7YzRBDchm02qTX0qsLqeeiTCJg5ipOT0E/YM8. You can use it to verify if it is the same thing that we were suppose to have or not.

So, if it is your first time with that id the ssh will ask if your trust it or not and type yes/no.


### Authenticating the Client

**Now that we have confirmed that we are talking with the correct server, we need to identify ourselves and get authenticated.**

Many case our login id and pass is the verification.bUt this is not consider a secure practice.

At some point, one will surely hit a machine with SSH configured with key authentication instead. 

**This authentication uses public and private keys to prove the client is a valid and authorised user on the server.** 

**By default, SSH keys are RSA keys.** You can choose which algorithm to generate and add a passphrase to encrypt the SSH key.

Some of the options that you see are:
    DSA (Digital Signature Algorithm) is a public-key cryptography algorithm specifically designed for digital signatures.
    ECDSA (Elliptic Curve Digital Signature Algorithm) is a variant of DSA that uses elliptic curve cryptography to provide smaller key sizes for equivalent security.
    ECDSA-SK (ECDSA with Security Key) is an extension of ECDSA. It incorporates hardware-based security keys for enhanced private key protection.
    Ed25519 is a public-key signature system using EdDSA (Edwards-curve Digital Signature Algorithm) with Curve25519.
    Ed25519-SK (Ed25519 with Security Key) is a variant of Ed25519. Similar to ECDSA-SK, it uses a hardware-based security key for improved private key protection.


On using `ssh-keygen -t <name of the option/empty>` we will be asked:
    to enter custom file name or the keys will go default. **Public keys will be store with the extension of `.pub`**
    Then asked for passphrase, it is like a password to to see the private file/key.
    done.

To see them go `cd ~`.

if we had used -t rsa, the resulting keys would have been much longer. Weshould use -t rsa always.

The key should always be safe with a passphrase. 

Someone with your private key can log in to servers that accept it, i.e., include it among the authorised keys, unless the key is encrypted with a passphrase.  

It’s very important to mention that the passphrase used to decrypt the private key doesn’t identify you to the server at all; it only decrypts the SSH private key. The passphrase is never transmitted and never leaves your system.

Using tools like John the Ripper, you can attack an encrypted SSH key to attempt to find the passphrase, highlighting the importance of using a complex passphrase and keeping your private key private.


### Using SSH Keys to Get a “Better Shell”

**Private SSH keys must have strict permissions to prevent unauthorized access.**
If permissions are too loose (e.g., world-readable), the SSH client will refuse to use the key and show a warning like:
    `Permissions 0644 for '<privateKeyFileName>' are too open.`
**Only the owner should have read/write access.**

Only the owner should have read/write access.
    `chmod 600 ~/.<ssh/privateKeyFileName>`
This means:
    Owner (you): Read + Write (rw-)
    Group/Others: No access (---)

how to use the key:
    `ssh -i ~/.ssh/privateKeyFileName <user@host>.example.com`
-i flag specifies the key file.


### Keys Trusted by the Remote Host

**The ~/.ssh folder is the default place to store these keys for OpenSSH.**

The authorized_keys (note the US English spelling) file in this directory holds public keys that are allowed access to the server if key authentication is enabled. By default on many Linux distributions, key authentication is enabled as it is more secure than using a password to authenticate. Only key authentication should be accepted if you want to allow SSH access for the root user.

### Using SSH Keys to Get a “Better Shell”

Leaving an SSH key in the authorized_keys file on a machine can be a useful backdoor, and you don’t need to deal with any of the issues of unstabilised reverse shells like Control-C or lack of tab completion. Just for regular user.


## Digital Signatures and Certificates

In day to day life you will be asked to fill out and sign the application. 

For example, it can confirm that you agree to the terms and conditions, authorise a transaction, or acknowledge receiving an item. 

In the “digital” world, you cannot use your signature, stamp or fingerprint; you need a digital signature.

### What’s a Digital Signature?

Digital signatures provide a way **to verify the authenticity and integrity** of a digital message or document. 

Proving the authenticity of files means we know who created or modified them.

Using asymmetric cryptography, you produce a signature with your private key, which can be verified using your public key.

Only you should have access to your private key, which proves you signed the file. 

In many modern countries, digital and physical signatures have the same legal value.

**The simplest form of digital signature is encrypting the document with your private key. If someone wants to verify this signature, they would decrypt it with your public key and check if the files match.**

We use the term digital signature to refer to signing a document using a private key or a certificate. 

This is where **Bob encrypts a hash of his document and shares it with Alice, along with the original document.**

**Alice can decrypt the encrypted hash and compare it with the hash of the file she received.** 

This approach proves the document’s integrity, unlike pasting a fancy image of a signature.

### Certificates: Prove Who You Are!

*Certificates are an essential application of public key cryptography*, and they are also linked to digital signatures. 

A common place where they’re *used is for HTTPS.*

How does your web browser know that the server you’re talking to is the real tryhackme.com?

The certificates have a chain of trust:
    the certificate is signed by an organisation, the organisation is trusted by a CA, and the CA is trusted by your browser. 
    Therefore, your browser trusts the certificate. 
    In general, there are long chains of trust. 

Let’s say you have a website and want to use HTTPS: 
    This step requires having a TLS certificate. 
    You can get one from the various certificate authorities for an annual fee.     
    Furthermore, you can get your own TLS certificates for domains you own using Let's Encrypt for free. 
    If you run a website, it’s worth setting up and switching to HTTPS, as any modern website would do.

## PGP and GPG

**PGP stands for Pretty Good Privacy.**

*It’s software that implements encryption for encrypting files, performing digital signing, and more.*

GnuPG or GPG is an open-source implementation of the OpenPGP standard.

**GPG is commonly used in email to protect the confidentiality of the email messages.**
 
Furthermore, it can be used to sign an email message and confirm its integrity.

use `gpg --full-gen-key` to do it.

You may need to use GPG to decrypt files in CTFs. With PGP/GPG, private keys can be protected with passphrases in a similar way that we protect SSH private keys. If the key is passphrase protected, you can attempt to crack it using John the Ripper and gpg2john.

### Practi﻿cal Example

Now that you have your GPG key pair, you can share the public key with your contacts. 
Whenever your contacts want to communicate securely, they encrypt their messages to you using your public key. 
To decrypt the message, you will have to use your private key. Due to the importance of the GPG keys, it is vital that you keep a backup copy in a secure location.

Let’s say you got a new computer. All you need to do is import your key, and you can start decrypting your received messages again:

You would use `gpg --import <backup.key>` to import your key from backup.key
To decrypt your messages, you need to issue `gpg --decrypt </confidential_message.gpg>`

## conclusion

there are other types like:

1. Cryptography is the science of securing communication and data using codes and ciphers.
2. Cryptanalysis is the study of methods to break or bypass cryptographic security systems without knowing the key.
3. Brute-Force Attack is an attack method that involves trying every possible key or password to decrypt a message.
4. Dictionary Attack is an attack method where the attacker tries dictionary words or combinations of them.


