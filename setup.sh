#!/bin/bash

# --- 1. Colors for feedback ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Omarchy Setup...${NC}"

# --- 2. Install Packages ---
if command -v yay &> /dev/null; then
    echo -e "${YELLOW}Installing packages from list...${NC}"
    # Using yay to handle both official and AUR packages from your unified list
    yay -S --needed --noconfirm - < ~/dotfiles/omarchy/pkglist.txt
else
    echo -e "${RED}Error: yay not found. Please install an AUR helper first.${NC}"
    exit 1
fi

# --- 3. Handle Stow Conflicts ---
# Stow fails if a 'real' file already exists. We remove defaults to make room for symlinks.
echo -e "${YELLOW}Cleaning up default configs to prevent Stow conflicts...${NC}"
rm -rf ~/.bashrc ~/.config/hypr ~/.config/waybar ~/.config/ghostty

# --- 4. Apply Configs with Stow ---
echo -e "${YELLOW}Applying dotfiles with GNU Stow...${NC}"
cd ~/dotfiles
stow omarchy

# --- 5. Security & Git Config ---
echo -e "${YELLOW}Configuring Git hooks and Auth...${NC}"
# Re-enable your Gitleaks protection
git config core.hooksPath .githooks

# Login to GitLab (University instance)
glab auth login --hostname gitlab.hs-flensburg.de

# --- 6. Final Reminders ---
echo -e "${GREEN}✓ Basic setup complete!${NC}"
echo -e "${YELLOW}Final Manual Steps:${NC}"
echo "1. Open VS Code and 'Turn on Settings Sync' to pull your cloud config."
echo "2. Log into Bitwarden"
echo "3. Restart your terminal or run 'source ~/.bashrc'."