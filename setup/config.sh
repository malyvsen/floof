source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

rice_message "setting up config files" &&
cp -r "$(dirname ${BASH_SOURCE[0]})/../home/." "${HOME}/" &&
xrdb ~/.Xresources &&
wal -i "$(xdg-user-dir WALLPAPERS)/$RICE_NAME.jpg" &&
source ~/.bashrc
