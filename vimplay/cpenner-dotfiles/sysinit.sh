# /bin/sh
# A little script to install the essentials and get set up.

# May also want to reorder paths in /etc/paths to put /usr/local/bin and /usr/local/Cellar

# First Install Homebrew
sudo ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh
sudo curl -L http://install.ohmyz.sh | sh

# Set default shell to zsh
chsh -s /bin/zsh

# Then a few homebrew essentials:
brew install htop-osx
brew install pandoc
brew install the_silver_searcher
brew install tmux
brew install tree
brew install watch
brew install wget
brew install autojump
brew install autoenv
brew install calc
brew install fzf
brew install git
brew install node
brew install tldr
brew install moreutils
brew install reattach-to-user-namespace

# Eventually this will be added to normal homebrew. Check there if it fails.
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

brew cask install google-chrome
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
brew cask install slack
brew cask install bettertouchtool
# Note, For 'Super' command key, rebind Command_R in Seil to keycode 80
brew cask install seil
brew cask install karabiner

gem install tmuxinator

easy_install pip
easy_install ipdb
easy_install bpython

# Neovim
pip install neovim
brew install neovim

# Setup vimrc stuff
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/ ~/.config/nvim

# Set up iterm2 integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
