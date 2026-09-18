#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
yay_installed="false"
paru_installed="false"
aur_helper=""

# --------------------------------------------------------------
# Library
# --------------------------------------------------------------

source $SCRIPT_DIR/_lib.sh

# --------------------------------------------------------------
# General Packages
# --------------------------------------------------------------

source $SCRIPT_DIR/pkgs.sh

# --------------------------------------------------------------
# Distro related packages
# --------------------------------------------------------------

_isInstalled() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    if [ -n "${check}" ]; then
        echo 0
        return #true
    fi
    echo 1
    return #false
}

_installYay() {
    if [[ ! $(_isInstalled "base-devel") == 0 ]]; then
        sudo pacman --noconfirm -S "base-devel"
    fi
    if [[ ! $(_isInstalled "git") == 0 ]]; then
        sudo pacman --noconfirm -S "git"
    fi
    if [ -d $HOME/Downloads/yay-bin ]; then
        rm -rf $HOME/Downloads/yay-bin
    fi
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    git clone https://aur.archlinux.org/yay-bin.git $HOME/Downloads/yay-bin
    cd $HOME/Downloads/yay-bin
    makepkg -si --noconfirm
    cd $temp_path
    echo ":: yay has been installed successfully."
}

_checkAURHelper() {
    if [[ $(_checkCommandExists "yay") == 0 ]]; then
        echo ":: yay is installed"
        aur_helper="yay"
    else
        echo ":: yay is not installed. Installing..."
        _installYay
        aur_helper="yay"
    fi
}

_installPackages() {
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed."
            continue
        fi
        $aur_helper --noconfirm -S "${pkg}"
    done
}

_runCurlInstalls() {
    for install in "${curl_installs[@]}"; do
        IFS='|' read -r name command <<< "$install"
        echo ":: Installing ${name}..."
        bash -lc "$command"
    done
}

_runGitClones() {
    for repo in "${git_clones[@]}"; do
        IFS='|' read -r name url destination <<< "$repo"
        resolved_destination=$(eval printf '%s' "$destination")

        if [ -d "$resolved_destination" ]; then
            echo ":: ${name} already installed"
            continue
        fi

        echo ":: Cloning ${name}..."
        git clone "$url" "$resolved_destination"
    done
}

# --------------------------------------------------------------
# Install Gum
# --------------------------------------------------------------

if [[ $(_checkCommandExists "gum") == 0 ]]; then
    echo ":: gum is already installed"
else
    echo ":: The installer requires gum. gum will be installed now"
    sudo pacman --noconfirm -S gum
fi

# --------------------------------------------------------------
# Header
# --------------------------------------------------------------

_writeHeader "Arch"

# --------------------------------------------------------------
# Install yay if needed
# --------------------------------------------------------------

_checkAURHelper

# --------------------------------------------------------------
# General
# --------------------------------------------------------------

_installPackages "${general[@]}"

# --------------------------------------------------------------
# Apps
# --------------------------------------------------------------

_installPackages "${apps[@]}"

# --------------------------------------------------------------
# Tools
# --------------------------------------------------------------

_installPackages "${tools[@]}"

# --------------------------------------------------------------
# Fonts
# --------------------------------------------------------------

_installPackages "${fonts[@]}"

# --------------------------------------------------------------
# Hyprland
# --------------------------------------------------------------

_installPackages "${hyprland[@]}"

# --------------------------------------------------------------
# Create .local/bin folder
# --------------------------------------------------------------

if [ ! -d $HOME/.local/bin ]; then
    mkdir -p $HOME/.local/bin
fi
# --------------------------------------------------------------
# Oh My Zsh & Plugins
# --------------------------------------------------------------

echo ":: Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo ":: Oh My Zsh already installed"
fi

echo ":: Installing Oh My Zsh plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

_runGitClones

# --------------------------------------------------------------
# Curl installs
# --------------------------------------------------------------

_runCurlInstalls

# --------------------------------------------------------------
# Cursors
# --------------------------------------------------------------

source $SCRIPT_DIR/_cursors.sh

# --------------------------------------------------------------
# Fonts
# --------------------------------------------------------------

source $SCRIPT_DIR/_fonts.sh

# --------------------------------------------------------------
# Install dotfiles with chezmoi
# --------------------------------------------------------------

echo ":: Installing dotfiles with chezmoi..."

if [ ! -d "$HOME/.local/share/chezmoi/.git" ]; then
    echo ":: Cloning dotfiles into ~/.local/share/chezmoi..."
    git clone "$SCRIPT_DIR/.." "$HOME/.local/share/chezmoi"
fi

chezmoi apply

# --------------------------------------------------------------
# Default shell
# --------------------------------------------------------------

if [[ "$SHELL" != "/usr/bin/fish" ]]; then
    echo ":: Setting fish as the default shell..."
    sudo chsh -s /usr/bin/fish "$USER"
fi

# --------------------------------------------------------------
# Icons
# --------------------------------------------------------------

source $SCRIPT_DIR/_icons.sh

echo ":: Configuration complete! Restart your terminal (or run: exec fish)."

# --------------------------------------------------------------
# Finish
# --------------------------------------------------------------

_finishMessage
