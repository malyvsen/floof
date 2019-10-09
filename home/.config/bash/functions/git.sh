# load github ssh key
function gh {
  if [[ -n $1 ]]; then
    local key_path="$1"
  else
    local key_path="$HOME/.ssh/github_rsa"
  fi
  eval "$(ssh-agent -s)" && ssh-add "$key_path"
}

# add all in directory, commit, push
function gacp {
  git add . && git commit -m "$1" && git push
}
