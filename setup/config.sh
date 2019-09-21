echo "[desert-wolf] setting up config files" &&
cp -r ./home/. "${HOME}/" &&
xrdb ~/.Xresources &&
wal -t -i "$(xdg-user-dir WALLPAPERS)/desert-wolf/dark.png" &&
source ~/.bashrc
