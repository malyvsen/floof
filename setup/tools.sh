source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

rice_message "installing additional tools" &&
yay -S --needed python python-pip python2 &&
pip install thefuck --user &&
yay -S --needed python-pywal feh imagemagick &&
yay -S --needed ttf-google-fonts-git &&
yay -S --needed ranger neofetch gotop-bin sysstat &&
yay -S --needed atom-editor-bin firefox &&
yay -S --needed scrot xclip pslist
