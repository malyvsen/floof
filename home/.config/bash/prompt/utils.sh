# append a section given by $1, making sure to separate
function prompt_append_section {
  local to_append=$(prompt_section_$1)
  if [[ -n "$to_append" ]]; then
    if [[ -n "$__anything_printed" ]]; then
      PS1+=$(prompt_section_separator)
    fi
    PS1+="$to_append"
    __anything_printed="true"
  fi
}


# background $1, foreground $2
function prompt_colors {
  echo -n "\[\e[4${1};3${2}m\]"
}


function prompt_background {
  echo -n "\[\e[4${1}m\]"
}


function prompt_foreground {
  echo -n "\[\e[3${1}m\]"
}


function prompt_section_separator {
  echo -n "$(prompt_foreground ${PROMPT_COLORS[meta]})"
  echo -n "${PROMPT_SYMBOLS[section_separator]}"
  echo -n "$(prompt_foreground ${PROMPT_COLORS[foreground]})"
}
