export LESS=-Ri
export PROMPT='%n@%m %1~%# '
export HOMEBREW_NO_ANALYTICS=1

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

HISTSIZE=40000
SAVEHIST=50000


alias ls='ls -G --color=auto'
alias ll='ls -Gla'
alias st='git status'


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

function ai() {
  local prompt="$@"
  curl -s -X POST "https://api.anthropic.com/v1/messages" \
    -H "x-api-key: ${ANTHROPIC_API_KEY}" \
    -H "anthropic-version: 2023-06-01" \
    -H "Content-Type: application/json" \
    -d '{
      "model": "claude-3-7-sonnet-20250219",
      "max_tokens": 80,
      "messages": [
        {"role": "user", "content": "Suggest a zsh command for: '"${prompt}"'.\nOutput only the command, no explanation."}
      ]
  }' | jq -r 'if .type == "error" then .error.message else .content[0].text end'
}

[ -f /usr/local/etc/zshenv ] && source /usr/local/etc/zshenv
