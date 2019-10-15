source "$(dirname ${BASH_SOURCE[0]})/utils.sh"

function display() {
  if [[ $(ip route) -eq "" ]]; then
    echo "No connection"
    return 1
  else
    wifi_name="$(iwgetid -r)"
    if [[ -n wifi_name ]]; then
      echo "$wifi_name"
    else
      echo "Wired"
    fi
    return 0
  fi
}

function display_loop() {
  while true; do
    if display; then
      sleep 10m
    else
      sleep 1s
    fi
  done
}

display_loop &
while read click; do
  if [[ $click -eq 1 ]]; then
    launch_terminal "netctl-auto list | less -R"
  fi
  rkill -TERM $!
  display_loop &
done
