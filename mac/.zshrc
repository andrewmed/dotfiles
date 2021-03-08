HISTFILE=$HOME/.zhistory
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

export GOPATH="$HOME/code/go"
export PATH="$GOPATH/bin:$PATH"
export GOROOT="$HOME/code/goroot"
export PATH="$GOROOT/bin:$PATH"

alias ls='ls -G'
alias ll='ls -Gla'
alias f='function _f(){ find . -xdev -not -path "*/\.*" -iname "*$1*" 2> /dev/null; }; _f'

