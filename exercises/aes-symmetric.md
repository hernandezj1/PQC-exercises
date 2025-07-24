# Exercise 1: AES Symmetric Encryption

This exercise shows how to encrypt a message with AES and verify it using SHA-256.

---

##  Create Directory Structure

```bash
mkdir sym
cd sym
mkdir Bob Alice
cd Alice
```

---

## Create a Message File

```bash
vim message.txt
# Add your message and save
```

---

##  Encrypt and Hash the Message

```bash
openssl enc -aes-256-cbc -salt -in message.txt -out message.enc -pass pass:password
xxd -p message.enc
sha256sum message.txt > message.txt.sha256
```

---

## Simulate Sending to Bob

```bash
mv message.enc ../Bob/
mv message.txt.sha256 ../Bob/
cd ../Bob
```

---

## Verify and Decrypt

```bash
openssl enc -d -aes-256-cbc -salt -in message.enc -out message.txt -pass pass:password
sha256sum -c message.txt.sha256
```

---

✅ AES with a 256-bit key is considered quantum-safe due to its resistance to brute-force attacks, even under Grover’s algorithm.
