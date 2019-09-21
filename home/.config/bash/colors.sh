if shopt -q login_shell; then
  :
else
  cat ~/.cache/wal/sequences
fi
