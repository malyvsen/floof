source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

if rice_ask "install additional tools?"; then
  yay -S --needed python python-pip python2 &&
  pip install thefuck --user &&
  yay -S --needed python-pywal feh imagemagick &&
  yay -S --needed ttf-google-fonts-git &&
  yay -S --needed dmenu ranger autojump &&
  yay -S --needed neofetch gotop-bin sysstat &&
  yay -S --needed atom-editor-bin firefox &&
  yay -S --needed bat scrot xclip pslist
fi
