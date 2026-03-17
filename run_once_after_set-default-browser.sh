#!/bin/bash
set -euo pipefail

DESIRED="google-chrome.desktop"
CURRENT=$(xdg-settings get default-web-browser 2>/dev/null || echo "")

if [[ "$CURRENT" != "$DESIRED" ]]; then
    echo "🌐 Setting default browser → Google Chrome"
    xdg-settings set default-web-browser "$DESIRED"
fi

echo "🔑 Sign in to your Google account:"
echo "  → Opening Google Chrome..."
google-chrome-stable "https://accounts.google.com/signin" &>/dev/null &
