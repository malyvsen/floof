source "$(dirname ${BASH_SOURCE[0]})/utils.sh" &&

key_path="$HOME/.ssh/github_rsa"

if rice_ask "set up github ssh key?"; then
  ssh-keygen -t rsa -b 4096 -f "$key_path" &&
  cat "$key_path" | xclip -sel clip &&
  rice_message "key copied, opening browser..." &&
  xdg-open "https://github.com/settings/ssh/new" &&
  rice_message "press enter to resume" -n && read
fi
