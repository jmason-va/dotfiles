#!/bin/sh
if [ -f ./bashrc ]; then . ./bashrc; fi

# screen-256color disables highlighting in less...
export TERM=xterm-256color
#goole cloud sdk
source '/Users/jmason/google-cloud-sdk/path.bash.inc'

#autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/jmason/.docker/machine/machines/vbootstrap-vm"
export DOCKER_MACHINE_NAME="vbootstrap-vm"
# Run this command to configure your shell: 
# eval "$(docker-machine env vbootstrap-vm)"


#coffee commands
alias coffee='python ~/design/caffeinate/coffee.py menu '
alias coffee-+='python ~/design/caffeinate/coffee.py add_coffee'
alias coffee--='python ~/design/caffeinate/coffee.py subtract_cup'
alias coffee-c='python ~/design/caffeinate/coffee.py new_day'
alias coffee-d='python ~/design/caffeinate/coffee.py clear_all'
alias coffee-t='python ~/design/caffeinate/coffee.py get_totals'
alias coffee-w='python ~/design/caffeinate/coffee.py add_water'



#github commands
alias gc="git commit -a -m"
alias gp='git push'
alias gs='git status'
alias ga='git add .'

alias sc='source ~/.bash_profile'
alias bp='sublime ~/dotfiles/profile'
alias brc='sublime ~/dotfiles/bashrc'



alias hotkeys='printf "⌘  Command\n⇧  Shift\n⌥  Option\n⌃  Control\n⇪  Caps Lock\nFn Function\n"'
alias chrome="open /Applications/Google\ Chrome.app/"
alias hide="chflags hidden"
alias show="chflags nohidden"
alias l="ls -la -G"
alias rm='rm -rf'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


# Aliases
alias cl=clear
alias sp="source ~/.bash_profile"
alias src="source ~/.zshrc"
alias killservers="pkill -f 'dev_appserver\.py'"
alias info="info --vi-keys"
alias ls="ls -G"
alias l="ls -la"
alias sl="ls -G"
alias 'pip install'='pip install --user'
alias L="| less"
alias t="tmuxinator"

alias profile="vim ~/dotfiles/profile"
alias zshrc="vim ~/dotfiles/zshrc"
alias vimrc="vim ~/dotfiles/vimrc"
alias df="cd ~/dotfiles/"
alias -- -="cd -"

if type nvim &> /dev/null; then
    alias vim="nvim"
    export EDITOR=nvim
fi

alias p='python'

# git shortcuts
# alias git='hub'
alias g='git'
alias gs='git status'
alias gl='git l'
alias gc='git commit -a -m'

alias zs="source ~/.zshrc"
alias goals="vim ~/me/goals.md"
alias learnlog="vim ~/me/learnlog.md"
