#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

PROMPT_DIRTRIM=3

source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/colors/simple_colors.colors.bash"

function prompt_command() {
  local square="▪"
  local rhombus="❖"
  local circle=""

  local git_status
  git_status=$(__git_ps1 " ( %s)")

  local BOLD
  BOLD="${PROMPT_EMPHASIS["BOLD"]}"
  local OFF
  OFF="${PROMPT_EMPHASIS["REGULAR"]}"

  PS1="$BOLD${PROMPT_FG["YELLOW"]}╭─$OFF"
  PS1+="$BOLD${PROMPT_FG["CYAN"]}\u$OFF"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}@$OFF"
  PS1+="$BOLD${PROMPT_FG["MAGENTA"]}\h$OFF"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$OFF"
  PS1+="$BOLD${PROMPT_FG["BLUE"]}|\t|$OFF"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}:$OFF"
  PS1+="$BOLD${PROMPT_FG["RED"]}[\w]$OFF"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$git_status$OFF\n"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}╰ $OFF"

  # Continuation Prompt
  PS2="$BOLD${PROMPT_FG["YELLOW"]}  $OFF"
}
PROMPT_COMMAND=prompt_command;
