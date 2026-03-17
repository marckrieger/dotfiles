# dotfiles

[Omarchy](https://omarchy.org/) dotfiles managed with [chezmoi](https://chezmoi.io/).

## Bootstrap a new device

```bash
chezmoi init --apply git@github.com:marckrieger/dotfiles.git
```

This will:
1. Generate an SSH key (if missing) and print the public key
2. Install user packages via pacman/AUR
3. Deploy config files (bindings, monitors, input, theme, backgrounds)
4. Set the omarchy theme
5. Set Google Chrome as default browser
6. Enable and start Tailscale
7. Set Limine boot timeout to 0 (if Limine is the bootloader)

## What's managed

| File | Scope |
|------|-------|
| `~/.config/hypr/bindings.conf` | Shared across devices |
| `~/.config/hypr/input.conf` | Shared (touchpad, keyboard) |
| `~/.config/hypr/monitors.conf` | Per-device (templated by hostname) |
| `~/.config/omarchy/packages.txt` | User-installed packages (not omarchy defaults) |
| `~/.config/omarchy/theme.txt` | Per-device theme |
| `~/.config/omarchy/backgrounds/` | Custom wallpapers |

## Adding a new device

1. Set hostname: `sudo hostnamectl set-hostname <name>`
2. Add a block for the new hostname in:
   - `private_dot_config/hypr/monitors.conf.tmpl`
   - `private_dot_config/omarchy/theme.txt.tmpl` (if different theme)
3. Commit and push

## Adding packages

Edit `private_dot_config/omarchy/packages.txt` and run `chezmoi apply`.

## Adding backgrounds

```bash
# Copy images to ~/.config/omarchy/backgrounds/<theme-name>/
chezmoi add ~/.config/omarchy/backgrounds/<theme-name>
```
