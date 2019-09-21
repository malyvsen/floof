#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# terminal recoloring
source ~/.config/bash/colors.sh

# custom aliases
source ~/.config/bash/aliases.sh

# custom functions
for file in ~/.config/bash/functions/*; do
  source $file
done

# custom prompt
for file in ~/.config/bash/prompt/*; do
  source $file
done

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
