# WalJr's HyperLand (Msi)

![WalJr's HyperLand (Msi)](assets/banner.png)

Personal dotfiles for Hyprland (CachyOS) on an MSI Pulse 16 AI laptop, Arch Linux and fish, managed with [chezmoi](https://www.chezmoi.io).

Based on [emirbartu/noktadosyalari](https://github.com/emirbartu/noktadosyalari), customized for my machine.

## Customizations

- **Purple theme**: window borders and glow on the focused window (`#d69bff → #7e4fae`), blurred backgrounds, dim-inactive windows
- **kitty** with ultra transparency (0.05 opacity) and a **fish** shell
- **starship** prompt in white/black with a terminal icon
- **fastfetch** greeting with an animated CMD-style ASCII logo
- **Noctalia media OSD**: the disc icon spins like a playing CD — see [`patches/`](patches/)
- Custom **Hyprland scripts**: toggle internal monitor (game mode), touchpad toggle, auto monitor setup

## What's inside

| Path | Description |
| --- | --- |
| `hypr/` | Hyprland lua config — binds, window rules, animations, decorations, monitors, scripts |
| `kitty/`, `alacritty/` | terminal emulator configs (noctalia themes) |
| `fish/`, `dot_starship.toml` | fish shell config + starship prompt |
| `fastfetch/` | fastfetch config and animated CMD logo (gif) |
| `noctalia/` | bar, panels, OSD and theme settings |
| `nvim/`, `vim/` | editor configs |
| `gtk-3.0/`, `gtk-4.0/`, `qt6ct/` | GTK/Qt theming |
| `uwsm/` | session/env variables (cursor theme/size, NVIDIA) |
| `vicinae/`, `shelly/`, `btop/`, `opencode/` | app configs |
| `patches/` | source patches (spinning disc for noctalia's media OSD) |
| `setup/` | fresh Arch/CachyOS install script |

## Keybinds

`Mod` = Super

### Windows

| Key | Action |
| --- | --- |
| `Mod + Q` | Close window |
| `Mod + Esc` | Kill window |
| `Mod + Alt + Space` | Toggle floating |
| `Mod + F` | Fullscreen |
| `Mod + D` | Maximize (fullscreen mode 1) |
| `Mod + J` | Toggle split |
| `Mod + Arrows` | Focus in direction |
| `Alt + Tab` | Cycle windows |
| `Mod + Tab` | Window switcher (noctalia) |
| `Mod + Shift + Arrows` | Move window |
| `Mod + Shift + Scroll` | Move window to another monitor |
| `Mod + Ctrl + Shift + Arrows/Scroll` | Move window to workspace on monitor |
| `Mod + Shift + [1-9,0]` | Move window to workspace (follow) |
| `Mod + Alt + [1-9,0]` | Move window to workspace (stay) |
| `Mod + LMB drag` / `Mod + RMB drag` | Move / resize with mouse |
| `Mod + Ctrl + Arrows` | Resize window |
| `Mod + -` / `Mod + +` | Zoom out / in (up to 3x) |

### Launch

| Key | Action |
| --- | --- |
| `Mod + Return` | kitty |
| `Mod + E` | File manager (pcmanfm) |
| `Mod + T` | Text editor |
| `Mod + C` / `XF86Calculator` | Calculator |
| `Mod + W` | Brave |
| `Ctrl + Shift + Esc` | kitty + btop |
| `Alt + Space` | Vicinae launcher |
| `Mod + Z` | Noctalia settings |
| `Mod + X` | Control center |
| `Mod + Alt + C` | Session panel |
| `Mod + L` | Lock session |

### Workspaces & monitors

| Key | Action |
| --- | --- |
| `Mod + [1-9,0]` | Switch workspace |
| `Mod + Ctrl + [1-9,0]` | Switch workspace (monitor relative) |
| `Mod + Scroll up/down` | Next / previous workspace |
| `Mod + Ctrl + Scroll` | Switch monitor |
| `Mod + S` | Scratchpad (special workspace) |
| `Mod + Alt + F1/F2/F3` | Focus monitor |
| `Mod + Alt + M` | Toggle internal (laptop) monitor — game mode |

### Utilities

| Key | Action |
| --- | --- |
| `Mod + Shift + S` | Screenshot region |
| `Mod + Print` | Screenshot fullscreen |
| `Mod + P` | Color picker (hyprpicker) |
| `Mod + V` | Clipboard history (vicinae) |
| `Mod + A` | Notifications |
| `Mod + Shift + W` | Wallpaper panel |
| `Mod + Alt + T` / `XF86TouchpadToggle` | Toggle touchpad |

### Hardware keys

| Key | Action |
| --- | --- |
| `XF86AudioRaiseVolume` / `LowerVolume` | Volume up / down |
| `XF86AudioMute` / `XF86AudioMicMute` | Mute output / microphone |
| `XF86AudioPlay` / `Pause` | Play / pause |
| `XF86AudioNext` / `Prev` | Next / previous track |
| `XF86MonBrightnessUp/Down` | Brightness up / down |

### Touchpad gestures

| Gesture | Action |
| --- | --- |
| 3 fingers down | Close window |
| 3 fingers up | Fullscreen |
| 3 fingers horizontal | Switch workspace |
| 4 fingers horizontal | Switch workspace |

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
