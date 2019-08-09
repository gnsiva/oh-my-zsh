# ZSH Theme - Altered version of Bira
# Prequisites
#
# The zsh-command-time plugin https://github.com/popstas/zsh-command-time
# Set the ZSH_THEME_USER_COLOUR variable for your machine
#
# To use any 256 colour code, you can do the below
# eval anake_blue='$FG[068]'
# export ZSH_THEME_USER_COLOUR="${anake_blue}"
#
# To use a pre-existing oh-my-zsh colour
# export ZSH_THEME_USER_COLOUR="$fg[yellow]"
#
# For gns: edit in bin folder, copy into oh-my-zsh folder to update git


local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]${ZSH_THEME_USER_COLOUR}%}%n@%m %{$reset_color%}'
    local user_symbol='➜'
fi

local current_dir='%{$terminfo[bold]${ZSH_THEME_USER_COLOUR}%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX


PROMPT="╭─${venv_prompt}${user_host}${current_dir}${rvm_ruby}${git_branch}
╰─%B[%*]${user_symbol}%b "
RPROMPT="%B$(zsh_command_time)${return_code}%b"

