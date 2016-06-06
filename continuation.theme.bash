#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

PROMPT_DIRTRIM=3

function prompt_command() {
  local start_smooth=$arc_down_and_right
  local stop_smooth_square=$arc_up_and_right$square
  local stop_smooth_rhombus=$arc_up_and_right$rhombus
  local stop_smooth_circle=$arc_up_and_right$circle

  local git_status
  git_status=$(__git_ps1 " ( %s)")

  local BOLD
  BOLD="${PROMPT_EMPHASIS["BOLD"]}"
  local OFF
  OFF="${PROMPT_EMPHASIS["REGULAR"]}"

  PS1="$BOLD${PROMPT_FG["YELLOW"]}$start_smooth"
  PS1+="$BOLD${PROMPT_FG["CYAN"]}\u"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}@"
  PS1+="$BOLD${PROMPT_FG["MAGENTA"]}\h"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$thick_clock"
  PS1+="$BOLD${PROMPT_FG["BLUE"]}|\t|"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}:"
  PS1+="$BOLD${PROMPT_FG["RED"]}[\w]"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$git_status$OFF\n"
  PS1+="$BOLD${PROMPT_FG["YELLOW"]}$stop_smooth_circle$OFF "

  # Continuation Prompt
  PS2="$BOLD${PROMPT_FG["YELLOW"]}$stop_smooth_circle$OFF "
}
PROMPT_COMMAND=prompt_command;
