# jump directories upwards until a directory beginning with $1 is reached
function up {
  while [[ ! "$PWD" == "/" ]]; do
    cd ..
    if [[ "$(basename "$PWD")" =~ ^$1.* ]]; then
      return 0
    fi
  done
  return 1
}

# create a directory and directly cd into it
function mcd {
  mkdir -p $1
  cd $1
}

# resolve directory name (/bin/../media becomes /media)
function resolve_dir {
  (cd $1 && pwd)
}

# inspect the contents of a directory or file
function inspect {
  if [[ -n $1 ]]; then local target="$1"; else local target="$PWD";
  if [[ -d $target ]]; then
    ls -a --color=auto "$target"
  elif [[ -f $target ]]; then
    bat "$target"
  else
    return 1
  fi
}
