# get the path of a removable device from a shortened version
function device_path {
  echo "/dev/$(basename "$1")"
}

# find where a given device is mounted
function mounted_at {
  findmnt -S "$(device_path $1)" | tail -1 | cut -d" " -f 1
}

# list all connected usb devices
function list_usb {
  for device in /sys/block/*; do
    if udevadm info --path="$device" --query=property | grep -q ^ID_BUS=usb; then
      basename "$device"
    fi
  done
}

# check if a device is a usb device
function is_usb {
  list_usb | grep -q "$1"
}

# recursively get the device on which the current directory is
function get_device {
  if [[ "$1" = /dev/* ]]; then
    if [[ -e "$1" ]]; then
      echo "$1"
      return 0
    else
      return 1
    fi
  fi
  local resolved=$(resolve_dir "$1")
  if [[ "$resolved" == "/" ]]; then
    return 2
  fi
  local device=$(findmnt -M "$resolved" | grep -oe "/dev/[^ ]*" | grep -oe "[^ /]*$")
  if [[ -n "$device" ]]; then
    echo "$device"
    return 0
  fi
  get_device $(dirname "$1")
  return
}

# mount an external drive in a way that allows users to access it safely
function safe_mount {
  if [[ -n "$(mounted_at $1)" ]]; then
    echo "already mounted at $mounted_at"
    return 1
  fi
  udisksctl mount -b "$(device_path $1)" && cd $(mounted_at $1)
}

# safely unmount a usb mounted with safe_mount from above
function safe_unmount {
  if [[ -z "$1" ]]; then
    local device=$(get_device "$PWD")
  else
    local device=$(get_device "$1")
  fi
  local mounted_at=$(mounted_at "$device")
  if [[ -z "$mounted_at" ]]; then
    echo "not mounted"
    return 1
  fi
  if [[ "$(get_device "$PWD")" == "$device" ]]; then
    cd "$HOME"
  fi
  udisksctl unmount -b "$(device_path "$device")"
}
