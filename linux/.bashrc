export VISUAL=vim
export EDITOR="$VISUAL"
export KEYBOARD_KEY_TIMEOUT_US=1000


alias f='function _f(){ find . -xdev -regex "./mnt" -prune -regex "./media" -prune -o -not -path "*/\.*" -iname "*$1*" 2> /dev/null; }; _f'
alias new='function _new(){ find $1 -ignore_readdir_race -xdev -not -path "*/\.*" -type f -printf "%T@ %p\n" | sort -n | cut -f2- -d" " | tail; }; _new'
alias size='du -sh *|sort -h'
alias s='git status'


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
export PROMPT_COMMAND='history -a'
shopt -s histappend
history -a

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

