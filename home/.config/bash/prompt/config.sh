if shopt -q login_shell; then
  # login shell - resort to the basics
  declare -A PROMPT_SYMBOLS=(
  [end_separator]=": "
  [section_separator]=" | "

  [git_branch]=""
  [git_stash]="▽"
  [git_ahead]="⬆"
  [git_behind]="⬇"
  [git_untracked]="◇"
  [git_modified]="◈"
  [git_staged]="◆"
  [git_conflicts]="!"

  [read_only]="[read-only] "
  [venv]="venv: "
  )

  declare -A PROMPT_COLORS=(
  [background_ok]="4"
  [highlight_ok]="3"
  [background_error]="1"
  [highlight_error]="3"
  [foreground]="0"
  [meta]="7"
  )
else
  # non-login shell can handle some more fancy stuff
  declare -A PROMPT_SYMBOLS=(
  [end_separator]=" "
  [section_separator]="  "

  [git_branch]=" "
  [git_stash]="▽"
  [git_ahead]="⬆"
  [git_behind]="⬇"
  [git_untracked]="◇"
  [git_modified]="◈"
  [git_staged]="◆"
  [git_conflicts]="↯"

  [read_only]=" "
  [venv]="venv: "
  )

  declare -A PROMPT_COLORS=(
  [background_ok]="6"
  [highlight_ok]="5"
  [background_error]="5"
  [highlight_error]="2"
  [foreground]="0"
  [meta]="7"
  )
fi
