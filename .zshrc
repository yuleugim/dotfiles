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
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

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

## Device Aliases
alias wp-akc="cd ~/Projects/wp-akc/themes/akc/component-library"
alias shop="cd ~/Projects/akc-shop"
alias homestead="cd ~/Projects/Homestead"
alias bark-ssh="ssh -i ~/.ssh/bark/id_pub mxu@dev-apps-bark-ny-01.akc.org"
alias wp-code="code ~/Projects/wp-akc"
alias shop-code="code ~/Projects/akc-shop"

# Functions
git-checkout-pr() {
  git fetch origin "pull/$1/head:pr$1"
  git checkout "pr$1"
}

lighthouse-urls() {
  for url in "$@"
  do
    lighthouse --perf --quiet $url
  done
}

stop(){
  if [ $# -ne 1 ]; then
          echo 1>&2 Usage: stop process
  else
    PROCESS=$1
    echo "Stopping processes with the word ${tGreen}$1${tReset}"
    ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | sudo xargs kill -STOP
  fi
}

# Plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U promptinit; promptinit
prompt pure

export GPG_TTY=$(tty)

[ -f "/Users/mxu/.shopify-app-cli/shopify.sh" ] && source "/Users/mxu/.shopify-app-cli/shopify.sh"

