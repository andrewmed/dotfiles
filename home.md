#https://www.atlassian.com/git/tutorials/dotfiles

git clone --bare git@github.com:andrewmed/.cfg.git $HOME/.home
alias home='git --git-dir=$HOME/.home/ --work-tree=$HOME'
home config --local status.showUntrackedFiles no
home checkout
