export TERM=xterm-256color

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

DEFAULT_USER="yuleugim"

# Path to your oh-my-zsh installation.
export ZSH=/Users/yuleugim/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

## Aliases

alias nv="nvim"
alias zshrc="nvim ~/.zshrc"
alias hyperrc="nvim ~/.hyper.js"
alias bsr="brew services restart"
alias bss="brew services stop"
alias subl="sublime"
alias Finder="open ."

## LIFARS Aliases

export PROJECTS="$HOME/Projects"
export DOCKER="$PROJECTS/wp-lifars"
export LFRS="$DOCKER/web/wp-content/themes/lifars"
export LFRS_PROD="<prod server>"
export LFRS_STAGING="<staging server>"

alias lfrs-docker="docker-compose"
alias lfrs-up="docker-compose up -d"
alias lfrs-stop="docker-compose stop"
alias lfrs-down="docker-compose down"
alias lfrs-wp="docker exec ac03b1e360e2 wp"
alias lfrs-sass="sass $LFRS/assets/theme/theme.scss | postcss -o $LFRS/style.css -m $LFRS/style.css.map -u autoprefixer"
alias lfrs-sass-watch="sass $LFRS/assets/theme/theme.scss:$LFRS/style.css -w"
alias lfrs-postcss-watch="postcss $LFRS/style.css -r -m $LFRS/style.css.map -u autoprefixer -w"
alias lfrs-sass-min="sass $LFRS/assets/theme/theme.scss | postcss -o $LFRS/style.css -m $LFRS/style.css.map -u autoprefixer cssnano"
alias lfrs-sassdoc="sassdoc $LFRS/assets/theme/**/*.scss -d $LFRS/doc/sassdoc"

# End aliases

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/yuleugim/.rbenv/shims:${PATH}"

# Plugins

autoload -U promptinit; promptinit
prompt pure

# Load rbenv automatically
eval "$(rbenv init -)"
export GPG_TTY=$(tty)
