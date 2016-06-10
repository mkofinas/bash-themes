#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

PROMPT_DIRTRIM=3

function prompt_command() {

  local git_status
  git_status=$(__git_ps1 "( %s)")

  local BOLD
  BOLD="${PROMPT_EMPHASIS["BOLD"]}"
  local OFF
  OFF="${PROMPT_EMPHASIS["REGULAR"]}"
  local DIM
  DIM="${PROMPT_EMPHASIS["DIM"]}"

  L1_PROMPT_LEFT="${PROMPT_FG["YELLOW"]} $OFF"
  L1_PROMPT_LEFT+="${PROMPT_FG["CYAN"]}\u$OFF"
  L1_PROMPT_LEFT+="${PROMPT_FG["YELLOW"]}:$OFF"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["RED"]}[$OFF"
  L1_PROMPT_LEFT+="${PROMPT_FG["RED"]}\w$OFF"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["RED"]}]$OFF"
  L1_PROMPT_LEFT+="${PROMPT_FG["YELLOW"]} $git_status$OFF"

  L1_PROMPT="$L1_PROMPT_LEFT$PROMPT_COLOR_OFF\n"

  # Second Prompt Line
  if [[ $system_exit_wrong == 1 ]]; then
      L2_PROMPT="$DIM${PROMPT_FG["RED"]}$long_right_arrow$OFF"
  else
      L2_PROMPT="$DIM${PROMPT_FG["GREEN"]}$long_right_arrow$OFF"
  fi

  PS1=$L1_PROMPT$L2_PROMPT

  # Continuation Prompt
  if [[ $system_exit_wrong == 1 ]]; then
      PS2="$DIM${PROMPT_FG["RED"]}$long_right_arrow$OFF"
  else
      PS2="$DIM${PROMPT_FG["GREEN"]}$long_right_arrow$OFF"
  fi
}
PROMPT_COMMAND=prompt_command;
