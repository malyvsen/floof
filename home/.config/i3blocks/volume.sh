function display() {
  info=$(pacmd list-sinks)
  muted=$(echo "$info" | grep "muted" | grep -oE "yes|no" | head -1)
  if [ "$muted" == "yes" ]; then
    echo "Muted"
  else
    echo "Volume $(echo "$info" | grep $'\t'volume | grep -oE '[0-9]*\%' | head -1)"
  fi
}

function display_loop() {
  pactl subscribe |
  stdbuf -oL grep change |
  while read -r change; do
    display
  done
}

display
display_loop &
while read click; do
  if [ $click -eq 1 ]; then
    i3-msg -q "workspace 10; exec i3-sensible-terminal -e alsamixer"
  fi
  display
done
