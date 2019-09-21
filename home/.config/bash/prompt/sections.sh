function prompt_section_dir {
  if [ ! -w "$PWD" ]; then
    echo -n "$(prompt_foreground ${PROMPT_COLORS[highlight]})"
    echo -n "${PROMPT_SYMBOLS[read_only]}"
    echo -n "$(prompt_foreground ${PROMPT_COLORS[foreground]})"
  fi
  echo -n "\W"
}


function prompt_section_venv {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo -n "${PROMPT_SYMBOLS[venv]}${VIRTUAL_ENV##*/}"
  fi
}


function prompt_section_git {
  local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [ -z "$git_branch" ]; then
    return 0
  fi

  echo -n "${PROMPT_SYMBOLS[git_branch]}$git_branch"

  local number_behind_ahead="$(git rev-list --count --left-right '@{upstream}...HEAD' 2>/dev/null)"
  local number_ahead="${number_behind_ahead#*	}"
  local number_behind="${number_behind_ahead%	*}"
  if [ ! "0$number_ahead" -eq 0 -o ! "0$number_behind" -eq 0 ]; then
    if [ ! "$number_ahead" -eq 0 ]; then
      echo -n "${PROMPT_SYMBOLS[git_ahead]}$number_ahead"
    fi
    if [ ! "$number_behind" -eq 0 ]; then
      echo -n "${PROMPT_SYMBOLS[git_behind]}$number_behind"
    fi
  fi

  local number_staged="$(git diff --staged --name-only --diff-filter=AM 2> /dev/null | wc -l)"
  if [ ! "$number_staged" -eq "0" ]; then
    echo -n "$(prompt_section_separator)${PROMPT_SYMBOLS[git_staged]}$number_staged"
  fi

  local number_conflicts="$(git diff --name-only --diff-filter=U 2> /dev/null | wc -l)"
  if [ ! "$number_conflicts" -eq "0" ]; then
    echo -n "$(prompt_section_separator)${PROMPT_SYMBOLS[git_conflicts]}$number_conflicts"
  fi

  local number_modified="$(git diff --name-only --diff-filter=M 2> /dev/null | wc -l )"
  if [ ! "$number_modified" -eq "0" ]; then
    echo -n "$(prompt_section_separator)${PROMPT_SYMBOLS[git_modified]}$number_modified"
  fi

  local number_untracked="$(git ls-files --other --exclude-standard | wc -l)"
  if [ ! "$number_untracked" -eq "0" ]; then
    echo -n "$(prompt_section_separator)${PROMPT_SYMBOLS[git_untracked]}$number_untracked"
  fi
}


function prompt_section_jobs {
  local number_jobs=$(jobs -p | wc -l)
  if [[ "$number_jobs" -ne 0 ]]; then
    echo -n "$number_jobs job"
    if [[ "$number_jobs" -gt 1 ]]; then
      echo -n "s" # to make "jobs" plural
    fi
  fi
}
