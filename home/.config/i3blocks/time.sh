function display() {
  date +"%a %x %X"
}

function display_loop() {
  while true; do
    display
    sleep 1s
  done
}

display_loop &
while read click; do
  if [ $click -eq 1 ]; then
    xdg-open https://calendar.google.com
  fi
done
