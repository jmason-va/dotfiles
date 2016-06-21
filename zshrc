source ~/dotfiles/profile

function _update_ps1()
{
  export PROMPT="$(~/dotfiles/powerline-zsh/powerline-zsh.py -m konsole $?)"
}
precmd()
{
  _update_ps1
}

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
ZSH_THEME="robbyrussell"
export TERM='xterm-256color'
CASE_SENSITIVE="true"

# Needed for easy colours.
autoload -U colors && colors
plugins=(git bundler osx rake ruby)

# Path to your oh-my-zsh installation.
export ZSH=/Users/jmason/.oh-my-zsh

# testing these, this may cause problems
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


plugins=(git)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


