#!/bin/bash
set -euo pipefail

CHEZMOI_DIR="$(chezmoi source-path)"
CURRENT_URL="$(git -C "$CHEZMOI_DIR" remote get-url origin)"

if [[ "$CURRENT_URL" == https://github.com/* ]]; then
  SSH_URL="${CURRENT_URL/https:\/\/github.com\//git@github.com:}"
  git -C "$CHEZMOI_DIR" remote set-url origin "$SSH_URL"
  echo "🔗 Switched chezmoi remote to $SSH_URL"
fi
