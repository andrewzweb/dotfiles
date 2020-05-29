echo '[>] Start instal packages';

# firewall  
yes | sudo pacman -S gufw;

# for my cloud 
yes | yaourt -S nextcloud-client;

# for backup
yes | sudo pacman -S timeshift;

# money accounting 
yes | sudo pacman -S ledger;

# desktop Enviroment
yes | sudo pacman -S vlc;
yes | sudo pacman -S latte-dock;
yes | sudo pacman -S gparted;
yes | sudo pacman -S filelight;
yes | sudo pacman -S qbittorent;
yes | sudo pacman -S clementine;
# yes | yaourt -S keepass2; # don't work 
yes | yaourt -S telegram-desktop; # don't work 

# terminal tools 
yes | yaourt -S glances;
yes | sudo pacman -S keepass2;
yes | sudo pacman -S tree;
yes | sudo pacman -S neofetch;
yes | sudo pacman -S gnupg;
yes | sudo pacman -S zsh;
yes | sudo pacman -S hub;
yes | sudo pacman -S mosh;

# texteditor
yes | sudo pacman -S emacs;

# browsers
yes | sudo pacman -S chromium;
yes | sudo pacman -S firefox;
#echo 'n' | yaourt -S google-chrome; # don't work 

# work with image
yes | sudo pacman -S gimp;
yes | sudo pacman -S krita;

# other
yes | sudo pacman -S anki;

# for touchpad thinkpad t440p
yes | sudo pacman -S xorg-xinput;

echo '[+] End install packages';
