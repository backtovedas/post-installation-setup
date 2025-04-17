echo "Proceeding with post installation"
echo "Installing Packages..."

sudo pacman -Sy --noconfirm base-devel git libx11 libxinerema libxft xf86-input-synaptics xf86-video-intel xorg-server xorg-xinit xorg-xrandr xwallpaper bluez cmake mpv zsh-completions zsh-syntax-highlighting pipewire pipewire-audio pipewire-pulse picom python python-pip python-pywal python-setuptools fzf brightnessctl usbutils intel-ucode intel-media-driver mesa dosfstools networkmanager ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono noto-fonts-emoji

echo "Setting up dotfiles"
sleep 2
git clone --bare https://github.com/shivjeet1/dotfiles.git $HOME/.dotfiles/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

echo "configuring . . ."
sleep 1
export DISPLAY=3

source $HOME/.zprofile 2> /dev/null
wal -s -i $HOME/post-installation-script/art.jpg
sed '/urg/d' -i $XDG_CACHE_HOME/wal/colors-wal-dwm.h
sed '31s/0/256/' -i $XDG_CACHE_HOME/wal/colors-wal-st.h

sed "s/.*foreground.*$(grep foreground $XDG_CACHE_HOME/wal/colors.Xresources | head -n 1 | sed s/\*/Sxiv\./g)/" -i $XRESOURCES
sed "s/.*background.*/$(grep background $XDG_CACHE_HOME/wal/colors.Xresources | head -n 1 | sed s/\*/Sxiv\./g)/" -i $XRESOURCES

echo "Setting up DWM"
mkdir -p $HOME/.local/src
git clone https://github.com/shivjeet1/dwm.git $HOME/.local/src/dwm
git clone https://github.com/shivjeet1/dmenu.git $HOME/.local/src/dmenu
git clone https://github.com/shivjeet1/slstatus.git $HOME/.local/src/slstatus
git clone https://github.com/shivjeet1/st.git $HOME/.local/src/st

user_correction(){
	sed -i "s/shiv/$USER/" $HOME/.local/src/dwm/config.h
	sed -i "s/shiv/$USER/" $HOME/.local/src/st/config.h 
	sed -i "s/shiv/$USER/" $HOME/.local/src/dmenu/config.h
	cd $HOME/.local/src/dwm; sudo make clean install
	cd $HOME/.local/src/st; sudo make clean install
	cd $HOME/.local/src/dmenu; sudo make clean install
    cd $HOME/.local/src/slstatus; sudo make clean install
}

case $USER in
	shiv)
		cd $HOME/.local/src/dwm; sudo make clean install
		cd $HOME/.local/src/st; sudo make clean install
		cd $HOME/.local/src/dmenu; sudo make clean install
        cd $HOME/.local/src/slstatus; sudo make clean install
        ;;
	*)
		user_correction
		;;
esac

#cd $HOME/.local/src/dwmblocks; sudo make clean install || sudo make clean install


