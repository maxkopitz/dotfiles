#!/bin/bash
set -exu
set -o pipefail


install_brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
install_macos() {
  brew tap homebrew/cask-fonts
  brew install font-hack-nerd-font
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/softmoth/zsh-vim-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone  https://github.com/softmoth/zsh-vim-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vim-mode

  brew install ripgrep
  brew install wget 
  brew install tmux
  brew install nvim
  brew install node
  brew install go
  brew install --cask alacritty
  brew install --cask protonvpn
  brew install --cask notion
  brew install sqlite
  brew install tree
  brew install gh
  brew install httpie
  brew install fd
  brew install --cask discord --no-quarantine
  brew install docker
  brew install tmux-mem-cpu-load
  brew install pnpm
}

install_tmux_depdencies() {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
}
install_oh_my_zsh() {
  if [[ ! -f ~/.zshrc ]]; then
    info "Installing oh my zsh..."
    ZSH=~/.oh-my-zsh ZSH_DISABLE_COMPFIX=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chmod 744 ~/.oh-my-zsh/oh-my-zsh.sh
  else
    warn "oh-my-zsh already installed"
  fi
}

setup_ssh_config() {
  #https://eecs280staff.github.io/tutorials/setup_caen.html#avoiding-repeated-2fa
  echo -e '# SSH multiplexing\nHost *\n  ControlMaster auto\n  ControlPersist yes\n   ControlPath ~/.ssh/socket-%C\n  ServerAliveInterval 60\n  ServerAliveCountMax 5' >> ~/.ssh/config
  chmod 600 ~/.ssh/config
}
