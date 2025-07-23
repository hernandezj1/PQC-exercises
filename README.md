# QURECA Hands-On Workshop: Post-Quantum Cryptography

This repository supports **Lesson 4.3** of the QURECA Quantum Security Course: **Post-Quantum Cryptography (PQC)**.

---

## Goal

This hands-on session will help you:

- Practice **symmetric encryption** using AES-256-CBC.
- Explore **post-quantum certificate creation** using the hybrid algorithm `mldsa44_rsa2048` via Open Quantum Safe.

AES remains considered **quantum-resistant** at large key sizes (e.g. 256 bits), while hybrid PQC algorithms help transition asymmetric encryption systems to future-safe standards.

---

## Setup

For these exercises, please ensure you have OpenSSL 3.0.x installed and with the pertinent OQS ( Open Quantum Safe Provider). If you do not please refer to our install script which will guide you through the necessary steps and dependencies. Also please be aware that changes to your system's security are highly delicate and we reccomend you use a separate server such as the ones provided by the CoCalc platform which will allow you to do these exercises without endangering your system's security.


