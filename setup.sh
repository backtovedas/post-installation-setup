echo "Proceeding with post installation"
echo "Installing Packages."

sudo pacman -Sy --noconfirm base-devel git libx11 libxinerema libxft xf86-input-synaptics xf86-video-intel xorg-server xorg-xinit xorg-xrandr xwallpaper bluez cmake mpv zsh-completions zsh-syntax-highlighting pipewire pipewire-audio pipewire-pulse picom brightnessctl usbutils intel-ucode intel-media-driver mesa dosfstools networkmanager ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono noto-fonts-emoji 
