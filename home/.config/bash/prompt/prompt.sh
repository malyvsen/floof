# this prompt is heavily inspired by pureline: https://github.com/chris-marsh/pureline
PROMPT_COMMAND="prompt_set"

function prompt_set {
  prompt_start

  prompt_append_section dir
  prompt_append_section venv
  prompt_append_section git
  prompt_append_section jobs

  prompt_end
}


function prompt_start {
  if [ $? -eq 0 ]; then
    PROMPT_COLORS[background]=${PROMPT_COLORS[background_ok]}
    PROMPT_COLORS[highlight]=${PROMPT_COLORS[highlight_ok]}
  else
    PROMPT_COLORS[background]=${PROMPT_COLORS[background_error]}
    PROMPT_COLORS[highlight]=${PROMPT_COLORS[highlight_error]}
  fi

  PS1="$(prompt_colors ${PROMPT_COLORS[background]} ${PROMPT_COLORS[foreground]})"
}


function prompt_end {
  PS1+="$(prompt_colors ${PROMPT_COLORS[foreground]} ${PROMPT_COLORS[background]})"
  PS1+="${PROMPT_SYMBOLS[end_separator]}"
  PS1+="\[\e[0m\]"

  unset __anything_printed
  unset __return_code
}
