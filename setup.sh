#!/bin/bash
# first, install Anarchy Linux with i3, termite, and whatever drivers you need
# then run startx and run this from within i3

(source ./setup/dirs.sh) &&
(source ./setup/yay.sh) &&
(source ./setup/tools.sh) &&
(source ./setup/config.sh) &&
echo "[desert-wolf] setup finished succesfully. you may want to look through ${HOME}/.config"
