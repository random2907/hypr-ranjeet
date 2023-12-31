# Hypr Ranjeet

Hypr Ranjeet is a personalized Arch Linux setup with a focus on simplicity and aesthetics.

# Show


https://github.com/random2907/hypr-ranjeet/assets/81547183/3c2a0c04-8766-40ab-9400-eb8dca6742f2



## Installation

### AUR Helper
```bash
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

### Required Packages
```bash
yay -S acpi alacritty python-pywal rofi-lbonn-wayland-git neofetch hyprland xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xdg-user-dirs zsh sddm rsync waybar qt5-wayland qt6-wayland dunst polkit-kde-agent upower kvantum nwg-look nwg-displays wlr-randr-git wl-clipboard cliphist
```

### Sound Packages
```bash
yay -S network-manager-applet networkmanager blueman bluez bluez-utils
```

### Font/Icon/Theme Packages
```bash
yay -S qt5ct qt6ct ttf-nerd-fonts-symbols-mono papirus-icon-theme breeze-icons breeze ttf-icomoon-feather
```

### Optional Packages
```bash
yay -S mpv wf-recorder obs-studio dolphin swaylock-effects-git swayidle slurp imagemagick swappy
```

### Dotfiles Installation
```bash
git clone https://github.com/random2907/hypr-ranjeet.git
cd hypr-ranjeet
rsync -avxHAXP --exclude '.git*' .* ~/
```
