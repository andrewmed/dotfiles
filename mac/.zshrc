export LESS=-Ri
export PROMPT='%n@%m %1~%# '

bindkey -e                                        # emacs key bindings

setopt interactivecomments # allow comments in interactive mode
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense

setopt appendhistory
setopt inc_append_history  
setopt share_history

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word
PROMPT_EOL_MARK=""

HISTFILE=~/.zsh_history
HISTSIZE=40000
SAVEHIST=50000


alias ls='ls -G --color=auto'
alias ll='ls -Gla'
alias f='function _f(){ find . -xdev -not -path "*/\.*" -iname "*$1*" 2> /dev/null; }; _f'
alias history='history 0'
alias st='git status'


# SUGGESTIONS='/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
SUGGESTIONS='/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
if [ -f $SUGGESTIONS ]; then
    . $SUGGESTIONS
fi

if [ -d $HOME/code/goroot ]; then
    export GOROOT="$HOME/code/goroot"
    export PATH="$GOROOT/bin:$PATH"
fi

if [ -d $HOME/code/go ]; then
    export GOPATH="$HOME/code/go"
    export PATH="$GOPATH/bin:$PATH"
fi



