# launch terminal in temporary workspace, executing given command
function launch_terminal {
  i3-msg -q "workspace 13:temp"
  i3-sensible-terminal -e "sh -c \"cat ~/.cache/wal/sequences && $1\""
}
