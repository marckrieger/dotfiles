#!/bin/bash
set -euo pipefail

DESIRED="google-chrome-stable.desktop"
CURRENT=$(xdg-settings get default-web-browser 2>/dev/null || echo "")

if [[ "$CURRENT" != "$DESIRED" ]]; then
    echo "🌐 Setting default browser → Google Chrome"
    xdg-settings set default-web-browser "$DESIRED"
fi
