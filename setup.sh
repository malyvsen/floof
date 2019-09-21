#!/bin/bash
# first, install Anarchy Linux with i3, termite, and whatever drivers you need
# then run startx and run this from within i3

WALLPAPERS_DIR="${HOME}/library/visual/wallpapers/desert-wolf"
WALLPAPER="${WALLPAPERS_DIR}/dark.png"
REPOS_DIR="${HOME}/library/coding"


(
  echo "[desert-wolf] setting up directories" &&
  rm -r "${HOME}/*" &&
  mkdir -p $WALLPAPERS_DIR &&
  mkdir -p $REPOS_DIR &&
  xdg-user-dirs-update --set DESKTOP "${HOME}/library/desktop" && mkdir -p $(xdg-user-dir DESKTOP) &&
  xdg-user-dirs-update --set DOWNLOAD "${HOME}/temp" && mkdir -p $(xdg-user-dir DOWNLOAD) &&
  xdg-user-dirs-update --set TEMPLATES "${HOME}/library/templates" && mkdir -p $(xdg-user-dir TEMPLATES) &&
  xdg-user-dirs-update --set PUBLICSHARE "${HOME}/library/public" && mkdir -p $(xdg-user-dir PUBLICSHARE) &&
  xdg-user-dirs-update --set DOCUMENTS "${HOME}/creative/writing" && mkdir -p $(xdg-user-dir DOCUMENTS) &&
  xdg-user-dirs-update --set MUSIC "${HOME}/library/audio/music" && mkdir -p $(xdg-user-dir MUSIC) &&
  xdg-user-dirs-update --set PICTURES "${HOME}/library/visual" && mkdir -p $(xdg-user-dir PICTURES) &&
  xdg-user-dirs-update --set VIDEOS "${HOME}/library/visual/videos" && mkdir -p $(xdg-user-dir VIDEOS) &&
  xdg-user-dirs-update
) &&

(
  echo "[desert-wolf] installing yay" &&
  sudo pacman -S expac yajl &&
  cd "${REPOS_DIR}" &&
  git clone https://aur.archlinux.org/yay.git &&
  cd yay &&
  makepkg -si
) &&

(
  echo "[desert-wolf] installing additional tools" &&
  sudo pacman -S python python-pip python2 &&
  pip install thefuck --user &&
  yay -S python-pywal feh imagemagick &&
  yay -S ttf-google-fonts-git &&
  yay -S ranger neofetch gotop-bin sysstat &&
  yay -S atom-editor-bin firefox &&
  yay -S scrot xclip pslist
) &&

(
  echo "[desert-wolf] setting up config files" &&
  cp -r ./home/. "${HOME}/" &&
  xrdb ~/.Xresources &&
  cp ./*.png "${WALLPAPERS_DIR}/" &&
  wal -t -i "${WALLPAPER}"
) &&

echo "[desert-wolf] setup finished succesfully. you may want to look through ${HOME}/.config"
