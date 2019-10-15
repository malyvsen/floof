source "$(dirname ${BASH_SOURCE[0]})/utils.sh"

function display() {
  idle=$(mpstat -P all 1 1 | grep -oE "[^ ]*$" | tail -1)
  used=$(echo "100 $idle" | awk '{printf "%05.2f", $1 - $2}')
  echo "CPU $used%"
}

function display_loop() {
  while true; do
    display
  done
}

display_loop &
while read click; do
  if [[ $click -eq 1 ]]; then
    launch_terminal "gotop"
  fi
done
