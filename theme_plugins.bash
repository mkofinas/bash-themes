source ~/.bash/prompt-support/plugins/system/system.plugin.bash
source ~/.bash/prompt-support/plugins/prompt/prompt.plugin.bash
source ~/.bash/prompt-support/plugins/cpu_temperature/cpu_temperature.plugin.bash

source ~/.bash/prompt-support/colors/simple_colors.colors.bash

source ~/.bash/prompt-support/symbols/arrows.symbols.sh
source ~/.bash/prompt-support/symbols/letters.symbols.sh
source ~/.bash/prompt-support/symbols/box_draw.symbols.sh
source ~/.bash/prompt-support/symbols/misc.symbols.sh

PROMPT_COMMAND="set_system_exit_status; $PROMPT_COMMAND"

