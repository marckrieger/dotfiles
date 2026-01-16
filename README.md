# Setup

## 1. Clone the Repo
```bash
git clone https://github.com/marckrieger/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## 2. Installation (Choose One)
### Option A: Automatic Setup (Not tested yet)
```bash
chmod +x setup.sh
./setup.sh
```
### Option B: Manual Setup
<details>
<summary></summary>

**2.1.** Install packages:
```bash
yay -S --needed - < ~/dotfiles/omarchy/pkglist.txt
```
**2.2.** Apply configs:
```bash
cd ~/dotfiles
stow --adopt omarchy
```
**2.3.** Enable hooks:
```bash
git config core.hooksPath .githooks
```

</details>

## 3. Sign ins
**3.1.** Setup Bitwarden

**3.2.** Sign into VSCode

**3.3.** Setup git:
```bash
gh auth login
```
```bash
glab auth login
```

# Maintenance and Updates
- Update the package list when installing new packages:
```bash
pacman -Qqe > ~/dotfiles/omarchy/pkglist.txt
```