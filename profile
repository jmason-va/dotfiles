#!/bin/sh
if [ -f ./bashrc ]; then . ./bashrc; fi
export PATH=$PATH:~/bin


#testing, may need to delete THIS LINE IF THERE ARE PROBLEMS
PATH=$PATH:$HOME/bin



# screen-256color disables highlighting in less...
export TERM=xterm-256color

#goole cloud sdk
# source '/Users/jmason/google-cloud-sdk/path.bash.inc'

#autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

#docker setup
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/jmason/.docker/machine/machines/vbootstrap-vm"
export DOCKER_MACHINE_NAME="vbootstrap-vm"
# Run this command to configure your shell: 
# eval "$(docker-machine env vbootstrap-vm)"

#book commands
alias book='chrome ~/writing/published/index.html; ~/writing/htmlify/publish.sh styles.css'
alias book-light='chrome ~/writing/published/index.html; ~/writing/htmlify/publish.sh styles-light.css'

#coffee commands
alias c='python ~/design/caffeinate/coffee.py menu '
alias c+='python ~/design/caffeinate/coffee.py add_coffee'
alias c-='python ~/design/caffeinate/coffee.py subtract_cup'
alias c-c='python ~/design/caffeinate/coffee.py new_day'
alias c-a='python ~/design/caffeinate/coffee.py clear_all'
alias c-t='python ~/design/caffeinate/coffee.py get_totals'
alias w+='python ~/design/caffeinate/coffee.py add_water'

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

alias rb="rm *~"
alias zs="source ~/.zshrc"
alias sub='open -a "/Applications/Sublime Text.app"'
alias sublime='open -a "/Applications/Sublime Text.app"'
alias profile='sublime ~/dotfiles/profile'

#adding path for go, could probably delete this later if i dont look into it more
export PATH=$PATH:/usr/local/go/bin

