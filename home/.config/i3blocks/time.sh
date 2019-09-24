source "$(dirname ${BASH_SOURCE[0]})/utils.sh"

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
    launch_terminal "cal --year --color=always | less -R"
  fi
done
