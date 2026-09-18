# WalJr's HyperLand (Msi)

![WalJr's HyperLand (Msi)](assets/banner.png)

Personal dotfiles for Hyprland (CachyOS) on an MSI Pulse 16 AI laptop, Arch Linux and fish, managed with [chezmoi](https://www.chezmoi.io).

Based on [emirbartu/noktadosyalari](https://github.com/emirbartu/noktadosyalari), customized for my machine (purple theme, glow, kitty/starship/fastfetch setup).

## Highlights

- Purple theme: window borders + glow on the focused window, blur and dim-inactive
- kitty with ultra transparency, fish shell and a white/black starship prompt
- fastfetch greeting with an animated CMD-style ASCII logo
- noctalia, nvim, uwsm, GTK/Qt configs and a setup script for fresh installs

## Structure

The repo root is the chezmoi source directory:

- `dot_config/` — everything that installs to `~/.config/` (hypr, kitty, fish, fastfetch, noctalia, nvim, uwsm, ...)
- `dot_starship.toml`, `dot_zshrc`, `dot_Xresources`, `dot_gtkrc-2.0` — home dotfiles
- `setup/` — install scripts (`setup-arch.sh`), ignored by chezmoi (`.chezmoiignore`)

## Install

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply WalJr/WalJrs-HyperLand-Msi
```

Or on a fresh Arch/CachyOS machine: clone this repo and run `setup/setup-arch.sh`
(installs packages with yay, then clones the repo into `~/.local/share/chezmoi` and runs `chezmoi apply`).

## Daily usage

```sh
chezmoi apply                 # sync ~ and ~/.config from this repo
chezmoi add ~/.config/foo     # start managing a new file
chezmoi edit --apply ~/.zshrc # edit and apply
chezmoi update                # pull + apply
```

## Inspirations

Thanks to [ML4W](https://github.com/mylinuxforwork/dotfiles) and the following projects:

- https://github.com/emirbartu/noktadosyalari
- https://github.com/JaKooLit/Hyprland-Dots
- https://github.com/prasanthrangan/hyprdots
- https://github.com/sudo-harun/dotfiles
- https://github.com/dianaw353/hyprland-configuration-rootfs
