# Path to your oh-my-zsh installation.
export ZSH="/Users/maxkopitz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
    git 
    docker 
    docker-compose
    tmux 
    colorize
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
)

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_DEFAULT_SESSION_NAME="config"

DISABLE_FZF_AUTO_COMPLETION="true"

source $ZSH/oh-my-zsh.sh
alias zshconfig="nv ~/.zshrc"
alias nv="nv"
alias nvconfig="nv ~/.config/nvim/"

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

alias nv="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PNPM_HOME="/Users/maxkopitz/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
