#!/bin/bash
set -euo pipefail

SSH_KEY="$HOME/.ssh/id_ed25519"

if [[ -f "$SSH_KEY" ]]; then
    echo "SSH key already exists at $SSH_KEY"
    exit 0
fi

echo "Generating new SSH key..."
ssh-keygen -t ed25519 -C "$(hostname)-$(whoami)" -f "$SSH_KEY" -N ""

echo ""
echo "============================================"
echo "Add this public key to GitHub, servers, etc:"
echo "============================================"
echo ""
cat "${SSH_KEY}.pub"
echo ""
echo "GitHub: https://github.com/settings/ssh/new"
echo "============================================"
