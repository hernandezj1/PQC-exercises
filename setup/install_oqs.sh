#!/bin/bash

# OpenSSL Seminar Installation Script (No config edits)

set -e  # Exit on error

echo "=== Verifying OpenSSL version (must be >= 3.0.0) ==="
openssl version

# --- Step 1 : Install Dependencies ---
echo "=== Installing required dependencies ==="
sudo apt update
sudo apt install -y astyle cmake gcc ninja-build libssl-dev python3-pytest \
    python3-pytest-xdist unzip xsltproc doxygen graphviz python3-yaml valgrind

# --- Step 2: Clone and Build liboqs ---
echo "=== Cloning liboqs and building ==="
git clone -b main https://github.com/open-quantum-safe/liboqs.git
cd liboqs
mkdir build && cd build
cmake -GNinja ..
ninja
sudo ninja install
cd ~

# --- Step 3: Clone and Build oqs-provider ---
echo "=== Cloning oqs-provider and building ==="
git clone https://github.com/open-quantum-safe/oqs-provider.git
cd oqs-provider
cmake -S . -B _build
cmake --build _build
ctest --test-dir _build
sudo cmake --install _build
cd ~

# --- Manual Step: Edit openssl.cnf ---
echo "=== Manual Step Required ==="
echo "Please open /etc/ssl/openssl.cnf in a text editor with sudo:"
echo "    sudo vim /etc/ssl/openssl.cnf"
echo ""
echo "Then add the following lines if not already present:"
echo ""
echo "[provider_sect]"
echo "default = default_sect"
echo "oqsprovider = oqsprovider_sect"
echo "[oqsprovider_sect]"
echo "activate = 1"
echo ""
