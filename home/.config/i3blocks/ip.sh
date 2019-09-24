source "$(dirname ${BASH_SOURCE[0]})/utils.sh"

function display() {
  if [ $(ip route) -eq "" ]; then
    echo "No connection"
    return 1
  else
    ip=$(curl -Ss icanhazip.com)
    if [ $? -ne 0 ]; then
      echo "No connection"
      return 2
    else
      echo "$ip"
      return 0
    fi
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
  if [ $click -eq 1 ]; then
    launch_terminal "ip address | less -R"
  fi
  rkill -TERM $!
  display_loop &
done
