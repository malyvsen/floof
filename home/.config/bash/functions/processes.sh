# recursively list PIDs for subtree
function descendants {
  local children=$(ps -o pid= --ppid "$1")
  if [[ -z "$children" ]]; then
    return
  fi
  echo $children
  for pid in $children; do
    descendants "$pid"
  done
}
