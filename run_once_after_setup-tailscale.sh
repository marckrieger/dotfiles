#!/bin/bash
set -euo pipefail

if ! systemctl is-enabled --quiet tailscaled 2>/dev/null; then
    echo "🔗 Enabling tailscaled service"
    sudo systemctl enable --now tailscaled
fi

if ! tailscale status &>/dev/null; then
    echo "🔗 Starting Tailscale login"
    sudo tailscale up
fi
