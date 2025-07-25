# Setup Instructions for Post-Quantum OpenSSL Exercises

This setup script installs the necessary dependencies and builds the [Open Quantum Safe (OQS)](https://openquantumsafe.org/) libraries, which extend OpenSSL with post-quantum cryptographic algorithms.

--- 
## Running the script

Once you have downloaded the script into your system make sure that it is executable by running the following

```
chmod +x install_oqs.sh
```

Then run it by typing the following:

```
./install_oqs.sh
```

---

## What This Script Does

1. **Verifies** your OpenSSL version (must be ≥ 3.0.0).
2. **Installs required dependencies** such as `libssl-dev`, `cmake`, and others.
3. **Builds and installs** `liboqs`, the core C library implementing quantum-safe algorithms.
4. **Builds and installs** `oqs-provider`, which allows OpenSSL to use quantum-safe algorithms via a provider.
5. **Instructs you to manually edit** the OpenSSL configuration (`openssl.cnf`) so it loads the OQS provider.
6. **Lists available providers and signature algorithms** to confirm the setup worked.

---

## _ATTENTION:_ Manual Configuration Step

After the script completes, you **must** add the following to your OpenSSL config file (`/etc/ssl/openssl.cnf`):

```
[provider_sect]
default = default_sect
oqsprovider = oqsprovider_sect

[oqsprovider_sect]
activate = 1
```

You can access the file by running: 

You can edit the file with:

```
sudo vim /etc/ssl/openssl.cnf
```

__NOTE:__ If you have newer version of OpenSSL, you may already have Quantum safe algorithims available so please verify your available algorithims by running the following:
```
openssl list -signature-algorithms
openssl list -cipher-algorithms
```

---
##  Final Verification Commands

After editing the config file, confirm everything works with:

```
openssl list -providers
openssl list -signature-algorithms -provider oqsprovider
```
You should see ```oqsprovider``` listed and quantum-safe algorithms like falcon512 or dilithium3.


