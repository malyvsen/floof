source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

if rice_ask "install cursor theme?"; then
  yay -S --needed bibata-cursor-theme
fi
