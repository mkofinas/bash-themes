#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

PROMPT_DIRTRIM=3

source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/plugins/system/system.plugin.bash"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/plugins/prompt/prompt.plugin.bash"

source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/colors/simple_colors.colors.bash"

function prompt_command() {

  local git_status
  git_status=$(__git_ps1 " ( %s)")

  local OFF
  OFF="${PROMPT_EMPHASIS["REGULAR"]}"
  local BOLD
  BOLD="${PROMPT_EMPHASIS["BOLD"]}"
  local DIM
  DIM="${PROMPT_EMPHASIS["DIM"]}"

  local BG_PROMPT
  BG_PROMPT="$BOLD${PROMPT_FG["DEFAULT"]}${PROMPT_BG["BLACK"]}$PROMPT_CLEAR_EOL"

  local L1_PROMPT_LEFT
  L1_PROMPT_LEFT="$BOLD${PROMPT_FG["YELLOW"]} "
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["CYAN"]}\u"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["YELLOW"]}@"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["MAGENTA"]}\h"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["YELLOW"]}:"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["RED"]}[\w]"
  L1_PROMPT_LEFT+="$BOLD${PROMPT_FG["YELLOW"]}$git_status"

  local L1_PROMPT_LEFT_SIZE
  L1_PROMPT_LEFT_SIZE=`expand_prompt "$L1_PROMPT_LEFT"`

  local right_text
  right_text="\A"

  local L1_PROMPT_RIGHT
  local L1_PROMPT_RIGHT_SIZE
  L1_PROMPT_RIGHT="\$(write_at_end_of_line "$right_text")"
  L1_PROMPT_RIGHT_SIZE=`expand_prompt "$right_text"`
  L1_PROMPT_RIGHT="$BOLD${PROMPT_FG["YELLOW"]}$L1_PROMPT_RIGHT"

  local available_width
  available_width=$((`tput cols` - $L1_PROMPT_LEFT_SIZE))

  local L1_PROMPT
  if [[ $available_width -ge $L1_PROMPT_RIGHT_SIZE ]]; then
    L1_PROMPT="$L1_PROMPT_LEFT$L1_PROMPT_RIGHT$OFF\n"
  else
    L1_PROMPT="$L1_PROMPT_LEFT$OFF\n"
  fi

  local L2_PROMPT
  # Second Prompt Line
  if [[ $system_exit_wrong == 1 ]]; then
      L2_PROMPT="$DIM${PROMPT_FG["RED"]}⟶  $OFF"
  else
      L2_PROMPT="$DIM${PROMPT_FG["GREEN"]}⟶  $OFF"
  fi

  PS1=$BG_PROMPT$L1_PROMPT$L2_PROMPT

  # Continuation Prompt
  if [[ $system_exit_wrong == 1 ]]; then
      PS2="$DIM${PROMPT_FG["RED"]}⟶  $OFF"
  else
      PS2="$DIM${PROMPT_FG["GREEN"]}⟶  $OFF"
  fi
}
PROMPT_COMMAND=prompt_command;
PROMPT_COMMAND="set_system_exit_status; $PROMPT_COMMAND"
