source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

rice_message "installing yay" &&
sudo pacman -S expac yajl &&
cd "${REPOS_DIR}" &&
git clone https://aur.archlinux.org/yay.git &&
cd yay &&
makepkg -si
