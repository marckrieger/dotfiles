#!/bin/bash
set -euo pipefail

LIMINE_CONF=$(find /boot -maxdepth 2 -name "limine.conf" 2>/dev/null | head -1)
[[ -z "$LIMINE_CONF" ]] && exit 0

if grep -q '^#timeout: ' "$LIMINE_CONF"; then
    echo "⚡ Setting Limine boot timeout → 0 (instant boot)"
    sudo sed -i 's/^#timeout: .*/timeout: 0/' "$LIMINE_CONF"
fi
