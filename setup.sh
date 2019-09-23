#!/bin/bash
# first, install Anarchy Linux with i3, termite, and whatever drivers you need
# then run startx and run this from within i3

source "$(dirname ${BASH_SOURCE[0]})/setup/utils.sh" &&

(source "$(dirname ${BASH_SOURCE[0]})/setup/dirs.sh") &&
(source "$(dirname ${BASH_SOURCE[0]})/setup/yay.sh") &&
(source "$(dirname ${BASH_SOURCE[0]})/setup/tools.sh") &&
(source "$(dirname ${BASH_SOURCE[0]})/setup/config.sh") &&
neofetch --source "$(xdg-user-dir WALLPAPERS)/$RICE_NAME.jpg" --w3m &&
rice_message "setup finished succesfully. you may want to look through ${HOME}/.config"
