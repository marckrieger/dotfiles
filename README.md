# Setup
1. Clone repo
2. Install packages:
```bash
yay -S --needed - < ~/dotfiles/omarchy/pkglist.txt
```
3. Apply configs:
```bash
cd ~/dotfiles
stow omarchy
```
4. Enable hooks:
```bash
git config core.hooksPath .githooks
```
5. Setup Bitwarden
6. Sign into VSCode
7. Setup git:
```bash
gh auth login
```
```bash
glab auth login
```