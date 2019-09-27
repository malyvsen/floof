# add all in directory, commit, push
function gacp {
  git add . && git commit -m "$1" && git push
}
