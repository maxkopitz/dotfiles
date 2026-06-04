#/usr/bin/env bash

rm -rf ~/.config/tmux
rm -rf ~/.config/alacritty
rm -rf ~/.local/scripts

cp -r ./.config/tmux/ ~/.config/tmux
cp -r ./.config/alacritty/ ~/.config/alacritty 
cp -r ./bin/.local/scripts/ ~/.local/scripts
