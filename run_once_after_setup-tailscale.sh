#!/bin/bash
set -euo pipefail

echo "🔗 Setting up Tailscale"
sudo systemctl enable --now tailscaled

if ! tailscale status &>/dev/null; then
    echo "🔗 Starting Tailscale login"
    sudo tailscale up
fi
