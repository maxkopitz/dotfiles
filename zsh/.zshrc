# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source ~/.zsh_profile  
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
    git 
    colorize
    colored-man-pages
    zsh-syntax-highlighting
    fzf
)

ZSH_TMUX_DEFAULT_SESSION_NAME="config"

DISABLE_FZF_AUTO_COMPLETION="true"

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/tools/nvim/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"

alias whatsmyip="curl ipinfo.io/ip"
alias vim="nvim"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $(uname) == "Darwin" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
  PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
fi

