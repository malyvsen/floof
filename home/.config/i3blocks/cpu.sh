function display() {
  idle=$(mpstat -P all 1 1 | grep -oE "[^ ]*$" | tail -1)
  used=$(echo "100 $idle" | awk '{printf "%.2f", $1 - $2}')
  echo "CPU $used%"
}

function display_loop() {
  while true; do
    display
  done
}

display_loop &
while read click; do
  if [ $click -eq 1 ]; then
    i3-msg -q "workspace 10; exec i3-sensible-terminal -e gotop"
  fi
done
