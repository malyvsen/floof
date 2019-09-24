source "$(dirname ${BASH_SOURCE[0]})/utils.sh"

function display() {
  weather=$(curl -Ss 'https://wttr.in?0TQ' | cut -c 16- | head -2 | xargs echo)
  if [ $? -eq 0 ]; then
    weather=$(echo "$weather" | sed "s/ °/°/g")
    echo "$weather"
    return 0
  else
    return 1
  fi
}

function display_loop() {
  while true; do
    if display; then
      sleep 30m
    else
      sleep 1s
    fi
  done
}

display_loop &
while read click; do
  if [ $click -eq 1 ]; then
    launch_terminal "curl -s 'https://wttr.in?m' | less -R"
  fi
  rkill -TERM $!
  display_loop &
done
