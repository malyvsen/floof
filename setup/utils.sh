RICE_NAME="floof"

function rice_ask {
  while true; do
    rice_message "$1" -n
    read -r -p " (yes/no): "
    if [[ "$REPLY" =~ (y|Y).* ]]; then
      return 0
    elif [[ "$REPLY" =~ (n|N).* ]]; then
      return 1
    fi
  done
}

function rice_message {
  echo -e $2 "[\033[36;40m$RICE_NAME\033[0m] $1"
}
