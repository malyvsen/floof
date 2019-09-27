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
