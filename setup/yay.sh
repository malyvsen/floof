source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

if rice_ask "install yay?"; then
  sudo pacman -S --needed gcc make binutils expac yajl fakeroot &&
  cd "${REPOS_DIR}" &&
  git clone https://aur.archlinux.org/yay.git &&
  cd yay &&
  makepkg -si
fi
