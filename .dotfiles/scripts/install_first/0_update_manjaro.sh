# Run install all I need

echo '[+] RUN';
sudo chmod +x 1_update_pacman.sh 2_install_yaourt.sh 3_install_packages.sh 4_settings.sh;
./1_update_pacman.sh;
./2_install_yaourt.sh;
./3_install_packages.sh;
./4_settings.sh;
echo '[+] DONE';
