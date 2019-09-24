if shopt -q login_shell; then
  # login shell, basic symbols only
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
else
  # non-login shell can handle more fancy symbols
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
fi

declare -A PROMPT_COLORS=(
[background_ok]="6"
[highlight_ok]="1"
[background_error]="1"
[highlight_error]="2"
[foreground]="0"
[meta]="7"
)
