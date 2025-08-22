# Day 37- 21st august 2025

# OWASP Top 10 - 2021

## 1. Broken Access Control

Broken access control allows attackers to **bypass authorisation**, allowing them to **view sensitive data** or perform tasks they aren't supposed to.

A regular visitor being able to access protected pages can lead to the following:

Being able to view sensitive information from other users.
Accessing unauthorized functionality.


For example, a vulnerability was found in 2019, where an attacker could get any single frame from a Youtube video marked as private. 

The researcher who found the vulnerability showed that he could ask for several frames and somewhat reconstruct the video. 

Since the expectation from a user when marking a video as private would be that nobody had access to it, this was indeed accepted as a broken access control vulnerability.

## Insecure Direct Object Reference

IDOR or Insecure Direct Object Reference refers to an access control vulnerability where you can **access resources you wouldn't ordinarily be able to see.** 

This occurs when the programmer exposes a Direct Object Reference, which is just **an identifier that refers to specific objects within the server.** 

By object, *we could mean a file, a user, a bank account in a banking application, or anything really.*

Notice that direct object references aren't the problem, but rather that the application doesn't validate if the logged-in user should have access to the requested account.



