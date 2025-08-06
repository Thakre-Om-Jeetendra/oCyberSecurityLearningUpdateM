# DAY 23 6th august 2025

Wow I got time to do one more chapter good.
# Cryptography Basics

While networking protocols have made it possible for devices spread across the globe to communicate, cryptography has made it possible to trust this communication

we will cover:
    Cryptography key terms
    Importance of cryptography
    Caesar Cipher
    Standard symmetric ciphers
    Common asymmetric ciphers
    Basic mathematics commonly used in cryptography


## Importance of Cryptography

The term secure includes confidentiality and integrity of the communicated data. 

**Cryptography can be defined as the practice and study of techniques for secure communication and data protection where we expect the presence of adversaries and third parties.**

In other words, these adversaries should not be able to disclose or alter the contents of the messages.

Cryptography is used to protect confidentiality, integrity, and authenticity. 

In this age, you use cryptography daily, and you’re almost certainly reading this over an encrypted connection. 

**you will learn that the data should be encrypted both while being stored (at rest) and while being transmitted (in motion).**

Just like how bank use Payment Card Industry Data Security Standard (PCI DSS) for your credit card information.

handling medical records requires complying with their respective standards. Unlike credit cards, the standards for handling medical records vary from one country to another. 


**So, if you open a company and if you handle something sensitive info of customers then you need to know rules and regulation.**



## Plaintext to Ciphertext

We begin with the plaintext that we want to encrypt. 

The plaintext is the readable data; it can be anything from a simple “hello”, a cat photo, credit card information, or medical health records. 

From a cryptography perspective, these are all “plaintext” messages waiting to be encrypted. 

**The plaintext is passed through the encryption function along with a proper key; the encryption function returns a ciphertext.**

*The encryption function is part of the cipher; a cipher is an algorithm to convert a plaintext into a ciphertext and vice versa.*

**To recover the plaintext, we must pass the ciphertext along with the proper key via the decryption function, which would give us the original plaintext.**

cipher is pronounced as "sai·fr"


## Historical Ciphers

the Caesar Cipher from the first century BCE. The idea is simple: shift each letter by a certain number to encrypt the message.

### Caesar cipher:
OM -> rp.
    - you shift to 3 excluding 'o' so, r.
    - you shift to 3 excluding 'm' so, p.

**The Caesar cipher works by shifting letters by a fixed number (the key). This key can be any number but upto 25 only.**

As you can see it can be easily cracked with only 25 keys possible. So, caesar cipher is not consider secure.


## Types of Encryption

### Symmetric Encryption

Symmetric encryption, also known as symmetric cryptography, **uses the same key to encrypt and decrypt the data.**

Keeping the key secret is a must; it is also called **private key cryptography.**

Furthermore, communicating the key to the intended parties can be challenging as it requires a secure communication channel. 

**Maintaining the secrecy of the key can be a significant challenge, especially if there are many recipients.** 

The problem becomes more severe in the presence of a powerful adversary; consider the threat of industrial espionage, for instance.

Examples of symmetric encryption are DES (Data Encryption Standard), 3DES (Triple DES) and AES (Advanced Encryption Standard).
    DES was adopted as a standard in 1977 and uses a 56-bit key. With the advancement in computing power, in 1999, **a DES key was successfully broken in less than 24 hours,** motivating the shift to 3DES.
    3DES is DES applied three times; consequently, the key size is 168 bits, though the effective security is 112 bits. 3DES was more of an ad-hoc solution when DES was no longer considered secure. **3DES was deprecated in 2019** and should be replaced by AES; however, it may still be found in some legacy systems.
    **AES was adopted as a standard in 2001.** Its key size can be 128, 192, or 256 bits.

There are many more symmetric encryption ciphers used in various applications; however, they have not been adopted as standards.

You need a secure channel/way to send that key to someone else. One way is by meeting in-person, BECAUSE IF YOU TRY INTERNET HACKERS WILL SAY HELLO TO YOU.


### Asymmetric Encryption

asymmetric encryption uses a pair of keys, one to encrypt and the other to decrypt, This is ben-10 typeshyt 🤣. 

To protect confidentiality, asymmetric encryption or asymmetric cryptography encrypts the data using the public key; hence, it is also called public key cryptography.

#### here is my own analogy on this

So asymmetric encryption is like a mailbox with name(public) of the house owner(u) on it. It is visible to public. 

Now let's say a person pass by your house and he want's to contect you. But you are very rare person. 

So, he writes the letter(plaintext) and mail it on "your named" mailbox. Once the letter is in he or anyone can not see retrieve it. 

Only you have the key to that mailbox and it is private.
---------------------------------------------------------------------------------

Examples are RSA, Diffie-Hellman, and Elliptic Curve cryptography (ECC). The two keys involved in the process are referred to as a public key and a private key. 

**Asymmetric encryption tends to be slower, and many asymmetric encryption ciphers use larger keys than symmetric encryption.**

For example, RSA uses 2048-bit, 3072-bit, and 4096-bit keys; 2048-bit is the recommended minimum key size. 

Asymmetric encryption is based on a particular group of mathematical problems that are easy to compute in one direction but extremely difficult to reverse. 

In this context, extremely difficult means practically infeasible.

**For example, we can rely on a mathematical problem that would take a very long time, for example, millions of years, to solve using today’s technology.**

#### names used generally
Alice = Sender

Bob = Receiver

Eve = Eavesdropper

Mallory = Evil hacker


## Basic Math

I hate this cuz I don't know this and taught me this. The final boss MATHEMATICS.

The building blocks of modern cryptography lie in mathematics. To demonstrate some basic algorithms, we will cover two mathematical operations that are used in various algorithms:

XOR Operation
Modulo Operation


### XOR Operation

XOR, short for “exclusive OR”, is a logical operation in binary arithmetic that plays a crucial role in various computing and cryptographic applications.

**In binary, XOR compares two bits and returns 1 if the bits are different and 0 if they are the same, as shown in the truth table below.** 

This operation is often represented by the symbol ⊕ or ^.

#### You may be wondering how XOR can play any role in cryptography. 

XOR has several interesting properties that make it useful in cryptography and error detection. 

One key property is that applying XOR to a value with itself results in 0, and applying XOR to any value with 0 leaves it unchanged. 

**This means A ⊕ A = 0, and A ⊕ 0 = A for any binary value A.**

Additionally, XOR is commutative, i.e., A ⊕ B = B ⊕ A. And it is associative, i.e., (A ⊕ B) ⊕ C = A ⊕ (B ⊕ C).


#### Let’s see how we can make use of the above in cryptography. 
We will demonstrate how XOR can be used as a basic symmetric encryption algorithm. 
**Consider the binary values P and K, where P is the plaintext, and K is the secret key. The ciphertext is C = P ⊕ K.**

Now, **if we know C and K, we can recover P.**

We start with C ⊕ K = (P ⊕ K) ⊕ K.

But we know that (P ⊕ K) ⊕ K = P ⊕ (K ⊕ K) because XOR is associative. 

Furthermore, we know that K ⊕ K = 0; consequently, (P ⊕ K) ⊕ K = P ⊕ (K ⊕ K) = P ⊕ 0 = P. 

In other words, XOR served as a simple symmetric encryption algorithm. In practice, it is more complicated as we need a secret key as long as the plaintext.

*p.s.* -believe me I understood every step but if you ask me to solve it I might not be able to I need practice🥲. That is why I fear math **you need to solve many example to fix it in your mind.**

### Modulo Operation

Another mathematical operation we often encounter in cryptography is the modulo operator, commonly written as % or as mod. The modulo operator, X%Y, is the remainder when X is divided by Y. In our daily life calculations, we focus more on the result of division than on the remainder. The remainder plays a significant role in cryptography.

You need to work with large numbers when solving some cryptography exercises. If your calculator fails, we suggest using a programming language such as Python. Python has a built-in int type that can handle integers of arbitrary size and would automatically switch to larger types as needed. Many other programming languages have dedicated libraries for big integers. If you prefer to do your math online, consider WolframAlpha.

Let’s consider a few examples:
    25%5 = 0 because 25 divided by 5 is 5, with a remainder of 0, i.e., 25 = 5 × 5 + 0
    23%6 = 5 because 23 divided by 6 is 3, with a remainder of 5, i.e., 23 = 3 × 6 + 5
    23%7 = 2 because 23 divided by 7 is 3 with a remainder of 2, i.e., 23 = 3 × 7 + 2

**An important thing to remember about modulo is that it’s not reversible.** 

**If we are given the equation x%5 = 4, infinite values of x would satisfy this equation.**

The modulo operation always returns a non-negative result less than the divisor. This means that for any integer a and positive integer n, the result of a%n will always be in the range 0 to n − 1.

Well mostly I will rely on ai to solve maths but I think having maths skill is very valuable and I will start learning it once I find time for it. (Oh, where did my old days of fun go. I should i studied when I had the time🥲)


