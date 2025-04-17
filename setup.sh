echo "Proceeding with post installation"
echo "Installing Packages..."

sudo pacman -Sy --noconfirm base-devel git libx11 libxinerema libxft xf86-input-synaptics xf86-video-intel xorg-server xorg-xinit xorg-xrandr xwallpaper bluez cmake mpv zsh-completions zsh-syntax-highlighting pipewire pipewire-audio pipewire-pulse picom python python-pip python-pywal python-setuptools fzf brightnessctl usbutils intel-ucode intel-media-driver mesa dosfstools networkmanager ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono noto-fonts-emoji

echo "Setting up dotfiles"
sleep 2
git clone --bare https://github.com/shivjeet1/dotfiles.git $HOME/.dotfiles/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

echo "configuring . . ."
sleep 1
export DISPLAY=3


