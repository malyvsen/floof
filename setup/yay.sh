echo "[desert-wolf] installing yay" &&
sudo pacman -S expac yajl &&
cd "${REPOS_DIR}" &&
git clone https://aur.archlinux.org/yay.git &&
cd yay &&
makepkg -si
