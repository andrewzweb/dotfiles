# Installing yaourt 

echo '[>] Start instal yaourt';

# download required packages 
echo -ne '\n Y \n' | sudo pacman -S base-devel git wget yajl;
cd /tmp;
git clone https://aur.archlinux.org/package-query.git;
cd package-query/;
yes | makepkg -si && cd /tmp/;
git clone https://aur.archlinux.org/yaourt.git;
cd yaourt/;
yes | makepkg -si;

echo '[+] End install yaourt';
