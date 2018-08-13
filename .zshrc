export TERM=xterm-256color

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH
DEFAULT_USER="yuleugim"

# Disable zsh theme
ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Required exports
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

## Aliases
alias nv="nvim"
alias zshrc="nv ~/.zshrc"
alias hyperrc="nv ~/.hyper.js"
alias bsr="brew services restart"
alias bss="brew services stop"
alias subl="sublime"
alias Finder="open ."
alias spotlight-reindex="sudo mdutil -E /"
alias proxy="source proxy"
alias unproxy="source unproxy"

# Functions
git-checkout-pr() {
  git fetch upstream "pull/$1/head:pr$1"
  git checkout "pr$1"
}

lighthouse-urls() {
  for url in "$@"
  do
    lighthouse --perf --quiet $url
  done
}

# Plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U promptinit; promptinit
prompt pure

export GPG_TTY=$(tty)
