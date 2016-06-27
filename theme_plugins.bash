source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/plugins/system/system.plugin.bash"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/plugins/prompt/prompt.plugin.bash"
source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/plugins/cpu_temperature/cpu_temperature.plugin.bash"

source "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/prompt-support/colors/simple_colors.colors.bash"

PROMPT_COMMAND="set_system_exit_status; $PROMPT_COMMAND"

