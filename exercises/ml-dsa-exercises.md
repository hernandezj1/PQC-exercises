# Exercise 2: Post-Quantum Certificate with MLDSA

## What are Certificates?

Digital certificates are cryptographic credentials used to verify the identity of users, devices, or servers on the internet. They are typically issued by a **Certificate Authority (CA)** and include a **public key** and identifying information (like a domain name), all digitally signed by the CA.

## Why Post-Quantum Certificates?

Most digital certificates today rely on RSA or ECC for digital signatures. However, **quantum computers** could break these using Shor’s algorithm. Post-quantum certificates use **quantum-resistant algorithms** like MLDSA (a hybrid of lattice-based and classical crypto) to ensure long-term security even in the quantum era.

---

## Generate a Post-Quantum Certificate using MLDSA

This exercise shows how to generate a post-quantum certificate using the **MLDSA hybrid algorithm** via **OpenSSL + liboqs**.

---

###  Step 1: Generate a Root CA Certificate

```bash
openssl req -x509 -new -newkey mldsa44_rsa2048 -keyout root_CA.key -out root_CA.crt -nodes -subj "/CN=test CA" -days 365
openssl x509 -in root_CA.crt -text -noout
```

---

### Step 2: Generate Alice's Key and Certificate Signing Request (CSR)

```bash
openssl genpkey -algorithm mldsa44_rsa2048 -out alice_private.key
openssl req -new -key alice_private.key -out A-req.csr
```

---

###  Step 3: Sign Alice’s Certificate with the Root CA

```bash
openssl x509 -req -in A-req.csr -CA root_CA.crt -CAkey root_CA.key -CAcreateserial -out A.crt -days 500 -sha256
openssl x509 -in A.crt -text -noout
```

---

Alice now has a **post-quantum-safe certificate** signed by a hybrid MLDSA root CA!
