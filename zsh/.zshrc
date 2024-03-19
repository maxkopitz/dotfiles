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

alias whatsmyip="curl ipinfo.io/ip"
alias vim="nvim"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $(uname) == "Darwin" ]]; then
  PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
fi
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VISUAL=nvim
export EDITOR=nvim

export PATH=$PATH:/usr/local/go/bin
export SSH_AUTH_SOCK=~/.1password/agent.sock

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
