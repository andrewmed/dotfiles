#https://www.atlassian.com/git/tutorials/dotfiles

git clone --bare git@github.com:andrewmed/dotfiles.git $HOME/.cfg
alias home='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
home config --local status.showUntrackedFiles no
home checkout
