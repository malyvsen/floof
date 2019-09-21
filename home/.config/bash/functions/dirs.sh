# jump directories upwards until it hits a directory with multiple folders
function up {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
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
