source ~/.dotfiles/prompt-support/plugins/system/system.plugin.bash
source ~/.dotfiles/prompt-support/plugins/prompt/prompt.plugin.bash
source ~/.dotfiles/prompt-support/plugins/cpu_temperature/cpu_temperature.plugin.bash

source ~/.dotfiles/prompt-support/colors/simple_colors.colors.bash

source ~/.dotfiles/prompt-support/symbols/arrows.symbols.sh
source ~/.dotfiles/prompt-support/symbols/letters.symbols.sh
source ~/.dotfiles/prompt-support/symbols/box_draw.symbols.sh
source ~/.dotfiles/prompt-support/symbols/misc.symbols.sh

PROMPT_COMMAND="set_system_exit_status; $PROMPT_COMMAND"

