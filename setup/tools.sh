echo "[desert-wolf] installing additional tools" &&
sudo pacman -S python python-pip python2 &&
pip install thefuck --user &&
yay -S python-pywal feh imagemagick &&
yay -S ttf-google-fonts-git &&
yay -S ranger neofetch gotop-bin sysstat &&
yay -S atom-editor-bin firefox &&
yay -S scrot xclip pslist
