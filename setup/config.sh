source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

if rice_ask "set up config files?"; then
  cp -r "$(dirname ${BASH_SOURCE[0]})/../home/." "${HOME}/" &&
  xrdb ~/.Xresources &&
  wal -i "$(xdg-user-dir WALLPAPERS)/$RICE_NAME.jpg" &&
  source ~/.bashrc
fi
