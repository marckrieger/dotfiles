#!/bin/bash
set -euo pipefail

SSH_KEY="$HOME/.ssh/id_ed25519"
[[ -f "$SSH_KEY" ]] && exit 0

echo "🔑 Generating SSH key..."
ssh-keygen -t ed25519 -C "$(hostname)-$(whoami)" -f "$SSH_KEY" -N "" -q
echo "  $(cat "${SSH_KEY}.pub")"
echo "  → https://github.com/settings/ssh/new"
